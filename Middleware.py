from langchain_ollama import OllamaLLM
from langchain_core.prompts import ChatPromptTemplate

from Exceptions import NotPresentInKBExceptions, LLMException
from Prolog import *

model = OllamaLLM(model='llama3.1:8b')

def extract_intent(message: str, person_id: str):
    prompt = """
    Stai valutando un messaggio utente che potrebbe servire per creare una nuova voce in un database.
    Se chiede per conto di terzi con il suo id non è considerabile come presentazione.
    Rispondi solo con "Sì" se il messaggio fornisce dati con una struttura compatibile con una registrazione (es. nome, data, attributi, categorie, ecc.).

    Se il messaggio non ha questo scopo, rispondi con "No".

    Messaggio:
    \"\"\"{message}\"\"\"
    """

    prompt = ChatPromptTemplate.from_template(prompt)
    chain = prompt | model

    result = chain.invoke({'message': message})
    result = result.replace('"', '')

    if not check_fact(f'person({person_id}).') and result != "Sì":
        return """
        Il tuo id non risulta essere presente nella mia conoscenza, 
        ti piacerebbe presentarti in modo tale da personalizzare
        la mia funzione in base alla tua condizione clinica?
        """
    elif result == "Sì":
        # aggiungere inserimento dati utente
        return add_new_user(message=message, person_id=person_id)

    prompt = """
    Sei un assistente intelligente incaricato di classificare il seguente messaggio dell'utente in base all'azione che intende compiere.

    Messaggio:
    "{message}"

    Scegli **una sola** tra le seguenti etichette (azioni possibili):

    - Medicina Incompatibile con la malattia  
    - Trattamento applicabile personalizzato  
    - Trattamento applicabile  
    - Trattamento in conflitto personalizzato  
    - Lista Farmaci prescritti  
    - Elencare tutti i trattamenti non standard  
    - Aggiungere farmaci prescritti  
    - Aggiungere patologie
    - Verificare esistenza trattamento per malattia
    - Conversazione generica

    Rispondi **esclusivamente** con **una delle etichette sopra**, senza aggiungere alcuna spiegazione o dettaglio.
    """

    prompt = ChatPromptTemplate.from_template(prompt)
    chain = prompt | model

    result = chain.invoke({'message': message})
    result = result.replace('"', '')
    result = result.replace('-', '')
    result = result.strip()

    if result == 'Medicina Incompatibile con la malattia':
        result = incompatibility_treatment_disease(message=message)

    elif result == 'Trattamento applicabile personalizzato':
        result = personalized_check_applicable_treatment(message=message, person_id=person_id)

    elif result == 'Trattamento applicabile':
        result = general_check_applicable_treatment(message=message)

    elif result == 'Trattamento in conflitto personalizzato':
        result = personalized_check_un_applicable_treatment(message=message, person_id=person_id)

    elif result == 'Lista Farmaci prescritti':
        result = get_all_prescripted_treatments(person_id=person_id)

    elif result == 'Elencare tutti i trattamenti non standard':
        result = extract_non_standard_treatment(person_id=person_id)

    elif result == 'Aggiungere farmaci prescritti':
        result = add_prescriptions_for_person(message=message, person_id=person_id)

    elif result == 'Aggiungere patologie':
        result = add_disease_for_person(message=message, person_id=person_id)

    elif result == 'Verificare esistenza trattamento per malattia':
        result = check_exists_treatment(message=message)

    else:
        result = general_conversation(message=message)

    return result

def extract_non_standard_treatment(person_id: str):
    try:
        result = get_non_standard_treatments(person_id=person_id)
        if result:
            result = "I Farmaci non standard che prendi sono:\n" +"\n".join(f"{item['Drug']} per la {item['Disease']}" for item in result)
        else:
            result = "I Farmaci che assumi sono tutti standard"
    except NotPresentInKBExceptions:
        result = "Errore nella verifica dei trattamenti non standard"
    return result

