DROP TRIGGER IF EXISTS trigger_sex_user ON myUser;
DROP TRIGGER IF EXISTS trigger_ajout_eleve ON Eleve;
DROP TRIGGER IF EXISTS trigger_en_attente ON Parent;
DROP TRIGGER IF EXISTS trigger_annuler_inscrip ON Inscription;
DROP TRIGGER IF EXISTS trigger_payement ON Inscription;
DROP TRIGGER IF EXISTS trigger_check_somme_gagnee ON Enseignant;
DROP TRIGGER IF EXISTS trigger_check_matiere ON Enseignant;
DROP TRIGGER IF EXISTS trigger_check_reserve ON Inscription;
DROP TRIGGER IF EXISTS trigger_prix_reserve ON Inscription;
DROP TRIGGER IF EXISTS trigger_prix_repartition ON Inscription;
DROP TRIGGER IF EXISTS trigger_update_reserve_solidarite ON Projet;
DROP TRIGGER IF EXISTS trigger_insert_projet_objectif ON Projet;
DROP TRIGGER IF EXISTS check_dates_projet ON Projet;
DROP TRIGGER IF EXISTS check_dates_projet_insert ON Projet;
DROP TRIGGER IF EXISTS trigger_insert_archive_cagnotte ON Archive;
DROP TRIGGER IF EXISTS trigger_insert_archive_reserve ON Archive;
DROP TRIGGER IF EXISTS trigger_remove_projet ON myDate;
DROP TRIGGER IF EXISTS trigger_update_date ON myDate;

DROP FUNCTION  IF EXISTS  check_sex_user();
DROP FUNCTION  IF EXISTS  check_date();
DROP FUNCTION  IF EXISTS  check_date_insert();
DROP FUNCTION  IF EXISTS  check_en_attente();
DROP FUNCTION  IF EXISTS  check_parent();
DROP FUNCTION  IF EXISTS  check_payement();
DROP FUNCTION  IF EXISTS  check_reserve();
DROP FUNCTION  IF EXISTS  check_somme_gagnnee();
DROP FUNCTION  IF EXISTS  check_matiere();
DROP FUNCTION  IF EXISTS  annuler_inscrip();
DROP FUNCTION  IF EXISTS  prix_repartition();
DROP FUNCTION  IF EXISTS  prix_reserve();
DROP FUNCTION  IF EXISTS  update_Date();
DROP FUNCTION  IF EXISTS  annul_en_attente();
DROP FUNCTION  IF EXISTS  remove_projet();
DROP FUNCTION  IF EXISTS  verification_cagnotte();
DROP FUNCTION  IF EXISTS  verification_objectif();
DROP FUNCTION  IF EXISTS  verification_reserve();


-- verification du sex
CREATE FUNCTION check_sex_user() RETURNS trigger AS $$
BEGIN
  IF NEW.sexe != 'M' AND NEW.sexe != 'F' THEN
    RAISE NOTICE 'err dans l insertion du sex de l user';
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_sex_user
BEFORE INSERT ON myUser
FOR EACH ROW EXECUTE PROCEDURE check_sex_user();





--trigger verifie si id parent est bien un parent
CREATE FUNCTION check_parent() RETURNS trigger AS $$
DECLARE all_parent Parent;
BEGIN
    SELECT * INTO all_parent FROM Parent where id = NEW.id_parent;
    IF NOT FOUND THEN RAISE NOTICE 'Le parent n existe pas';
    RETURN NULL;
    END IF;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_ajout_eleve
BEFORE INSERT ON Eleve
FOR EACH ROW EXECUTE PROCEDURE check_parent();



-- mise a joute de "en attente" des parents
CREATE FUNCTION check_en_attente() RETURNS trigger as $$
BEGIN
  IF NEW.en_attente != 0 AND NEW.en_attente != 1 THEN
    RAISE NOTICE 'mise a jour de l attribut en attente erroné';
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_en_attente
BEFORE UPDATE ON Parent
FOR EACH ROW EXECUTE PROCEDURE check_en_attente();


----------- annulé insc

CREATE FUNCTION annuler_inscrip() RETURNS  trigger as $$
    DECLARE
        ligne Eleve;
    BEGIN
        SELECT INTO ligne from Inscription where id_eleve = NEW.id_eleve;
        IF (select en_attente from Parent where id = ligne.id_parent) != FALSE THEN
            raise notice 'le pere de l etudiant inscrit est en attente';
            RETURN NULL;
        END IF;
    END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_annuler_inscrip
