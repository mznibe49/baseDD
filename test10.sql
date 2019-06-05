--Un parent s'inscrit pour un cours avec seulement 8€, il passe en attente, et la prochaine fois qu'il s'inscrit avec seulement 8€, il sera refusé car en attente


UPDATE Projet SET reserve_solidarite = 0 Where id = 1;


INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);



INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);


-- Plusieurs parents en attente:


INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);



INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);



INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);



INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(30 ,1,1,1); -- paye plus que 10€ et du coup augmente la reserve_solidarite et debloque les parents

--augmente aussi le solde de l'enseignant

SELECT * FROM Parent;


--si un parent s'inscrit avec moins de 8€ il est refusé


INSERT INTO Inscription (prix, id_eleve, id_projet, id_cours) VALUES(8 ,1,1,1);
