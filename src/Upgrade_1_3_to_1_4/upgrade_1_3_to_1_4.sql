-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.4. https://github.com/OpenFKG/fkg-postgresql/milestone/2';

-- Issue: https://github.com/OpenFKG/fkg-postgresql/issues/101
-- Nye entiteter og relationer:
INSERT INTO fkg.d_tabel VALUES (5607,'Ladepunkt','P','t_5607_ladepunkter','5.7');
INSERT INTO fkg.d_tabel VALUES (5608,'Planlagte ladefaciliteter','P','t_5608_plan_ladefaciliteter','5.7');
-- object: fkg.t_5607_ladepunkter_t | type: TABLE --
-- DROP TABLE IF EXISTS fkg.t_5607_ladepunkter_t CASCADE;
CREATE TABLE fkg.t_5607_ladepunkter_t (
	versions_id uuid NOT NULL,
	ladefacilitet_type_kode integer NOT NULL,
	effekt_type_kode integer,
	tilgaengelighed_type_kode integer,
	internationalt_id character varying(20),
	ejer_ladefacilitet character varying(50),
	operatoer_ladefacilitet character varying(50),
	udbyder_ladefacilitet character varying(50),
	antal_ladepunkter integer,
	stiktype character varying(30),
	anvendelsesgrad_kwh integer,
	driftstart_fra date,
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5607_ladepunkter_pk PRIMARY KEY (versions_id)
);
-- ddl-end --

-- object: fkg.t_5608_plan_ladefaciliteter_t | type: TABLE --
-- DROP TABLE IF EXISTS fkg.t_5608_plan_ladefaciliteter_t CASCADE;
CREATE TABLE fkg.t_5608_plan_ladefaciliteter_t (
	versions_id uuid NOT NULL,
	ladefacilitet_type_kode integer NOT NULL,
	effekt_type_kode integer,
	tilgaengelighed_type_kode integer,
	antal_planlagte_ladefaciliteter integer,
	ejer_ladefacilitet character varying,
	operatoer_ladefacilitet character varying,
	udbyder_ladefacilitet character varying,
	stiktype character varying,
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5608_plan_ladefaciliteter_pk PRIMARY KEY (versions_id)
);
-- ddl-end --

-- object: fkg.d_5607_ladefacilitet_type | type: TABLE --
-- DROP TABLE IF EXISTS fkg.d_5607_ladefacilitet_type CASCADE;
CREATE TABLE fkg.d_5607_ladefacilitet_type (
	ladefacilitet_type_kode integer NOT NULL,
	ladefacilitet_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5607_ladefacilitet_type_pk PRIMARY KEY (ladefacilitet_type_kode)
);
-- ddl-end --

-- object: fkg.d_5607_effekt_type | type: TABLE --
-- DROP TABLE IF EXISTS fkg.d_5607_effekt_type CASCADE;
CREATE TABLE fkg.d_5607_effekt_type (
	effekt_type_kode integer NOT NULL,
	effekt_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5607_effekt_type_pk PRIMARY KEY (effekt_type_kode)
);
-- ddl-end --

-- object: fkg.d_5607_tilgaengelighed_type | type: TABLE --
-- DROP TABLE IF EXISTS fkg.d_5607_tilgaengelighed_type CASCADE;
CREATE TABLE fkg.d_5607_tilgaengelighed_type (
	tilgaengelighed_type_kode integer NOT NULL,
	tilgaengelighed_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5607_tilgaengelighed_type_pk PRIMARY KEY (tilgaengelighed_type_kode)
);
-- ddl-end --

