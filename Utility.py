from xml.etree import ElementTree as ET
from deep_translator import GoogleTranslator
from tqdm.notebook import tqdm
import pandas as pd
import logging

def extract_ontology_info(path: str):
    ontology = ET.parse(path)
    logging.info('Extracting ontology info')
    entity = ontology.find('entities')
    entities = entity.findall('entity')
    ontology_dict = {}

    logging.info('Extracting Entity info')
    for i in entities:
        dict_entity = {}
        name_entity = i.get('name')
        attrib = []
        last_attrib = None
        for attribute in i.iter():
            if attribute.tag == 'attribute':
                attrib.append(attribute.attrib['name'])
                last_attrib = attribute.attrib['name']
            elif attribute.tag == 'value':
                if 'opt_' + last_attrib not in dict_entity.keys():
                    dict_entity['opt_' + last_attrib] = [attribute.attrib['name'].lower()]
                else:
                    dict_entity['opt_' + last_attrib].append(attribute.attrib['name'].lower())
        dict_entity['attributes'] = attrib
        ontology_dict[name_entity] = dict_entity

    relationships = ontology.find('relationships')
    relationship = relationships.findall('relationship')
    logging.info('Extracting Relationship info')
    for i in relationship:
        dict_relationship = {}
        name = i.get('name')
        attrib = []
        last_attrib = None
        for attribute in i.iter():
            if attribute.tag == 'attribute':
                attrib.append(attribute.attrib['name'])
                last_attrib = attribute.attrib['name']
            elif attribute.tag == 'value':
                if 'opt_' + last_attrib not in dict_relationship.keys():
                    dict_relationship['opt_' + last_attrib] = [attribute.attrib['name'].lower()]
                else:
                    dict_relationship['opt_' + last_attrib].append(attribute.attrib['name'].lower())
        dict_relationship['attributes'] = attrib
        ontology_dict[name] = dict_relationship

    return ontology_dict


def fix_usage(df: pd.DataFrame, valid_usage: list, col='usage', name_col='notes'):
    usages = []
    notes = []
    logging.info('Fixing usage')
    for value in tqdm(df[col].values):
        try:
            translated = GoogleTranslator(source='it', target='en').translate(value).lower()
            translated = translated.replace(' ', '')
            if translated in valid_usage:
                usages.append(translated)
                notes.append(None)
            else:
                notes.append(f'Nota assunzione: {value}')
                usages.append(None)
        except Exception as e:
            logging.error(f'Error: {e}')
            notes.append(f'Nota assunzione: {value}')
            usages.append(None)

    df[col] = usages
    df[name_col] = notes
    return df
