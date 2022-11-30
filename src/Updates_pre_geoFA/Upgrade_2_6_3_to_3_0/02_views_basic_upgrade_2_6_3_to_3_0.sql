DROP VIEW IF EXISTS fkg.t_5506_spildev_pl_pkt;
CREATE VIEW fkg.t_5506_spildev_pl_pkt AS
SELECT
  5506::integer AS temakode,
  't_5506_spildev_pl_pkt_t'::text AS temanavn,
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
  t.anlaeg_type_kode,
  k1.anlaeg_type AS anlaeg_type,
  t.planstatus_kode,
  k2.planstatus AS planstatus,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5506_spildev_pl_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5506_anlaegtype k1 ON (t.anlaeg_type_kode = k1.anlaeg_type_kode) LEFT JOIN
  fkg.d_basis_planstatus k2 ON (t.planstatus_kode = k2.planstatus_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5507_fiberkabel;
CREATE VIEW fkg.t_5507_fiberkabel AS
SELECT
  5507::integer AS temakode,
  't_5507_fiberkabel_t'::text AS temanavn,
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
  t.fs_cvr,
  t.fs_navn,
  t.dybde,
  t.aar_i_jord,
  t.antal_kabler,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5507_fiberkabel_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5900_jordfl;
CREATE VIEW fkg.t_5900_jordfl AS
SELECT
  5900::integer AS temakode,
  't_5900_jordfl_t'::text AS temanavn,
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
  t.afs_vejkode,
  k1.vejnavn AS afs_vejnavn,
  t.afs_cvf_vejkode,
  t.afs_husnr,
  t.afs_cvr_kode,
  t.afs_cvr_navn,
  t.afs_kommunekode,
  t.afs_postnr,
  k2.postnr_by AS afs_postnr_by,
  t.jordflyt_dato_start,
  t.jordflyt_dato_slut,
  t.modt_vejkode,
  k3.vejnavn AS modt_vejnavn,
  t.modt_cvf_vejkode,
  t.modt_husnr,
  t.modt_cvr_kode,
  t.modt_cvr_navn,
  t.modt_kommunekode,
  t.modt_postnr,
  k4.postnr_by AS modt_postnr_by,
  t.tillad_dato,
  t.jordmaengde_faktisk,
  t.jordmaengde_anmeldt,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5900_jordfl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_vejnavn k1 ON (t.afs_vejkode = k1.vejkode) LEFT JOIN
  fkg.d_basis_postnr k2 ON (t.afs_postnr = k2.postnr) LEFT JOIN
  fkg.d_vejnavn k3 ON (t.modt_vejkode = k3.vejkode) LEFT JOIN
  fkg.d_basis_postnr k4 ON (t.modt_postnr = k4.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5401_genbr_st;
CREATE VIEW fkg.t_5401_genbr_st AS
SELECT
  5401::integer AS temakode,
  't_5401_genbr_st_t'::text AS temanavn,
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
  t.gs_navn,
  t.gs_type_kode,
  k1.gs_type AS gs_type,
  t.p_nr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5401_genbr_st_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5401_gs_type k1 ON (t.gs_type_kode = k1.gs_type_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
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
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.film_link,
  t.film_link1,
  t.film_link2,
  t.film_link3,
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
  fkg.d_basis_ja_nej k13 ON (t.folder_k = k13.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k14 ON (t.vejkode = k14.vejkode) LEFT JOIN
  fkg.d_basis_postnr k15 ON (t.postnr = k15.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5500_elfors_omr;
CREATE VIEW fkg.t_5500_elfors_omr AS
SELECT
  5500::integer AS temakode,
  't_5500_elfors_omr_t'::text AS temanavn,
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
  t.net_s_nr,
  t.fs_cvr,
  t.fs_navn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5500_elfors_omr_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5601_hasti_daemp;
CREATE VIEW fkg.t_5601_hasti_daemp AS
SELECT
  5601::integer AS temakode,
  't_5601_hasti_daemp_t'::text AS temanavn,
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
  t.hasti_type_kode,
  k1.hasti_type AS hasti_type,
  t.hastighed_kode,
  k2.hastighed AS hastighed,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5601_hasti_daemp_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5601_hasti_type k1 ON (t.hasti_type_kode = k1.hasti_type_kode) LEFT JOIN
  fkg.d_basis_hastighed k2 ON (t.hastighed_kode = k2.hastighed_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5104_art_invas;
CREATE VIEW fkg.t_5104_art_invas AS
SELECT
  5104::integer AS temakode,
  't_5104_art_invas_t'::text AS temanavn,
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
  t.invasivart_kode,
  k1.ia_dansknavn AS ia_dansknavn,
  k1.ia_latinsknavn AS ia_latinsknavn,
  k1.ia_rige AS ia_rige,
  t.inventoer,
  t.antal_kode,
  k2.antal AS antal,
  t.forekomst,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5104_art_invas_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_invasivart k1 ON (t.invasivart_kode = k1.invasivart_kode) LEFT JOIN
  fkg.d_basis_antal k2 ON (t.antal_kode = k2.antal_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5600_vintervedl;
CREATE VIEW fkg.t_5600_vintervedl AS
SELECT
  5600::integer AS temakode,
  't_5600_vintervedl_t'::text AS temanavn,
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
  t.rute_kode,
  k1.rute AS rute,
  t.rute_entreprenoer_sne,
  t.rute_nr_sne,
  t.rute_entreprenoer_salt,
  t.rute_nr_salt,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5600_vintervedl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5600_rute k1 ON (t.rute_kode = k1.rute_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5602_p_zoner;
CREATE VIEW fkg.t_5602_p_zoner AS
SELECT
  5602::integer AS temakode,
  't_5602_p_zoner_t'::text AS temanavn,
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
  t.p_type_kode,
  k1.p_type AS p_type,
  t.p_tid_kode,
  k2.p_tid AS p_tid,
  t.p_periode,
  t.p_pladser_personbil,
  t.p_pris_time,
  t.p_pladser_handicap,
  t.p_pladser_lastbil,
  t.p_pladser_elbil,
  t.p_pladser_mc,
  t.p_pladser_cykel,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5602_p_zoner_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5602_p_type k1 ON (t.p_type_kode = k1.p_type_kode) LEFT JOIN
  fkg.d_5602_p_tid k2 ON (t.p_tid_kode = k2.p_tid_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5603_hasti_zone;
CREATE VIEW fkg.t_5603_hasti_zone AS
SELECT
  5603::integer AS temakode,
  't_5603_hasti_zone_t'::text AS temanavn,
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
  t.hastighed_kode,
  k1.hastighed AS hastighed,
  t.anbefalet_hastighed_kode,
  k2.hastighed AS anbefalet_hastighed,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5603_hasti_zone_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_hastighed k1 ON (t.hastighed_kode = k1.hastighed_kode) LEFT JOIN
  fkg.d_basis_hastighed k2 ON (t.anbefalet_hastighed_kode = k2.hastighed_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5604_koer_begr;
CREATE VIEW fkg.t_5604_koer_begr AS
SELECT
  5604::integer AS temakode,
  't_5604_koer_begr_t'::text AS temanavn,
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
  t.begr_type_kode,
  k1.begr_type AS begr_type,
  t.periode,
  t.vaegtbegr_akselt,
  t.vaegtbegr_totalv,
  t.fot_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5604_koer_begr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5604_begr_type k1 ON (t.begr_type_kode = k1.begr_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5902_jordv_anl;
CREATE VIEW fkg.t_5902_jordv_anl AS
SELECT
  5902::integer AS temakode,
  't_5902_jordv_anl_t'::text AS temanavn,
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
  t.brine,
  t.strenge_antal,
  t.strenge_laengde_samlede,
  t.tilladelses_dato,
  t.faerdigmeldingsdato,
  t.vaesketype_kode,
  k1.vaesketype AS vaesketype,
  t.gyldig_fra,
  t.gyldig_til,
  t.sagsnr,
  t.sag_status_kode,
  k2.sag_status AS sag_status,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5902_jordv_anl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5902_vaeske_type k1 ON (t.vaesketype_kode = k1.vaesketype_kode) LEFT JOIN
  fkg.d_basis_sag_status k2 ON (t.sag_status_kode = k2.sag_status_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5710_born_skole_dis;
CREATE VIEW fkg.t_5710_born_skole_dis AS
SELECT
  5710::integer AS temakode,
  't_5710_born_skole_dis_t'::text AS temanavn,
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
  t.udd_distrikt_nr,
  t.udd_distrikt_navn,
  t.udd_distrikt_type_kode,
  k1.udd_distrikt_type AS udd_distrikt_type,
  t.starttrin_kode,
  k2.trin AS starttrin,
  t.sluttrin_kode,
  k3.trin AS slutttrin,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5710_born_skole_dis_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5710_udd_distrikt_type k1 ON (t.udd_distrikt_type_kode = k1.udd_distrikt_type_kode) LEFT JOIN
  fkg.d_basis_trin k2 ON (t.starttrin_kode = k2.trin_kode) LEFT JOIN
  fkg.d_basis_trin k3 ON (t.sluttrin_kode = k3.trin_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5703_afstem_sted;
CREATE VIEW fkg.t_5703_afstem_sted AS
SELECT
  5703::integer AS temakode,
  't_5703_afstem_sted_t'::text AS temanavn,
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
  t.afstemningsomraade_nr,
  k1.afstemningsomraade_nr AS afstemningsomraade_navn,
  t.lokalitet,
  t.opstillingskreds_nr,
  t.opstillingskreds_navn,
  t.storkreds_nr,
  t.storkreds_navn,
  t.ansvar_revision,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5703_afstem_sted_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_afstemningsomraade k1 ON (t.afstemningsomraade_nr = k1.afstemningsomraade_nr) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5704_afstem_omr;
CREATE VIEW fkg.t_5704_afstem_omr AS
SELECT
  5704::integer AS temakode,
  't_5704_afstem_omr_t'::text AS temanavn,
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
  t.afstemningsomraade_nr,
  k1.afstemningsomraade_nr AS afstemningsomraade_navn,
  t.opstillingskreds_nr,
  t.opstillingskreds_navn,
  t.storkreds_nr,
  t.storkreds_navn,
  t.ansvar_revision,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5704_afstem_omr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_afstemningsomraade k1 ON (t.afstemningsomraade_nr = k1.afstemningsomraade_nr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5707_grunds;
CREATE VIEW fkg.t_5707_grunds AS
SELECT
  5707::integer AS temakode,
  't_5707_grunds_t'::text AS temanavn,
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
  t.udstyk_navn,
  t.grund_type_kode,
  k1.grund_type AS grund_type,
  t.salg_status_kode,
  k2.salg_status AS salg_status,
  t.pris,
  t.mindste_pris,
  t.kvm_pris,
  t.kontakt_oplys,
  t.grundareal,
  t.bygningareal,
  t.budfrist_slut,
  t.sagsnr,
  t.vejkode,
  k3.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k4.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5707_grunds_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5707_grund_type k1 ON (t.grund_type_kode = k1.grund_type_kode) LEFT JOIN
  fkg.d_5707_salg_status k2 ON (t.salg_status_kode = k2.salg_status_kode) LEFT JOIN
  fkg.d_vejnavn k3 ON (t.vejkode = k3.vejkode) LEFT JOIN
  fkg.d_basis_postnr k4 ON (t.postnr = k4.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6202_landk_omr;
CREATE VIEW fkg.t_6202_landk_omr AS
SELECT
  6202::integer AS temakode,
  't_6202_landk_omr_t'::text AS temanavn,
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
  t.omraade_nr,
  k1.omraade AS omraade,
  t.dato_besigtig,
  t.navn_besigtig,
  t.rev_dato,
  t.landskabskarakter,
  t.tidsdybde_kode,
  k2.tidsdybde AS tidsdybde,
  t.tidsdybde_beskr,
  t.intakthed_kode,
  k3.tilstand AS intakthed,
  t.intakthed_beskr,
  t.noeglefunktion,
  t.afgr_naboomr,
  t.vejledn_afgr_naboomr,
  t.skala_kode,
  k4.skala AS skala,
  t.skala_beskrivelse,
  t.rumlig_afgraensning_kode,
  k5.rumlig_afgraensning AS rumlig_afgraensning,
  t.rumlig_beskrivelse,
  t.kompleksitet_kode,
  k6.kompleksitet AS kompleksitet,
  t.kompleksitet_beskrivelse,
  t.struktur_kode,
  k7.struktur AS struktur,
  t.struktur_beskrivelse,
  t.visuel_uro_kode,
  k8.visuel_uro AS visuel_uro,
  t.visuel_uro_beskrivelse,
  t.kystforhold,
  t.oplevelse,
  t.analysekort,
  t.link_reg_skema,
  t.link_vejledning,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6202_landk_omr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_omraade k1 ON (t.omraade_nr = k1.omraade_nr) LEFT JOIN
  fkg.d_6202_tidsdybde k2 ON (t.tidsdybde_kode = k2.tidsdybde_kode) LEFT JOIN
  fkg.d_basis_tilstand k3 ON (t.intakthed_kode = k3.tilstand_kode) LEFT JOIN
  fkg.d_6202_skala k4 ON (t.skala_kode = k4.skala_kode) LEFT JOIN
  fkg.d_6202_rumlig_afgraensning k5 ON (t.rumlig_afgraensning_kode = k5.rumlig_afgraensning_kode) LEFT JOIN
  fkg.d_6202_kompleksitet k6 ON (t.kompleksitet_kode = k6.kompleksitet_kode) LEFT JOIN
  fkg.d_6202_struktur k7 ON (t.struktur_kode = k7.struktur_kode) LEFT JOIN
  fkg.d_6202_visuel_uro k8 ON (t.visuel_uro_kode = k8.visuel_uro_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6200_nat_geo;
CREATE VIEW fkg.t_6200_nat_geo AS
SELECT
  6200::integer AS temakode,
  't_6200_nat_geo_t'::text AS temanavn,
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
  t.data_oprindelse,
  t.omraade_nr,
  k1.omraade AS omraade,
  t.geologi_kode,
  k2.geologi AS geologi,
  t.geo_ref,
  t.jordtype_kode,
  k3.jordtype AS jordtype,
  t.terraen_kode,
  k4.terraen AS terraen,
  t.terraen_ref,
  t.kompleksitet_kode,
  k5.kompleksitet AS kompleksitet,
  t.vandelement,
  t.farvandsomraade,
  t.strandbred,
  t.begrund_afgraensning,
  t.omr_sammenhaeng,
  t.farvand_strand_ref,
  t.naturgeo_beskrivelse,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6200_nat_geo_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_omraade k1 ON (t.omraade_nr = k1.omraade_nr) LEFT JOIN
  fkg.d_6200_geologi k2 ON (t.geologi_kode = k2.geologi_kode) LEFT JOIN
  fkg.d_6200_jordtype k3 ON (t.jordtype_kode = k3.jordtype_kode) LEFT JOIN
  fkg.d_6200_terraen k4 ON (t.terraen_kode = k4.terraen_kode) LEFT JOIN
  fkg.d_6200_kompleksitet k5 ON (t.kompleksitet_kode = k5.kompleksitet_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6203_landk_vur;
CREATE VIEW fkg.t_6203_landk_vur AS
SELECT
  6203::integer AS temakode,
  't_6203_landk_vur_t'::text AS temanavn,
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
  t.omraade_nr,
  k1.omraade AS omraade,
  t.delomraade_nr,
  t.karakterstyrke_kode,
  k2.karakterstyrke AS karakterstyrke,
  t.karakterstyrke_notat,
  t.visuel_notat,
  t.tilstand_kode,
  k3.tilstand AS tilstand,
  t.tilstand_notat,
  t.udvikling,
  t.saarbarhed_kode,
  k4.saarbarhed AS saarbarhed,
  t.saarbarhed_notat,
  t.tiltag,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6203_landk_vur_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_omraade k1 ON (t.omraade_nr = k1.omraade_nr) LEFT JOIN
  fkg.d_6203_karakterstyrke k2 ON (t.karakterstyrke_kode = k2.karakterstyrke_kode) LEFT JOIN
  fkg.d_basis_tilstand k3 ON (t.tilstand_kode = k3.tilstand_kode) LEFT JOIN
  fkg.d_6203_saarbarhed k4 ON (t.saarbarhed_kode = k4.saarbarhed_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6113_besk_nat_b;
CREATE VIEW fkg.t_6113_besk_nat_b AS
SELECT
  6113::integer AS temakode,
  't_6113_besk_nat_b_t'::text AS temanavn,
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
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6113_besk_nat_b_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6119_evaku_centr;
CREATE VIEW fkg.t_6119_evaku_centr AS
SELECT
  6119::integer AS temakode,
  't_6119_evaku_centr_t'::text AS temanavn,
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
  t.evakucenter_ref,
  t.evakucenter,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
  t.adr_id,
  t.funktionsstatus_kode,
  k3.funktionsstatus AS funktionsstatus,
  t.indkvartering_kode,
  k4.ja_nej AS indkvartering,
  t.sovepladser,
  t.forplejning_kode,
  k5.ja_nej AS forplejning,
  t.spisepladser,
  t.beredskabsplan_kode,
  k6.ja_nej AS beredskabsplan,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6119_evaku_centr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_vejnavn k1 ON (t.vejkode = k1.vejkode) LEFT JOIN
  fkg.d_basis_postnr k2 ON (t.postnr = k2.postnr) LEFT JOIN
  fkg.d_basis_funktionsstatus k3 ON (t.funktionsstatus_kode = k3.funktionsstatus_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.indkvartering_kode = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.forplejning_kode = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.beredskabsplan_kode = k6.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6120_midl_overn;
CREATE VIEW fkg.t_6120_midl_overn AS
SELECT
  6120::integer AS temakode,
  't_6120_midl_overn_t'::text AS temanavn,
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
  t.institutionsnavn,
  t.antal_personer,
  t.mid_ov_person,
  t.mid_ov_tlfnr,
  t.fast_vaagen_vagt_kode,
  k1.ja_nej AS fast_vaagen_vagt,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6120_midl_overn_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.fast_vaagen_vagt_kode = k1.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5706_havn_are;
CREATE VIEW fkg.t_5706_havn_are AS
SELECT
  5706::integer AS temakode,
  't_5706_havn_are_t'::text AS temanavn,
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
  t.havn_nr,
  t.havn_navn,
  t.havne_type_kode,
  k1.havn_type AS havne_type,
  t.cvr_havn,
  t.ejer_admin,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5706_havn_are_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5706_havn_type k1 ON (t.havne_type_kode = k1.havn_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5700_grundej;
CREATE VIEW fkg.t_5700_grundej AS
SELECT
  5700::integer AS temakode,
  't_5700_grundej_t'::text AS temanavn,
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
  t.forening_type_kode,
  k1.forening_type AS forening_type,
  t.forening_navn,
  t.forening_cvr,
  t.lokalpl_nr,
  t.formand,
  t.gf_tlf,
  t.gf_adresse,
  t.gf_mail,
  t.gf_adr_beskyt_kode,
  k2.gf_adr_beskyt AS gf_adr_beskyt,
  t.vedtaegt_kode,
  k3.ja_nej AS vedtaegt,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5700_grundej_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5700_forening_type k1 ON (t.forening_type_kode = k1.forening_type_kode) LEFT JOIN
  fkg.d_5700_adr_beskyt k2 ON (t.gf_adr_beskyt_kode = k2.gf_adr_beskyt_kode) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.vedtaegt_kode = k3.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5711_and_dis;
CREATE VIEW fkg.t_5711_and_dis AS
SELECT
  5711::integer AS temakode,
  't_5711_and_dis_t'::text AS temanavn,
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
  t.an_distrikt_nr,
  t.an_distrikt_navn,
  t.an_distrikt_type_kode,
  k1.an_distrikt_type AS an_distrikt_type,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5711_and_dis_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5711_an_distrikt_type k1 ON (t.an_distrikt_type_kode = k1.an_distrikt_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5606_vejinv;
CREATE VIEW fkg.t_5606_vejinv AS
SELECT
  5606::integer AS temakode,
  't_5606_vejinv_t'::text AS temanavn,
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
  t.inventar_nr,
  t.inventar_type_kode,
  k1.inventar_type AS inventar_type,
  t.model,
  t.tilstand_kode,
  k2.tilstand AS tilstand,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5606_vejinv_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5606_inventar_type k1 ON (t.inventar_type_kode = k1.inventar_type_kode) LEFT JOIN
  fkg.d_basis_tilstand k2 ON (t.tilstand_kode = k2.tilstand_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5701_lok_omr;
CREATE VIEW fkg.t_5701_lok_omr AS
SELECT
  5701::integer AS temakode,
  't_5701_lok_omr_t'::text AS temanavn,
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
  t.lokalraad_navn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5701_lok_omr_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6001_pot_m;
CREATE VIEW fkg.t_6001_pot_m AS
SELECT
  6001::integer AS temakode,
  't_6001_pot_m_t'::text AS temanavn,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.potentialekort,
  t.stoettep_kode,
  k1.ja_nej AS stoettep,
  t.dgu_nr,
  t.dybde,
  t.aekvidistance,
  t.magasin_kode,
  k2.magasin AS magasin,
  t.pejling,
  t.oprind_kilde,
  t.kotesystem_kode,
  k3.kotesystem AS kotesystem,
  t.usikkerhed,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6001_pot_m_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.stoettep_kode = k1.ja_nej_kode) LEFT JOIN
  fkg.d_basis_magasin k2 ON (t.magasin_kode = k2.magasin_kode) LEFT JOIN
  fkg.d_basis_kotesystem k3 ON (t.kotesystem_kode = k3.kotesystem_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6006_grundv_opl;
CREATE VIEW fkg.t_6006_grundv_opl AS
SELECT
  6006::integer AS temakode,
  't_6006_grundv_opl_t'::text AS temanavn,
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
  t.vandv_nr,
  k1.vandv AS vandv_navn,
  t.oplandtype,
  t.indsatsomraade,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6006_grundv_opl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_vandv_nr k1 ON (t.vandv_nr = k1.vandv_nr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6002_indv;
CREATE VIEW fkg.t_6002_indv AS
SELECT
  6002::integer AS temakode,
  't_6002_indv_t'::text AS temanavn,
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
  t.vandv_nr,
  k1.vandv AS vandv_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.indsatsomraade,
  t.indv_maengde_aar,
  t.kildeplads,
  t.reference,
  t.metode,
  t.dgu_nr,
  t.indtag,
  t.dato_beregn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6002_indv_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_vandv_nr k1 ON (t.vandv_nr = k1.vandv_nr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6004_vandv_fs;
CREATE VIEW fkg.t_6004_vandv_fs AS
SELECT
  6004::integer AS temakode,
  't_6004_vandv_fs_t'::text AS temanavn,
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
  t.vandv_nr,
  k1.vandv AS vandv_navn,
  t.fors_omr_type_kode,
  k2.fors_omr_type AS fors_omr_type,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6004_vandv_fs_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_vandv_nr k1 ON (t.vandv_nr = k1.vandv_nr) LEFT JOIN
  fkg.d_basis_fors_omr_type k2 ON (t.fors_omr_type_kode = k2.fors_omr_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6007_inds_omr;
CREATE VIEW fkg.t_6007_inds_omr AS
SELECT
  6007::integer AS temakode,
  't_6007_inds_omr_t'::text AS temanavn,
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
  t.indsatsomr_navn,
  t.stoerrelse,
  t.ansvar_myndighed,
  t.vedtagelse,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6007_inds_omr_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6008_maks_bor;
CREATE VIEW fkg.t_6008_maks_bor AS
SELECT
  6008::integer AS temakode,
  't_6008_maks_bor_t'::text AS temanavn,
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
  t.boredybde,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6008_maks_bor_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6105_sbygn_omr;
CREATE VIEW fkg.t_6105_sbygn_omr AS
SELECT
  6105::integer AS temakode,
  't_6105_sbygn_omr_t'::text AS temanavn,
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
  t.saer_distrikt_nr,
  t.saer_distrikt_navn,
  t.navn,
  t.kontakt_info,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6105_sbygn_omr_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6107_forholds;
CREATE VIEW fkg.t_6107_forholds AS
SELECT
  6107::integer AS temakode,
  't_6107_forholds_t'::text AS temanavn,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.bra_kode,
  t.net_tlf,
  t.cvr_firma,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
  t.adr_id,
  t.adr_i_tekst,
  t.tlf_arbejde,
  t.tlf_dag,
  t.tlf_nat,
  t.aba_kode,
  k3.ja_nej AS aba,
  t.avs_kode,
  k4.ja_nej AS avs,
  t.ars_kode,
  k5.ja_nej AS ars,
  t.noegleboks_kode,
  k6.ja_nej AS noegleboks,
  t.noeglested,
  t.central_placering,
  t.opgave_ankomst,
  t.prs_1,
  t.prs_2,
  t.prs_3,
  t.prs_4,
  t.prs_5,
  t.system_fkt,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6107_forholds_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_vejnavn k1 ON (t.vejkode = k1.vejkode) LEFT JOIN
  fkg.d_basis_postnr k2 ON (t.postnr = k2.postnr) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.aba_kode = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.avs_kode = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.ars_kode = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.noegleboks_kode = k6.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6108_moedepl;
CREATE VIEW fkg.t_6108_moedepl AS
SELECT
  6108::integer AS temakode,
  't_6108_moedepl_t'::text AS temanavn,
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
  t.navn,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
  t.adr_id,
  t.bemaerkning,
  t.link_tegn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6108_moedepl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_vejnavn k1 ON (t.vejkode = k1.vejkode) LEFT JOIN
  fkg.d_basis_postnr k2 ON (t.postnr = k2.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6110_noegle;
CREATE VIEW fkg.t_6110_noegle AS
SELECT
  6110::integer AS temakode,
  't_6110_noegle_t'::text AS temanavn,
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
  t.bra_kode,
  t.tyv_alarm_kode,
  k1.ja_nej AS tyv_alarm,
  t.noegleboksnr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.bemaerkning,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6110_noegle_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_ja_nej k1 ON (t.tyv_alarm_kode = k1.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6111_fyrv_till;
CREATE VIEW fkg.t_6111_fyrv_till AS
SELECT
  6111::integer AS temakode,
  't_6111_fyrv_till_t'::text AS temanavn,
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
  t.fyr_firma_navn,
  t.fyr_firma_cvr,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
  t.adr_id,
  t.tilladelse_type_kode,
  k3.tilladelse_type AS tilladelse_type,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6111_fyrv_till_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_vejnavn k1 ON (t.vejkode = k1.vejkode) LEFT JOIN
  fkg.d_basis_postnr k2 ON (t.postnr = k2.postnr) LEFT JOIN
  fkg.d_6111_tilladelse k3 ON (t.tilladelse_type_kode = k3.tilladelse_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6112_midl_dep;
CREATE VIEW fkg.t_6112_midl_dep AS
SELECT
  6112::integer AS temakode,
  't_6112_midl_dep_t'::text AS temanavn,
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
  t.virksomhed_cvr,
  t.virksomhed_navn,
  t.virksomhed_type,
  t.depot_type_kode,
  k1.depot_type AS depot_type,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6112_midl_dep_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6112_depottype k1 ON (t.depot_type_kode = k1.depot_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6009_indv_ovflv;
CREATE VIEW fkg.t_6009_indv_ovflv AS
SELECT
  6009::integer AS temakode,
  't_6009_indv_ovflv_t'::text AS temanavn,
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
  t.indv_maengde_aar,
  t.indv_kapacitet,
  t.indvinder_navn,
  t.indvinder_kontakt,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6009_indv_ovflv_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6101_beskyt_rum;
CREATE VIEW fkg.t_6101_beskyt_rum AS
SELECT
  6101::integer AS temakode,
  't_6101_beskyt_rum_t'::text AS temanavn,
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
  t.beskyt_rum_kode,
  k1.beskyt_rum AS beskyt_rum,
  t.klargjort_kode,
  k2.ja_nej AS klargjort,
  t.pladser,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6101_beskyt_rum_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6101_beskyt_rum k1 ON (t.beskyt_rum_kode = k1.beskyt_rum_kode) LEFT JOIN
  fkg.d_basis_ja_nej k2 ON (t.klargjort_kode = k2.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6117_inds_pkt;
CREATE VIEW fkg.t_6117_inds_pkt AS
SELECT
  6117::integer AS temakode,
  't_6117_inds_pkt_t'::text AS temanavn,
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
  t.nr_navn,
  t.beskrivelse,
  t.adgang,
  t.vej_afstand,
  t.ansvar,
  t.indsatstype_kode,
  k1.indsatstype AS indsatstype,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6117_inds_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6117_indsatstype k1 ON (t.indsatstype_kode = k1.indsatstype_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5508_husst_moel;
CREATE VIEW fkg.t_5508_husst_moel AS
SELECT
  5508::integer AS temakode,
  't_5508_husst_moel_t'::text AS temanavn,
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
  t.moelletype,
  t.hoejde,
  t.kapacitet,
  t.stoej_kode,
  k1.stoej AS stoej,
  t.konsekvenszone,
  t.sagsnr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5508_husst_moel_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5508_stoej k1 ON (t.stoej_kode = k1.stoej_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5200_aff_prod_udbr;
CREATE VIEW fkg.t_5200_aff_prod_udbr AS
SELECT
  5200::integer AS temakode,
  't_5200_aff_prod_udbr_t'::text AS temanavn,
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
  t.affald_prod_kode,
  k1.affald_prod AS affald_prod,
  t.navn,
  t.ejd_nr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.markblok,
  t.dosering_toerstof,
  t.dosering_vaadvaegt,
  t.fosfor_total,
  t.fosfor_udnyttelse,
  t.kvaelstof_total,
  t.kvaelstof_udnyttelse,
  t.kalium_total,
  t.udbringning_aar,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5200_aff_prod_udbr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5200_affald k1 ON (t.affald_prod_kode = k1.affald_prod_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6800_parl_fl;
CREATE VIEW fkg.t_6800_parl_fl AS
SELECT
  6800::integer AS temakode,
  't_6800_parl_fl_t'::text AS temanavn,
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
  t.vedlhold_f_type_kode,
  k1.vedlhold_f_type AS vedlhold_f_type,
  k1.vedlhold_f_type_label AS vedlhold_f_type_label,
  t.arbejdssted,
  t.konto_nr,
  t.udfoerer_enterp,
  t.kommunal_kontakt,
  t.anlaegsaar,
  t.etabl_pleje_udloeb,
  t.udskiftningaar,
  t.udtyndaar,
  t.klip_hoejde,
  t.klip_sider,
  t.klip_flade,
  t.driftniv_kode,
  k2.driftniv AS driftniv,
  t.ukrudtsbek_kode,
  k3.ukrudtsbek AS ukrudtsbek,
  t.tilstand_kode,
  k4.tilstand AS tilstand,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6800_parl_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6800_vedlhold_f_type k1 ON (t.vedlhold_f_type_kode = k1.vedlhold_f_type_kode) LEFT JOIN
  fkg.d_basis_driftniv k2 ON (t.driftniv_kode = k2.driftniv_kode) LEFT JOIN
  fkg.d_basis_ukrudtsbek k3 ON (t.ukrudtsbek_kode = k3.ukrudtsbek_kode) LEFT JOIN
  fkg.d_basis_tilstand k4 ON (t.tilstand_kode = k4.tilstand_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode)
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
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.film_link,
  t.film_link1,
  t.film_link2,
  t.film_link3,
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5001_maalest;
CREATE VIEW fkg.t_5001_maalest AS
SELECT
  5001::integer AS temakode,
  't_5001_maalest_t'::text AS temanavn,
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
  t.stationsnr,
  t.lokalitet,
  t.maalest_type_kode,
  k1.maalest_type AS maalest_type,
  t.ejerstatus_kode,
  k2.ejerstatus AS ejerstatus,
  t.dvfi_bedoemmelse_kode,
  k3.dvfi_bedoemmelse AS dvfi_bedoemmelse,
  t.dmu_nr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5001_maalest_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5001_maalest_type k1 ON (t.maalest_type_kode = k1.maalest_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k2 ON (t.ejerstatus_kode = k2.ejerstatus_kode) LEFT JOIN
  fkg.d_basis_dvfi_bedoemmelse k3 ON (t.dvfi_bedoemmelse_kode = k3.dvfi_bedoemmelse_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5002_faunasp;
CREATE VIEW fkg.t_5002_faunasp AS
SELECT
  5002::integer AS temakode,
  't_5002_faunasp_t'::text AS temanavn,
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
  t.spaerring_nr,
  t.spaerring_type_kode,
  k1.spaerring_type AS spaerring_type,
  t.passage_kode,
  k2.passage AS passage,
  t.lokalitet,
  t.vandloebsystem,
  t.saneret_aar,
  t.prioritet,
  t.passage_ansvarlig,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5002_faunasp_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5002_spaerring k1 ON (t.spaerring_type_kode = k1.spaerring_type_kode) LEFT JOIN
  fkg.d_5002_passage k2 ON (t.passage_kode = k2.passage_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5006_dybdekurv;
CREATE VIEW fkg.t_5006_dybdekurv AS
SELECT
  5006::integer AS temakode,
  't_5006_dybdekurv_t'::text AS temanavn,
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
  t.soe_navn,
  t.dmu_ref,
  t.soe_nr,
  t.dybde,
  t.lower,
  t.upper,
  t.maalt_aar,
  t.opm_metode,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5006_dybdekurv_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5010_vandl_elm;
CREATE VIEW fkg.t_5010_vandl_elm AS
SELECT
  5010::integer AS temakode,
  't_5010_vandl_elm_t'::text AS temanavn,
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
  t.element_nr,
  t.element_kode,
  k1.element AS element,
  t.lokalitet,
  t.vstation,
  t.vandloebsystem,
  t.anlagt_aar,
  t.saneret_aar,
  t.tilstand_kode,
  k2.tilstand AS tilstand,
  t.broend_data,
  t.toemningsfrekvens,
  t.adgangsforhold,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5010_vandl_elm_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5010_element_type k1 ON (t.element_kode = k1.element_kode) LEFT JOIN
  fkg.d_basis_tilstand k2 ON (t.tilstand_kode = k2.tilstand_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5105_rig_fattig;
CREATE VIEW fkg.t_5105_rig_fattig AS
SELECT
  5105::integer AS temakode,
  't_5105_rig_fattig_t'::text AS temanavn,
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
  t.stedid,
  t.natura_2000,
  t.kaer_type_kode,
  k1.kaer_type AS kaer_type,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5105_rig_fattig_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5105_kaer_type k1 ON (t.kaer_type_kode = k1.kaer_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5108_groent_part;
CREATE VIEW fkg.t_5108_groent_part AS
SELECT
  5108::integer AS temakode,
  't_5108_groent_part_t'::text AS temanavn,
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
  t.navn,
  t.kontakt_navn,
  t.kontakt_opl,
  t.deltager,
  t.formaal,
  t.gyldig_fra,
  t.gyldig_til,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5108_groent_part_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5300_genopd_ret;
CREATE VIEW fkg.t_5300_genopd_ret AS
SELECT
  5300::integer AS temakode,
  't_5300_genopd_ret_t'::text AS temanavn,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.funktion,
  t.planlagt_aktivitet,
  t.genoptaget,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5300_genopd_ret_t t ON (g.versions_id = t.versions_id)
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
  t.foto_link,
  t.foto_link1,
  t.foto_link2,
  t.foto_link3,
  t.geofafoto,
  t.geofafoto1,
  t.geofafoto2,
  t.geofafoto3,
  t.film_link,
  t.film_link1,
  t.film_link2,
  t.film_link3,
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
  fkg.d_basis_ja_nej k9 ON (t.folder_k = k9.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k10 ON (t.vejkode = k10.vejkode) LEFT JOIN
  fkg.d_basis_postnr k11 ON (t.postnr = k11.postnr) LEFT JOIN
  fkg.d_basis_ansva_v k12 ON (t.ansva_v_k = k12.ansva_v_k)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5402_genbr_con;
CREATE VIEW fkg.t_5402_genbr_con AS
SELECT
  5402::integer AS temakode,
  't_5402_genbr_con_t'::text AS temanavn,
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
  t.gc_type_kode,
  k1.gc_type AS gc_type,
  t.model,
  t.t_frekvens,
  t.t_dato,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5402_genbr_con_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5402_gc_type k1 ON (t.gc_type_kode = k1.gc_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5605_vejbyggel;
CREATE VIEW fkg.t_5605_vejbyggel AS
SELECT
  5605::integer AS temakode,
  't_5605_vejbyggel_t'::text AS temanavn,
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
  t.dekl_type_kode,
  k1.dekl_type AS dekl_type,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.dekl_link,
  t.bredde,
  t.forskydning,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5605_vejbyggel_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5605_dekl_type k1 ON (t.dekl_type_kode = k1.dekl_type_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5107_art_invas_p;
CREATE VIEW fkg.t_5107_art_invas_p AS
SELECT
  5107::integer AS temakode,
  't_5107_art_invas_p_t'::text AS temanavn,
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
  t.invasivart_kode,
  k1.ia_dansknavn AS ia_dansknavn,
  k1.ia_latinsknavn AS ia_latinsknavn,
  k1.ia_rige AS ia_rige,
  t.inventoer,
  t.antal_kode,
  k2.antal AS antal,
  t.forekomst,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5107_art_invas_p_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_invasivart k1 ON (t.invasivart_kode = k1.invasivart_kode) LEFT JOIN
  fkg.d_basis_antal k2 ON (t.antal_kode = k2.antal_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5702_skorst_fej;
CREATE VIEW fkg.t_5702_skorst_fej AS
SELECT
  5702::integer AS temakode,
  't_5702_skorst_fej_t'::text AS temanavn,
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
  t.skorstenf_distrikt_nr,
  t.skorstenf_distrikt_navn,
  t.gyldig_fra,
  t.gyldig_til,
  t.skorstensfejer_firma,
  t.skorstensfejer_cvr,
  t.sf_tlf,
  t.sf_adresse,
  t.sf_mail,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5702_skorst_fej_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5705_forp_are;
CREATE VIEW fkg.t_5705_forp_are AS
SELECT
  5705::integer AS temakode,
  't_5705_forp_are_t'::text AS temanavn,
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
  t.forpagter_navn,
  t.forpagter_formaal,
  t.udlejning_kode,
  k1.udlejning AS udlejning,
  t.landbrug_kode,
  k2.ja_nej AS landbrug,
  t.sagsnr,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5705_forp_are_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5705_udlejning k1 ON (t.udlejning_kode = k1.udlejning_kode) LEFT JOIN
  fkg.d_basis_ja_nej k2 ON (t.landbrug_kode = k2.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5716_servicetilbud;
CREATE VIEW fkg.t_5716_servicetilbud AS
SELECT
  5716::integer AS temakode,
  't_5716_servicetilbud_t'::text AS temanavn,
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
  t.service_type_kode,
  k1.service_type AS service_type,
  t.ejerstatus_kode,
  k2.ejerstatus AS ejerstatus,
  t.servicetilbud_navn,
  t.vejkode,
  k3.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k4.postnr_by AS postnr_by,
  t.link,
  t.geometri,
  t.adr_id
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5716_servicetilbud_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5716_servicetilbud_type k1 ON (t.service_type_kode = k1.service_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k2 ON (t.ejerstatus_kode = k2.ejerstatus_kode) LEFT JOIN
  fkg.d_vejnavn k3 ON (t.vejkode = k3.vejkode) LEFT JOIN
  fkg.d_basis_postnr k4 ON (t.postnr = k4.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5714_laering_udd_inst;
CREATE VIEW fkg.t_5714_laering_udd_inst AS
SELECT
  5714::integer AS temakode,
  't_5714_laering_udd_inst_t'::text AS temanavn,
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
  t.udd_institution_type_kode,
  k1.udd_institution_type AS udd_institution_type,
  t.ejerstatus_kode,
  k2.ejerstatus AS ejerstatus,
  t.udd_institution_navn,
  t.starttrin_kode,
  k3.trin AS starttrin,
  t.sluttrin_kode,
  k4.trin AS slutttrin,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5714_laering_udd_inst_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5714_udd_institution_type k1 ON (t.udd_institution_type_kode = k1.udd_institution_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k2 ON (t.ejerstatus_kode = k2.ejerstatus_kode) LEFT JOIN
  fkg.d_basis_trin k3 ON (t.starttrin_kode = k3.trin_kode) LEFT JOIN
  fkg.d_basis_trin k4 ON (t.sluttrin_kode = k4.trin_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5715_botilbud;
CREATE VIEW fkg.t_5715_botilbud AS
SELECT
  5715::integer AS temakode,
  't_5715_botilbud_t'::text AS temanavn,
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
  t.botilbud_type_kode,
  k1.botilbud_type AS botilbud_type,
  t.ejerstatus_kode,
  k2.ejerstatus AS ejerstatus,
  t.botilbud_navn,
  t.vejkode,
  k3.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k4.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5715_botilbud_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5715_botilbud_type k1 ON (t.botilbud_type_kode = k1.botilbud_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k2 ON (t.ejerstatus_kode = k2.ejerstatus_kode) LEFT JOIN
  fkg.d_vejnavn k3 ON (t.vejkode = k3.vejkode) LEFT JOIN
  fkg.d_basis_postnr k4 ON (t.postnr = k4.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6000_pot;
CREATE VIEW fkg.t_6000_pot AS
SELECT
  6000::integer AS temakode,
  't_6000_pot_t'::text AS temanavn,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.kote,
  t.navn,
  t.aekvidistance,
  t.magasin_kode,
  k1.magasin AS magasin,
  t.pejling,
  t.oprind_kilde,
  t.metode,
  t.reference,
  t.kotesystem_kode,
  k2.kotesystem AS kotesystem,
  t.usikkerhed,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6000_pot_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_magasin k1 ON (t.magasin_kode = k1.magasin_kode) LEFT JOIN
  fkg.d_basis_kotesystem k2 ON (t.kotesystem_kode = k2.kotesystem_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6003_besk_zone;
CREATE VIEW fkg.t_6003_besk_zone AS
SELECT
  6003::integer AS temakode,
  't_6003_besk_zone_t'::text AS temanavn,
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
  t.dgu_nr,
  t.kildeplads,
  t.indsatsomraade,
  t.vandv_nr,
  k1.vandv AS vandv_navn,
  t.jup_nr,
  t.tilladelse,
  t.tilladelse_gyldig,
  t.beskyt_zone,
  t.beskyt_zone_gyldig,
  t.lokalitet,
  t.zone_type_kode,
  k2.zone_type AS zone_type,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6003_besk_zone_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_vandv_nr k1 ON (t.vandv_nr = k1.vandv_nr) LEFT JOIN
  fkg.d_6003_zone_type k2 ON (t.zone_type_kode = k2.zone_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6103_bered_omr;
CREATE VIEW fkg.t_6103_bered_omr AS
SELECT
  6103::integer AS temakode,
  't_6103_bered_omr_t'::text AS temanavn,
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
  t.bereds_distrikt_nr,
  t.bereds_distrikt_navn,
  t.udrykker,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6103_bered_omr_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6104_risiko_virk;
CREATE VIEW fkg.t_6104_risiko_virk AS
SELECT
  6104::integer AS temakode,
  't_6104_risiko_virk_t'::text AS temanavn,
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
  t.risikotype_kode,
  k1.risikotype AS risikotype,
  t.cvr_risi_virk,
  t.kontakt_tlf,
  t.brandhaem_kode,
  k2.brandhaem AS brandhaem,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6104_risiko_virk_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6104_risikotype k1 ON (t.risikotype_kode = k1.risikotype_kode) LEFT JOIN
  fkg.d_6104_brandhaem k2 ON (t.brandhaem_kode = k2.brandhaem_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6115_afbr_omr;
CREATE VIEW fkg.t_6115_afbr_omr AS
SELECT
  6115::integer AS temakode,
  't_6115_afbr_omr_t'::text AS temanavn,
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
  t.afbr_nr,
  t.afbr_navn,
  t.afbr_type_kode,
  k1.afbr_type AS afbr_type,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6115_afbr_omr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6115_afbr_type k1 ON (t.afbr_type_kode = k1.afbr_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6201_kult_geo;
CREATE VIEW fkg.t_6201_kult_geo AS
SELECT
  6201::integer AS temakode,
  't_6201_kult_geo_t'::text AS temanavn,
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
  t.data_oprindelse,
  t.omraade_nr,
  k1.omraade AS omraade,
  t.begrund_afgraensning,
  t.link_litteratur,
  t.link_vejledning,
  t.link_reg_skema,
  t.kulturgeo_beskrivelse,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6201_kult_geo_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_basis_omraade k1 ON (t.omraade_nr = k1.omraade_nr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6116_olie_ber_pl;
CREATE VIEW fkg.t_6116_olie_ber_pl AS
SELECT
  6116::integer AS temakode,
  't_6116_olie_ber_pl_t'::text AS temanavn,
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
  t.navn,
  t.strand_type_kode,
  k1.strand_type AS strand_type,
  t.prioritet,
  t.esi_klasse_kode,
  k2.esi_klasse AS esi_klasse,
  t.baad_kode,
  k3.ja_nej AS baad,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6116_olie_ber_pl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6116_strandtype k1 ON (t.strand_type_kode = k1.strand_type_kode) LEFT JOIN
  fkg.d_6116_esi_klasse k2 ON (t.esi_klasse_kode = k2.esi_klasse_kode) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.baad_kode = k3.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6801_parl_li;
CREATE VIEW fkg.t_6801_parl_li AS
SELECT
  6801::integer AS temakode,
  't_6801_parl_li_t'::text AS temanavn,
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
  t.vedlhold_l_type_kode,
  k1.vedlhold_l_type AS vedlhold_l_type,
  k1.vedlhold_l_type_label AS vedlhold_l_type_label,
  t.arbejdssted,
  t.konto_nr,
  t.udfoerer_entrep,
  t.kommunal_kontakt,
  t.anlaegsaar,
  t.etabl_pleje_udloeb,
  t.udskiftningaar,
  t.klip_flade,
  t.klip_hoejde,
  t.klip_sider,
  t.klip_bredde,
  t.driftniv_kode,
  k2.driftniv AS driftniv,
  t.ukrudtsbek_kode,
  k3.ukrudtsbek AS ukrudtsbek,
  t.tilstand_kode,
  k4.tilstand AS tilstand,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6801_parl_li_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6801_vedlhold_l_type k1 ON (t.vedlhold_l_type_kode = k1.vedlhold_l_type_kode) LEFT JOIN
  fkg.d_basis_driftniv k2 ON (t.driftniv_kode = k2.driftniv_kode) LEFT JOIN
  fkg.d_basis_ukrudtsbek k3 ON (t.ukrudtsbek_kode = k3.ukrudtsbek_kode) LEFT JOIN
  fkg.d_basis_tilstand k4 ON (t.tilstand_kode = k4.tilstand_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6802_parl_pkt;
CREATE VIEW fkg.t_6802_parl_pkt AS
SELECT
  6802::integer AS temakode,
  't_6802_parl_pkt_t'::text AS temanavn,
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
  t.vedlhold_p_type_kode,
  k1.vedlhold_p_type AS vedlhold_p_type,
  k1.vedlhold_p_type_label AS vedlhold_p_type_label,
  t.arbejdssted,
  t.konto_nr,
  t.udfoerer_enterp,
  t.kommunal_kontakt,
  t.anlaegsaar,
  t.etabl_pleje_udloeb,
  t.udskiftningsaar,
  t.klip_flade,
  t.driftniv_kode,
  k2.driftniv AS driftniv,
  t.ukrudtsbek_kode,
  k3.ukrudtsbek AS ukrudtsbek,
  t.tilstand_kode,
  k4.tilstand AS tilstand,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6802_parl_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6802_groenvedligh_punkt k1 ON (t.vedlhold_p_type_kode = k1.vedlhold_p_type_kode) LEFT JOIN
  fkg.d_basis_driftniv k2 ON (t.driftniv_kode = k2.driftniv_kode) LEFT JOIN
  fkg.d_basis_ukrudtsbek k3 ON (t.ukrudtsbek_kode = k3.ukrudtsbek_kode) LEFT JOIN
  fkg.d_basis_tilstand k4 ON (t.tilstand_kode = k4.tilstand_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6803_parl_omr;
CREATE VIEW fkg.t_6803_parl_omr AS
SELECT
  6803::integer AS temakode,
  't_6803_parl_omr_t'::text AS temanavn,
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
  t.pg_distrikt_kode,
  k1.pg_distrikt AS pg_distrikt,
  t.pg_distrikt_nr,
  t.ansvarlig,
  t.udfoerer,
  t.udfoerer_kontakt1,
  t.udfoerer_kontakt2,
  t.kommunal_kontakt,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6803_parl_omr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6803_pg_distrikt k1 ON (t.pg_distrikt_kode = k1.pg_distrikt_kode)
WHERE g.systid_til IS NULL;
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
  t.copyright
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_7901_foto_t t ON (g.versions_id = t.versions_id)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5000_vandl;
CREATE VIEW fkg.t_5000_vandl AS
SELECT
  5000::integer AS temakode,
  't_5000_vandl_t'::text AS temanavn,
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
  t.navn,
  t.dmu_ref,
  t.vandloeb_nr,
  t.maalsaetning_kode,
  k1.maalsaetning AS maalsaetning,
  t.vandl_type_kode,
  k2.vandl_type AS vandl_type,
  t.ejerstatus_kode,
  k3.ejerstatus AS ejerstatus,
  t.klasse_kode,
  k4.klasse AS klasse,
  t.tidl_amt_kode,
  k5.ja_nej AS tidl_amt,
  t.vedligehold,
  t.ansvar_vedligehold,
  t.p3vandloeb_kode,
  k6.ja_nej AS p3vandloeb,
  t.sejlads,
  t.dvfi_bedoemmelse_kode,
  k7.dvfi_bedoemmelse AS dvfi_bedoemmelse,
  t.station_fra,
  t.station_til,
  t.vandloebs_bredde,
  t.vandfoeringsforhold,
  t.maalsaetning_opfyldt_kode,
  k8.ja_nej AS maalsaetning_opfyldt,
  t.fot_id,
  t.trussel_vand_kode,
  k9.trussel_vand AS trussel_vand,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5000_vandl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5000_maalsaetning k1 ON (t.maalsaetning_kode = k1.maalsaetning_kode) LEFT JOIN
  fkg.d_5000_vandl_type k2 ON (t.vandl_type_kode = k2.vandl_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k3 ON (t.ejerstatus_kode = k3.ejerstatus_kode) LEFT JOIN
  fkg.d_5000_klasse k4 ON (t.klasse_kode = k4.klasse_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.tidl_amt_kode = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.p3vandloeb_kode = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_dvfi_bedoemmelse k7 ON (t.dvfi_bedoemmelse_kode = k7.dvfi_bedoemmelse_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.maalsaetning_opfyldt_kode = k8.ja_nej_kode) LEFT JOIN
  fkg.d_basis_trussel_vand k9 ON (t.trussel_vand_kode = k9.trussel_vand_kode)
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
DROP VIEW IF EXISTS fkg.t_5009_pumpelag;
CREATE VIEW fkg.t_5009_pumpelag AS
SELECT
  5009::integer AS temakode,
  't_5009_pumpelag_t'::text AS temanavn,
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
  t.lag_navn,
  t.lag_type_kode,
  k1.lag_type AS lag_type,
  t.ejerstatus_kode,
  k2.ejerstatus AS ejerstatus,
  t.vandloebsystem,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5009_pumpelag_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5009_lag_type k1 ON (t.lag_type_kode = k1.lag_type_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k2 ON (t.ejerstatus_kode = k2.ejerstatus_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5003_draenledn;
CREATE VIEW fkg.t_5003_draenledn AS
SELECT
  5003::integer AS temakode,
  't_5003_draenledn_t'::text AS temanavn,
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
  t.ledn_nr,
  t.ledn_type_kode,
  k1.ledn_type AS ledn_type,
  t.klasse_kode,
  k2.klasse AS klasse,
  t.anlaeg_aar,
  t.dybde,
  t.dimension,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5003_draenledn_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5003_ledn_type k1 ON (t.ledn_type_kode = k1.ledn_type_kode) LEFT JOIN
  fkg.d_5003_klasse k2 ON (t.klasse_kode = k2.klasse_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5004_draenomr;
CREATE VIEW fkg.t_5004_draenomr AS
SELECT
  5004::integer AS temakode,
  't_5004_draenomr_t'::text AS temanavn,
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
  t.omr_navn,
  t.omr_type_kode,
  k1.omr_type AS omr_type,
  t.anlaeg_aar,
  t.projnr,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5004_draenomr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5004_omr_type k1 ON (t.omr_type_kode = k1.omr_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6118_bran_redn;
CREATE VIEW fkg.t_6118_bran_redn AS
SELECT
  6118::integer AS temakode,
  't_6118_bran_redn_t'::text AS temanavn,
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
  t.redarea_type_kode,
  k1.redarea_type AS redarea_type,
  t.rednarea_underomr,
  t.bygn_kompleks,
  t.byg_sag_nr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6118_bran_redn_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6118_brand_redarea_type k1 ON (t.redarea_type_kode = k1.redarea_type_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5005_soe;
CREATE VIEW fkg.t_5005_soe AS
SELECT
  5005::integer AS temakode,
  't_5005_soe_t'::text AS temanavn,
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
  t.soe_navn,
  t.dmu_ref,
  t.soe_nr,
  t.maalsaetning_kode,
  k1.maalsaetning AS maalsaetning,
  t.soe_type_kode,
  k2.soe_type AS soe_type,
  t.habitat_type_kode,
  k3.habitat_type AS habitat_type,
  t.trussel_vand_kode,
  k4.trussel_vand AS trussel_vand,
  t.sejlads,
  t.tilstand,
  t.opholdstid,
  t.volumen,
  t.fot_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5005_soe_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5005_maalsaetning k1 ON (t.maalsaetning_kode = k1.maalsaetning_kode) LEFT JOIN
  fkg.d_5005_soe_type k2 ON (t.soe_type_kode = k2.soe_type_kode) LEFT JOIN
  fkg.d_5005_habitat_type k3 ON (t.habitat_type_kode = k3.habitat_type_kode) LEFT JOIN
  fkg.d_basis_trussel_vand k4 ON (t.trussel_vand_kode = k4.trussel_vand_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5106_nat_pl;
CREATE VIEW fkg.t_5106_nat_pl AS
SELECT
  5106::integer AS temakode,
  't_5106_nat_pl_t'::text AS temanavn,
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
  t.pleje_type_kode,
  k1.pleje_type AS pleje_type,
  t.omr_nr,
  t.omr_navn,
  t.fortidsmindenr,
  t.faciliteter_kode,
  k2.faciliteter AS faciliteter,
  t.aftale_type,
  t.aftale_nr,
  t.gyldig_fra,
  t.gyldig_til,
  t.ejerstatus_kode,
  k3.ejerstatus AS ejerstatus,
  t.sagsnr,
  t.projekt_type,
  t.dyrehold,
  t.antal_moder,
  t.chr,
  t.navn,
  t.telefon,
  t.mobil,
  t.mail,
  t.ajour,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5106_nat_pl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5106_pleje_type k1 ON (t.pleje_type_kode = k1.pleje_type_kode) LEFT JOIN
  fkg.d_5106_faciliteter k2 ON (t.faciliteter_kode = k2.faciliteter_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k3 ON (t.ejerstatus_kode = k3.ejerstatus_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6100_brandhane;
CREATE VIEW fkg.t_6100_brandhane AS
SELECT
  6100::integer AS temakode,
  't_6100_brandhane_t'::text AS temanavn,
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
  t.brandhane_id,
  t.brandhane_type_kode,
  k1.brandhane_type AS brandhane_type,
  t.modeltype,
  t.ydelse,
  t.senest_maalte_ydelse,
  t.placering_kode,
  k2.placering AS placering,
  t.lokalitet,
  t.vejkode,
  k3.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k4.postnr_by AS postnr_by,
  t.adr_id,
  t.funktionsstatus_kode,
  k5.funktionsstatus AS funktionsstatus,
  t.aktiv_kode,
  k6.ja_nej AS aktiv,
  t.senest_tilsyn,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6100_brandhane_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6100_brandhane k1 ON (t.brandhane_type_kode = k1.brandhane_type_kode) LEFT JOIN
  fkg.d_6100_placering k2 ON (t.placering_kode = k2.placering_kode) LEFT JOIN
  fkg.d_vejnavn k3 ON (t.vejkode = k3.vejkode) LEFT JOIN
  fkg.d_basis_postnr k4 ON (t.postnr = k4.postnr) LEFT JOIN
  fkg.d_basis_funktionsstatus k5 ON (t.funktionsstatus_kode = k5.funktionsstatus_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.aktiv_kode = k6.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6102_redn_vej;
CREATE VIEW fkg.t_6102_redn_vej AS
SELECT
  6102::integer AS temakode,
  't_6102_redn_vej_t'::text AS temanavn,
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
  t.redvej_type_kode,
  k1.redvej_type AS redvej_type,
  t.redn_underomr,
  t.bygn_kompleks,
  t.byg_sag_nr,
  t.vejkode,
  k2.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k3.postnr_by AS postnr_by,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6102_redn_vej_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6102_redvej_type k1 ON (t.redvej_type_kode = k1.redvej_type_kode) LEFT JOIN
  fkg.d_vejnavn k2 ON (t.vejkode = k2.vejkode) LEFT JOIN
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5007_vandl_opl;
CREATE VIEW fkg.t_5007_vandl_opl AS
SELECT
  5007::integer AS temakode,
  't_5007_vandl_opl_t'::text AS temanavn,
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
  t.vandloeb_nr,
  t.dmu_ref,
  t.vandl_opl_nr,
  k1.opl_navn AS vandl_opl_navn,
  t.opl_type_kode,
  k2.vandl_opl_type AS opl_type,
  t.hydro_ref,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5007_vandl_opl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5007_opl k1 ON (t.vandl_opl_nr = k1.opl_nr) LEFT JOIN
  fkg.d_5007_opl_type k2 ON (t.opl_type_kode = k2.vandl_opl_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5008_soe_opl;
CREATE VIEW fkg.t_5008_soe_opl AS
SELECT
  5008::integer AS temakode,
  't_5008_soe_opl_t'::text AS temanavn,
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
  t.dmu_ref,
  t.soe_opl_nr,
  k1.soeopl_navn AS soe_opl_navn,
  t.soe_nr,
  t.hydro_ref,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5008_soe_opl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5008_opl k1 ON (t.soe_opl_nr = k1.soe_opl_nr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5400_affalds_dis;
CREATE VIEW fkg.t_5400_affalds_dis AS
SELECT
  5400::integer AS temakode,
  't_5400_affalds_dis_t'::text AS temanavn,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.affalddistrikt_nr,
  t.affalddistrikt_navn,
  t.affaldstype_kode,
  k1.affaldstype AS affaldstype,
  t.afh_frekvens,
  t.afh_dag,
  t.renovatoer_cvr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5400_affalds_dis_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5400_affalds_type k1 ON (t.affaldstype_kode = k1.affaldstype_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_6121_stor_ud_arr;
CREATE VIEW fkg.t_6121_stor_ud_arr AS
SELECT
  6121::integer AS temakode,
  't_6121_stor_ud_arr_t'::text AS temanavn,
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
  t.sua_kode,
  k1.sua_type AS sua_type,
  t.arrangement,
  t.forsamlingstelt_kode,
  k2.ja_nej AS forsamlingstelt,
  t.cirkustelt_kode,
  k3.ja_nej AS cirkustelt,
  t.campingomraade_kode,
  k4.ja_nej AS campingomraade,
  t.salgsomraade_kode,
  k5.ja_nej AS salgsomraade,
  t.arrangoer,
  t.adr_i_tekst,
  t.suppl_sted_beskrivelse,
  t.sua_person,
  t.sua_tlfnr,
  t.antal_personer,
  t.vejkode,
  k6.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k7.postnr_by AS postnr_by,
  t.adr_id,
  t.gyldig_fra,
  t.gyldig_til,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_6121_stor_ud_arr_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_6121_sua k1 ON (t.sua_kode = k1.sua_kode) LEFT JOIN
  fkg.d_basis_ja_nej k2 ON (t.forsamlingstelt_kode = k2.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.cirkustelt_kode = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.campingomraade_kode = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.salgsomraade_kode = k5.ja_nej_kode) LEFT JOIN
  fkg.d_vejnavn k6 ON (t.vejkode = k6.vejkode) LEFT JOIN
  fkg.d_basis_postnr k7 ON (t.postnr = k7.postnr)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5712_plej_aeldr_dis;
CREATE VIEW fkg.t_5712_plej_aeldr_dis AS
SELECT
  5712::integer AS temakode,
  't_5712_plej_aeldr_dis_t'::text AS temanavn,
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
  t.plej_distrikt_nr,
  t.plej_distrikt_navn,
  t.plej_distrikt_type_kode,
  k1.plej_distrikt_type AS plej_distrikt_type,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5712_plej_aeldr_dis_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5712_plej_distrikt_type k1 ON (t.plej_distrikt_type_kode = k1.plej_distrikt_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5713_prog_stat_dis;
CREATE VIEW fkg.t_5713_prog_stat_dis AS
SELECT
  5713::integer AS temakode,
  't_5713_prog_stat_dis_t'::text AS temanavn,
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
  t.prog_distrikt_nr,
  t.prog_distrikt_navn,
  t.prog_distrikt_type_kode,
  k1.prog_distrikt_type AS prog_distrikt_type,
  t.sagsnr,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5713_prog_stat_dis_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5713_prog_distrikt_type k1 ON (t.prog_distrikt_type_kode = k1.prog_distrikt_type_kode)
WHERE g.systid_til IS NULL;