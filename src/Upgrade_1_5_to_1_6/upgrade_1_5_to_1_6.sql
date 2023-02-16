-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.6. https://github.com/OpenFKG/fkg-postgresql/milestone/4';

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/114
-- link4 på ladestander
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN link4 CHARACTER varying(1024) NULL;

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/118
-- Markering af foto som vedrørende tilgængelighed
ALTER TABLE fkg.t_7900_fotoforbindelse_t ADD COLUMN tilgaeng_kode int NOT NULL DEFAULT 0;
ALTER TABLE fkg.t_7900_fotoforbindelse_t ADD CONSTRAINT tilgaeng_kode_ck CHECK (primaer_kode IN (0,1));
ALTER TABLE fkg.t_7900_fotoforbindelse_t ADD CONSTRAINT t_7900_fotoforbindelse_d_basis_ja_nej_tilg FOREIGN KEY (tilgaeng_kode)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH SIMPLE ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/117
-- Supplerende info til billeder
ALTER TABLE fkg.t_7901_foto_t ADD COLUMN billedtekst CHARACTER varying(3000), ADD COLUMN alt_tekst CHARACTER varying(254);

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/116
-- Lang tilgængeligheds beskrivelse
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000);

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/116
-- Ny JSON felt med tilgængeligheds-oplysninger
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN tilgaeng_opl jsonb;
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN tilgaeng_opl jsonb;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN tilgaeng_opl jsonb;

