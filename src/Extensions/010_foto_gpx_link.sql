-- Re: https://github.com/OpenFKG/fkg-postgresql/issues/91 og
--     https://github.com/OpenFKG/fkg-postgresql/issues/92
DROP SCHEMA IF EXISTS fkg_foto_gpx_link CASCADE
;
CREATE SCHEMA IF NOT EXISTS fkg_foto_gpx_link
;

CREATE TABLE IF NOT EXISTS fkg_foto_gpx_link.konfiguration (config_key TEXT, config_value TEXT, PRIMARY KEY (config_key));
INSERT INTO fkg_foto_gpx_link.konfiguration VALUES
  ('gpx_base_url_t_5800_fac_pkt',  'https://geofa.geodanmark.dk/extensions/fkgupload/api/gpx/point/'),
  ('gpx_base_url_t_5802_fac_li',   'https://geofa.geodanmark.dk/extensions/fkgupload/api/gpx/line/'),
  ('foto_base_url_t_5800_fac_pkt', 'https://geofa-foto.geodanmark.dk/1600/'),
  ('foto_base_url_t_5801_fac_fl',  'https://geofa-foto.geodanmark.dk/1600/'),
  ('foto_base_url_t_5802_fac_li',  'https://geofa-foto.geodanmark.dk/1600/')
;

CREATE OR REPLACE VIEW fkg_foto_gpx_link.t_5800_fac_pkt AS
SELECT
  temakode, temanavn, objekt_id, versions_id, systid_fra, systid_til, oprettet, cvr_kode, cvr_navn, kommunekode, bruger_id, oprindkode, oprindelse, statuskode, status, off_kode, offentlig, noegle, note,
  facil_ty_k, facil_ty, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, handicap, saeson_k, saeson, saeson_st, saeson_sl, saeson_bem, doegnaab_k,
  doegnaab, vandhane_k, vandhane, bemand_k, bemand, betaling_k, betaling, book_k, book, antal_pl, kvalitet_k, kvalitet, folder_k, folder, folde_link, foldelink1, foldelink2, foldelink3,
  foto_link, foto_link1, foto_link2, foto_link3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, vejnavn, cvf_vejkode, husnr, postnr, postnr_by, adr_id, ansva_v_k, ansva_v, link, link1, link2, link3, geometri,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5800_fac_pkt' AND foto_objek = fkg.t_5800_fac_pkt.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 0) AS geofafoto,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5800_fac_pkt' AND foto_objek = fkg.t_5800_fac_pkt.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 1) AS geofafoto1,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5800_fac_pkt' AND foto_objek = fkg.t_5800_fac_pkt.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 2) AS geofafoto2,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5800_fac_pkt' AND foto_objek = fkg.t_5800_fac_pkt.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 3) AS geofafoto3,
  (SELECT config_value || objekt_id::text FROM fkg_foto_gpx_link.konfiguration WHERE config_key = 'gpx_base_url_t_5800_fac_pkt') AS gpx_link
FROM
  fkg.t_5800_fac_pkt
;

CREATE OR REPLACE VIEW fkg_foto_gpx_link.t_5801_fac_fl AS
SELECT
  temakode, temanavn, objekt_id, versions_id, systid_fra, systid_til, oprettet, cvr_kode, cvr_navn, kommunekode, bruger_id, oprindkode, oprindelse, statuskode, status, off_kode, offentlig, noegle, note,
  facil_ty_k, facil_ty, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, handicap, saeson_k, saeson, saeson_st, saeson_sl, saeson_bem, doegnaab_k,
  doegnaab, vandhane_k, vandhane, bemand_k, bemand, betaling_k, betaling, book_k, book, antal_pl, kvalitet_k, kvalitet, folder_k, folder, folde_link, foldelink1, foldelink2, foldelink3,
  foto_link, foto_link1, foto_link2, foto_link3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, vejnavn, cvf_vejkode, husnr, postnr, postnr_by, adr_id, ansva_v_k, ansva_v, link, link1, link2, link3, geometri,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5801_fac_fl' AND foto_objek = fkg.t_5801_fac_fl.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 0) AS geofafoto,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5801_fac_fl' AND foto_objek = fkg.t_5801_fac_fl.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 1) AS geofafoto1,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5801_fac_fl' AND foto_objek = fkg.t_5801_fac_fl.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 2) AS geofafoto2,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5801_fac_fl' AND foto_objek = fkg.t_5801_fac_fl.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 3) AS geofafoto3
FROM
  fkg.t_5801_fac_fl
;

CREATE OR REPLACE VIEW fkg_foto_gpx_link.t_5802_fac_li AS
SELECT
  temakode, temanavn, objekt_id, versions_id, systid_fra, systid_til, oprettet, cvr_kode, cvr_navn, kommunekode, bruger_id, oprindkode, oprindelse, statuskode, status, off_kode, offentlig, noegle, note, 
  rute_ty_k, rute_ty, rute_uty_k, rute_uty, navn, navndels, straekn_nr, afm_rute_k, afm_rute, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, betaling,
  belaegn_k, belaegn, handicap_k, handikap, saeson_k, saeson, saeson_st, saeson_sl, saeson_bem, ansva_v_k, ansva_v, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, svaerhed, obs, kategori_k, kategori,
  certifi_k, certifi, hierarki_k, hierarki, kvalitet_k, kvalitet, folder_k, folder, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3,
  filmlink, filmlink1, filmlink2, filmlink3, vejkode, vejnavn, cvf_vejkode, husnr, postnr, postnr_by, adr_id, link, link1, link2, link3, geometri,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5802_fac_li' AND foto_objek = fkg.t_5802_fac_li.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 0) AS geofafoto,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5802_fac_li' AND foto_objek = fkg.t_5802_fac_li.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 1) AS geofafoto1,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5802_fac_li' AND foto_objek = fkg.t_5802_fac_li.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 2) AS geofafoto2,
  (SELECT config_value || foto_lokat FROM fkg_foto_gpx_link.konfiguration, fkg.t_7900_fotoforbindelse WHERE config_key = 'foto_base_url_t_5802_fac_li' AND foto_objek = fkg.t_5802_fac_li.objekt_id ORDER BY primaer_kode DESC, oprettet LIMIT 1 OFFSET 3) AS geofafoto3,
  (SELECT config_value || objekt_id::text FROM fkg_foto_gpx_link.konfiguration WHERE config_key = 'gpx_base_url_t_5802_fac_li') AS gpx_link
FROM
  fkg.t_5802_fac_li
;
