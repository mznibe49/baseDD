-- verification du sex
CREATE TRIGGER trigger_sex_user
BEFORE INSERT ON User
FOR EACH ROW EXECUTE PROCEDURE check_sex_user();

CREATE FUNCTION check_sex_user() RETURNS trigger AS $$
BEGIN
  IF NEW.sexe != 'M' AND NEW.sexe != 'F' THEN
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;



-- initialisation de "en attente" des parents
CREATE TRIGGER trigger_init_en_attente
BEFORE INSERT ON Parent
FOR EACH ROW EXECUTE PROCEDURE check_init_en_attente();

CREATE FUNCTION check_init_en_attente() RETURNS trigger as $$
BEGIN
  IF NEW.en_attente != 0 THEN
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- mise a joute de "en attente" des parents
CREATE TRIGGER trigger_en_attente
BEFORE UPDATE ON Parent
FOR EACH ROW EXECUTE PROCEDURE check_en_attente();

CREATE FUNCTION check_en_attente() RETURNS trigger as $$
BEGIN
  IF NEW.en_attente != 0 AND NEW.en_attente != 1 THEN
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

-- echec dans le cas ou le prix payé est < 8

CREATE TRIGGER trigger_payement
BEFORE INSERT ON Inscription
FOR EACH ROW EXECUTE PROCEDURE check_payement();


CREATE FUNCTION check_payement() RETURNS trigger as $$
BEGIN
  IF NEW.prix < 8 THEN
    RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- verifier la somme gagnee a l'initialisation
CREATE TRIGGER trigger_init_somme_gagnee
BEFORE INSERT ON Enseignant
FOR EACH ROW EXECUTE PROCEDURE check_init_somme_gagnne();

CREATE FUNCTION check_init_somme_gagnne() RETURNS trigger as $$
BEGIN
  IF NEW.somme_gagnee != 0 THEN
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;


-- verifier la somme gagnee avant l'update
CREATE TRIGGER trigger_check_somme_gagnee
BEFORE UPDATE ON Enseignant
FOR EACH ROW EXECUTE PROCEDURE check_somme_gagnnee();

CREATE FUNCTION check_somme_gagnnee() RETURNS trigger as $$
BEGIN
  IF NEW.somme_gagnee < OLD.somme_gagnee THEN
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;


-- verifier s'il y a assez d'argent dans la reserve_solidarite
CREATE TRIGGER trigger_check_reserve
BEFORE INSERT ON Inscription
FOR EACH ROW
when (NEW.prix >=8 AND NEW.prix <= 10) EXECUTE PROCEDURE check_reserve();

CREATE FUNCTION check_reserve() RETURNS trigger as $$
BEGIN
  IF ( SELECT reserve_solidarite FROM Projet where id = NEW.id_projet) < 2 THEN
    RAISE NOTICE 'Il n y a pas assez d argent dans la reserve';
    RETURN NULL;
  END IF;
END
$$ LANGUAGE plpgsql;

-- ajouter a la reserve quand prix de l'inscrip > 10

CREATE TRIGGER trigger_prix_reserve
AFTER INSERT ON Inscription
FOR EACH ROW
when (NEW.prix > 10) EXECUTE PROCEDURE prix_reserve();

CREATE FUNCTION prix_reserve() RETURNS trigger as $$
  BEGIN
    UPDATE Projet
    SET reserve_solidarite = reserve_solidarite + (NEW.prix - 10)
    where id = NEW.id_projet;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

-- disctribuer le prix de l'inscrip 4% Enseignant 4% entreprise 2% cagnotte

CREATE TRIGGER trigger_prix_repartition
AFTER INSERT ON Inscription
FOR EACH ROW EXECUTE PROCEDURE prix_repartition();

CREATE FUNCTION prix_repartition() RETURNS trigger as $$
  BEGIN
    UPDATE Projet
    SET cagnotte = cagnotte + 2
    where id = NEW.id_projet;

    UPDATE Enseignant
    SET somme_gagnee = somme_gagnee + 4
    where id = (select id_enseignant from Cours where Cours.id = NEW.id_cours);

    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

-- verification objectif insertion Projet

CREATE TRIGGER trigger_insert_projet_objectif
BEFORE INSERT ON Projet
FOR EACH ROW EXECUTE PROCEDURE verification_objectif();

CREATE FUNCTION verification_objectif() RETURNS trigger as $$
  BEGIN
    IF NEW.objectif < 0 THEN
      RETURN NULL;
    END IF;
  END;
$$ LANGUAGE plpgsql;


-- verification cagnotte insertion Projet

CREATE TRIGGER trigger_insert_projet_cagnotte
BEFORE INSERT ON Projet
FOR EACH ROW EXECUTE PROCEDURE verification_cagnotte();

CREATE FUNCTION verification_cagnotte() RETURNS trigger as $$
  BEGIN
    IF NEW.cagnotte != 0 THEN
      RETURN NULL;
    END IF;
  END;

$$ LANGUAGE plpgsql;

-- verification reserve_solidarite insertion Projet

CREATE TRIGGER trigger_insert_projet_solidatire
BEFORE INSERT ON Projet
FOR EACH ROW EXECUTE PROCEDURE verification_reserve();

CREATE FUNCTION verification_reserve() RETURNS trigger as $$
  BEGIN
    IF NEW.reserve_solidarite != 0 THEN
      RETURN NULL;
    END IF;
  END;
$$ LANGUAGE plpgsql;



-- insertion date ----

-- verifier la matiere du cours

--CREATE TRIGGER trigger_check_matiere_cours
--BEFORE INSERT ON Cours
--FOR EACH ROW EXECUTE PROCEDURE check_matiere_cours();

--CREATE FUNCTION check_matiere_cours() RETURNS trigger as $$
--BEGIN
  --IF ( SELECT COUNT (*) FROM Matiere WHERE Matiere.id = Cours.id_matiere) != 1 THEN
	--RETURN NULL;
  --END IF;
--END;
--$$ LANGUAGE plpgsql;


-- verification date debut < date fin
CREATE TRIGGER check_dates_projet
BEFORE INSERT ON Projet
for each statement execute procedure check_date();

CREATE FUNCTION check_date() RETURNS trigger as $$
BEGIN
    IF date_debut < date_fin THEN
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;



------ verifier date avant creation de projet ---

CREATE TRIGGER check_dates_projet_insert
BEFORE INSERT ON Projet
for each statement execute procedure check_date_insert();


CREATE FUNCTION check_date_insert() RETURNS trigger as $$
BEGIN
    --- on recupere fin la date du dernier projet et on compare avec date debut du nouveau (on doit pas avoir deux en mm temps
    IF New.date_debut < (select date_fin from Projet  where id = (SELECT MAX(id) FROM Projet)) THEN
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql