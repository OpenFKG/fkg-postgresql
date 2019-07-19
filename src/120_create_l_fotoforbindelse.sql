DROP VIEW IF EXISTS fkg.l_fotoforbindelse;
CREATE VIEW fkg.l_fotoforbindelse AS
SELECT
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
  t.noegle,
  t.note,
  t.foto_objek,
  t.foto_prefix,
  t.foto_navn,
  k1.tema_kode,
  k1.tema_navn,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.l_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_tabel k1 ON (t.tema_kode = k1.tema_kode)
WHERE g.systid_til IS NULL;

DROP VIEW IF EXISTS fkg.hist_l_fotoforbindelse;
CREATE VIEW fkg.hist_l_fotoforbindelse AS
SELECT
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
  t.noegle,
  t.note,
  t.foto_objek,
  t.foto_prefix,
  t.foto_navn,
  k1.tema_kode,
  k1.tema_navn,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.l_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_tabel k1 ON (t.tema_kode = k1.tema_kode);

CREATE OR REPLACE FUNCTION fkg.l_fotoforbindelse_trg() RETURNS trigger AS $$
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

      -- Insert into l_fotoforbindelse_t
      INSERT INTO fkg.l_fotoforbindelse_t (versions_id, noegle, note,   foto_objek, foto_prefix, foto_navn, tema_kode, geometri)
      SELECT
        NEW.versions_id, NEW.noegle, NEW.note, NEW.foto_objek, NEW.foto_prefix, NEW.foto_navn, NEW.tema_kode, NEW.geometri;

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

      -- Insert into l_fotoforbindelse_t
      INSERT INTO fkg.l_fotoforbindelse_t (versions_id, noegle, note,   foto_objek, foto_prefix, foto_navn, tema_kode, geometri)
      SELECT
        NEW.versions_id, NEW.noegle, NEW.note, NEW.foto_objek, NEW.foto_prefix, NEW.foto_navn, NEW.tema_kode, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS l_fotoforbindelse_trg_iud ON fkg.l_fotoforbindelse;

CREATE TRIGGER l_fotoforbindelse_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.l_fotoforbindelse
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.l_fotoforbindelse_trg();
