CREATE TABLE fkg.d_5800_kvalitet (
  kvalitet_k integer NOT NULL,
  kvalitet character varying(35) NOT NULL,
  aktiv integer NOT NULL,
  begrebsdefinition character varying,
  CONSTRAINT d_5800_kvalitet_pk PRIMARY KEY (kvalitet_k)
);
INSERT INTO fkg.d_5800_kvalitet VALUES
(1, 'TurismQ2021',      1, 'Data om faciliteten er kvalitetssikret i 2021'),
(9, 'Ukendt',           1, 'Mangler viden om kvalitetssikring af facilitetens data');

ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN kvalitet_k integer NOT NULL DEFAULT 9;
ALTER TABLE fkg.t_5800_fac_pkt_t ALTER COLUMN kvalitet_k DROP DEFAULT;

ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN kvalitet_k integer NOT NULL DEFAULT 9;
ALTER TABLE fkg.t_5802_fac_li_t ALTER COLUMN kvalitet_k DROP DEFAULT;

ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN kvalitet_k integer NOT NULL DEFAULT 9;
ALTER TABLE fkg.t_5801_fac_fl_t ALTER COLUMN kvalitet_k DROP DEFAULT;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_5800_kvalitet_fk FOREIGN KEY (kvalitet_k)
REFERENCES fkg.d_5800_kvalitet (kvalitet_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_t_d_5800_kvalitet FOREIGN KEY (kvalitet_k)
REFERENCES fkg.d_5800_kvalitet (kvalitet_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_5800_kvalitet FOREIGN KEY (kvalitet_k)
REFERENCES fkg.d_5800_kvalitet (kvalitet_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  t.folder_k,
  k9.ja_nej AS folder,
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
  k10.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k11.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k12.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k)
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
  t.folder_k,
  k13.ja_nej AS folder,
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
  k14.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k15.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k16.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k13 ON (t.folder_k = k13.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k14 ON (t.vejkode = k14.vejkode) LEFT JOIN
  fkg.d_basis_postnr k15 ON (t.postnr = k15.postnr) LEFT JOIN
  fkg.d_5800_kvalitet k16 ON (t.kvalitet_k = k16.kvalitet_k)
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
  t.folder_k,
  k9.ja_nej AS folder,
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
  k10.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k11.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k12.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k)
WHERE g.systid_til IS NULL;

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
  t.folder_k,
  k9.ja_nej AS folder,
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
  k10.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k11.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k12.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k);
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
  t.folder_k,
  k13.ja_nej AS folder,
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
  k14.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k15.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k16.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k13 ON (t.folder_k = k13.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k14 ON (t.vejkode = k14.vejkode) LEFT JOIN
  fkg.d_basis_postnr k15 ON (t.postnr = k15.postnr) LEFT JOIN
  fkg.d_5800_kvalitet k16 ON (t.kvalitet_k = k16.kvalitet_k);
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
  t.folder_k,
  k9.ja_nej AS folder,
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
  k10.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k11.postnr_by AS postnr_by,
  t.adr_id,
  t.ansva_v_k,
  k12.ansva_v AS ansva_v,
  t.link,
  t.link1,
  t.link2,
  t.link3,
  t.geometri,
  t.kvalitet_k,
  k13.kvalitet AS kvalitet
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k) LEFT JOIN
  fkg.d_5800_kvalitet k13 ON (t.kvalitet_k = k13.kvalitet_k);
  
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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;

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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;
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

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5800_fac_pkt_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;

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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;
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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;

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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, kvalitet_k)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.kvalitet_k;
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

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5801_fac_fl_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();