-- View definitions and trigger definitions for 6 changed 5607, 7900, 7901, 5800, 5801, 5802:
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
  g.noegle,
  g.note,
  t.geometri,
  t.copyright,
  t.billedtekst,
  t.alt_tekst
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
  g.noegle,
  g.note,
  t.fkg_tema,
  t.foto_objek,
  t.foto_lokat,
  t.foto_navn,
  t.primaer_kode,
  k1.ja_nej AS primaer,
  t.tilgaeng_kode,
  k2.ja_nej AS tilgaeng
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7900_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.primaer_kode = k1.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k2 ON (t.tilgaeng_kode = k2.ja_nej_kode)
WHERE g.systid_til IS NULL;
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
  g.noegle,
  g.note,
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.navndels,
  t.straekn_nr,
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
  t.saeson_k,
  k7.saeson_k AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.ansva_v_k,
  k8.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k9.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k10.kategori AS kategori,
  t.certifi_k,
  k11.certifi_k AS certifi,
  t.hierarki_k,
  k12.hierarki AS hierarki,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet,
  t.folder_k,
  k14.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.gpx_link,
  t.vejkode,
  k15.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k16.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
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
  fkg.d_5800_saeson k7 ON (t.saeson_k = k7.saeson_k) LEFT JOIN
  fkg.d_basis_ansva_v k8 ON (t.ansva_v_k = k8.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k9 ON (t.svaerhed_k = k9.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k10 ON (t.kategori_k = k10.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k11 ON (t.certifi_k = k11.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k12 ON (t.hierarki_k = k12.hierarki_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k14 ON (t.folder_k = k14.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k15 ON (t.vejkode = k15.vejkode) LEFT JOIN
  fkg.d_basis_postnr k16 ON (t.postnr = k16.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5801_fac_fl;
CREATE VIEW fkg.t_5801_fac_fl AS
SELECT
  5801::integer AS temakode,
  't_5801_fac_fl_t'::text AS temanavn,
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
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.kvalitet_k,
  k9.kvalitet AS kvalitet,
  t.folder_k,
  k10.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.vejkode,
  k11.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k12.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k13.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_5800_kvalitet k9 ON (t.kvalitet_k = k9.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.folder_k = k10.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k11 ON (t.vejkode = k11.vejkode) LEFT JOIN
  fkg.d_basis_postnr k12 ON (t.postnr = k12.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k13 ON (t.ansva_v_k = k13.ansva_v_k)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5800_fac_pkt;
CREATE VIEW fkg.t_5800_fac_pkt AS
SELECT
  5800::integer AS temakode,
  't_5800_fac_pkt_t'::text AS temanavn,
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
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.kvalitet_k,
  k9.kvalitet AS kvalitet,
  t.folder_k,
  k10.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.vejkode,
  k11.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k12.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k13.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5800_fac_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_5800_kvalitet k9 ON (t.kvalitet_k = k9.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.folder_k = k10.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k11 ON (t.vejkode = k11.vejkode) LEFT JOIN
  fkg.d_basis_postnr k12 ON (t.postnr = k12.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k13 ON (t.ansva_v_k = k13.ansva_v_k)
WHERE g.systid_til IS NULL;
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
  t.link4,
  t.adr_id,
  t.ansvar_org,
  t.kontak_ved,
  t.omraade_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.geometri
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
  g.noegle,
  g.note,
  t.geometri,
  t.copyright,
  t.billedtekst,
  t.alt_tekst
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
  g.noegle,
  g.note,
  t.fkg_tema,
  t.foto_objek,
  t.foto_lokat,
  t.foto_navn,
  t.primaer_kode,
  k1.ja_nej AS primaer,
  t.tilgaeng_kode,
  k2.ja_nej AS tilgaeng
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7900_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.primaer_kode = k1.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k2 ON (t.tilgaeng_kode = k2.ja_nej_kode);
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
  g.noegle,
  g.note,
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.navndels,
  t.straekn_nr,
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
  t.saeson_k,
  k7.saeson_k AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.ansva_v_k,
  k8.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k9.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k10.kategori AS kategori,
  t.certifi_k,
  k11.certifi_k AS certifi,
  t.hierarki_k,
  k12.hierarki AS hierarki,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet,
  t.folder_k,
  k14.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.gpx_link,
  t.vejkode,
  k15.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k16.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
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
  fkg.d_5800_saeson k7 ON (t.saeson_k = k7.saeson_k) LEFT JOIN
  fkg.d_basis_ansva_v k8 ON (t.ansva_v_k = k8.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k9 ON (t.svaerhed_k = k9.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k10 ON (t.kategori_k = k10.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k11 ON (t.certifi_k = k11.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k12 ON (t.hierarki_k = k12.hierarki_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k14 ON (t.folder_k = k14.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k15 ON (t.vejkode = k15.vejkode) LEFT JOIN
  fkg.d_basis_postnr k16 ON (t.postnr = k16.postnr);
DROP VIEW IF EXISTS fkg.hist_t_5801_fac_fl;
CREATE VIEW fkg.hist_t_5801_fac_fl AS
SELECT
  5801::integer AS temakode,
  't_5801_fac_fl_t'::text AS temanavn,
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
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.kvalitet_k,
  k9.kvalitet AS kvalitet,
  t.folder_k,
  k10.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.vejkode,
  k11.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k12.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k13.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_5800_kvalitet k9 ON (t.kvalitet_k = k9.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.folder_k = k10.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k11 ON (t.vejkode = k11.vejkode) LEFT JOIN
  fkg.d_basis_postnr k12 ON (t.postnr = k12.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k13 ON (t.ansva_v_k = k13.ansva_v_k);
DROP VIEW IF EXISTS fkg.hist_t_5800_fac_pkt;
CREATE VIEW fkg.hist_t_5800_fac_pkt AS
SELECT
  5800::integer AS temakode,
  't_5800_fac_pkt_t'::text AS temanavn,
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
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.navn_uk,
  t.navn_d,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.saeson_bem,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.kvalitet_k,
  k9.kvalitet AS kvalitet,
  t.folder_k,
  k10.ja_nej AS folder,
  t.folde_link,
  t.foldelink1,
  t.foldelink2,
  t.foldelink3,
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.filmlink,
  t.filmlink1,
  t.filmlink2,
  t.filmlink3,
  t.vejkode,
  k11.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k12.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k13.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.tilgaeng_beskriv,
  t.tilgaeng_opl,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5800_fac_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_5800_kvalitet k9 ON (t.kvalitet_k = k9.kvalitet_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.folder_k = k10.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k11 ON (t.vejkode = k11.vejkode) LEFT JOIN
  fkg.d_basis_postnr k12 ON (t.postnr = k12.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k13 ON (t.ansva_v_k = k13.ansva_v_k);
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
  t.link4,
  t.adr_id,
  t.ansvar_org,
  t.kontak_ved,
  t.omraade_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.geometri
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
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode, noegle, note)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode, NEW.noegle, NEW.note;

      -- Insert into theme
      INSERT INTO fkg.t_7901_foto_t (versions_id, geometri, copyright, billedtekst, alt_tekst)
      SELECT
        NEW.versions_id, NEW.geometri, NEW.copyright, NEW.billedtekst, NEW.alt_tekst;

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

      -- Insert into t_7901_foto_t
      INSERT INTO fkg.t_7901_foto_t (versions_id, geometri, copyright, billedtekst, alt_tekst)
      SELECT
        NEW.versions_id, NEW.geometri, NEW.copyright, NEW.billedtekst, NEW.alt_tekst;
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

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_7901_foto_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_7901_foto_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_7901_foto_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
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
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode, noegle, note)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode, NEW.noegle, NEW.note;

      -- Insert into theme
      INSERT INTO fkg.t_7900_fotoforbindelse_t (versions_id, fkg_tema, foto_objek, foto_lokat, foto_navn, primaer_kode, tilgaeng_kode)
      SELECT
        NEW.versions_id, NEW.fkg_tema, NEW.foto_objek, NEW.foto_lokat, NEW.foto_navn, NEW.primaer_kode, NEW.tilgaeng_kode;

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

      -- Insert into t_7900_fotoforbindelse_t
      INSERT INTO fkg.t_7900_fotoforbindelse_t (versions_id, fkg_tema, foto_objek, foto_lokat, foto_navn, primaer_kode, tilgaeng_kode)
      SELECT
        NEW.versions_id, NEW.fkg_tema, NEW.foto_objek, NEW.foto_lokat, NEW.foto_navn, NEW.primaer_kode, NEW.tilgaeng_kode;
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

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_7900_fotoforbindelse_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_7900_fotoforbindelse_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_7900_fotoforbindelse_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
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
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode, noegle, note)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode, NEW.noegle, NEW.note;

      -- Insert into theme
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navn_uk, navn_d, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;

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

      -- Insert into t_5802_fac_li_t
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navn_uk, navn_d, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;
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

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5802_fac_li_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5802_fac_li_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5802_fac_li_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
CREATE OR REPLACE FUNCTION fkg.t_5801_fac_fl_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, navn_uk, navn_d, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;

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

      -- Insert into t_5801_fac_fl_t
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, navn_uk, navn_d, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5801_fac_fl_trg_iud ON fkg.t_5801_fac_fl;

CREATE TRIGGER t_5801_fac_fl_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5801_fac_fl
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5801_fac_fl_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5801_fac_fl_t;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5801_fac_fl_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5801_fac_fl_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5801_fac_fl_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
CREATE OR REPLACE FUNCTION fkg.t_5800_fac_pkt_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, navn_uk, navn_d, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;

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

      -- Insert into t_5800_fac_pkt_t
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, navn_uk, navn_d, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, tilgaeng_beskriv, tilgaeng_opl, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.navn_uk, NEW.navn_d, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.tilgaeng_beskriv, NEW.tilgaeng_opl, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5800_fac_pkt_trg_iud ON fkg.t_5800_fac_pkt;

CREATE TRIGGER t_5800_fac_pkt_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5800_fac_pkt
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5800_fac_pkt_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5800_fac_pkt_t;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5800_fac_pkt_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5800_fac_pkt_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5800_fac_pkt_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
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
      INSERT INTO fkg.t_5607_ladefacilitet_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, planstatus_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, foto_link, foto_link1, foto_link2, foto_link3, link, link1, link2, link3, link4, adr_id, ansvar_org, kontak_ved, omraade_navn, gyldig_fra, gyldig_til, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.planstatus_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.link4, NEW.adr_id, NEW.ansvar_org, NEW.kontak_ved, NEW.omraade_navn, NEW.gyldig_fra, NEW.gyldig_til, NEW.geometri;

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
      INSERT INTO fkg.t_5607_ladefacilitet_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, planstatus_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, foto_link, foto_link1, foto_link2, foto_link3, link, link1, link2, link3, link4, adr_id, ansvar_org, kontak_ved, omraade_navn, gyldig_fra, gyldig_til, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.planstatus_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.link4, NEW.adr_id, NEW.ansvar_org, NEW.kontak_ved, NEW.omraade_navn, NEW.gyldig_fra, NEW.gyldig_til, NEW.geometri;
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
