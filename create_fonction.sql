
create or replace function creer_projet(nom_projet VARCHAR, nom_assos VARCHAR, objectif INT)
    returns void
language plpgsql
as $$
DECLARE assos_recup Association;
BEGIN
    SELECT * INTO assos_recup FROM Association WHERE Association.nom = nom_assos; --Association.nom ou nom
    IF NOT FOUND THEN RAISE EXCEPTION ' Il n existe pas d associations de ce noms'; END IF;
    INSERT INTO Projet(nom, objectif, id_association) VALUES (nom, objectif, assos_recup.id);
END;
$$;


create or replace function inscription_cours (matiere VARCHAR, nom_eleve VARCHAR, prenom_eleve VARCHAR, prix INT)
    returns void
language plpgsql
as $$
DECLARE cours_recup Cours; eleve_recup Eleve; inscription_recup Inscription;
BEGIN
    SELECT * INTO cours_recup FROM Cours WHERE Cours.matiere = matiere; --date particulier? TRIGGER SUR UN SEUL COURS MATIERE/DATE OU SINON CMT
    IF NOT FOUND THEN RAISE EXCEPTION 'Il n existe pas encore de cours pour cette matiere'; END IF;
    SELECT * INTO eleve_recup FROM Eleve WHERE Eleve.nom = nom_eleve AND Eleve.prenom = prenom_eleve;
    IF NOT FOUND THEN RAISE EXCEPTION 'Il n existe pas encore d eleve de ce nom'; END IF;
    IF cours_recup.id_inscription IS NOT NULL THEN RAISE EXCEPTION 'Le cours est déjà pris'; END IF;
    INSERT INTO Inscription VALUES(NULL, prix, eleve_recup.id, ???, cours_recup.id); -- à quel projet on s'inscrit
    SELECT * INTO inscription_recup FROM Inscription WHERE id_eleve = eleve_recup.id AND id_cours= cours_recup.id; --+id projet?
    UPDATE Cours SET id_inscription = inscription_recup.id WHERE id = cours_recup.id;   -- verifier id inscription ds cours est null
END;
$$;


create or replace function inscription_association(nom VARCHAR)
    returns void
language plpgsql
as $$
BEGIN
    INSERT Into Association VALUES(NULL, nom);
END;
$$;



create function creer_parent(nom VARCHAR, prenom VARCHAR, sexe VARCHAR(1))
    returns void
language plpgsql
as $$
BEGIN
    INSERT INTO Parent VALUES (NULL, nom, prenom, sexe, 0);
END;
$$;

create function creer_eleve(nom VARCHAR, prenom VARCHAR, sexe VARCHAR(1), nom_ecole VARCHAR, adresse_ecole VARCHAR, nom_parent VARCHAR, prenom_parent VARCHAR)
    returns void
language plpgsql
as $$
DECLARE recup_ecole Ecole; recup_parent Parent;
BEGIN
    SELECT * INTO recup_ecole FROM Ecole Where Ecole.nom = nom_ecole AND Ecole.adresse = adresse_ecole;
    IF NOT FOUND THEN RAISE EXCEPTION 'Il n existe pas d ecole de ce nom à cette adresse'; END IF;
    SELECT * INTO recup_parent FROM Parent Where Parent.nom = nom_parent AND Parent.prenom = prenom_parent;
    IF NOT FOUND THEN RAISE EXCEPTION 'Il n existe pas de parent de ce nom'; END IF;

    INSERT INTO Eleve VALUES (NULL, nom, prenom, sexe, recup_ecole.id, recup_parent.id);
END;
$$;

create function creer_enseignant(nom VARCHAR, prenom VARCHAR, sexe VARCHAR(1), nom_matiere VARCHAR)
    returns void
language plpgsql
as $$
DECLARE recup_matiere Matiere;
BEGIN
    SELECT * INTO recup_matiere FROM Matiere Where Matiere.nom = nom_matiere;
    IF NOT FOUND THEN RAISE EXCEPTION 'Il n existe pas de matiere de ce nom'; END IF;
    INSERT INTO Enseignant VALUES(NULL, nom, prenom, sexe, recup_matiere.id, 0);
END;
$$;
