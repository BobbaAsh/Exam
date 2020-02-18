CREATE DATABASE RNE;

USE RNE;
DROP TABLE IF EXISTS elus;
CREATE TABLE elus(
code_insee VARCHAR(12)
,mode_de_scrutin VARCHAR(1000)
,numliste INT(2)
,code_nuance_de_la_liste VARCHAR(6)
,numero_du_candidat_dans_la_liste INT(4)
,tour INT(3)
,nom VARCHAR(1000)
,prenom VARCHAR(1000)
,sexe VARCHAR(1)
,date_de_naissance VARCHAR(100)
,code_profession INT(6)
,libelle_profession VARCHAR(1000)
,nationalite VARCHAR(1000)
)
;

-- Create Table population
DROP TABLE IF EXISTS population;
CREATE TABLE population(
code_insee VARCHAR(12)
,population_legale INT(7)
)
;


DROP TABLE IF EXISTS nuancier;
CREATE TABLE nuancier(
code VARCHAR(6)
,libelle VARCHAR(1000)
,ordre INT(3)
,definition_ VARCHAR(1000)
)
;


DROP TABLE IF EXISTS villes;
CREATE TABLE villes(
id INT(6)
,departement_code VARCHAR(10)
,code_insee VARCHAR(10)
,zip_code INT(6)
,name VARCHAR(1000)
)
;

DROP TABLE IF EXISTS categorie;
CREATE TABLE categorie(
code VARCHAR(10)
,nb_demplois INT(6)
,artisans_commerçants_chefs_dentreprise INT(6)
,cadres_et_professions_intellectuelles_superieures INT(6)
,professions_intermedaires INT(6)
,employes INT(6)
,ouvriers INT(6)
)
;


DROP TABLE IF EXISTS departements;
CREATE TABLE departements(
id INT(4)
,region_code VARCHAR(100)
,code VARCHAR(100)
,name VARCHAR(1000)
,nom_normalise VARCHAR(1000)
)
;


CREATE USER 'RNE_user'@'localhost' IDENTIFIED BY 'RNE_password';
GRANT ALL PRIVILEGES ON localhost.rne TO 'RNE_user'@'localhost';
FLUSH PRIVILEGES;