-- Relations:
-- object: t_5607_ladepunkter_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5607_ladepunkter_t DROP CONSTRAINT IF EXISTS t_5607_ladepunkter_generel_fk CASCADE;
ALTER TABLE fkg.t_5607_ladepunkter_t ADD CONSTRAINT t_5607_ladepunkter_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5607_lade_pkt_d_5607_ladefacilitet_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5607_ladepunkter_t DROP CONSTRAINT IF EXISTS t_5607_lade_pkt_d_5607_ladefacilitet_type_fk CASCADE;
ALTER TABLE fkg.t_5607_ladepunkter_t ADD CONSTRAINT t_5607_lade_pkt_d_5607_ladefacilitet_type_fk FOREIGN KEY (ladefacilitet_type_kode)
REFERENCES fkg.d_5607_ladefacilitet_type (ladefacilitet_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5607_lade_pkt_d_5607_effekt_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5607_ladepunkter_t DROP CONSTRAINT IF EXISTS t_5607_lade_pkt_d_5607_effekt_kode_fk CASCADE;
ALTER TABLE fkg.t_5607_ladepunkter_t ADD CONSTRAINT t_5607_lade_pkt_d_5607_effekt_kode_fk FOREIGN KEY (effekt_type_kode)
REFERENCES fkg.d_5607_effekt_type (effekt_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5607_lade_pkt_d_5607_tilgaengelighed_type_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5607_ladepunkter_t DROP CONSTRAINT IF EXISTS t_5607_lade_pkt_d_5607_tilgaengelighed_type_kode_fk CASCADE;
ALTER TABLE fkg.t_5607_ladepunkter_t ADD CONSTRAINT t_5607_lade_pkt_d_5607_tilgaengelighed_type_kode_fk FOREIGN KEY (tilgaengelighed_type_kode)
REFERENCES fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5608_plan_ladefaciliteter_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t DROP CONSTRAINT IF EXISTS t_5608_plan_ladefaciliteter_generel_fk CASCADE;
ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t ADD CONSTRAINT t_5608_plan_ladefaciliteter_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5608_plan_ladefaciliteter_d_5607_ladefacilitet_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t DROP CONSTRAINT IF EXISTS t_5608_plan_ladefaciliteter_d_5607_ladefacilitet_type_fk CASCADE;
ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t ADD CONSTRAINT t_5608_plan_ladefaciliteter_d_5607_ladefacilitet_type_fk FOREIGN KEY (ladefacilitet_type_kode)
REFERENCES fkg.d_5607_ladefacilitet_type (ladefacilitet_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5608_plan_faciliteter_d_5607_effekt_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t DROP CONSTRAINT IF EXISTS t_5608_plan_faciliteter_d_5607_effekt_kode_fk CASCADE;
ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t ADD CONSTRAINT t_5608_plan_faciliteter_d_5607_effekt_kode_fk FOREIGN KEY (effekt_type_kode)
REFERENCES fkg.d_5607_effekt_type (effekt_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: t_5608_plan_ladefaciliteter_d_5607_tilgaengelighed_type_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t DROP CONSTRAINT IF EXISTS t_5608_plan_ladefaciliteter_d_5607_tilgaengelighed_type_kode_fk CASCADE;
ALTER TABLE fkg.t_5608_plan_ladefaciliteter_t ADD CONSTRAINT t_5608_plan_ladefaciliteter_d_5607_tilgaengelighed_type_kode_fk FOREIGN KEY (tilgaengelighed_type_kode)
REFERENCES fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- Lookup values:
DELETE FROM fkg.d_5607_effekt_type;
DELETE FROM fkg.d_5607_ladefacilitet_type;
DELETE FROM fkg.d_5607_tilgaengelighed_type;
INSERT INTO fkg.d_5607_ladefacilitet_type (ladefacilitet_type_kode, ladefacilitet_type, aktiv, begrebsdefinition) VALUES (1, E'Elladestander til bil', 1, E'En elladestander, der kan bruges til at oplade en elbil eller hybridbil.');
INSERT INTO fkg.d_5607_ladefacilitet_type (ladefacilitet_type_kode, ladefacilitet_type, aktiv, begrebsdefinition) VALUES (2, E'Elladestander til cykel', 1, E'En elladestander, der kan bruges til at oplade en elcykel.');
INSERT INTO fkg.d_5607_ladefacilitet_type (ladefacilitet_type_kode, ladefacilitet_type, aktiv, begrebsdefinition) VALUES (3, E'Elladestander til kørestol', 1, E'En elladestander, der kan bruges til at oplade en elektrisk kørestol.');
INSERT INTO fkg.d_5607_effekt_type (effekt_type_kode, effekt_type, aktiv, begrebsdefinition) VALUES (1, E'Normallader', 1, E'3-22 kW');
INSERT INTO fkg.d_5607_effekt_type (effekt_type_kode, effekt_type, aktiv, begrebsdefinition) VALUES (2, E'Hurtiglader', 1, E'50-100 kW');
INSERT INTO fkg.d_5607_effekt_type (effekt_type_kode, effekt_type, aktiv, begrebsdefinition) VALUES (3, E'Lynlader', 1, E'> 150 kW');
INSERT INTO fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode, tilgaengelighed_type, aktiv, begrebsdefinition) VALUES (1, E'Offentligt tilgængelig', 1, E'En ladefacilitet eller en tankstation til forsyning med et alternativt drivmiddel, som giver ikkediskriminerende adgang for brugere. Ikkediskriminerende adgang kan omfatte forskellige vilkår for godkendelse, anvendelse og betaling.');
INSERT INTO fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode, tilgaengelighed_type, aktiv, begrebsdefinition) VALUES (2, E'Privat ladestander', 1, E'En ladefacilitet eller en tankstation, som ejes af privatejer eller virksomhed og som giver en eksklusiv ret til ejer samt evt. ansatte i virksomhed.');
INSERT INTO fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode, tilgaengelighed_type, aktiv, begrebsdefinition) VALUES (3, E'Kommunal bilflåde', 1, E'En ladefacilitet eller en tankstation, som ejes af kommune og som giver en eksklusiv ret til den kommunale bilflåde.');
INSERT INTO fkg.d_5607_tilgaengelighed_type (tilgaengelighed_type_kode, tilgaengelighed_type, aktiv, begrebsdefinition) VALUES (4, E'Statslig bilflåde', 1, E'En ladefacilitet eller en tankstation, som ejes af statslig myndighed og som giver en eksklusiv ret til den statslige bilflåde.');

-- Issue: https://github.com/OpenFKG/fkg-postgresql/issues/100
-- Nye felter på friluftstemaer
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN navn_uk CHARACTER varying(255), ADD COLUMN navn_d CHARACTER varying(255);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN navn_uk CHARACTER varying(255), ADD COLUMN navn_d CHARACTER varying(255);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN navn_uk CHARACTER varying(255), ADD COLUMN navn_d CHARACTER varying(255);

-- Issue: https://github.com/OpenFKG/fkg-postgresql/issues/103
-- Nye facilitetstyper
INSERT INTO fkg.d_5800_facilitet VALUES (4401, 'Overbæringssted', 1, 'Sted hvor der kan overbæres kanoer mv.');
INSERT INTO fkg.d_5800_facilitet VALUES (4411, 'Fiskeplatform', 1, 'Bro el.lign. hvorfra fiskeri er velegent');
INSERT INTO fkg.d_5800_facilitet VALUES (1361, 'Fodhviler', 1, '');
INSERT INTO fkg.d_5800_facilitet VALUES (1371, 'Bænk', 1, '');


-- Views for changed themes -- Actual:
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
DROP VIEW IF EXISTS fkg.t_5608_plan_ladefaciliteter;
CREATE VIEW fkg.t_5608_plan_ladefaciliteter AS
SELECT
  5608::integer AS temakode,
  't_5608_plan_ladefaciliteter_t'::text AS temanavn,
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
  t.antal_planlagte_ladefaciliteter,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.stiktype,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5608_plan_ladefaciliteter_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5607_ladepunkter;
CREATE VIEW fkg.t_5607_ladepunkter AS
SELECT
  5607::integer AS temakode,
  't_5607_ladepunkter_t'::text AS temanavn,
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
  t.internationalt_id,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.antal_ladepunkter,
  t.stiktype,
  t.anvendelsesgrad_kwh,
  t.driftstart_fra,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5607_ladepunkter_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode)
