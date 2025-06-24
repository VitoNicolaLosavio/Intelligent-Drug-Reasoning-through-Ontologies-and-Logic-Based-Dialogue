import streamlit as st
from Middleware import extract_intent


def chatbot_response(user_id, message):
    return extract_intent(message=message, person_id=user_id)


# Titolo dell'app
st.title("Chatbot con Knowledge Base")

st.markdown("""
Benvenuto nel **assistente medico intelligente** 🧠💊  
Questo chatbot utilizza una *base di conoscenza clinica* per fornirti risposte personalizzate su prescrizioni, farmaci e condizioni di salute.

Per funzionare al meglio, il sistema ha bisogno di associare le informazioni a un paziente:  
inserisci il tuo **ID paziente** oppure fornisci alcuni dati (anche parziali) per registrarti.

⚠️ Senza queste informazioni, il chatbot potrà comunque rispondere a **domande generali**, ma **non potrà fornirti indicazioni personalizzate**.

---

🔔 **Disclaimer**  
Questo assistente ha **solo finalità informative** e non sostituisce in alcun modo il parere del medico o le prescrizioni professionali.  
Per qualsiasi decisione clinica, rivolgiti sempre a un professionista sanitario qualificato.
""")



# Campo per l'ID utente
user_id = st.text_input("Inserisci il tuo ID utente")

# Stato della conversazione (sessione utente)
if "chat_history" not in st.session_state:
    st.session_state.chat_history = []

# Input del messaggio
message = st.text_input("Scrivi un messaggio")
# Quando premi Invio o clicchi su invia
if st.button("Invia") and user_id and message:
    # Salva il messaggio utente
    st.session_state.chat_history.append((f"👤 {user_id}", message))

    # Ottieni risposta dal chatbot
    response = chatbot_response(user_id, message)
    st.session_state.chat_history.append(("🤖 Bot", response))

# Mostra la conversazione
st.subheader("Conversazione")
for sender, msg in st.session_state.chat_history:
    st.markdown(f"**{sender}**: {msg}")