def general_check_applicable_treatment(message: str):
    prompt = """
        Partendo dal messaggio dell'utente, estrai il nome del farmaco e la malattia.
        Non devi commentare la richiesta, le informazioni di farmaci e malattie sono presenti nella knowledge base.
        Rispetta il tuo compito, ignora le altre informazioni
        Il messaggio è il seguente: {message}
        Restituisci la coppia malattia e farmaco in questo modo: malattia # farmaco.
        """
    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    try:
        response = response.replace('.','')
        disease, drug = response.split('#')
        disease, drug = disease.strip().capitalize(), drug.strip()
        result = is_treatment_applicable(drug_id=drug, disease_id=disease)

        if result:
            result = "Il trattamento è considerato standard di conseguenza è applicabile"
        else:
            result = "Il trattamento non è applicabile per quella malattia"
    except NotPresentInKBExceptions:
        result = "Farmaco o malattia non presente nella knowledge base"
    except Exception:
        raise LLMException(f'Il modello ha risposto in questo modo: {response}')

    return result

def personalized_check_applicable_treatment(message: str, person_id: str):
    prompt = """
        Partendo dal messaggio dell'utente, estrai il nome del farmaco di cui vuole verificare il conflitto.
        Il messaggio è il seguente: {message}
        Restituisci solo il nome del farmaco, senza aggiungere dettagli.
        """
    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    try:
        result = get_safe_prescriptions(person_id=person_id, drug_id=response)
    except NotPresentInKBExceptions:
        result = "Farmaco o malattia non presente nella knowledge base"
    if result:
        result = "È possibile prescrivere il farmaco"
    else:
        result = "Non è sicuro prescrivere il farmaco"
    return result

def personalized_check_un_applicable_treatment(message: str, person_id: str):
    prompt = """
        Partendo dal messaggio dell'utente, estrai il nome del farmaco di cui vuole verificare il conflitto.
        Il messaggio è il seguente: {message}
        Restituisci solo il nome del farmaco, senza aggiungere dettagli.
        """
    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    try:
        result = get_unsafe_prescriptions(person_id=person_id, drug_id=response)
    except NotPresentInKBExceptions:
        return "Farmaco o malattia non presente nella knowledge base"

    if result:
        return "Attenzione per la sua condizione clinica questo farmaco non può essere assunto."

    return "Secondo la sua condizione cliniac questo farmaco può essere assunto."

def check_exists_treatment(message: str):
    prompt = """
    Dal seguente messaggio dell'utente, estrai esclusivamente il **nome completo della malattia**, anche se è composto da più parole 
    (es. "insufficienza renale grave", "ipersensibilità fans").

    Non aggiungere alcun dettaglio, spiegazione o commento: restituisci solo il nome esatto della malattia.

    Messaggio:
    \"\"\"{message}\"\"\"
    """

    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    response = response.replace('.','')
    try:
        result = has_treatments(response)
    except NotPresentInKBExceptions:
        return "Farmaco o malattia non presente nella knowledge base"

    if result:
        return "Esiste un farmaco prescrivibile per questa malattia"

    return "Non esiste un farmaco prescrivibile per questa malattia o non è presente nella knowledge base"


def get_all_prescripted_treatments(person_id: str):
    try:
        result = get_prescriptions_for_person(person_id=person_id)
        formatted = []
        for item in result:
            drug_id = item['drug']
            name = item['name']
            if isinstance(name, bytes):
                name = name.decode("utf-8")
            formatted.append(f"{drug_id} ({name})")
        if formatted:
            result = "I farmaci prescritti sono i seguenti: " + ', '.join(formatted)
        else:
            result = "Non ti sono stati prescritti dei farmaci"
    except NotPresentInKBExceptions:
        result = "Farmaco o malattia non presente nella knowledge base"

    return result

def add_prescriptions_for_person(message: str, person_id: str):
    prompt = """
            Partendo dal messaggio dell'utente, estrai il nome del farmaco, 
            la data di prescrizione se presente, la data di fine se presente, 
            il dosaggio se presente e la frequenza.
            Il messaggio è il seguente: {message}
            La risposta deve essere di questo formato:
            Nome farmaco #  data prescrizione # data fine # dosaggio # frequenza
            Non aggiungere dettagli
            """
    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    drug, start_data, end_date, dosage, frequency = response.split('#')
    drug_id = get_drug_id_by_name(drug.strip())

    prescibed_to = {
        'person_id': person_id,
        'drugs': drug_id,
        'startDate': start_data,
        'endDate': end_date,
        'dosage': dosage,
        'frequency': frequency
    }

    _, messages = insert_new_person_relationships(file_path='prolog/relationship_bk.pl', prescribed_to=prescibed_to)

    return messages

