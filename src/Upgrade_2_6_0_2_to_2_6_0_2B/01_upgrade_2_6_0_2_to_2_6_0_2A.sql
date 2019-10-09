-- Upgrade script FKG datamodel 2_6_0_2 to 2_6_0_2A
-- Missing column in t_5802_fac_li_t: straekn_nr
-- Fixes: https://github.com/OpenFKG/fkg-postgresql/issues/52

-- Drop dependent views
DROP VIEW IF EXISTS fkg.t_5802_fac_li;
DROP VIEW IF EXISTS fkg.hist_t_5802_fac_li;

-- New column
ALTER TABLE fkg.t_5802_fac_li_t
  ADD COLUMN straekn_nr character varying(128)
;

-- Create views
DROP VIEW IF EXISTS fkg.t_5802_fac_li;
CREATE VIEW fkg.t_5802_fac_li AS
SELECT
  5802::integer AS temakode,
  't_5802_fac_li_t'::text AS temanavn,
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
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navndels,
  t.afm_rute_k,
  k3.ja_nej AS afm_rute,
  t.laengde,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.straekn_nr,
  t.ansvar_org,
  t.kontak_ved,
  t.betaling_k,
  k4.ja_nej AS betaling,
  t.belaegn_k,
  k5.belaegning AS belaegn,
  t.handicap_k,
  k6.handicapegnet AS handikap,
  t.ansva_v_k,
  k7.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k8.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k9.kategori AS kategori,
  t.certifi_k,
  k10.certifi_k AS certifi,
  t.hierarki_k,
  k11.hierarki AS hierarki,
  t.folder_k,
  k12.ja_nej AS folder,
  t.folde_link,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.gpx_link,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5802_fac_li_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5802_rutetype k1 ON (t.rute_ty_k = k1.rute_ty_k) LEFT JOIN
  fkg.d_5802_rute_uty k2 ON (t.rute_uty_k = k2.rute_uty_k) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.afm_rute_k = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.betaling_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k5 ON (t.belaegn_k = k5.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k6 ON (t.handicap_k = k6.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansva_v k7 ON (t.ansva_v_k = k7.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k8 ON (t.svaerhed_k = k8.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k9 ON (t.kategori_k = k9.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k10 ON (t.certifi_k = k10.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k11 ON (t.hierarki_k = k11.hierarki_k) LEFT JOIN
  fkg.d_basis_ja_nej k12 ON (t.folder_k = k12.ja_nej_kode)
WHERE g.systid_til IS NULL;

DROP VIEW IF EXISTS fkg.hist_t_5802_fac_li;
CREATE VIEW fkg.hist_t_5802_fac_li AS
SELECT
  5802::integer AS temakode,
  't_5802_fac_li_t'::text AS temanavn,
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
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navndels,
  t.afm_rute_k,
  k3.ja_nej AS afm_rute,
  t.laengde,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.betaling_k,
  k4.ja_nej AS betaling,
  t.belaegn_k,
  k5.belaegning AS belaegn,
  t.handicap_k,
  k6.handicapegnet AS handikap,
  t.ansva_v_k,
  k7.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k8.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k9.kategori AS kategori,
  t.certifi_k,
  k10.certifi_k AS certifi,
  t.hierarki_k,
  k11.hierarki AS hierarki,
  t.folder_k,
  k12.ja_nej AS folder,
  t.folde_link,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.gpx_link,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5802_fac_li_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5802_rutetype k1 ON (t.rute_ty_k = k1.rute_ty_k) LEFT JOIN
  fkg.d_5802_rute_uty k2 ON (t.rute_uty_k = k2.rute_uty_k) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.afm_rute_k = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.betaling_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k5 ON (t.belaegn_k = k5.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k6 ON (t.handicap_k = k6.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansva_v k7 ON (t.ansva_v_k = k7.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k8 ON (t.svaerhed_k = k8.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k9 ON (t.kategori_k = k9.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k10 ON (t.certifi_k = k10.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k11 ON (t.hierarki_k = k11.hierarki_k) LEFT JOIN
  fkg.d_basis_ja_nej k12 ON (t.folder_k = k12.ja_nej_kode);


-- Create triggers
CREATE OR REPLACE FUNCTION fkg.t_5802_fac_li_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foto_link1, foto_link2, filmlink, gpx_link, adr_id, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.gpx_link, NEW.adr_id, NEW.link, NEW.geometri;

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

      -- Insert into t_5802_fac_li_t
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foto_link1, foto_link2, filmlink, gpx_link, adr_id, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.gpx_link, NEW.adr_id, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5802_fac_li_trg_iud ON fkg.t_5802_fac_li;

CREATE TRIGGER t_5802_fac_li_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5802_fac_li
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5802_fac_li_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5802_fac_li_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5802_fac_li_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

-- Recreate indices
DROP INDEX IF EXISTS fkg.t_5800_fac_pkt_t_gist;CREATE INDEX t_5800_fac_pkt_t_gist ON fkg.t_5800_fac_pkt_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5802_fac_li_t_gist;CREATE INDEX t_5802_fac_li_t_gist ON fkg.t_5802_fac_li_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5801_fac_fl_t_gist;CREATE INDEX t_5801_fac_fl_t_gist ON fkg.t_5801_fac_fl_t USING gist (geometri);
