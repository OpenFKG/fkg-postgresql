-- Alter script FKG 2.4 => 2.5

-- Slet 2 temaer
DROP TABLE IF EXISTS fkg.t_5901_raastof_till_t CASCADE;
DROP TABLE IF EXISTS fkg.t_6114_midl_oph_t CASCADE;
DELETE FROM fkg.d_tabel WHERE tema_kode IN (5901, 6114);

-- 5 nye opslagstabeller
CREATE TABLE fkg.d_basis_belaegning(
	belaegning_kode integer NOT NULL,
	belaegning character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_belaegning_pk PRIMARY KEY (belaegning_kode));

CREATE TABLE fkg.d_basis_handicapegnet(
	handicapegnet_kode integer NOT NULL,
	handicapegnet character varying(40) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_handicapegnet_pk PRIMARY KEY (handicapegnet_kode));

CREATE TABLE fkg.d_basis_invasivart(
	invasivart_kode integer NOT NULL,
	ia_dansknavn character varying(128) NOT NULL,
	ia_latinsknavn character varying(128) NOT NULL,
	ia_rige character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	CONSTRAINT d_basis_invasivart_pk PRIMARY KEY (invasivart_kode));

CREATE TABLE fkg.d_basis_kotesystem(
	kotesystem_kode integer NOT NULL,
	kotesystem character varying(250) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_kotesystem_pk PRIMARY KEY (kotesystem_kode));

CREATE TABLE fkg.d_5802_fremkommelighed(
	fremkommelighed_kode integer NOT NULL,
	fremkommelighed character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5802_fremkommelighed_pk PRIMARY KEY (fremkommelighed_kode));

CREATE TABLE fkg.d_6121_sua(
	sua_kode integer NOT NULL,
	sua_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6121_sua_pk PRIMARY KEY (sua_kode));


INSERT INTO fkg.d_basis_belaegning VALUES (1,'Fast belægning',1,'Fast belægning, som fx asfalt, brolægning og beton');
INSERT INTO fkg.d_basis_belaegning VALUES (2,'Løs belægning',1,'Løs belægning, som fx perlesten, stenmel');
INSERT INTO fkg.d_basis_belaegning VALUES (3,'Uden belægning',1,'Uden belægning, som fx natursti, skovsti og trampet sti, strand.');
INSERT INTO fkg.d_basis_belaegning VALUES (8,'Andet',1,'Andet');
INSERT INTO fkg.d_basis_belaegning VALUES (9,'Ukendt',1,'Mangler viden om belægning');
-- SELECT * FROM fkg.d_basis_belaegning;

INSERT INTO fkg.d_basis_handicapegnet VALUES (1,'Handicapegnet',1,'Faciliteten er egnet for handicappede');
INSERT INTO fkg.d_basis_handicapegnet VALUES (2,'Delvist handicapegnet',1,'Faciliteten er delvist egnet for handicappede, fx kørestolsegnet, men intet handicaptoilet.');
INSERT INTO fkg.d_basis_handicapegnet VALUES (3,'Ikke handicapegnet',1,'Faciliteten er ikke egnet for handicappede');
INSERT INTO fkg.d_basis_handicapegnet VALUES (8,'Andet',1,'Andet');
INSERT INTO fkg.d_basis_handicapegnet VALUES (9,'Ukendt',1,'Mangler viden om egnethed for handicappede.');
-- SELECT * FROM fkg.d_basis_handicapegnet;

