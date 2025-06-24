from pyswip import Prolog
from Exceptions import NotPresentInKBExceptions
from Utility import extract_ontology_info
from deep_translator import GoogleTranslator
import logging

prolog = Prolog()
ontology = extract_ontology_info('drugsOntology.gbs')
prolog.consult("prolog/main.pl")

def check_fact(q: str):
    """
    Check whether a fact or rule is true in the Prolog knowledge base.

    :param q: A Prolog query string
    :return: True if the query succeeds (i.e., the fact exists), False otherwise.
    """
    query = prolog.query(q)
    try:
        result = bool(list(query))
        query.close()
        return result
    except Exception:
        return False


def get_fact_info(q: str):
    """
    Generic function to retrieve structured information from a Prolog fact.

    :q: The Prolog query string
    :return: A dictionary mapping variable names to their values, or None if not found
    """

    q = prolog.query(q)
    try:
        result = next(q)
        return result
    except StopIteration:
        return None
    finally:
        q.close()

def get_drug_id_by_name(name: str):
    """
    Retrieve the ID of a drug given its name (exact match).

    :param name: The name of the drug (as stored in drug_data/7)
    :return: The matching drug ID or None
    """
    query = f'drug_data(DrugID, "{name}", _, _, _, _, _)'
    results = list(prolog.query(query))
    return results[0]["DrugID"] if results else None

def get_disease_id_by_name(name: str):
    """
    Retrieve the ID of a disease given its name (exact match).

    :param name: The name of the disease (as stored in disease_data/9)
    :return: The matching disease ID or None
    """
    query = f'disease_data(DiseaseID, "{name}", _, _, _, _, _, _, _)'
    results = list(prolog.query(query))
    return results[0]["DiseaseID"] if results else None

def get_person_id_by_name(name: str):
    query = f"person_data(PersonID, '{name}', _, _, _, _)"
    results = list(prolog.query(query))
    return results[0]["PersonID"] if results else None

def get_prescriptions_for_person(person_id: str):
    """
    Restituisce i farmaci prescritti a una persona, con ID e nome.
    """
    query = f"prescribed_drug_info({person_id}, Drug, Name)"
    return [{'drug' :res["Drug"], 'name': res["Name"]} for res in prolog.query(query)]


def get_unsafe_prescriptions(person_id: str, drug_id: str):
    """
    Get all drugs prescribed to a person that are considered unsafe.
    """
    if not check_fact(f'drug({drug_id}).'):
        drug_id = get_drug_id_by_name(drug_id)

    if not drug_id:
        raise NotPresentInKBExceptions()

    q = f"contraindicated_for_person({person_id}, {drug_id})"
    try:
        return bool(list(prolog.query(q)))
    except:
        return []


def get_safe_prescriptions(person_id: str, drug_id: str):
    """
    Get if a drug prescribed to a person that are considered safe.
    """

    if not check_fact(f'drug({drug_id}).'):
        drug_id = get_drug_id_by_name(drug_id)

    q = f"safe_for({person_id}, {drug_id})"
    try:
        return list(prolog.query(q))
    except:
        return None


def is_treatment_applicable(drug_id: str, disease_id: str):
    """
    True if the drug safely treats the disease.
    """
    if not check_fact(f'drug({drug_id}).'):
        # Extract id drug
        drug_id = get_drug_id_by_name(drug_id)

    if not check_fact(f'disease({disease_id}).'):
        # Extract disease id
        disease_id = get_disease_id_by_name(disease_id.capitalize())

    if drug_id and disease_id:
        q = f"standard_treatment({drug_id}, {disease_id})"
        return check_fact(q)
    else:
        raise NotPresentInKBExceptions()

def get_non_standard_treatments(person_id: str):
    """
    Return all (Drug, Disease) pairs where the treatment is marked as non-standard.
    """
    q = f"get_all_non_standard_treatment({person_id}, Drug, Disease)"
    try:
        return [{"Drug": r["Drug"], "Disease": r["Disease"]} for r in prolog.query(q)]
    except:
        raise NotPresentInKBExceptions()

def is_drug_incompatible_with_disease(drug_id: str, disease_id: str):
    """
    Check whether a drug is contraindicated for a particular disease
    based on the Prolog report 'Contraindicated For/4'.

    :param drug_id: Drug ID
    :param disease_id: Disease IF
    :return: True if the drug is contraindicated for the disease.
    """
    if not check_fact(f'disease({disease_id}).'):
        disease_id = get_disease_id_by_name(disease_id.capitalize())

    if not check_fact(f'drug({drug_id}).'):
        drug_id = get_drug_id_by_name(drug_id)

    if not drug_id or not disease_id:
        raise NotPresentInKBExceptions()

    query = f"contraindicated_for({drug_id}, {disease_id}, _, _)"
    return check_fact(query)

def has_treatments(disease_id: str):
    """
    Verifica se esistono trattamenti standard per una malattia.
    """
    if not check_fact(f'disease({disease_id}).'):
        disease_id = get_disease_id_by_name(disease_id.capitalize())

    if not disease_id:
        raise NotPresentInKBExceptions()

    query = f"has_treatment({disease_id})"
    return check_fact(query)