WHERE g.systid_til IS NULL;

-- Historical:
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
  t.geometri,
  t.navn_uk,
  t.navn_d
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
DROP VIEW IF EXISTS fkg.hist_t_5608_plan_ladefaciliteter;
CREATE VIEW fkg.hist_t_5608_plan_ladefaciliteter AS
SELECT
  5608::integer AS temakode,
  't_5608_plan_ladefaciliteter_t'::text AS temanavn,
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
  t.antal_planlagte_ladefaciliteter,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.stiktype,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5608_plan_ladefaciliteter_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode);
DROP VIEW IF EXISTS fkg.hist_t_5607_ladepunkter;
CREATE VIEW fkg.hist_t_5607_ladepunkter AS
SELECT
  5607::integer AS temakode,
  't_5607_ladepunkter_t'::text AS temanavn,
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
  t.internationalt_id,
  t.ejer_ladefacilitet,
  t.operatoer_ladefacilitet,
  t.udbyder_ladefacilitet,
  t.antal_ladepunkter,
  t.stiktype,
  t.anvendelsesgrad_kwh,
  t.driftstart_fra,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5607_ladepunkter_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5607_ladefacilitet_type k1 ON (t.ladefacilitet_type_kode = k1.ladefacilitet_type_kode) LEFT JOIN
  fkg.d_5607_effekt_type k2 ON (t.effekt_type_kode = k2.effekt_type_kode) LEFT JOIN
  fkg.d_5607_tilgaengelighed_type k3 ON (t.tilgaengelighed_type_kode = k3.tilgaengelighed_type_kode);

