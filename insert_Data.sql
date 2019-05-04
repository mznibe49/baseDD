


-------- Utilisateurs --------

-------- Eleve --------

INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (1,'Stephan','Ariane', 'F', 1, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (2,'Stephan','Camille', 'F', 2, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (3,'Stephan','Chayane', 'M', 3, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (4,'Ribeiro','Camille', 'F', 2, 2 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (5,'Ribeiro','Andrea', 'F', 3, 2 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (6,'Zniber','Simo', 'M', 1, 3);
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (7,'Lepeix','Thomas', 'M', 3, 4);
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (8,'Lepeix','Lea', 'F', 1, 4 );

INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (9,'Bob','Marley', 'F', 1, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (10,'Stepahane','Curry', 'F', 2, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (11,'Neymar','Da silva', 'M', 3, 1 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (12,'Leonel','Messi', 'F', 2, 2 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (13,'xavi','hernandez', 'F', 3, 2 );
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (14,'Cristiano','Ronaldo', 'M', 1, 3);
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (15,'Kylian','Mbappe', 'M', 3, 4);
INSERT INTO Eleve (id,nom,prenom,sexe,id_ecole,id_parent) VALUES (16,'Ivan','Racititc', 'F', 1, 4 );

-------- Parents --------

INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (17, 'Stephan', 'Serge', 'M',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (18, 'Ribeiro', 'Aïda', 'F',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (19, 'Zniber', 'Mohamed', 'M',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (20, 'Lepeix', 'Mathilde', 'F',0);


INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (21, 'Lorem', 'Ipsum', 'M',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (22, 'Clement', 'longlet', 'F',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (23, 'Moahmmed', 'Salah', 'M',0);
INSERT INTO Parent (id, nom, prenom, sexe, en_attente) VALUES (24, 'Steve', 'Mandanda', 'F',0);

-------- Enseignant --------

INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (25, 'Parsen', 'Jean', 'M', 0, 1);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (26, 'Antiquario', 'Anais', 'F', 0, 2);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (27, 'Delfino', 'Susan', 'F', 0, 3);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (28, 'Boiro', 'Michel', 'M', 0, 4);

INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (29, 'LeMaire', 'Samantha', 'F', 0, 1);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (30, 'Sveth', 'Samuel', 'M', 0, 3);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (31, 'Cure', 'Lisa', 'F', 0, 4);

INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (32, 'Marneau', 'Julien', 'M', 0, 1);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (33, 'Nieniel', 'Diandra', 'F', 0, 2);
INSERT INTO Enseignant (id, nom, prenom, sexe, somme_gagnee, id_matiere) VALUES (34, 'Bouamra', 'Malek', 'M', 0, 4);


-------- Ecoles --------

INSERT INTO Ecole VALUES (1, '5 rue Thomas Mann', 'Paris Diderot');
INSERT INTO Ecole VALUES (2, '7 rue de Picpus', 'Ecole Lefevre');
INSERT INTO Ecole VALUES (3, '7 rue de Picpus', 'Ecole Infirmiere');


-------- Matieres --------

INSERT INTO Matiere VALUES (1, 'Français');
INSERT INTO Matiere VALUES (2, 'Histoire');
INSERT INTO Matiere VALUES (3, 'Informatique');
INSERT INTO Matiere VALUES (4, 'Maths');


-------- Associations --------

INSERT INTO Association VALUES(1, 'Resto du coeurs');
INSERT INTO Association VALUES(2, 'Croix Rouge');
INSERT INTO Association VALUES(3, 'Unicef');
INSERT INTO Association VALUES(4, 'Sidaction');


-------- Projet --------
INSERT INTO Projet VALUES(1,'nom_projet1','2019-01-02 00:00:00.000','2019-05-02 00:00:00.000',200,0,0,1);
INSERT INTO Projet VALUES(2,'nom_projet2','2019-01-02 00:00:00.000','2019-05-02 00:00:00.000',200,0,0,1);


-------- Inscription --------
INSERT INTO Inscription VALUES(1,20 ,1,1,1);
INSERT INTO Inscription VALUES(2,10 ,2,2,2);
INSERT INTO Inscription VALUES(3,9 ,3,3,3);
INSERT INTO Inscription VALUES(4,12 ,4,4,4);
INSERT INTO Inscription VALUES(5,8 ,5,5,5);
INSERT INTO Inscription VALUES(6,10 ,6,6,6);
INSERT INTO Inscription VALUES(7,13,7,7,7);
INSERT INTO Inscription VALUES(8,10,8,8,8);


-------- Cours --------

INSERT INTO Cours VALUES(1,'2019-01-03 00:00:00.000' ,1);
INSERT INTO Cours VALUES(2,'2019-01-04 00:00:00.000' ,2);
INSERT INTO Cours VALUES(3,'2019-01-05 00:00:00.000' ,3);
INSERT INTO Cours VALUES(4,'2019-01-06 00:00:00.000' ,4);
INSERT INTO Cours VALUES(5,'2019-01-07 00:00:00.000' ,5);
INSERT INTO Cours VALUES(6,'2019-01-08 00:00:00.000' ,6);
INSERT INTO Cours VALUES(7,'2019-01-09 00:00:00.000' ,7);
INSERT INTO Cours VALUES(8,'2019-01-10 00:00:00.000' ,8);



-------- myDate --------
INSERT INTO myDate VALUES('2019-01-02 00:00:00.000');
INSERT INTO myDate VALUES('2019-05-02 00:00:00.000');

INSERT INTO myDate VALUES('2019-01-03 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-04 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-05 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-06 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-07 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-08 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-09 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-10 00:00:00.000');

INSERT INTO myDate VALUES('2019-01-11 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-14 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-15 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-16 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-17 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-18 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-19 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-20 00:00:00.000');

INSERT INTO myDate VALUES('2019-01-23 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-24 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-25 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-26 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-27 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-28 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-29 00:00:00.000');
INSERT INTO myDate VALUES('2019-01-30 00:00:00.000');








