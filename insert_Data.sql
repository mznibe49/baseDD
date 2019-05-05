

-------- Utilisateurs --------

-------- Eleve --------

INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Stephan','Ariane', 'F', 1, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Stephan','Camille', 'F', 2, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Stephan','Chayane', 'M', 3, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Ribeiro','Camille', 'F', 2, 2 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Ribeiro','Andrea', 'F', 3, 2 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Zniber','Simo', 'M', 1, 3);
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Lepeix','Thomas', 'M', 3, 4);
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Lepeix','Lea', 'F', 1, 4 );

INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Bob','Marley', 'F', 1, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Stepahane','Curry', 'F', 2, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Neymar','Da silva', 'M', 3, 1 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Leonel','Messi', 'F', 2, 2 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('xavi','hernandez', 'F', 3, 2 );
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Cristiano','Ronaldo', 'M', 1, 3);
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Kylian','Mbappe', 'M', 3, 4);
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Ivan','Racititc', 'F', 1, 4 );

-------- Parents --------

INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Stephan', 'Serge', 'M',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Ribeiro', 'Aïda', 'F',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Zniber', 'Mohamed', 'M',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Lepeix', 'Mathilde', 'F',0);


INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Lorem', 'Ipsum', 'M',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Clement', 'longlet', 'F',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Moahmmed', 'Salah', 'M',0);
INSERT INTO Parent ( nom, prenom, sexe, en_attente) VALUES ( 'Steve', 'Mandanda', 'F',0);

-------- Enseignant --------

INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Parsen', 'Jean', 'M', 0, 1);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Antiquario', 'Anais', 'F', 0, 2);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Delfino', 'Susan', 'F', 0, 3);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Boiro', 'Michel', 'M', 0, 4);

INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'LeMaire', 'Samantha', 'F', 0, 1);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Sveth', 'Samuel', 'M', 0, 3);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Cure', 'Lisa', 'F', 0, 4);

INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Marneau', 'Julien', 'M', 0, 1);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Nieniel', 'Diandra', 'F', 0, 2);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Bouamra', 'Malek', 'M', 0, 4);


INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'LeMaire', 'Samantha', 'F', 0, 1);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Sveth', 'Samuel', 'M', 0, 3);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Cure', 'Lisa', 'F', 0, 4);

INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Marneau', 'Julien', 'M', 0, 1);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Nieniel', 'Diandra', 'F', 0, 2);
INSERT INTO Enseignant ( nom, prenom, sexe, somme_gagnee, id_matiere) VALUES ( 'Bouamra', 'Malek', 'M', 0, 4);


-------- Ecoles --------

INSERT INTO Ecole (adresse, nom) VALUES ( '5 rue Thomas Mann', 'Paris Diderot');
INSERT INTO Ecole (adresse, nom) VALUES ( '12 rue de test1', 'Ecole Lefevre');
INSERT INTO Ecole (adresse, nom) VALUES ( '33 rue de test2', 'Dauphine');
INSERT INTO Ecole (adresse, nom) VALUES ( '42 rue de test3', 'Sorbone');
INSERT INTO Ecole (adresse, nom) VALUES ( '24 rue de test4', 'Euclide');
INSERT INTO Ecole (adresse, nom) VALUES ( '11 rue de test5', 'Ibn Cina');
INSERT INTO Ecole (adresse, nom) VALUES ( '41 rue de test6', 'Jean jack hamid');
INSERT INTO Ecole (adresse, nom) VALUES ( '16 rue de test7', 'Spinoza');
INSERT INTO Ecole (adresse, nom) VALUES ( '99 rue de test8', 'Alhabus');

-------- Matieres --------

INSERT INTO Matiere (nom) VALUES ( 'Français');
INSERT INTO Matiere (nom) VALUES ( 'Histoire');
INSERT INTO Matiere (nom) VALUES ( 'Informatique');
INSERT INTO Matiere (nom) VALUES ( 'Maths');


-------- Associations --------

INSERT INTO Association (nom) VALUES( 'Resto du coeurs');
INSERT INTO Association (nom) VALUES( 'Croix Rouge');
INSERT INTO Association (nom) VALUES( 'Unicef');
INSERT INTO Association (nom) VALUES( 'Sidaction');


-------- Projet --------

INSERT INTO Projet (nom, date_debut, date_fin, objectif, cagnotte, reserve_solidarite, id_association) VALUES('nom_projet1','2019-01-02 00:00:00.000','2019-05-02 00:00:00.000',200,0,0,1);
INSERT INTO Projet (nom, date_debut, date_fin, objectif, cagnotte, reserve_solidarite, id_association) VALUES('nom_projet2','2019-01-02 00:00:00.000','2019-05-02 00:00:00.000',200,0,0,1);


-------- Inscription --------
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(20 ,1,1,1);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(10 ,2,2,2);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(9 ,3,3,3);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(12 ,4,4,4);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,5,5,5);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(10 ,6,6,6);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(13,7,7,7);
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(10,8,8,8);


-------- Cours --------

INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-03 00:00:00.000' ,25);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-04 00:00:00.000' ,26);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-05 00:00:00.000' ,27);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-06 00:00:00.000' ,28);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-07 00:00:00.000' ,29);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-08 00:00:00.000' ,30);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-09 00:00:00.000' ,31);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-10 00:00:00.000' ,32);

INSERT INTO Cours (date_cours, id_enseignant) VALUES( '2019-01-03 00:00:00.000' ,33);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-04 00:00:00.000' ,34);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-05 00:00:00.000' ,35);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-06 00:00:00.000' ,36);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-07 00:00:00.000' ,37);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-08 00:00:00.000' ,38);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-09 00:00:00.000' ,39);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-10 00:00:00.000' ,40);

INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-03 00:00:00.000' ,31);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-04 00:00:00.000' ,32);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-05 00:00:00.000' ,33);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-06 00:00:00.000' ,34);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-07 00:00:00.000' ,25);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-08 00:00:00.000' ,26);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-09 00:00:00.000' ,27);
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-10 00:00:00.000' ,28);




-------- myDate --------

--- ici on a une seul date fictif currDate avec laquelle on va comparer les autre
INSERT INTO myDate VALUES('2019-01-02 00:00:00.000');