def insert_new_person_facts(person_dict, file_path):
    person_ontology = ontology['Person']
    logging.info('Insert a new person into the knowledge base.')
    # Check bloodGroup
    bg = person_dict["blood_group"]
    if bg != 'non presente':
        if bg not in person_ontology['opt_bloodGroup'] :
            logging.error(f" The blood group '{bg}' is not valid according to the ontology.")
            return False
    else:
        bg = None

    gender = person_dict['gender']
    if gender not in person_ontology['opt_gender']:
        logging.error(f"The gender '{gender}' is not valid according to the ontology.")
        return False

    block_id = f"person({person_dict['person_id']}).\n\n"
    block_data = (
        f"person_data(\n"
        f"    {person_dict['person_id']},\n"
        f"    '{person_dict['name']}',\n"
        f"    '{person_dict['surname']}',\n"
        f"    {gender},\n"
        f"    '{person_dict['birth_date']}',\n"
        f"    '{bg}'\n"
        ").\n\n"
    )

    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    out = []
    inserted_id = inserted_data = False
    for line in lines:
        out.append(line)
        if not inserted_id and line.strip() == "% person_id":
            out.append(block_id)
            inserted_id = True
        if not inserted_data and line.strip() == "% person_data":
            out.append(block_data)
            inserted_data = True

    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(out)

    logging.info('Person added to knowledge base.')
    return True


def insert_new_person_relationships(file_path: str, prescribed_to: dict|None = None, has_disease: dict|None = None):

    logging.info('Insert the relationships into the knowledge base.')
    if not prescribed_to and not has_disease:
        return False, 'Nessun dato è stato fornito'
    # Check bloodGroup
    block_data = {}

    if prescribed_to:
        block_data = {
            'prescribedTo':
                f"prescribed_to("
                f"{prescribed_to['drugs']},"
                f"{prescribed_to['person_id']},"
                f"'{prescribed_to['startDate']}',"
                f"{prescribed_to['endDate']},"
                f"'{prescribed_to['dosage']}',"
                f"'{prescribed_to['frequency']}'"
                ").\n",
            'hasPrescription':
                f"has_prescription("
                f"{prescribed_to['person_id']},"
                f"{prescribed_to['drugs']},"
                f"'{prescribed_to['startDate']}',"
                f"'{prescribed_to['endDate']}',"
                f"'{prescribed_to['dosage']}',"
                f"'{prescribed_to['frequency']}'"
                ").\n",
        }

    if has_disease:
        relationship = ontology['hasPatient']
        status = has_disease["status"]
        status = GoogleTranslator(source='it', target='en').translate(status).lower()
        if status not in relationship['opt_status']:
            logging.error(f" The status'{status}' is not valid according to the ontology.")
        else:
            disease = get_disease_id_by_name(has_disease['disease'].capitalize())
            if disease:
                block_data['hasDisease'] = (
                    f"has_disease("
                    f"{has_disease['person_id']},"
                    f"{disease},"
                    f"'{has_disease['diagnosisDate']}'"
                    f",{has_disease['status']}).\n"
                )

                block_data['hasPatient'] = (
                    f"has_patient("
                    f"{disease},"
                    f"{has_disease['person_id']},"
                    f"'{has_disease['diagnosisDate']}',"
                    f"{has_disease['status']}).\n"
                )


    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    out = []
    inserted_prescribed = inserted_has_prescription =  False
    inserted_has_disease = inserted_has_patient =  False
    messages = ''
    for line in lines:
        out.append(line)
        if not inserted_prescribed and line.strip() == "% prescribed_to":
            if 'prescribedTo' in block_data and not check_fact(block_data['prescribedTo']):
                messages += 'Prescrizione inserita correttamente. '
                out.append(block_data['prescribedTo'])
            elif 'hasPrescription' in block_data:
                messages += 'Prescrizione non inserita o già presente. '
            inserted_prescribed = True
        if not inserted_has_prescription and line.strip() == "% has_prescription":
            if 'hasPrescription' in block_data and not check_fact(block_data['hasPrescription']):
                out.append(block_data['hasPrescription'])
            inserted_has_prescription = True
        if not inserted_has_patient and line.strip() == "% has_patient":
            if 'hasPatient' in block_data and not check_fact(block_data['hasPatient']):
                messages += 'Malattia aggiunta correttamente. '
                out.append(block_data['hasPatient'])
            elif 'hasPatient' in block_data:
                messages += 'Malattia non aggiunta o già presente. '
            inserted_has_patient = True
        if not inserted_has_disease and line.strip() == "% has_disease":
            if 'hasDisease' in block_data and not check_fact(block_data['hasDisease']):
                out.append(block_data['hasDisease'])
            inserted_has_disease = True

    with open(file_path, 'w', encoding='utf-8') as f:
        f.writelines(out)

    logging.info('Relationships inserted into knowledge base.')
    return True, messages
