BEGIN TRANSACTION;
-- Upgrade script FKG datamodel 2_6_0_2A to 2_6_0_3
-- l_fotoforbindelse replaced by t_7900_fotoforbindelse
-- New t_7901_foto
-- Drop obsolete views and tables
DROP VIEW IF EXISTS fkg.l_fotoforbindelse;
DROP VIEW IF EXISTS fkg.hist_l_fotoforbindelse;
DROP TABLE IF EXISTS fkg.l_fotoforbindelse_t;

-- Clean up, in order to make it possible to rerun
DROP VIEW IF EXISTS fkg.t_7900_fotoforbindelse;
DROP VIEW IF EXISTS fkg.hist_t_7900_fotoforbindelse;
DROP VIEW IF EXISTS fkg.t_7901_foto;
DROP VIEW IF EXISTS fkg.hist_t_7901_foto;
DROP TABLE IF EXISTS fkg.t_7901_foto_t;
DROP TABLE IF EXISTS fkg.t_7900_fotoforbindelse_t;

INSERT INTO fkg.d_temagruppe VALUES ('5.20', 7900, 7999,'Fotos');
INSERT INTO fkg.d_tabel VALUES (7900,'Fotoforbindelse','P','t_7900_fotoforbindelse','5.20');
INSERT INTO fkg.d_tabel VALUES (7901,'Foto','P','t_7901_foto','5.20');

-- Create t_7901_foto_t
CREATE TABLE fkg.t_7901_foto_t (
  versions_id uuid NOT NULL,
  note character varying(254),
  geometri geometry(POINT, 25832),
  copyright character varying(124),
  CONSTRAINT t_7901_foto_pk PRIMARY KEY (versions_id)
);
ALTER TABLE fkg.t_7901_foto_t ADD CONSTRAINT t_7901_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Create t_7900_fotoforbindelse_t
CREATE TABLE fkg.t_7900_fotoforbindelse_t (
  versions_id uuid NOT NULL,
  note character varying(254),
  fkg_tema character varying(50) NOT NULL,
  foto_objek uuid NOT NULL,
  foto_lokat uuid NOT NULL,
  foto_navn character varying(128),
  primaer_kode integer NOT NULL,
  CONSTRAINT t_7900_fotoforbindelse_pk PRIMARY KEY (versions_id),
  CONSTRAINT primaer_kode_ck CHECK (primaer_kode IN (0,1))
);
CREATE UNIQUE INDEX primaer_kode_unique_idx ON fkg.t_7900_fotoforbindelse_t
  USING btree
  (
    foto_objek,
    primaer_kode
  )
  WHERE (primaer_kode = 1);
ALTER TABLE fkg.t_7900_fotoforbindelse_t ADD CONSTRAINT t_7900_fotoforbindelse_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE fkg.t_7900_fotoforbindelse_t ADD CONSTRAINT t_7900_fotoforbindelse_d_basis_ja_nej FOREIGN KEY (primaer_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- New views, triggers and indeces:
/* Create script made by:
WITH new_tables AS (SELECT 't_7901_foto_t' table_name UNION SELECT 't_7900_fotoforbindelse_t')
SELECT fkg_utilities.get_view_definition(table_name, 'B') FROM new_tables
UNION
SELECT fkg_utilities.get_view_definition(table_name, 'H') FROM new_tables
UNION
SELECT fkg_utilities.get_trigger_function_definition(table_name) FROM new_tables
UNION
SELECT fkg_utilities.get_index_definition('t_7901_foto_t')
ORDER BY 1 desc
*/
DROP VIEW IF EXISTS fkg.t_7901_foto;
CREATE VIEW fkg.t_7901_foto AS
SELECT
  7901::integer AS temakode,
  't_7901_foto_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.note,
  t.geometri,
  t.copyright
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7901_foto_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_7900_fotoforbindelse;
CREATE VIEW fkg.t_7900_fotoforbindelse AS
SELECT
  7900::integer AS temakode,
  't_7900_fotoforbindelse_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.note,
  t.fkg_tema,
  t.foto_objek,
  t.foto_lokat,
  t.foto_navn,
  t.primaer_kode,
  k1.ja_nej AS primaer
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7900_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.primaer_kode = k1.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.hist_t_7901_foto;
CREATE VIEW fkg.hist_t_7901_foto AS
SELECT
  7901::integer AS temakode,
  't_7901_foto_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.note,
  t.geometri,
  t.copyright
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7901_foto_t t ON (g.versions_id = t.versions_id);
DROP VIEW IF EXISTS fkg.hist_t_7900_fotoforbindelse;
CREATE VIEW fkg.hist_t_7900_fotoforbindelse AS
SELECT
  7900::integer AS temakode,
  't_7900_fotoforbindelse_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.note,
  t.fkg_tema,
  t.foto_objek,
  t.foto_lokat,
  t.foto_navn,
  t.primaer_kode,
  k1.ja_nej AS primaer
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7900_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.primaer_kode = k1.ja_nej_kode);
DROP INDEX IF EXISTS fkg.t_7901_foto_t_gist;CREATE INDEX t_7901_foto_t_gist ON fkg.t_7901_foto_t USING gist (geometri);
CREATE OR REPLACE FUNCTION fkg.t_7901_foto_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_7901_foto_t (versions_id, note, geometri, copyright)
      SELECT
        NEW.versions_id, NEW.note, NEW.geometri, NEW.copyright;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into t_7901_foto_t
      INSERT INTO fkg.t_7901_foto_t (versions_id, note, geometri, copyright)
      SELECT
        NEW.versions_id, NEW.note, NEW.geometri, NEW.copyright;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_7901_foto_trg_iud ON fkg.t_7901_foto;

CREATE TRIGGER t_7901_foto_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_7901_foto
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_7901_foto_trg();

CREATE OR REPLACE FUNCTION fkg.make_multi()
  RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      NEW.geometri = ST_Multi(NEW.geometri);
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_7901_foto_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_7901_foto_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

CREATE OR REPLACE FUNCTION fkg.t_7900_fotoforbindelse_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_7900_fotoforbindelse_t (versions_id, note, fkg_tema, foto_objek, foto_lokat, foto_navn, primaer_kode)
      SELECT
        NEW.versions_id, NEW.note, NEW.fkg_tema, NEW.foto_objek, NEW.foto_lokat, NEW.foto_navn, NEW.primaer_kode;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into t_7900_fotoforbindelse_t
      INSERT INTO fkg.t_7900_fotoforbindelse_t (versions_id, note, fkg_tema, foto_objek, foto_lokat, foto_navn, primaer_kode)
      SELECT
        NEW.versions_id, NEW.note, NEW.fkg_tema, NEW.foto_objek, NEW.foto_lokat, NEW.foto_navn, NEW.primaer_kode;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_7900_fotoforbindelse_trg_iud ON fkg.t_7900_fotoforbindelse;

CREATE TRIGGER t_7900_fotoforbindelse_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_7900_fotoforbindelse
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_7900_fotoforbindelse_trg();

CREATE OR REPLACE FUNCTION fkg.make_multi()
  RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      NEW.geometri = ST_Multi(NEW.geometri);
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_7900_fotoforbindelse_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_7900_fotoforbindelse_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();
ROLLBACK TRANSACTION;