-- Trigger
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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;

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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, straekn_nr, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, gpx_link, vejkode, cvf_vejkode, husnr, postnr, adr_id, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.gpx_link, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;
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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;

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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;
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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;

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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, saeson_bem, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, kvalitet_k, folder_k, folde_link, foldelink1, foldelink2, foldelink3, foto_link, foto_link1, foto_link2, foto_link3, geofafoto, geofafoto1, geofafoto2, geofafoto3, filmlink, filmlink1, filmlink2, filmlink3, vejkode, cvf_vejkode, husnr, postnr, adr_id, ansva_v_k, link, link1, link2, link3, geometri, navn_uk, navn_d)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.saeson_bem, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.kvalitet_k, NEW.folder_k, NEW.folde_link, NEW.foldelink1, NEW.foldelink2, NEW.foldelink3, NEW.foto_link, NEW.foto_link1, NEW.foto_link2, NEW.foto_link3, NEW.geofafoto, NEW.geofafoto1, NEW.geofafoto2, NEW.geofafoto3, NEW.filmlink, NEW.filmlink1, NEW.filmlink2, NEW.filmlink3, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.link1, NEW.link2, NEW.link3, NEW.geometri, NEW.navn_uk, NEW.navn_d;
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
CREATE OR REPLACE FUNCTION fkg.t_5608_plan_ladefaciliteter_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_5608_plan_ladefaciliteter_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, antal_planlagte_ladefaciliteter, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, stiktype, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.antal_planlagte_ladefaciliteter, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.stiktype, NEW.geometri;

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

      -- Insert into t_5608_plan_ladefaciliteter_t
      INSERT INTO fkg.t_5608_plan_ladefaciliteter_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, antal_planlagte_ladefaciliteter, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, stiktype, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.antal_planlagte_ladefaciliteter, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.stiktype, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5608_plan_ladefaciliteter_trg_iud ON fkg.t_5608_plan_ladefaciliteter;

CREATE TRIGGER t_5608_plan_ladefaciliteter_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5608_plan_ladefaciliteter
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5608_plan_ladefaciliteter_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5608_plan_ladefaciliteter_t;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5608_plan_ladefaciliteter_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5608_plan_ladefaciliteter_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5608_plan_ladefaciliteter_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
CREATE OR REPLACE FUNCTION fkg.t_5607_ladepunkter_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_5607_ladepunkter_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.geometri;

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

      -- Insert into t_5607_ladepunkter_t
      INSERT INTO fkg.t_5607_ladepunkter_t (versions_id, ladefacilitet_type_kode, effekt_type_kode, tilgaengelighed_type_kode, internationalt_id, ejer_ladefacilitet, operatoer_ladefacilitet, udbyder_ladefacilitet, antal_ladepunkter, stiktype, anvendelsesgrad_kwh, driftstart_fra, geometri)
      SELECT
        NEW.versions_id, NEW.ladefacilitet_type_kode, NEW.effekt_type_kode, NEW.tilgaengelighed_type_kode, NEW.internationalt_id, NEW.ejer_ladefacilitet, NEW.operatoer_ladefacilitet, NEW.udbyder_ladefacilitet, NEW.antal_ladepunkter, NEW.stiktype, NEW.anvendelsesgrad_kwh, NEW.driftstart_fra, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5607_ladepunkter_trg_iud ON fkg.t_5607_ladepunkter;

CREATE TRIGGER t_5607_ladepunkter_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5607_ladepunkter
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5607_ladepunkter_trg();

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

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5607_ladepunkter_t;

DO $$ BEGIN
  IF EXISTS (SELECT 1 FROM information_schema."columns" WHERE 
  table_schema = 'fkg'
  AND table_name = 't_5607_ladepunkter_t'
  AND column_name = 'geometri') THEN
    DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5607_ladepunkter_t;
    CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE ON fkg.t_5607_ladepunkter_t FOR EACH ROW EXECUTE PROCEDURE fkg.make_multi();
  END IF;
END$$
;
-- Indices:
DROP INDEX IF EXISTS fkg.t_5802_fac_li_t_gist;CREATE INDEX t_5802_fac_li_t_gist ON fkg.t_5802_fac_li_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5801_fac_fl_t_gist;CREATE INDEX t_5801_fac_fl_t_gist ON fkg.t_5801_fac_fl_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5800_fac_pkt_t_gist;CREATE INDEX t_5800_fac_pkt_t_gist ON fkg.t_5800_fac_pkt_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5608_plan_ladefaciliteter_t_gist;CREATE INDEX t_5608_plan_ladefaciliteter_t_gist ON fkg.t_5608_plan_ladefaciliteter_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5607_ladepunkter_t_gist;CREATE INDEX t_5607_ladepunkter_t_gist ON fkg.t_5607_ladepunkter_t USING gist (geometri);