BEFORE INSERT on Inscription
FOR EACH STATEMENT EXECUTE PROCEDURE annuler_inscrip();



-- echec dans le cas ou le prix payé est < 8
CREATE FUNCTION check_payement() RETURNS trigger as $$
BEGIN
  IF NEW.prix < 8 THEN
    RAISE NOTICE 'prix payement inferieur a 8';
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_payement
BEFORE INSERT ON Inscription
FOR EACH ROW EXECUTE PROCEDURE check_payement();



-- verifier la somme gagnee avant l'update
CREATE FUNCTION check_somme_gagnnee() RETURNS trigger as $$
BEGIN
  IF NEW.somme_gagnee < OLD.somme_gagnee THEN
    RAISE NOTICE 'err : nv somme gagnee est inf a l ancienne somme stoqué';
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_somme_gagnee
BEFORE UPDATE ON Enseignant
FOR EACH ROW EXECUTE PROCEDURE check_somme_gagnnee();


--- verifie la matiere de l'enseignant ----
CREATE FUNCTION check_matiere() RETURNS trigger as $$
BEGIN
  IF (select count(*) from Matiere where Matiere.id = New.id_matiere) != 1  THEN
    RAISE NOTICE 'err : Matiere enseignant introuvable dans table matiere';
    RETURN NULL;
  END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_matiere
BEFORE UPDATE ON Enseignant
FOR EACH ROW EXECUTE PROCEDURE check_matiere();



-- verifier s'il y a assez d'argent dans la reserve_solidarite
CREATE FUNCTION check_reserve() RETURNS trigger as $$
BEGIN
  IF ( SELECT reserve_solidarite FROM Projet where id = NEW.id_projet) < 2 THEN
    RAISE NOTICE 'Il n y a pas assez d argent dans la reserve';
    RETURN NULL;
  END IF;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_reserve
BEFORE INSERT ON Inscription
FOR EACH ROW
when (NEW.prix >=8 AND NEW.prix <= 10) EXECUTE PROCEDURE check_reserve();




-- ajouter a la reserve quand prix de l'inscrip > 10
CREATE FUNCTION prix_reserve() RETURNS trigger as $$
  BEGIN
    UPDATE Projet
    SET reserve_solidarite = reserve_solidarite + (NEW.prix - 10)
    where id = NEW.id_projet;
    RAISE NOTICE 'prix supp a 10 est l ajoute a la reserve solidarité est fait';
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_prix_reserve
AFTER INSERT ON Inscription
FOR EACH ROW
when (NEW.prix > 10) EXECUTE PROCEDURE prix_reserve();

-- disctribuer le prix de l'inscrip 4% Enseignant 4% entreprise 2% cagnotte
CREATE FUNCTION prix_repartition() RETURNS trigger as $$
DECLARE prix_cagnotte INT; prix_enseignant INT; projet_recup Projet; date_actuelle myDate;
  BEGIN
    SELECT * INTO projet_recup  FROM Projet WHERE id = NEW.id_projet LIMIT 1;
    SELECT * INTO date_actuelle FROM myDate LIMIT 1;
    IF(date_actuelle.date_fictive >= projet_recup.date_fin * (75/100) AND projet_recup.cagnotte < projet_recup.objectif) THEN
        prix_cagnotte = 4;
        prix_enseignant = 4;
    ELSE
        prix_cagnotte = 2;
        prix_enseignant = 4;
    end if;
    UPDATE Projet
    SET cagnotte = cagnotte + prix_cagnotte
    where id = NEW.id_projet;

    UPDATE Enseignant
    SET somme_gagnee = somme_gagnee + prix_enseignant
    where id = (select id_enseignant from Cours where Cours.id = NEW.id_cours);

    RAISE NOTICE 'distribution faite avec succes';

    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_prix_repartition
AFTER INSERT ON Inscription
FOR EACH ROW EXECUTE PROCEDURE prix_repartition();





----- reserv solid tjr supp a son ancien valeur ------------
CREATE FUNCTION annul_en_attente() RETURNS trigger as $$
BEGIN
    IF NEW.reserve_solidarite > OLD.reserve_solidarite tHEN
    UPDATE Parent
        SET en_attente = False;
        RAISE NOTICE 'La reserve solidarité a augmenté les parents ne sont plus en attente';
        RETURN NEW;
        END IF;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_reserve_solidarite
BEFORE UPDATE ON Projet
FOR EACH ROW EXECUTE PROCEDURE annul_en_attente();


