---- inscrip refusé prix < 8
INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(7 ,4,2,4);
---- id enseignant inexistant
INSERT INTO Cours (date_cours, id_enseignant) VALUES('2019-01-05 00:00:00.000' ,90);
---- le pere d'un etudiant existe dans la base
INSERT INTO Eleve (nom,prenom,sexe,id_ecole,id_parent) VALUES ('Stepahane','Curry', 'F', 2, 60);



