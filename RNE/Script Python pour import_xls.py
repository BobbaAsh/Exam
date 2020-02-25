#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jan  7 15:51:34 2020

@author: bobba
"""

from sqlalchemy import create_engine
import pandas as pd
import time

departements  = "id	region_code	code	name	nom normalisé"
population = "Code insée	Population légale"
elus = "code (insee)	mode de scrutin	numliste	code (nuance de la liste)	numéro du candidat dans la liste	tour	nom	prénom	sexe	Date de naissance	code (profession)	libellé profession	nationalité"
nuancier = "code	libellé	ordre	définition_"
ville = "id	departement_code	code_insee	zip_code	name"
categories = "Code	Nb d'emplois	Artisans, commerçants, chefs d'entreprise	Cadres et professions intellectuelles supérieures	Professions intermédaires	Employés	Ouvriers"


engine = create_engine("mysql+pymysql://root@localhost/RNE")

def r_names(x):
    s2 = x.lower().replace(' ', '_').replace(',','').replace('(','').replace(')','').replace("'",'').replace('é','e').split()
    return(s2)
 
def parse_dates(x3):
    for i in range(0,len(x3)):
        if x3[i][0:4]=='Date':
            return x3[i]
    return    
    
def chargement(x, link, table):
    col = r_names(x)
    print("Lecture des données")
    start_time = time.time()
    df = pd.read_excel(link, skiprows = [0,1])
    df.columns = col
    print("Données lu")
    df.to_sql(table, con = engine, if_exists='append', index = False)
    return print("Temps d execution : %s secondes ---" % (time.time() - start_time))

chargement(categories,'/home/bobba/code/Simplon/Exam/RNE/RESSOURCES/categorie_professionelle.xlsx', 'categorie')