INSERT INTO fkg.d_basis_invasivart VALUES (1010,'Almindelig pæleorm','Teredo navalis','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1020,'Amerikansk knivmusling','Ensis americanus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1030,'Amerikansk Ribbegople','Mnemiopsis leidyi','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1040,'Amerikansk Skarveand','Oxyura jamaicensis','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1050,'Bisamrotte','Ondatra zibethicus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1060,'Brun rotte','Rattus norvegicus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1070,'Canadagås','Branta canadensis','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1080,'Galizisk sumpkrebs/Tyrkerkrebs','Potamobius leptodatylus eller Astacus leptodactylus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1090,'Harlekinmariehøne','Harmonia axyridis','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1100,'Iberisk Skovsnegl, "Dræbersnegl"','Arion lusitanicus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1110,'Kastanie-minérmøl','Cameraria ohridella','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1120,'Kinesisk Uldhåndskrabbe','Eriocheir sinensis','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1130,'Kongekrabbe/Troldkrabbe/Kamtscatkakrabbe','Paralithodes camtschaticus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1140,'Mink','Mustela vison','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1150,'Mårhund','Nyctereutes procyonoides','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1160,'Nilgås','Alopochen aegyptiacus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1170,'Plettet voldsnegl','Cantareus aspersus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1180,'Rødøret Terrapin','Trachemys scripta','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1190,'Signalkrebs','Pacifastacus leniusculus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1200,'Sort Svane','Cygnus astratus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1210,'Stillehavsøsters/Japansk østers','Crassostrea gigas','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1220,'Sumpbæver/Bæverrotte','Myocastor coypus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1230,'Vandremusling','Dreissena polymorpha','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1240,'Vaskebjørn','Procyon lotor','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (1250,'Ålens svømmeblæreorm','Anguillicola crassus','Dyreriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2010,'Bjergfyr','Pinus mugo','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2020,'Butblæret sargassotang','Sargassum muticum','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2030,'Bynke-ambrosie','Ambrosia artemisiifolia','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2040,'Canadisk bakkestjerne','Conyza canadensis','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2050,'Contortafyr/Klitfyr','Pinus contorta','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2060,'Engelsk vadegræs','Spartina anglica','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2070,'Glansbladet hæg','Prunus serotina','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2080,'Gul kæmpekalla','Lysichiton americanus','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2090,'Gyldenris/Canadisk gyldenris/Sildig gyldenris','Solidago canadensis/Solidago gigantea','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2100,'Japansk pileurt','Fallopia japonica','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2110,'Kæmpe-balsamin','Impatiens glandulifera','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2120,'Kæmpe-bjørneklo','Heracleum mantegazzianum','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2130,'Kæmpe-pileurt','Fallopia sachalinensis','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2140,'Mangebladet lupin','Lupinus polyphyllus','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2150,'Pastinak','Pastinaca sativa','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2160,'Rød hestehov','Petasites hybridus','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (2170,'Rynket rose','Rosa rugosa','Planteriget',1);
INSERT INTO fkg.d_basis_invasivart VALUES (9998,'Andet','-','-',1);
INSERT INTO fkg.d_basis_invasivart VALUES (9999,'Ukendt','Ignoratus','Ignoratus',1);
-- SELECT * FROM fkg.d_basis_invasivart;

DELETE FROM fkg.d_basis_kotesystem;
INSERT INTO fkg.d_basis_kotesystem VALUES (1,'DNN',1,'Dansk normal nul, gammelt system. Indført omkring 1910. Udfaset i 2006.');
INSERT INTO fkg.d_basis_kotesystem VALUES (2,'DVR90',1,'Dansk Vertikal Reference 1990. Indført i 2002.');
INSERT INTO fkg.d_basis_kotesystem VALUES (8,'Andet',1,'Andet');
INSERT INTO fkg.d_basis_kotesystem VALUES (9,'Ukendt',1,'Ukendt');
-- SELECT * FROM fkg.d_basis_kotesystem;

INSERT INTO fkg.d_5802_fremkommelighed VALUES (1,'Stor fremkommelighed',1,'Strækning med ingen eller små stigninger. Egnet til barnevogn mm');
INSERT INTO fkg.d_5802_fremkommelighed VALUES (2,'Middel fremkommelighed',1,'Strækning med middel fremkommelighed. Stigninger og strækninger uden belægning  kan forekomme.');
INSERT INTO fkg.d_5802_fremkommelighed VALUES (3,'Ringe fremkommelighed',1,'Strækning til fx MTB eller vandrestøvler. Store stigninger og løst underlag kan forekomme.');
INSERT INTO fkg.d_5802_fremkommelighed VALUES (8,'Andet',1,'Andet');
INSERT INTO fkg.d_5802_fremkommelighed VALUES (9,'Ukendt',1,'Mangler viden om fremkommeligheden');
-- SELECT * FROM fkg.d_5802_fremkommelighed;

INSERT INTO fkg.d_6121_sua VALUES (1,'Festival',1,'Festival med flere koncerter m.v.');
INSERT INTO fkg.d_6121_sua VALUES (2,'Dyrskue',1,'Dyreskue');
INSERT INTO fkg.d_6121_sua VALUES (3,'Forsamlingstelt',1,'Telt med master og barduner, stålramme eller lignende, der anvendes til forsamling af mange mennesker. Flere end 150 personer');
INSERT INTO fkg.d_6121_sua VALUES (4,'Cirkus',1,'Cirkus flere end 150 personer');
INSERT INTO fkg.d_6121_sua VALUES (5,'Koncert',1,'Store udendørs koncerter');
INSERT INTO fkg.d_6121_sua VALUES (6,'Spejderlejr',1,'Spejderlejr med camping som ikke er omfattet af campingreglementet flere end 150 personer');
INSERT INTO fkg.d_6121_sua VALUES (7,'Kræmmermarked',1,'Kræmmermarked');
INSERT INTO fkg.d_6121_sua VALUES (8,'Camping',1,'Campingområde som ikke er omfattet af campingreglementet flere end 150 personer');
INSERT INTO fkg.d_6121_sua VALUES (98,'Andet',1,'Hvor andet ikke er dækkende.');
INSERT INTO fkg.d_6121_sua VALUES (99,'Ukendt',1,'Mangler viden om typen.');
-- SELECT * FROM fkg.d_6121_sua;

-- Nye temaer
CREATE TABLE fkg.t_5801_fac_fl_t(
	versions_id uuid NOT NULL,
	facilitet_type_kode integer NOT NULL,
	belaegning_kode integer,
	handicapegnet_kode integer,
	ejerstatus_kode integer,
	navn character varying(50),
	noegle character varying(128),
	note character varying(254),
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5801_fac_fl_pk PRIMARY KEY (versions_id));

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_pkt_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_pkt_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_5800_facilitet_fk FOREIGN KEY (facilitet_type_kode)
REFERENCES fkg.d_5800_facilitet (facilitet_type_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_belaegning_fk FOREIGN KEY (belaegning_kode)
REFERENCES fkg.d_basis_belaegning (belaegning_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_handicapegnet_fk FOREIGN KEY (handicapegnet_kode)
REFERENCES fkg.d_basis_handicapegnet (handicapegnet_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;


CREATE TABLE fkg.t_6119_evaku_centr_t(
	versions_id uuid NOT NULL,
	evakucenter_ref integer,
	evakucenter character varying(150),
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	funktionsstatus_kode integer,
	indkvartering_kode integer,
	sovepladser integer,
	forplejning_kode integer,
	spisepladser integer,
	beredskabsplan_kode integer,
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6119_evaku_centr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6119_evaku_centr_evakucenter_ref_ck CHECK (evakucenter_ref BETWEEN 1 AND 99999),
	CONSTRAINT t_6119_evaku_centr_sovepladser_ck CHECK (sovepladser BETWEEN 1 AND 5000),
	CONSTRAINT t_6119_evaku_centr_spisepladser_ck CHECK (spisepladser BETWEEN 1 AND 5000)

);

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_basis_funktionsstatus_fk FOREIGN KEY (funktionsstatus_kode)
REFERENCES fkg.d_basis_funktionsstatus (funktionsstatus_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_basis_ja_nej_indkvartering_fk FOREIGN KEY (indkvartering_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_basis_ja_nej_forplejning_fk FOREIGN KEY (forplejning_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6119_evaku_centr_t ADD CONSTRAINT t_6119_evaku_centr_d_basis_ja_nej_beredsskabsplan_fk FOREIGN KEY (beredskabsplan_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;


CREATE TABLE fkg.t_6120_midl_overn_t(
	versions_id uuid NOT NULL,
	institutionsnavn character varying(128) NOT NULL,
	antal_personer integer NOT NULL,
	mid_ov_person character varying(128) NOT NULL,
	mid_ov_tlfnr integer NOT NULL,
	fast_vaagen_vagt_kode integer NOT NULL,
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6120_midl_overn_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6120_midl_overn_t_antal_personer_ck CHECK (antal_personer BETWEEN 10 AND 1000),
	CONSTRAINT t_6120_midl_overn_t_mid_ov_tlfnr_ck CHECK (mid_ov_tlfnr BETWEEN 10000000 AND 99999999)

);

ALTER TABLE fkg.t_6120_midl_overn_t ADD CONSTRAINT t_6120_midl_overn_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6120_midl_overn_t ADD CONSTRAINT t_6120_midl_overn_t_d_basis_ja_nej_fast_vaagen_vagt_fk FOREIGN KEY (fast_vaagen_vagt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6120_midl_overn_t ADD CONSTRAINT t_6120_midl_overn_t_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6120_midl_overn_t ADD CONSTRAINT t_6120_midl_overn_t_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

-- DROP TABLE fkg.t_6121_stor_ud_arr_t CASCADE
CREATE TABLE fkg.t_6121_stor_ud_arr_t(
	versions_id uuid NOT NULL,
	sua_kode integer NOT NULL,
	arrangement character varying(128) NOT NULL,
	forsamlingstelt_kode integer,
	cirkustelt_kode integer,
	campingomraade_kode integer,
	salgsomraade_kode integer,
	arrangoer character varying(128),
	adr_i_tekst character varying(128),
	suppl_sted_beskrivelse character varying(128),
	sua_person character varying(128) NOT NULL,
	sua_tlfnr integer NOT NULL,
	antal_personer integer NOT NULL,
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6121_stor_ud_arr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6121_stor_ud_arr_t_sua_tlfnr_ck CHECK (sua_tlfnr BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_6121_stor_ud_arr_t_antal_personer_ck CHECK (antal_personer BETWEEN 0 AND 999999)

);

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_basis_ja_nej_forsamlingstelt_fk FOREIGN KEY (forsamlingstelt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_basis_ja_nej_cirkustelt_fk FOREIGN KEY (cirkustelt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_basis_ja_nej_campingomraade_fk FOREIGN KEY (campingomraade_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_basis_ja_nej_salgsomraade_fk FOREIGN KEY (salgsomraade_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_6121_stor_ud_arr_t ADD CONSTRAINT t_6121_stor_ud_arr_t_d_6121_sua_fk FOREIGN KEY (sua_kode)
REFERENCES fkg.d_6121_sua (sua_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Core data
INSERT INTO fkg.d_tabel VALUES (5801,'Facilitet_flade','F','t_5801_fac_fl','5.9');
INSERT INTO fkg.d_tabel VALUES (6119,'Evakueringscenter','P','t_6119_evaku_centr','5.12');
INSERT INTO fkg.d_tabel VALUES (6120,'Midlertidig overnatning','P','t_6120_midl_overn','5.12');
INSERT INTO fkg.d_tabel VALUES (6121,'Større udendørs arrangementer','F','t_6121_stor_ud_arr','5.12');

-- New views:
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
  t.facilitet_type_kode,
  k1.facilitet_type AS facilitet_type,
  t.belaegning_kode,
  k2.belaegning AS belaegning,
  t.handicapegnet_kode,
  k3.handicapegnet AS handicapegnet,
  t.ejerstatus_kode,
  k4.ejerstatus AS ejerstatus,
  t.navn,
  t.noegle,
  t.note,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facilitet_type_kode = k1.facilitet_type_kode) LEFT JOIN
  fkg.d_basis_belaegning k2 ON (t.belaegning_kode = k2.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k3 ON (t.handicapegnet_kode = k3.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k4 ON (t.ejerstatus_kode = k4.ejerstatus_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr);
DROP VIEW IF EXISTS fkg.hist_t_6119_evaku_centr;
CREATE VIEW fkg.hist_t_6119_evaku_centr AS
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
  t.evakucenter_ref,
  t.evakucenter,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
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
  t.note,
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
  fkg.d_basis_ja_nej k6 ON (t.beredskabsplan_kode = k6.ja_nej_kode);
DROP VIEW IF EXISTS fkg.hist_t_6120_midl_overn;
CREATE VIEW fkg.hist_t_6120_midl_overn AS
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
  t.gyldig_fra,
  t.gyldig_til,
  t.note,
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
  fkg.d_basis_postnr k3 ON (t.postnr = k3.postnr);
DROP VIEW IF EXISTS fkg.hist_t_6121_stor_ud_arr;
CREATE VIEW fkg.hist_t_6121_stor_ud_arr AS
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
  t.gyldig_fra,
  t.gyldig_til,
  t.noegle,
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
  fkg.d_basis_postnr k7 ON (t.postnr = k7.postnr);

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
  t.facilitet_type_kode,
  k1.facilitet_type AS facilitet_type,
  t.belaegning_kode,
  k2.belaegning AS belaegning,
  t.handicapegnet_kode,
  k3.handicapegnet AS handicapegnet,
  t.ejerstatus_kode,
  k4.ejerstatus AS ejerstatus,
  t.navn,
  t.noegle,
  t.note,
  t.vejkode,
  k5.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facilitet_type_kode = k1.facilitet_type_kode) LEFT JOIN
  fkg.d_basis_belaegning k2 ON (t.belaegning_kode = k2.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k3 ON (t.handicapegnet_kode = k3.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ejerstatus k4 ON (t.ejerstatus_kode = k4.ejerstatus_kode) LEFT JOIN
  fkg.d_vejnavn k5 ON (t.vejkode = k5.vejkode) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr)
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
  t.evakucenter_ref,
  t.evakucenter,
  t.vejkode,
  k1.vejnavn AS vejnavn,
  t.cvf_vejkode,
  t.husnr,
  t.postnr,
  k2.postnr_by AS postnr_by,
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
  t.note,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.note,
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
  t.gyldig_fra,
  t.gyldig_til,
  t.noegle,
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




-- New triggers:
CREATE OR REPLACE FUNCTION fkg.t_6120_midl_overn_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_6120_midl_overn_t (versions_id, institutionsnavn, antal_personer, mid_ov_person, mid_ov_tlfnr, fast_vaagen_vagt_kode, vejkode, cvf_vejkode, husnr, postnr, gyldig_fra, gyldig_til, note, link, geometri)
      SELECT
        NEW.versions_id, NEW.institutionsnavn, NEW.antal_personer, NEW.mid_ov_person, NEW.mid_ov_tlfnr, NEW.fast_vaagen_vagt_kode, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.gyldig_fra, NEW.gyldig_til, NEW.note, NEW.link, NEW.geometri;

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

      -- Insert into t_6120_midl_overn_t
      INSERT INTO fkg.t_6120_midl_overn_t (versions_id, institutionsnavn, antal_personer, mid_ov_person, mid_ov_tlfnr, fast_vaagen_vagt_kode, vejkode, cvf_vejkode, husnr, postnr, gyldig_fra, gyldig_til, note, link, geometri)
      SELECT
        NEW.versions_id, NEW.institutionsnavn, NEW.antal_personer, NEW.mid_ov_person, NEW.mid_ov_tlfnr, NEW.fast_vaagen_vagt_kode, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.gyldig_fra, NEW.gyldig_til, NEW.note, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_6120_midl_overn_vw_trg_iud ON fkg.t_6120_midl_overn;

CREATE TRIGGER t_6120_midl_overn_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_6120_midl_overn
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_6120_midl_overn_trg();

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
$$LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_6120_midl_overn_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_6120_midl_overn_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

CREATE OR REPLACE FUNCTION fkg.t_6119_evaku_centr_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_6119_evaku_centr_t (versions_id, evakucenter_ref, evakucenter, vejkode, cvf_vejkode, husnr, postnr, funktionsstatus_kode, indkvartering_kode, sovepladser, forplejning_kode, spisepladser, beredskabsplan_kode, note, link, geometri)
      SELECT
        NEW.versions_id, NEW.evakucenter_ref, NEW.evakucenter, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.funktionsstatus_kode, NEW.indkvartering_kode, NEW.sovepladser, NEW.forplejning_kode, NEW.spisepladser, NEW.beredskabsplan_kode, NEW.note, NEW.link, NEW.geometri;

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

      -- Insert into t_6119_evaku_centr_t
      INSERT INTO fkg.t_6119_evaku_centr_t (versions_id, evakucenter_ref, evakucenter, vejkode, cvf_vejkode, husnr, postnr, funktionsstatus_kode, indkvartering_kode, sovepladser, forplejning_kode, spisepladser, beredskabsplan_kode, note, link, geometri)
      SELECT
        NEW.versions_id, NEW.evakucenter_ref, NEW.evakucenter, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.funktionsstatus_kode, NEW.indkvartering_kode, NEW.sovepladser, NEW.forplejning_kode, NEW.spisepladser, NEW.beredskabsplan_kode, NEW.note, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_6119_evaku_centr_vw_trg_iud ON fkg.t_6119_evaku_centr;

CREATE TRIGGER t_6119_evaku_centr_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_6119_evaku_centr
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_6119_evaku_centr_trg();

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
$$LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_6119_evaku_centr_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_6119_evaku_centr_t FOR EACH ROW
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
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facilitet_type_kode, belaegning_kode, handicapegnet_kode, ejerstatus_kode, navn, noegle, note, vejkode, cvf_vejkode, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facilitet_type_kode, NEW.belaegning_kode, NEW.handicapegnet_kode, NEW.ejerstatus_kode, NEW.navn, NEW.noegle, NEW.note, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;

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

      -- Insert into t_5801_fac_fl_t
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facilitet_type_kode, belaegning_kode, handicapegnet_kode, ejerstatus_kode, navn, noegle, note, vejkode, cvf_vejkode, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facilitet_type_kode, NEW.belaegning_kode, NEW.handicapegnet_kode, NEW.ejerstatus_kode, NEW.navn, NEW.noegle, NEW.note, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5801_fac_fl_vw_trg_iud ON fkg.t_5801_fac_fl;

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
$$LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5801_fac_fl_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5801_fac_fl_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

CREATE OR REPLACE FUNCTION fkg.t_6121_stor_ud_arr_trg() RETURNS trigger AS $$
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
      INSERT INTO fkg.t_6121_stor_ud_arr_t (versions_id, sua_kode, arrangement, forsamlingstelt_kode, cirkustelt_kode, campingomraade_kode, salgsomraade_kode, arrangoer, adr_i_tekst, suppl_sted_beskrivelse, sua_person, sua_tlfnr, antal_personer, vejkode, cvf_vejkode, husnr, postnr, gyldig_fra, gyldig_til, noegle, link, geometri)
      SELECT
        NEW.versions_id, NEW.sua_kode, NEW.arrangement, NEW.forsamlingstelt_kode, NEW.cirkustelt_kode, NEW.campingomraade_kode, NEW.salgsomraade_kode, NEW.arrangoer, NEW.adr_i_tekst, NEW.suppl_sted_beskrivelse, NEW.sua_person, NEW.sua_tlfnr, NEW.antal_personer, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.gyldig_fra, NEW.gyldig_til, NEW.noegle, NEW.link, NEW.geometri;

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

      -- Insert into t_6121_stor_ud_arr_t
      INSERT INTO fkg.t_6121_stor_ud_arr_t (versions_id, sua_kode, arrangement, forsamlingstelt_kode, cirkustelt_kode, campingomraade_kode, salgsomraade_kode, arrangoer, adr_i_tekst, suppl_sted_beskrivelse, sua_person, sua_tlfnr, antal_personer, vejkode, cvf_vejkode, husnr, postnr, gyldig_fra, gyldig_til, noegle, link, geometri)
      SELECT
        NEW.versions_id, NEW.sua_kode, NEW.arrangement, NEW.forsamlingstelt_kode, NEW.cirkustelt_kode, NEW.campingomraade_kode, NEW.salgsomraade_kode, NEW.arrangoer, NEW.adr_i_tekst, NEW.suppl_sted_beskrivelse, NEW.sua_person, NEW.sua_tlfnr, NEW.antal_personer, NEW.vejkode, NEW.cvf_vejkode, NEW.husnr, NEW.postnr, NEW.gyldig_fra, NEW.gyldig_til, NEW.noegle, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_6121_stor_ud_arr_vw_trg_iud ON fkg.t_6121_stor_ud_arr;

CREATE TRIGGER t_6121_stor_ud_arr_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_6121_stor_ud_arr
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_6121_stor_ud_arr_trg();

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
$$LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_6121_stor_ud_arr_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_6121_stor_ud_arr_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

