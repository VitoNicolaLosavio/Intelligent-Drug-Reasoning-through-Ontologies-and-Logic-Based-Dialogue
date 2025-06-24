# 🧠 Intelligent Medical Assistant

This project implements a conversational **chatbot in Italian** that interacts with a **clinical knowledge base written in Prolog**. The chatbot can answer questions about drugs, diseases, prescriptions, and treatments, providing both general and personalized responses based on the user's clinical profile.

## Requirements

Before running the system, ensure you have the following installed:

- Python 3.10 or higher
- [SWI-Prolog](https://www.swi-prolog.org/Download.html)
- [Ollama](https://ollama.com/) (to run the LLaMA model locally)
- LLaMA 3 model available in Ollama:
  ```bash
  ollama run llama3.1:8b

## Install Python dependencies
For install all the dependencies of the project you need to run the following code on your cmd
```bash
pip install -r requirements.txt
```

## Running the Chatbot

Once everything is installed, launch the chatbot interface with:
```bash
streamlit run interface.py
```