def add_disease_for_person(message: str, person_id: str):
    prompt = """
    Estrai dal seguente messaggio dell’utente:

    1. Il **nome completo della malattia**, anche se composto (es. "ipersensibilità fans", "insufficienza renale grave", ecc.)
    2. La **data in cui è stata diagnosticata** (se presente, in formato YYYY-MM-DD)
    3. Il **livello di gravità** (se presente), scegliendo solo tra i seguenti valori:

    Active, Inactive, Remission, Cured, Terminal, Chronic, Acute, Relapsing, Progressive, Stable, Advanced

    Non aggiungere commenti o dettagli extra.

    Restituisci la risposta in questo formato:
    malattia # data_diagnosi # gravità

    Messaggio utente:
    \"\"\"{message}\"\"\"
    """

    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()

    disease, diagnosis_date, status = response.split('#')

    response = {
                'disease': disease.strip(),
                'person_id': person_id,
                'diagnosisDate': diagnosis_date.strip(),
                'status': status.strip()
    }

    response, messages = insert_new_person_relationships(file_path='prolog/relationship_bk.pl', has_disease=response)
    if response:
        return messages

    return "Errore nell'inserimento della malattia"

def add_new_user(message: str, person_id: str):
    prompt = """
    Partendo dal seguente messaggio, estrai nell’ordine:
    - nome
    - cognome
    - data di nascita (formato YYYY-MM-DD)
    - genere (se genere maschile, metti m, se genere femminile metti f)
    - gruppo sanguigno

    Il messaggio è il seguente:
    {message}

    La risposta deve essere in questo formato (senza aggiungere altro):
    Nome # Cognome # DataNascita # Genere # GruppoSanguigno
    """

    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    name, surname, birth_date, gender, blood_group = response.split('#')

    person = {
        'person_id': person_id.strip(),
        'name': name.strip(),
        'surname': surname.strip(),
        'blood_group': blood_group.strip(),
        'birth_date': birth_date.strip(),
        'gender': gender.strip()
    }

    response = insert_new_person_facts(person_dict=person, file_path='prolog/person_bk.pl')
    if response:
        return "Aggiunto correttamente"

    return "Errore nell'inserimento dell'utente"

def incompatibility_treatment_disease(message: str):
    prompt = """
    Estrai dal messaggio dell'utente due elementi precisi:

    1. Il **nome completo della malattia**, anche se è composto (es. "ipersensibilità fans", "insufficienza renale grave", ecc.)
    2. Il **nome del farmaco**

    Non dividere mai i nomi composti e non aggiungere spiegazioni o commenti.  
    Se il messaggio contiene entrambi, restituisci solo:

    malattia # farmaco

    Esempio:
    ipersensibilità fans # ibuprofene

    Messaggio:
    {message}
    """

    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()
    disease, drug = response.split('#')
    try:
        response = is_drug_incompatible_with_disease(drug_id=drug.strip(), disease_id=disease.strip())
        if response:
            return "Il trattamento è incompatibile con la malattia in quanto controindicato"

        return "Trattamento compatibile"
    except NotPresentInKBExceptions:
        return "Farmaco o malattia non presenti nella knowledge base"


def general_conversation(message: str):
    prompt = """Sei un assistente medico virtuale, progettato per aiutare gli utenti a ottenere informazioni su farmaci, prescrizioni e malattie, basandoti su una base di conoscenza clinica.
    Il seguente messaggio proviene da una conversazione generica, non salutare, si assume che la conversazione sia già avviata.  
    L'utente potrebbe fare domande informative, esprimere un dubbio o chiedere qualcosa su farmaci, trattamenti o condizioni di salute, **senza necessariamente cercare una risposta personalizzata**.
    
    Rispondi in modo educato, professionale e semplice.  
    Fornisci una risposta informativa generale.  
    Se la richiesta richiede dati clinici che non sono disponibili, guidalo gentilmente a fornire più informazioni.
    
    Messaggio dell’utente:
    \"\"\"{message}\"\"\""""
    prompt = ChatPromptTemplate.from_template(prompt)

    chain = prompt | model

    response = chain.invoke({'message': message}).lower()

    return response

