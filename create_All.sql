DROP TABLE IF EXISTS myDate CASCADE ;
DROP TABLE IF EXISTS Inscription CASCADE ;
DROP TABLE IF EXISTS Cours CASCADE ;
DROP TABLE IF EXISTS Enseignant CASCADE ;
DROP TABLE IF EXISTS Eleve CASCADE ;
DROP TABLE IF EXISTS Parent CASCADE ;
DROP TABLE IF EXISTS Archive CASCADE ;
DROP TABLE IF EXISTS Projet CASCADE ;
DROP TABLE IF EXISTS Matiere CASCADE ;
DROP TABLE IF EXISTS Association CASCADE ;
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
  nom varchar(20) NOT NULL,
  prenom varchar(20) NOT NULL,
  sexe char(1) NOT NULL
);

--CREATE UNIQUE INDEX ind_nom_prenom_user ON myUser (nom,prenom);


CREATE TABLE Parent
( -- 6
  id SERIAL PRIMARY KEY ,
  en_attente boolean NOT NULL default false
) INHERITS (myUser);

CREATE INDEX ind_en_attente ON Parent(en_attente);


CREATE TABLE Eleve
( -- 7
    id SERIAL PRIMARY KEY ,
    id_ecole  INT NOT NULL,
    id_parent INT NOT NULL,
    FOREIGN KEY (id_ecole) REFERENCES Ecole (id),
    FOREIGN KEY (id_parent) REFERENCES Parent(id)
) INHERITS (myUser);



CREATE TABLE Enseignant
( -- 8
    id SERIAL PRIMARY KEY ,
    somme_gagnee INT NOT NULL default 0,
    id_matiere   INT NOT NULL,
    FOREIGN KEY (id_matiere) REFERENCES Matiere (id)
) INHERITS (myUser);



CREATE TABLE Cours ( -- 2
    id SERIAL PRIMARY KEY ,
    date_cours TIMESTAMP NOT NULL,
    id_enseignant INT NOT NULL,
    FOREIGN KEY(id_enseignant) REFERENCES Enseignant(id)
);


CREATE INDEX ind_date_cours ON Cours (date_cours);


CREATE TABLE Inscription( -- 1
    id SERIAL ,
    prix INT NOT NULL,
    id_eleve INT NOT NULL,
    id_projet INT NOT NULL,
    id_cours INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_eleve) REFERENCES Eleve(id),
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


