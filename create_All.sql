DROP TABLE IF EXISTS myDate;
DROP TABLE IF EXISTS Inscription;
DROP TABLE IF EXISTS Enseignant;
DROP TABLE IF EXISTS Eleve;
DROP TABLE IF EXISTS Parent;
DROP TABLE IF EXISTS Archive;
DROP TABLE IF EXISTS Cours;
DROP TABLE IF EXISTS Projet;
DROP TABLE IF EXISTS Matiere;
DROP TABLE IF EXISTS Association;
DROP TABLE IF EXISTS Ecole;
DROP TABLE IF EXISTS myUser;


CREATE TABLE myDate
(
  date_fictive TIMESTAMP NOT NULL
);


CREATE TABLE Ecole
(-- 10
    id SERIAL ,
    adresse varchar(100) NOT NULL,
    nom     varchar(20)  NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE Association( -- 4
    id SERIAL,
    nom VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY(id)
);


CREATE TABLE Projet( -- 3
    id SERIAL ,
    nom VARCHAR(100) NOT NULL UNIQUE,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,
    objectif INT NOT NULL default 0,
    cagnotte INT NOT NULL default 0,
    reserve_solidarite INT NOT NULL default 0,
    id_association INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_association) REFERENCES Association(id)
);

CREATE INDEX ind_debut_fin_projet ON Projet(date_debut,date_fin);
CREATE INDEX ind_cagnotte_projet ON Projet(cagnotte);
CREATE INDEX ind_solidarite_projet ON Projet(reserve_solidarite);

CREATE TABLE Matiere
( -- 9
    id SERIAL ,
    nom varchar(20) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);


CREATE TABLE myUser ( -- 5
  id SERIAL  ,
  nom varchar(20) NOT NULL,
  prenom varchar(20) NOT NULL,
  sexe char(1) NOT NULL,
  PRIMARY KEY (id)
);

CREATE UNIQUE INDEX ind_nom_prenom_user ON myUser (nom,prenom);


CREATE TABLE Parent
( -- 6
    en_attente boolean NOT NULL default false,
    email varchar(30)
) INHERITS (myUser);

CREATE INDEX ind_en_attente ON Parent(en_attente);


CREATE TABLE Eleve
( -- 7
    id_ecole  INT NOT NULL,
    id_parent INT NOT NULL,
    FOREIGN KEY (id_ecole) REFERENCES Ecole (id),
    FOREIGN KEY (id_parent) REFERENCES myUser(id)
) INHERITS (myUser);



CREATE TABLE Enseignant
( -- 8
    somme_gagnee INT NOT NULL default 0,
    id_matiere   INT NOT NULL,
    FOREIGN KEY (id_matiere) REFERENCES Matiere (id)
) INHERITS (myUser);



CREATE TABLE Cours ( -- 2
    id SERIAL ,
    date_cours TIMESTAMP NOT NULL,
    id_enseignant INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_enseignant) REFERENCES myUser(id)
);


CREATE INDEX ind_date_cours ON Cours (date_cours);


CREATE TABLE Inscription( -- 1
    id SERIAL ,
    prix INT NOT NULL,
    id_eleve INT NOT NULL,
    id_projet INT NOT NULL,
    id_cours INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_eleve) REFERENCES myUser(id),
    FOREIGN KEY (id_cours) REFERENCES Cours(id),
    FOREIGN KEY (id_projet) REFERENCES Projet(id)
);

CREATE UNIQUE INDEX ind_nom_adresse_ecole ON Ecole (nom,adresse);


CREATE  TABLE Archive
(
    id SERIAL,
    nom VARCHAR(100) NOT NULL UNIQUE,
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP NOT NULL,
    objectif INT NOT NULL,
    cagnotte INT NOT NULL,
    reserve_solidarite INT NOT NULL,
    id_association INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(id_association) REFERENCES Association(id)
);

