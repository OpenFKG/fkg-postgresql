-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.7. https://github.com/OpenFKG/fkg-postgresql/milestone/6';

-- https://github.com/OpenFKG/fkg-postgresql/issues/124
-- Facilitetstypen fjernes helt:
-- NB: Kan fejle hvis en eksisterende facilitet i fkg.t_5800_fac_pkt_t eller fkg.t_5801_fac_fl_t peger på den.
DELETE FROM fkg.d_5800_facilitet WHERE facil_ty_k = 1172;

-- https://github.com/OpenFKG/fkg-postgresql/issues/123
-- sagsnr på ladestander
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN IF NOT EXISTS sagsnr CHARACTER varying(128) NULL;

-- View og trigger definition på 5607:
DROP VIEW IF EXISTS fkg.t_5607_ladefacilitet;
CREATE VIEW fkg.t_5607_ladefacilitet AS
SELECT
  5607::integer AS temakode,
  't_5607_ladefacilitet_t'::text AS temanavn,
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
  g.noegle,
  g.note,
  t.ladefacilitet_type_kode,
  k1.ladefacilitet_type AS ladefacilitet_type,
  t.effekt_type_kode,
  k2.effekt_type AS effekt_type,
  t.tilgaengelighed_type_kode,
  k3.tilgaengelighed_type AS tilgaengelighed_type,
  t.planstatus_kode,
  k4.planstatus AS planstatus,
  t.internationalt_id,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.antal_ladepunkter,
  t.stiktype,
  t.anvendelsesgrad_kwh,
  t.driftstart_fra,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.adr_id,
  t.ansvar_org,
  t.kontak_ved,
  t.omraade_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.geometri,
  t.link4,
  t.sagsnr
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5607_ladefacilitet_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode) LEFT JOIN
  fkg.d_basis_planstatus k4 ON (t.planstatus_kode = k4.planstatus_kode)
WHERE g.systid_til IS NULL;

DROP VIEW IF EXISTS fkg.hist_t_5607_ladefacilitet;
CREATE VIEW fkg.hist_t_5607_ladefacilitet AS
SELECT
  5607::integer AS temakode,
  't_5607_ladefacilitet_t'::text AS temanavn,
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
  g.noegle,
  g.note,
  t.ladefacilitet_type_kode,
  k1.ladefacilitet_type AS ladefacilitet_type,
  t.effekt_type_kode,
  k2.effekt_type AS effekt_type,
  t.tilgaengelighed_type_kode,
  k3.tilgaengelighed_type AS tilgaengelighed_type,
  t.planstatus_kode,
  k4.planstatus AS planstatus,
  t.internationalt_id,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.antal_ladepunkter,
  t.stiktype,
  t.anvendelsesgrad_kwh,
  t.driftstart_fra,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.adr_id,
  t.ansvar_org,
  t.kontak_ved,
  t.omraade_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.geometri,
  t.link4,
  t.sagsnr
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5607_ladefacilitet_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode) LEFT JOIN
  fkg.d_basis_planstatus k4 ON (t.planstatus_kode = k4.planstatus_kode);

CREATE OR REPLACE FUNCTION fkg.t_5607_ladefacilitet_trg() RETURNS trigger AS $$
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
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode, noegle, note)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode, NEW.noegle, NEW.note;

      -- Insert into theme
      INSERT INTO fkg.t_5607_ladefacilitet_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, planstatus_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, foto_link, foto_link1, foto_link2, foto_link3, link, link1, link2, link3, adr_id, ansvar_org, kontak_ved, omraade_navn, gyldig_fra, gyldig_til, geometri, link4, sagsnr)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.planstatus_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.adr_id, NEW.ansvar_org, NEW.kontak_ved, NEW.omraade_navn, NEW.gyldig_fra, NEW.gyldig_til, NEW.geometri, NEW.link4, NEW.sagsnr;

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
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode, noegle, note)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode, NEW.noegle, NEW.note;

      -- Insert into t_5607_ladefacilitet_t
      INSERT INTO fkg.t_5607_ladefacilitet_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, planstatus_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, foto_link, foto_link1, foto_link2, foto_link3, link, link1, link2, link3, adr_id, ansvar_org, kontak_ved, omraade_navn, gyldig_fra, gyldig_til, geometri, link4, sagsnr)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.planstatus_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.adr_id, NEW.ansvar_org, NEW.kontak_ved, NEW.omraade_navn, NEW.gyldig_fra, NEW.gyldig_til, NEW.geometri, NEW.link4, NEW.sagsnr;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5607_ladefacilitet_trg_iud ON fkg.t_5607_ladefacilitet;

CREATE TRIGGER t_5607_ladefacilitet_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5607_ladefacilitet
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5607_ladefacilitet_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5607_ladefacilitet_t;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5607_ladefacilitet_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5607_ladefacilitet_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5607_ladefacilitet_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