-- verification objectif insertion Projet
CREATE FUNCTION verification_objectif() RETURNS trigger as $$
  BEGIN
    IF NEW.objectif < 0 THEN
      RAISE NOTICE 'err objectif projet neg';
      RETURN NULL;
    END IF;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_insert_projet_objectif
BEFORE INSERT ON Projet
FOR EACH ROW EXECUTE PROCEDURE verification_objectif();



-- verification date debut < date fin
CREATE FUNCTION check_date() RETURNS trigger as $$
BEGIN
    IF date_debut < date_fin THEN
        RAISE NOTICE 'err : date_debut < date_fin (meme projet)';
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_dates_projet
BEFORE INSERT ON Projet
for each statement execute procedure check_date();



------ verifier date avant creation de projet ---
CREATE FUNCTION check_date_insert() RETURNS trigger as $$
BEGIN
    --- on recupere fin la date du dernier projet et on compare avec date debut du nouveau (on doit pas avoir deux en mm temps
    IF New.date_debut < (select date_fin from Projet  where id = (SELECT MAX(id) FROM Projet)) THEN
      RAISE NOTICE 'err : date debut nv projet < date fin ancien projet';
      RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_dates_projet_insert
BEFORE INSERT ON Projet
for each statement execute procedure check_date_insert();



-- verification cagnotte insertion Archivage
CREATE FUNCTION verification_cagnotte() RETURNS trigger as $$
  BEGIN
    IF NEW.cagnotte != 0 THEN
      RAISE NOTICE 'err : cagnotte initialisé != 0';
      RETURN NULL;
    END IF;
  END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_insert_archive_cagnotte
BEFORE INSERT ON Archive
FOR EACH ROW EXECUTE PROCEDURE verification_cagnotte();




-- verification cagnotte insertion Archivage
CREATE FUNCTION verification_reserve() RETURNS trigger as $$
  BEGIN
    IF NEW.reserve_solidarite != 0 THEN
      RAISE NOTICE 'err : reserve initialisé != 0';
      RETURN NULL;
    END IF;
  END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_insert_archive_reserve
BEFORE INSERT ON Archive
FOR EACH ROW EXECUTE PROCEDURE verification_reserve();



----- triggers date fic ----- suppresion du projet
CREATE FUNCTION remove_projet() RETURNS trigger AS $$
    DECLARE
        ligne Projet;
    BEGIN
        SELECT INTO ligne from Projet limit 1;
        IF date_fictive > ligne.date_fin THEN
            raise notice 'supp projet en cours, ajout dans l archivage effectué';
            INSERT INTO Archive (nom, date_debut, date_fin, objectif, cagnotte, reserve_solidarite, id_association) VALUES (ligne.nom, ligne.date_fin, ligne.date_fin, ligne.objectif,ligne.cagnotte, ligne.reserve_solidarite, ligne.id_association);
            DELETE FROM Projet where id = (select min(id) from Projet);
        end if;
    END;
$$ LANGUAGE  plpgsql;


CREATE TRIGGER trigger_remove_projet
AFTER UPDATE ON myDate
FOR EACH statement EXECUTE PROCEDURE remove_projet();




----- trigg notification ----
CREATE FUNCTION update_Date() RETURNS trigger as $$ -- a changer
    DECLARE projet_boucle Projet;
BEGIN
    For projet_boucle IN SELECT * FROM Projet
        LOOP
            IF projet_boucle.cagnotte >= (75/100 * projet_boucle.objectif)  THEN
                RAISE NOTICE 'La cagnotte a atteint % et a donc depassé 75 pour 100 de l objectif', projet_boucle.cagnotte;
            ELSIF projet_boucle.cagnotte >= (50/100 * projet_boucle.objectif)  THEN
                RAISE NOTICE 'La cagnotte a atteint % et a donc depassé 50 pour 100 de l objectif', projet_boucle.cagnotte;
            ELSIF projet_boucle.cagnotte >= (25/100 * projet_boucle.objectif)  THEN
                RAISE NOTICE 'La cagnotte a atteint % et a donc depassé 25 pour cent de l objectif', projet_boucle.cagnotte;
                end if ;
            --IF(myDate.date_fictive >= projet_boucle.date_fin * (75/100) ) THEN
                --RAISE NOTICE 'On a depassé 75 pour cent du temps';
            --end if;
        end loop;

end;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trigger_update_date
BEFORE UPDATE ON myDate
for each statement execute procedure update_Date();