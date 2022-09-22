CREATE OR REPLACE FUNCTION fkg.fotoforbindelse_check_primaer_kode() returns trigger as $$
  BEGIN
	IF (NEW.primaer_kode = 1) THEN
      IF (
	    SELECT
	      count(1)
        FROM
	      fkg.t_7900_fotoforbindelse f
	    WHERE
          f.primaer_kode = 1 AND
	      f.objekt_id <> NEW.objekt_id AND
	      f.foto_objek = NEW.foto_objek
      ) > 0 THEN 
	    RAISE EXCEPTION 'Der må højst være een aktuel fotoforbindelse med primaer_kode = 1 til hver aktuelt objet.';
      END IF;
    END IF;
  RETURN NEW;
END;
$$ language plpgsql
;

DROP TRIGGER check_primaer_kode ON fkg.t_7900_fotoforbindelse;
CREATE TRIGGER check_primaer_kode 
  INSTEAD OF INSERT OR UPDATE ON fkg.t_7900_fotoforbindelse
  FOR EACH ROW
  EXECUTE FUNCTION fkg.fotoforbindelse_check_primaer_kode()
;
