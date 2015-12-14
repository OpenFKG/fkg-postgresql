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
UPDATE fkg.d_tabel SET tema_navn = 'Arter Invasive Flade' WHERE tema_kode = 5104;
UPDATE fkg.d_tabel SET tema_navn = 'Arter Invasive Punkt' WHERE tema_kode = 5107;
UPDATE fkg.d_tabel SET tema_navn = 'Børne- og skoledistrikter' WHERE tema_kode = 5710;

-- t_5602_p_zoner_t, ny datatype
ALTER TABLE fkg.t_5602_p_zoner_t RENAME COLUMN p_pris_time TO p_pris_time_int;
ALTER TABLE fkg.t_5602_p_zoner_t ADD COLUMN p_pris_time double precision;
UPDATE fkg.t_5602_p_zoner_t SET p_pris_time = p_pris_time_int;
ALTER TABLE fkg.t_5602_p_zoner_t DROP COLUMN p_pris_time_int CASCADE;
ALTER TABLE fkg.t_5602_p_zoner_t ADD CONSTRAINT t_5602_p_zoner_p_pris_time_ck CHECK (p_pris_time BETWEEN 0.01 AND 999.99);

-- t_5401_genbr_st_t, ny check constraint
ALTER TABLE fkg.t_5401_genbr_st_t ADD CONSTRAINT p_nr_ck CHECK (p_nr BETWEEN 1 AND 99999);


-- t_6000_pot_t og t_6001_pot_m_t fremmednøgle flyttes fra d_6000_kotesystem til d_basis_kotesystem (linje 61-63)
ALTER TABLE fkg.t_6000_pot_t DROP CONSTRAINT t_6000_pot;
ALTER TABLE fkg.t_6001_pot_m_t DROP CONSTRAINT t_6001_pot_m_d_6000_kotesystem_fk;
ALTER TABLE fkg.t_6000_pot_t
  ADD CONSTRAINT t_6000_pot_d_basis_kotesystem_fk FOREIGN KEY (kotesystem_kode)
      REFERENCES fkg.d_basis_kotesystem (kotesystem_kode) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE fkg.t_6001_pot_m_t
  ADD CONSTRAINT t_6001_pot_m_d_basis_kotesystem_fk FOREIGN KEY (kotesystem_kode)
      REFERENCES fkg.d_basis_kotesystem (kotesystem_kode) MATCH FULL
      ON UPDATE NO ACTION ON DELETE NO ACTION;
DROP TABLE fkg.d_6000_kotesystem CASCADE;

-- Opdatering af feltnavne. 
--Noter->note
ALTER TABLE fkg.t_5104_art_invas_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5105_rig_fattig_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5107_art_invas_p_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5506_spildev_pl_pkt_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5705_forp_are_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6102_redn_vej_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6107_forholds_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6108_moedepl_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6110_noegle_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6116_olie_ber_pl_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6117_inds_pkt_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6118_bran_redn_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6800_parl_fl_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6801_parl_li_t RENAME COLUMN noter TO note;
ALTER TABLE fkg.t_6802_parl_pkt_t RENAME COLUMN noter TO note;
-- Fra "phosphor_indhold" til "fosfor_total"
ALTER TABLE fkg.t_5200_aff_prod_udbr_t RENAME COLUMN phosphor_indhold TO fosfor_total;
-- Fra "sagnr" til "sagsnr"
ALTER TABLE fkg.t_5508_husst_moel_t RENAME COLUMN sagnr TO sagsnr;
-- Fra "skorstensfejer" til "skorstensfejer_firma"
ALTER TABLE fkg.t_5702_skorst_fej_t RENAME COLUMN skorstensfejer TO skorstensfejer_firma;
-- Fra "net_adr" til "net_tlf"
ALTER TABLE fkg.t_6107_forholds_t RENAME COLUMN net_adr TO net_tlf;


-- t_5104_art_invas_t, ændringer
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN sortlistet_kode CASCADE;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN dnavn;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN lnavn;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN nobanis_invasiv_opt;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN rige_dk;
ALTER TABLE fkg.t_5104_art_invas_t ADD COLUMN invasivart_kode integer NOT NULL;
ALTER TABLE fkg.t_5104_art_invas_t ADD CONSTRAINT t_5104_art_invas_t_d_basis_invasivart FOREIGN KEY (invasivart_kode)
  REFERENCES fkg.d_basis_invasivart (invasivart_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

-- t_5107_art_invas_p_t, ændringer
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN sortlistet_kode CASCADE;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN dnavn;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN lnavn;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN nobanis_invasiv_opt;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN rige_dk;
ALTER TABLE fkg.t_5107_art_invas_p_t ADD COLUMN invasivart_kode integer NOT NULL;
ALTER TABLE fkg.t_5107_art_invas_p_t ADD CONSTRAINT t_5107_art_invas_p_d_basis_invasivart FOREIGN KEY (invasivart_kode)
  REFERENCES fkg.d_basis_invasivart (invasivart_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

-- t_5200_aff_prod_udbr_t, 4 nye felter
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD COLUMN fosfor_udnyttelse double precision;
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD COLUMN kvaelstof_total double precision;
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD COLUMN kvaelstof_udnyttelse double precision;
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD COLUMN kalium_total double precision;
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD CONSTRAINT t_5200_aff_prod_udbr_fosfor_udnyttelse_ck CHECK (fosfor_udnyttelse BETWEEN 0.01 AND 100.0);
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD CONSTRAINT t_5200_aff_prod_udbr_kvaelstof_total_ck CHECK (kvaelstof_total BETWEEN 0.01 AND 9999.99);
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD CONSTRAINT t_5200_aff_prod_udbr_kvaelstof_udnyttelse_ck CHECK (kvaelstof_udnyttelse BETWEEN 0.01 AND 9999.99);
ALTER TABLE fkg.t_5200_aff_prod_udbr_t ADD CONSTRAINT t_5200_aff_prod_udbr_kalium_total_ck CHECK (kalium_total BETWEEN 0.01 AND 9999.99);

-- t_5700_grundej_t, nyt felt
ALTER TABLE fkg.t_5700_grundej_t ADD COLUMN forening_cvr integer;
ALTER TABLE fkg.t_5700_grundej_t ADD CONSTRAINT t_5700_grundej_forening_cvr_ck CHECK (forening_cvr BETWEEN 10000000 AND 99999999);

-- t_5702_skorst_fej_t, nyt felt
ALTER TABLE fkg.t_5702_skorst_fej_t ADD COLUMN skorstensfejer_cvr integer;
ALTER TABLE fkg.t_5702_skorst_fej_t ADD CONSTRAINT t_5702_skorst_fej_skorstensfejer_cvr_ck CHECK (skorstensfejer_cvr BETWEEN 10000000 AND 99999999);

-- t_5703_afstem_sted_t, nye felter
ALTER TABLE fkg.t_5703_afstem_sted_t ADD COLUMN opstillingskreds_nr integer;
ALTER TABLE fkg.t_5703_afstem_sted_t ADD COLUMN opstillingskreds_navn character varying(40);
ALTER TABLE fkg.t_5703_afstem_sted_t ADD COLUMN storkreds_nr integer;
ALTER TABLE fkg.t_5703_afstem_sted_t ADD COLUMN storkreds_navn character varying(40);
ALTER TABLE fkg.t_5703_afstem_sted_t ADD COLUMN ansvar_revision character varying(128);
ALTER TABLE fkg.t_5703_afstem_sted_t ADD CONSTRAINT t_5703_afstem_sted_opstillingskreds_nr_ck CHECK (opstillingskreds_nr BETWEEN 1 AND 92);
ALTER TABLE fkg.t_5703_afstem_sted_t ADD CONSTRAINT t_5703_afstem_sted_storkreds_nr_ck CHECK (storkreds_nr BETWEEN 1 AND 10);

-- t_5900_jordfl_t, nye felter
ALTER TABLE fkg.t_5900_jordfl_t ADD COLUMN afs_cvr_kode integer;
ALTER TABLE fkg.t_5900_jordfl_t ADD COLUMN afs_cvr_navn character varying(128);
ALTER TABLE fkg.t_5900_jordfl_t ADD COLUMN modt_cvr_kode integer;
ALTER TABLE fkg.t_5900_jordfl_t ADD COLUMN modt_cvr_navn character varying(128);
ALTER TABLE fkg.t_5900_jordfl_t ADD CONSTRAINT t_5900_jordfl_afs_cvr_kode_ck CHECK (afs_cvr_kode BETWEEN 10000000 AND 99999999);
ALTER TABLE fkg.t_5900_jordfl_t ADD CONSTRAINT t_5900_jordfl_modt_cvr_kode_ck CHECK (modt_cvr_kode BETWEEN 10000000 AND 99999999);

-- t_6007_inds_omr_t, ny datatype
ALTER TABLE fkg.t_6007_inds_omr_t RENAME COLUMN vedtagelse TO vedtagelse_string;
ALTER TABLE fkg.t_6007_inds_omr_t ADD COLUMN vedtagelse date;
UPDATE fkg.t_6007_inds_omr_t SET vedtagelse = vedtagelse_string::date;
ALTER TABLE fkg.t_6007_inds_omr_t DROP COLUMN vedtagelse_string CASCADE;

-- t_6111_fyrv_till_t, nyt feltnavn og nyt felt
ALTER TABLE fkg.t_6111_fyrv_till_t RENAME COLUMN firma TO fyr_firma_navn;
ALTER TABLE fkg.t_6111_fyrv_till_t ADD COLUMN fyr_firma_cvr integer;
ALTER TABLE fkg.t_6111_fyrv_till_t ADD CONSTRAINT t_6111_fyrv_till_fyr_firma_cvr_ck CHECK (fyr_firma_cvr BETWEEN 10000000 AND 99999999);

-- t_6112_midl_dep_t, nye feltnavne (også i lookup-tabel)
ALTER TABLE fkg.t_6112_midl_dep_t RENAME COLUMN cvr TO virksomhed_cvr;
ALTER TABLE fkg.t_6112_midl_dep_t RENAME COLUMN depottype_kode TO depot_type_kode;
ALTER TABLE fkg.d_6112_depottype RENAME COLUMN depottype_kode TO depot_type_kode;
ALTER TABLE fkg.d_6112_depottype RENAME COLUMN depottype TO depot_type;

-- t_6116_olie_ber_pl_t, nye feltnavne (også i lookup-tabel)
ALTER TABLE fkg.t_6116_olie_ber_pl_t RENAME COLUMN strandtype_kode TO strand_type_kode;
ALTER TABLE fkg.d_6116_strandtype RENAME COLUMN strandtype_kode TO strand_type_kode;
ALTER TABLE fkg.d_6116_strandtype RENAME COLUMN strandtype TO strand_type;

-- t_6200_nat_geo_t, feltnavne ændret
ALTER TABLE fkg.t_6200_nat_geo_t RENAME COLUMN vandelementer TO vandelement;
ALTER TABLE fkg.t_6200_nat_geo_t RENAME COLUMN strandbredden TO strandbred;

-- Nye og ændrede opslagsværdier:
INSERT INTO fkg.d_basis_antal VALUES (4,'1000+',1,'Over 1000 stk.');

ALTER TABLE fkg.d_5106_pleje_type ADD COLUMN pleje_type_label character varying(10);
UPDATE fkg.d_5106_pleje_type SET begrebsdefinition = 'Andet' WHERE pleje_type_kode = 98;
UPDATE fkg.d_5106_pleje_type SET begrebsdefinition = 'Ukendt' WHERE pleje_type_kode = 99;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP1' WHERE pleje_type_kode = 1;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP2' WHERE pleje_type_kode = 2;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP3' WHERE pleje_type_kode = 3;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP4' WHERE pleje_type_kode = 4;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP5' WHERE pleje_type_kode = 5;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP6' WHERE pleje_type_kode = 6;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP7' WHERE pleje_type_kode = 7;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP8' WHERE pleje_type_kode = 8;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP9' WHERE pleje_type_kode = 9;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP11' WHERE pleje_type_kode = 11;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP12' WHERE pleje_type_kode = 12;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP13' WHERE pleje_type_kode = 13;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP14' WHERE pleje_type_kode = 14;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP15' WHERE pleje_type_kode = 15;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP16' WHERE pleje_type_kode = 16;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP98' WHERE pleje_type_kode = 98;
UPDATE fkg.d_5106_pleje_type SET pleje_type_label = 'NP99' WHERE pleje_type_kode = 99;
UPDATE fkg.d_5106_pleje_type SET pleje_type = 'Slåning af gyvel', begrebsdefinition = 'Slåning af gyvel med brakpudser hvert 2. år.' WHERE pleje_type_kode = 5;

INSERT INTO fkg.d_5707_grund_type VALUES (11,'Byggegrund - jordbrugsparcel',1,'Grund med ret til at bygge en bolig med mulihged for mindre dyrehold eller stor have/udenomareal');

INSERT INTO fkg.d_5714_udd_institution_type VALUES (30,'Erhvervsskole',1,'Erhvervsskole varetager den teoretiske del af erhvervsuddannelsen. Typisk tømre, smede, mekanikeker,slagter m.v.');

-- Lookuptabel d_6118_redarea_type
ALTER TABLE fkg.d_6118_brand_redarea_type RENAME COLUMN brand_redarea_type_kode TO redarea_type_kode;
ALTER TABLE fkg.d_6118_brand_redarea_type RENAME COLUMN brand_redarea_type TO redarea_type;

-- Tema 6202_landk_omr, 4 feltnavne
ALTER TABLE fkg.t_6202_landk_omr_t RENAME COLUMN landskabskarakteren TO landskabskarakter;
ALTER TABLE fkg.t_6202_landk_omr_t RENAME COLUMN noeglefunktioner TO noeglefunktion;
ALTER TABLE fkg.t_6202_landk_omr_t RENAME COLUMN oplevelser TO oplevelse;

-- Tema 5800_facilitet, diverse ændringer
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN belaegning_kode integer;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN handicapegnet_kode integer;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_belaegning_fk FOREIGN KEY (belaegning_kode)
REFERENCES fkg.d_basis_belaegning (belaegning_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_handicapegnet_fk FOREIGN KEY (handicapegnet_kode)
REFERENCES fkg.d_basis_handicapegnet (handicapegnet_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

DELETE FROM fkg.d_5800_facilitet;
INSERT INTO fkg.d_5800_facilitet VALUES (1012, 'Toilet', 1, 'WC i bygning, der er åbent for offentligheden.');
INSERT INTO fkg.d_5800_facilitet VALUES (1022, 'Bålplads', 1, 'Afgrænset plads til bål eller grill til offentlig brug.  Ikke alle bålsteder har grill-muligheden.');
INSERT INTO fkg.d_5800_facilitet VALUES (1031, 'Legeplads', 1, 'En legeplads er et afgrænset sted udendørs, som er tilrettelagt for at børn kan lege der.');
INSERT INTO fkg.d_5800_facilitet VALUES (1041, 'Naturlegeplads', 1, 'Legeplads ude i naturen typisk bygget med naturens egne matrialer. Træstammer og sten m.v.');
INSERT INTO fkg.d_5800_facilitet VALUES (1051, 'Badestrand', 1, 'Område, der anvendes til badning.');
INSERT INTO fkg.d_5800_facilitet VALUES (1061, 'Blå Flag strand', 1, 'Badeområde, der er tildelt Blå Flag.');
INSERT INTO fkg.d_5800_facilitet VALUES (1072, 'Blå Flag facilitet', 1, 'Faciliteter til Blå Flag badestrande, f.eks. infostandere, redningsposter mm.');
INSERT INTO fkg.d_5800_facilitet VALUES (1082, 'Spejderhytte', 1, 'Bygning, hvor en eller flere spejdergrupper holder til.');
INSERT INTO fkg.d_5800_facilitet VALUES (1091, 'Friluftsbad/Svømmebad', 1, 'Område med et eller flere badebassinner, der kan være overdækket eller under åben himmel. Dækker også havnebad.');
INSERT INTO fkg.d_5800_facilitet VALUES (1102, 'Slæbested', 1, 'Anlæg til ophaling eller isætning af mindre både, evt. med spil.');
INSERT INTO fkg.d_5800_facilitet VALUES (1112, 'Motionsmødested', 1, 'Sted i bygning eller i naturen, hvor man mødes med andre motionister, som udgangspunkt for fælles motion.');
INSERT INTO fkg.d_5800_facilitet VALUES (1122, 'Cykelpumpestation', 1, 'Opstillet cykelpumpe.');
INSERT INTO fkg.d_5800_facilitet VALUES (1132, 'Tørvejrsrum', 1, 'Halvåbent, overdækket sted, hvor du kan raste og spise medbragt mad. Også kaldetmadpakkehus.');
INSERT INTO fkg.d_5800_facilitet VALUES (1142, 'Virtuelt oplevelsespunkt', 1, 'Virtuelle oplevelsespunkter/Hotspots, som kan tilgås fx via apps eller lignende.');
INSERT INTO fkg.d_5800_facilitet VALUES (1152, 'Info-tavle', 1, 'Opstillet skilt, planche eller tavle med information om et område og dets muligheder.');
INSERT INTO fkg.d_5800_facilitet VALUES (1162, 'Cykelparkering', 1, 'Opstillet cykelstativ eller anden fast opstilling, der gør det muligt at parkere sin cykel.');
INSERT INTO fkg.d_5800_facilitet VALUES (1172, 'Ladestationer', 1, 'Ladestationer til elbiler.');
INSERT INTO fkg.d_5800_facilitet VALUES (1182, 'Turistinformation', 1, 'Kontor/lokaler, der har til formål at informere turister om lokalområdet.');
INSERT INTO fkg.d_5800_facilitet VALUES (1191, 'Hundeskov/Hundepark', 1, 'Særligt udpeget og eventuelt indhegnet område for hundeluftning. Kommunale og private områder.');
INSERT INTO fkg.d_5800_facilitet VALUES (1201, 'Picnic', 1, 'Plads med borde, siddepladser, evt. hængekøjer og andre ting til roligt ophold.');
INSERT INTO fkg.d_5800_facilitet VALUES (1211, 'Vandlegeplads', 1, 'Legeplads med særlige redskaber og faciliteter til leg med vand.');
INSERT INTO fkg.d_5800_facilitet VALUES (1222, 'Vandpost', 1, 'Offentligt tilgængeligt drikkevand. Kan være lukket om vinteren.');
INSERT INTO fkg.d_5800_facilitet VALUES (1232, 'Trækfærge', 1, 'En trækfærge er en pram som er forbundet med en wire. Trækfærgen forbinder bredderne på en å eller et vandløb så man kan med egen trækkraft komme over på den anden side.');
INSERT INTO fkg.d_5800_facilitet VALUES (1242, 'Livreddertårn', 1, 'Bemandet redningspost (rød og hvidstribet tårn) af specieluddannede kystlivreddere og udstyret med blandt andet hjertestartere, rescue boards og førstehjælpsudstyr.');
INSERT INTO fkg.d_5800_facilitet VALUES (1252, 'Livredderpost', 1, 'Ubemandet redningspost der typisk indeholder: Vejlednig, 1 redningskrans, 1 sejldugstaske med 22o m nylon line, 2 redningsveste, 2 gjordbælter med karbinhage og evt. isstige og issyle.');
INSERT INTO fkg.d_5800_facilitet VALUES (2012, 'Fugletårn', 1, 'Fugletårn er en indretning rejst ved en fuglelokalitet for at give offentligheden udsyn til områdets fugleliv og ofte skjule observatørerne således at fuglene ikke forstyrres.');
INSERT INTO fkg.d_5800_facilitet VALUES (2022, 'Udsigtspunkt', 1, 'Punkt med en god udsigt. Ofte på toppen af en høj eller skrænt. Kan også være fra en bygning.');
INSERT INTO fkg.d_5800_facilitet VALUES (2031, 'Fiskesø', 1, 'Put&take sø. Sted hvor man kan købe dagskort til at fiske efter udsatte fisk.');
INSERT INTO fkg.d_5800_facilitet VALUES (2041, 'Rekreativt naturområde', 1, 'Naturområde hvor borgere kan opholde sig og rekreere. Fordybelsessted.');
INSERT INTO fkg.d_5800_facilitet VALUES (2051, 'Park', 1, 'Grønt byområde anlagt med en blanding af buske, træer, blomster og græs.');
INSERT INTO fkg.d_5800_facilitet VALUES (2062, 'Naturcenter', 1, 'Bygningsfacilitet som er udgangspunkt for offentlig naturformidling og aktivteter i et naturområde. Oftest med ansat personale.');
INSERT INTO fkg.d_5800_facilitet VALUES (2072, 'Naturbase', 1, 'Plads i naturområde med mulighed for ophold, lån af grej, bålplads mm.');
INSERT INTO fkg.d_5800_facilitet VALUES (2082, 'Naturskole', 1, 'Bygningsfacilitet med primært formål at facilitere naturaktiviteter og undervisning for skoler og institutioner o.lign.');
INSERT INTO fkg.d_5800_facilitet VALUES (2092, 'Udstilling', 1, 'Offentlig tilgængelig formidling eller introduktion til et områdes natur- eller kulturforhold. Ofte placeret i mindre bygning eller vejrly.');
INSERT INTO fkg.d_5800_facilitet VALUES (2102, 'Naturrum', 1, 'Bygning og støttepunkt for naturformidling efter Friluftsrådets koncept og definition.');
INSERT INTO fkg.d_5800_facilitet VALUES (2111, 'Naturpark', 1, 'Naturpark af regional betydning, jf. mærkningsordning ved Friluftsrådet.');
INSERT INTO fkg.d_5800_facilitet VALUES (2121, 'Nationalpark', 1, 'Nationalpark anerkendt af staten.');
INSERT INTO fkg.d_5800_facilitet VALUES (2132, 'Kælkebakke', 1, 'Område med mulighed for at kælke, når der er snedække.');
INSERT INTO fkg.d_5800_facilitet VALUES (2141, 'Terapihave', 1, 'Specielt indrettede haveanlæg med terapeutisk og stressforebyggende formål.');
INSERT INTO fkg.d_5800_facilitet VALUES (2151, 'Spiselig vegetation', 1, 'Areal med offentligt tilgængelige spiselige planter, frugt, nødder, grønsager mm.');
INSERT INTO fkg.d_5800_facilitet VALUES (2161, 'Oplevelsespunkt', 1, 'Plads i naturområde eller friluftsanlæg med mulighed for ophold, naturoplevelser, evt. lån af grej, bålplads, information mm. Herunder oplevelsespunkt i havne f.eks. kaldet Oplevelseshavn.');
INSERT INTO fkg.d_5800_facilitet VALUES (3012, 'Shelter', 1, 'En lav træbarak, traditionelt åben på den ene langside, gulvet hævet ca. 0,5 m over jorden og stort tagudhæng, således at man er relativt beskyttet mod regn.');
INSERT INTO fkg.d_5800_facilitet VALUES (3022, 'Kano overnatningsplads', 1, 'Kanorasteplads til kanofarer, med mulighed for overnatning.');
INSERT INTO fkg.d_5800_facilitet VALUES (3031, 'Teltplads', 1, 'Sted til at slå telt op for overnatning.');
INSERT INTO fkg.d_5800_facilitet VALUES (3041, 'Campingplads', 1, 'Overnatningssted til campingvogne og telte.');
INSERT INTO fkg.d_5800_facilitet VALUES (3051, 'Hytter og Lejrskoler', 1, 'Udlejningshytter med plads til mange. Typiske med sovesale og storkøkken.');
INSERT INTO fkg.d_5800_facilitet VALUES (3061, 'Feriecenter', 1, 'En samling ferielejligheder, der danner rammen om familiens ophold på feriecenteret, samt en række fælles faciliteter, hvor der tilbydes en bred vifte af aktiviteter.');
INSERT INTO fkg.d_5800_facilitet VALUES (4011, 'Idrætshal', 1, 'Kaldes også for sportshal. Stor hal hvor i der kan dyrkes en eller flere former for fysisk sport.');
INSERT INTO fkg.d_5800_facilitet VALUES (4021, 'Svømmehal', 1, 'Opvarmet svømmebassin inde i en bygning.');
INSERT INTO fkg.d_5800_facilitet VALUES (4031, 'Idrætsanlæg', 1, 'Bane hvor på der kan dyrkes en eller flere former for fysisk sport, f.eks. atletik, fodbold, baseball mm.');
INSERT INTO fkg.d_5800_facilitet VALUES (4041, 'Cykelbane', 1, 'Område til fx MTB  og BMX.');
INSERT INTO fkg.d_5800_facilitet VALUES (4051, 'Agilitybane', 1, 'Agilitybane er en hundesportsbane, hvor hundene skal tage en række forhindringer korrekt og i den rette rækkefølge.');
INSERT INTO fkg.d_5800_facilitet VALUES (4061, 'Modelflyveplads', 1, '”Lufthavn” for modelflyvere.');
INSERT INTO fkg.d_5800_facilitet VALUES (4071, 'Skøjtebane', 1, 'Bane til skøjteløb om vinteren på søer eller kunstige isbaner i byer både indendørs og udendørs.');
INSERT INTO fkg.d_5800_facilitet VALUES (4081, 'Minigolfbane', 1, 'Anlæg til at spille minigolf på, hvor banelængden normalt er under 10 m.');
INSERT INTO fkg.d_5800_facilitet VALUES (4091, 'Golfbane', 1, 'En golfbane er et idrætsanlæg, hvorpå man spiller golf. Den består af et antal huller, oftest 18, men for mindre baners vedkommende 9, mens store baner kan have 27 eller 36 huller.');
INSERT INTO fkg.d_5800_facilitet VALUES (4101, 'Discgolfanlæg', 1, 'Område med udpegede fairways og opstillede ”kurve” til spillet frisbee-golf/discgolf.');
INSERT INTO fkg.d_5800_facilitet VALUES (4111, 'Boldbane', 1, 'Baner indrettet til boldspil.');
INSERT INTO fkg.d_5800_facilitet VALUES (4121, 'Skydebaneanlæg', 1, 'En eller flere baner til skydning, fx kort- og langdistanceskydning.');
INSERT INTO fkg.d_5800_facilitet VALUES (4132, 'Pentanquebane', 1, 'En eller flere baner til petanque.');
INSERT INTO fkg.d_5800_facilitet VALUES (4142, 'Skateranlæg', 1, 'Anlæg, plads eller bane som rummer anlagte udfordringer til skatere, BMXcykler m.fl.');
INSERT INTO fkg.d_5800_facilitet VALUES (4152, 'Parkouranlæg', 1, 'Plads/område med særlige faciliteter til at udøve parkour i.');
INSERT INTO fkg.d_5800_facilitet VALUES (4161, 'Rideanlæg', 1, 'Placering for ridecenter eller –klub.');
INSERT INTO fkg.d_5800_facilitet VALUES (4172, 'Beachvolleybane', 1, 'Udendørs areal afsat til spillet beachvolley.');
INSERT INTO fkg.d_5800_facilitet VALUES (4182, 'Dykkerspot', 1, 'Seværdighed under vand.');
INSERT INTO fkg.d_5800_facilitet VALUES (4191, 'Kitesurf område', 1, 'Område anvist til kitesurfing.');
INSERT INTO fkg.d_5800_facilitet VALUES (4201, 'Windsurfområde', 1, 'Område anvist til windsurfing.');
INSERT INTO fkg.d_5800_facilitet VALUES (4211, 'Kitebuggyområde', 1, 'Område anvist til kørsel med kitebuggy.');
INSERT INTO fkg.d_5800_facilitet VALUES (4222, 'Motionsplads', 1, 'Sted i naturen, hvor der er opstillet div. motionsredskaber til fri afbenyttelse, fx  sundhedsplads, motionsplads, fitnessplads, pulspark.');
INSERT INTO fkg.d_5800_facilitet VALUES (4231, 'Flugtskydningsbane', 1, 'Lerdueskydningsbane.');
INSERT INTO fkg.d_5800_facilitet VALUES (4241, 'Motorsportsbane', 1, 'Bane, hvor der udøves motorsport.');
INSERT INTO fkg.d_5800_facilitet VALUES (4251, 'Ketchersportsanlæg', 1, 'Udendørs og/eller indendørs anlæg eller bane til ketchersport, herunder tennis og squash.');
INSERT INTO fkg.d_5800_facilitet VALUES (4262, 'Rulleskøjtebane', 1, 'Udendørs eller indendørs anlæg indrettet til rulleskøjteløb.');
INSERT INTO fkg.d_5800_facilitet VALUES (4272, 'Klatreanlæg', 1, 'Område med opsatte klatreudfordringer eller forhindringsbane f.eks. i træer, klatrevægge, wireforløb mm.');
INSERT INTO fkg.d_5800_facilitet VALUES (4281, 'Cricketbane', 1, 'Bane til spillet Cricket');
INSERT INTO fkg.d_5800_facilitet VALUES (4291, 'Krolfbane', 1, 'Bane til spillet Krolf');
INSERT INTO fkg.d_5800_facilitet VALUES (4301, 'UV-jagtspot', 1, 'Område der er velegnet til undervands-jagt.');
INSERT INTO fkg.d_5800_facilitet VALUES (5011, 'Forsamlingshus', 1, 'Et forsamlingshus er byens kulturhus og mødested.');
INSERT INTO fkg.d_5800_facilitet VALUES (5021, 'Museum', 1, 'Museum er en permanent institution med udstilling og formidling af f.eks. kunst, kulturhistorie eller naturhistorie.');
INSERT INTO fkg.d_5800_facilitet VALUES (5031, 'Teater', 1, 'Sted, hvor der opføres teater eller andre kulturelle opførelser. Herunder også amfiteater.');
INSERT INTO fkg.d_5800_facilitet VALUES (5041, 'Forlystelsesanlæg', 1, 'En park med flere faste forlystelser, typisk for hele familien.');
INSERT INTO fkg.d_5800_facilitet VALUES (5051, 'Biograf', 1, 'En biograf er et sted, sædvanligvis en bygning, hvor man fremviser film.');
INSERT INTO fkg.d_5800_facilitet VALUES (5061, 'Foreningshus', 1, 'Hus der kan huse en række forskellige foreningers aktiviteter og administration.');
INSERT INTO fkg.d_5800_facilitet VALUES (5072, 'Formidling af fortidsminder', 1, 'Særligt udvalgte fortidsminder til fokus.');
INSERT INTO fkg.d_5800_facilitet VALUES (5082, 'Historiske steder', 1, 'Lokalitet eller område, hvor særlige historiske begivenheder har fundet sted.');
INSERT INTO fkg.d_5800_facilitet VALUES (5092, 'Lokal- eller sogne-arkiv', 1, 'Lokalt arkiv til opbevaring af indsamlet viden om kultur og historie i nærmiljøet – herunder evt også kirkehistorie.');
INSERT INTO fkg.d_5800_facilitet VALUES (5102, 'Kunst', 1, 'Udendørs kunst, som fx skulpturer, gavlmalerier og land-art');
INSERT INTO fkg.d_5800_facilitet VALUES (6011, 'Bådplads', 1, 'Fortøjningssted til både/joller.');
INSERT INTO fkg.d_5800_facilitet VALUES (6021, 'Rostadion', 1, 'Område på sø til konkurrence roning.');
INSERT INTO fkg.d_5800_facilitet VALUES (6031, 'Umotoriseret sejlads tilladt', 1, 'Område, hvor det er tilladt at sejle i kano el. lign. Udpeges f.eks. på vandflade, hvor der ellers er generelt sejlforbud.');
INSERT INTO fkg.d_5800_facilitet VALUES (6042, 'Sejlsports- og roklub', 1, 'Klubhus, hvorfra der udøves sejlsport.');
INSERT INTO fkg.d_5800_facilitet VALUES (6052, 'Kanorasteplads', 1, 'Rasteplads til kanofarer.');
INSERT INTO fkg.d_5800_facilitet VALUES (9981, 'Andet', 1, 'Hvor andre facilitetsbetegnelser ikke er dækkende.');
INSERT INTO fkg.d_5800_facilitet VALUES (9991, 'Ukendt', 1, 'Mangler viden om typen.');

-- Tema 5802_facilitet, diverse ændringer
ALTER TABLE fkg.d_5802_facilitet RENAME TO d_5802_facilitetl;
ALTER TABLE fkg.d_5802_facilitetl RENAME COLUMN facilitet_type_kode TO facilitetl_type_kode;
ALTER TABLE fkg.d_5802_facilitetl RENAME COLUMN facilitet_type TO facilitetl_type;

ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN facilitet_type_kode TO facilitetl_type_kode;

UPDATE fkg.d_5802_facilitetl SET facilitetl_type='Skirute' WHERE facilitetl_type_kode = 1;
UPDATE fkg.d_5802_facilitetl SET facilitetl_type='Løberute' WHERE facilitetl_type_kode = 2;
UPDATE fkg.d_5802_facilitetl SET begrebsdefinition='Skiløberute på afmærkede og uafmærkede ruter i naturen.' WHERE facilitetl_type_kode = 1;
UPDATE fkg.d_5802_facilitetl SET begrebsdefinition='Løberute på afmærkede og uafmærkede ruter langs veje og i naturen.' WHERE facilitetl_type_kode = 2;

INSERT INTO fkg.d_5802_facilitetl VALUES (3,'Cykelrute',1,'Rute for cykler, afmærket på kort og evt. i terræn.');
INSERT INTO fkg.d_5802_facilitetl VALUES (4,'Mountainbikerute',1,'Afmærket eller uafmærket rute for mountainbikes.');
INSERT INTO fkg.d_5802_facilitetl VALUES (5,'Vandrerute',1,'Rute velegnet til vandring.');
INSERT INTO fkg.d_5802_facilitetl VALUES (6,'Motionsrute',1,'Rute udpeget til motionsformål – typisk løb eller gang.');
INSERT INTO fkg.d_5802_facilitetl VALUES (7,'Undervandsrute',1,'Afmærket eller uafmærket rute under vand for snorkeldykkere/dykkere.');
INSERT INTO fkg.d_5802_facilitetl VALUES (8,'Riderute',1,'Afmærket eller uafmærket rute til færdsel til hest.');
INSERT INTO fkg.d_5802_facilitetl VALUES (9,'Sejlrute',1,'Afmærket eller uafmærket rute for kano- og kajak-sejlads.');
INSERT INTO fkg.d_5802_facilitetl VALUES (10,'Gratis fiskeri',1,'Strækning med gratis fiskeri.');
INSERT INTO fkg.d_5802_facilitetl VALUES (11,'Rekreativ sti',1,'Vandresti med fokus på det rekreative.');
INSERT INTO fkg.d_5802_facilitetl VALUES (12,'Adgangsvej',1,'Sti eller spor med fri adgang, der fører hen til facilitet.');

ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN straekningsnr integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN belaegning_kode integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN fremkommelighed_kode integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN handicapegnet_kode integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN startpunkt_x integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN startpunkt_y integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN afmaerket_rute_kode integer;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_belaegning_fk FOREIGN KEY (belaegning_kode)
REFERENCES fkg.d_basis_belaegning (belaegning_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_fremkommelighed_fk FOREIGN KEY (fremkommelighed_kode)
REFERENCES fkg.d_5802_fremkommelighed (fremkommelighed_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_handicapegnet_fk FOREIGN KEY (handicapegnet_kode)
REFERENCES fkg.d_basis_handicapegnet (handicapegnet_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_afmaerket_rute_fk FOREIGN KEY (afmaerket_rute_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Tema t_6800_parl_fl, diverse ændringer
ALTER TABLE fkg.d_6800_vedlhold_f_type RENAME COLUMN vedlhold_f_type_lable TO vedlhold_f_type_label;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_kode = 103010, vedlhold_f_type='Græsflade med lund' WHERE vedlhold_f_type_kode = 103020;
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (103060,'Græsflade - skillerabat',1,'GR3f','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (103070,'Græsflade - helle',1,'GR3g','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (106060,'Rabatgræs - skillerabat',1,'GR6f','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (108010,'Strand og klit',1,'GR8g','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (108020,'Eng',1,'GR8h','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (108030,'Overdrev',1,'GR8i','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (183010,'Pur - helle',1,'HA3g','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (226010,'Trægruppe - flade',1,'SK6a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (401011,'Fast belægning - Raste-/P-plads',1,'FB1k','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (401051,'Fast belægning - Helle m. brolægning',1,'FB1j','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (401052,'Fast belægning - Helle m. asfalt',1,'FB1l','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (412070,'Løs belægning - Helle',1,'LB2g','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (412080,'Løs belægning - Raste-/P-plads',1,'LB2h','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (412090,'Løs belægning, Stenmel',1,'LB2h','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (424070,'Sportsbelægning - Sand',1,'SB4g','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (431010,'Ophalerplads',1,'BY1a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (446010,'Legeudstyr - flade',1,'UD6a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961010,'Renhold (uden anden pleje)',1,'RE1a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961011,'Renhold Bef. areal',1,'RE1b','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961012,'Renhold Ubef. areal',1,'RE1c','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961013,'Renhold Udstyr',1,'RE1d','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961014,'Rengøring Toilet',1,'RE55a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6800_vedlhold_f_type VALUES (961020,'Ukrudts-bekæmpelse',1,'RE3a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'AN1' WHERE vedlhold_f_type_kode = 980000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL1' WHERE vedlhold_f_type_kode = 121000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL2' WHERE vedlhold_f_type_kode = 122000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL3' WHERE vedlhold_f_type_kode = 123000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL4' WHERE vedlhold_f_type_kode = 124000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL4a' WHERE vedlhold_f_type_kode = 124010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL5' WHERE vedlhold_f_type_kode = 125000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL5a' WHERE vedlhold_f_type_kode = 125010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL5b' WHERE vedlhold_f_type_kode = 125020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL5c' WHERE vedlhold_f_type_kode = 125030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL5d' WHERE vedlhold_f_type_kode = 125040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL6' WHERE vedlhold_f_type_kode = 126000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL6a' WHERE vedlhold_f_type_kode = 126010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL6b' WHERE vedlhold_f_type_kode = 126020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL7' WHERE vedlhold_f_type_kode = 127010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BL8' WHERE vedlhold_f_type_kode = 127020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BU1' WHERE vedlhold_f_type_kode = 161000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BU1a' WHERE vedlhold_f_type_kode = 161010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BU1b' WHERE vedlhold_f_type_kode = 161020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BU2' WHERE vedlhold_f_type_kode = 162000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BU3' WHERE vedlhold_f_type_kode = 163000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BY1' WHERE vedlhold_f_type_kode = 431000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BY1a' WHERE vedlhold_f_type_kode = 431010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BY2' WHERE vedlhold_f_type_kode = 432000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BY3' WHERE vedlhold_f_type_kode = 433000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'BY4a' WHERE vedlhold_f_type_kode = 434010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB01f' WHERE vedlhold_f_type_kode = 401060;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1' WHERE vedlhold_f_type_kode = 401000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1a' WHERE vedlhold_f_type_kode = 401010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1b' WHERE vedlhold_f_type_kode = 401020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1c' WHERE vedlhold_f_type_kode = 401030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1d' WHERE vedlhold_f_type_kode = 401040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1e' WHERE vedlhold_f_type_kode = 401050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1g' WHERE vedlhold_f_type_kode = 401070;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1h' WHERE vedlhold_f_type_kode = 401080;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1j' WHERE vedlhold_f_type_kode = 401051;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1k' WHERE vedlhold_f_type_kode = 401011;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB1l' WHERE vedlhold_f_type_kode = 401052;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'FB2a' WHERE vedlhold_f_type_kode = 402010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR1' WHERE vedlhold_f_type_kode = 101000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR2' WHERE vedlhold_f_type_kode = 102000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR2a' WHERE vedlhold_f_type_kode = 102010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR2b' WHERE vedlhold_f_type_kode = 102020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR2d' WHERE vedlhold_f_type_kode = 102040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3' WHERE vedlhold_f_type_kode = 103000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3a' WHERE vedlhold_f_type_kode = 103010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3b' WHERE vedlhold_f_type_kode = 103020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3d' WHERE vedlhold_f_type_kode = 103040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3f' WHERE vedlhold_f_type_kode = 103060;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR3g' WHERE vedlhold_f_type_kode = 103070;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR4' WHERE vedlhold_f_type_kode = 104000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR4a' WHERE vedlhold_f_type_kode = 104010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR4b' WHERE vedlhold_f_type_kode = 104020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR4d' WHERE vedlhold_f_type_kode = 104040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR5' WHERE vedlhold_f_type_kode = 105000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR5a' WHERE vedlhold_f_type_kode = 105010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR5b' WHERE vedlhold_f_type_kode = 105020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR5c' WHERE vedlhold_f_type_kode = 105030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR5e' WHERE vedlhold_f_type_kode = 105050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6' WHERE vedlhold_f_type_kode = 106000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6a' WHERE vedlhold_f_type_kode = 106010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6b' WHERE vedlhold_f_type_kode = 106020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6c' WHERE vedlhold_f_type_kode = 106030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6d' WHERE vedlhold_f_type_kode = 106040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6e' WHERE vedlhold_f_type_kode = 106050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR6f' WHERE vedlhold_f_type_kode = 106060;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR7' WHERE vedlhold_f_type_kode = 107000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR7a' WHERE vedlhold_f_type_kode = 107010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR7b' WHERE vedlhold_f_type_kode = 107020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR7d' WHERE vedlhold_f_type_kode = 107040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR8g' WHERE vedlhold_f_type_kode = 108010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR8h' WHERE vedlhold_f_type_kode = 108020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GR8i' WHERE vedlhold_f_type_kode = 108030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS1' WHERE vedlhold_f_type_kode = 261000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS1a' WHERE vedlhold_f_type_kode = 261010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS1b' WHERE vedlhold_f_type_kode = 261020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS1c' WHERE vedlhold_f_type_kode = 261030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS2' WHERE vedlhold_f_type_kode = 262000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS2a' WHERE vedlhold_f_type_kode = 262010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS2b' WHERE vedlhold_f_type_kode = 262020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS2c' WHERE vedlhold_f_type_kode = 262030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS3' WHERE vedlhold_f_type_kode = 263000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS3a' WHERE vedlhold_f_type_kode = 263010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS3b' WHERE vedlhold_f_type_kode = 263020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS3c' WHERE vedlhold_f_type_kode = 263030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'GS3d' WHERE vedlhold_f_type_kode = 263040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'HA1' WHERE vedlhold_f_type_kode = 181000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'HA2' WHERE vedlhold_f_type_kode = 182000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'HA3' WHERE vedlhold_f_type_kode = 183000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'HA3g' WHERE vedlhold_f_type_kode = 183010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'HA4' WHERE vedlhold_f_type_kode = 184000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2' WHERE vedlhold_f_type_kode = 412000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2a' WHERE vedlhold_f_type_kode = 412010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2b' WHERE vedlhold_f_type_kode = 412020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2c' WHERE vedlhold_f_type_kode = 412030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2d' WHERE vedlhold_f_type_kode = 412040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2e' WHERE vedlhold_f_type_kode = 412050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2g' WHERE vedlhold_f_type_kode = 412070;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2h' WHERE vedlhold_f_type_kode = 412080;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB2h' WHERE vedlhold_f_type_kode = 412090;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB3' WHERE vedlhold_f_type_kode = 413000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB3a' WHERE vedlhold_f_type_kode = 413010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB3b' WHERE vedlhold_f_type_kode = 413020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB3c' WHERE vedlhold_f_type_kode = 413030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB3d' WHERE vedlhold_f_type_kode = 413040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB4' WHERE vedlhold_f_type_kode = 414000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB4a' WHERE vedlhold_f_type_kode = 414010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'LB4d' WHERE vedlhold_f_type_kode = 414040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE1a' WHERE vedlhold_f_type_kode = 961010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE1b' WHERE vedlhold_f_type_kode = 961011;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE1c' WHERE vedlhold_f_type_kode = 961012;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE1d' WHERE vedlhold_f_type_kode = 961013;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE3a' WHERE vedlhold_f_type_kode = 961020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'RE55a' WHERE vedlhold_f_type_kode = 961014;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4' WHERE vedlhold_f_type_kode = 424000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4a' WHERE vedlhold_f_type_kode = 424010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4b' WHERE vedlhold_f_type_kode = 424020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4c' WHERE vedlhold_f_type_kode = 424030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4d' WHERE vedlhold_f_type_kode = 424040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4e' WHERE vedlhold_f_type_kode = 424050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4f' WHERE vedlhold_f_type_kode = 424060;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SB4g' WHERE vedlhold_f_type_kode = 424070;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SK2' WHERE vedlhold_f_type_kode = 222000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SK3' WHERE vedlhold_f_type_kode = 223000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SK4' WHERE vedlhold_f_type_kode = 224000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SK5' WHERE vedlhold_f_type_kode = 225000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'SK6a' WHERE vedlhold_f_type_kode = 226010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'UD6a' WHERE vedlhold_f_type_kode = 446010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'UK1' WHERE vedlhold_f_type_kode = 990000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA1' WHERE vedlhold_f_type_kode = 301000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2' WHERE vedlhold_f_type_kode = 302000;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2a' WHERE vedlhold_f_type_kode = 302010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2b' WHERE vedlhold_f_type_kode = 302020;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2c' WHERE vedlhold_f_type_kode = 302030;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2d' WHERE vedlhold_f_type_kode = 302040;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA2e' WHERE vedlhold_f_type_kode = 302050;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA3a' WHERE vedlhold_f_type_kode = 303010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA4a' WHERE vedlhold_f_type_kode = 304010;
UPDATE fkg.d_6800_vedlhold_f_type SET vedlhold_f_type_label = 'VA5a' WHERE vedlhold_f_type_kode = 305010;

-- Tema t_6801_parl_li, diverse ændringer
ALTER TABLE fkg.d_6801_vedlhold_l_type RENAME COLUMN vedlhold_l_type_lable TO vedlhold_l_type_label;
ALTER TABLE fkg.t_6801_parl_li_t RENAME COLUMN udfoerer_enterp TO udfoerer_entrep;
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (106110,'Rabatgræs - linje',1,'GR61a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (106120,'Rabatgræs- skillerabat - linje',1,'GR61b','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (126110,'Løgvækster - linje',1,'BL61b','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (303010,'Vejgrøft',1,'VA3a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (444021,'Sponsorskilt/banner',1,'UD4e','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6801_vedlhold_l_type VALUES (447110,'Autoværn',1,'UD71a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'GR61a' WHERE vedlhold_l_type_kode = 106110;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'GR61b' WHERE vedlhold_l_type_kode = 106120;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'BL61b' WHERE vedlhold_l_type_kode = 126110;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'KL1' WHERE vedlhold_l_type_kode = 141000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'HA11' WHERE vedlhold_l_type_kode = 181100;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'HA21' WHERE vedlhold_l_type_kode = 182100;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'HA2a' WHERE vedlhold_l_type_kode = 182110;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'HA4' WHERE vedlhold_l_type_kode = 184100;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'VA3' WHERE vedlhold_l_type_kode = 303000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'VA3a' WHERE vedlhold_l_type_kode = 303010;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'VA3b' WHERE vedlhold_l_type_kode = 303020;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'FB3a' WHERE vedlhold_l_type_kode = 403010;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'BY5' WHERE vedlhold_l_type_kode = 435000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'BY6' WHERE vedlhold_l_type_kode = 436000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'BY7' WHERE vedlhold_l_type_kode = 437000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'BY8' WHERE vedlhold_l_type_kode = 438000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD9' WHERE vedlhold_l_type_kode = 443000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD4e' WHERE vedlhold_l_type_kode = 444021;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD8' WHERE vedlhold_l_type_kode = 447000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD81' WHERE vedlhold_l_type_kode = 447100;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD71a' WHERE vedlhold_l_type_kode = 447110;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD82' WHERE vedlhold_l_type_kode = 447200;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD83a' WHERE vedlhold_l_type_kode = 447310;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD83b' WHERE vedlhold_l_type_kode = 447320;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD84a' WHERE vedlhold_l_type_kode = 447410;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD84b' WHERE vedlhold_l_type_kode = 447420;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UD84c' WHERE vedlhold_l_type_kode = 447430;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'FO1a' WHERE vedlhold_l_type_kode = 801010;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'AN2' WHERE vedlhold_l_type_kode = 980000;
update fkg.d_6801_vedlhold_l_type set vedlhold_l_type_label = 'UK2' WHERE vedlhold_l_type_kode = 990000;

-- Tema t_6802_parl_pkt, diverse ændringer
ALTER TABLE fkg.d_6802_groenvedligh_punkt RENAME COLUMN vedlhold_p_type_lable TO vedlhold_p_type_label;
INSERT INTO fkg.d_6802_groenvedligh_punkt VALUES (201010,'Vejtræ - åbenland',1,'TR1a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6802_groenvedligh_punkt VALUES (432110,'Overkørsel',1,'BY21a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6802_groenvedligh_punkt VALUES (439040,'Km-sten',1,'BY9d','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6802_groenvedligh_punkt VALUES (445020,'Førstehjælp',1,'UD5a','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
INSERT INTO fkg.d_6802_groenvedligh_punkt VALUES (445030,'Nødtelefon',1,'UD5b','Lokal standard – skal beskrives i udbudsmaterialet eller lignende');
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BL9' where vedlhold_p_type_kode = 128000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'KL2' where vedlhold_p_type_kode = 142000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'KL2a' where vedlhold_p_type_kode = 142010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BU3' where vedlhold_p_type_kode = 161200;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'TR1' where vedlhold_p_type_kode = 201000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'TR1a' where vedlhold_p_type_kode = 201010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'TR2' where vedlhold_p_type_kode = 202000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'TR3' where vedlhold_p_type_kode = 203000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'TR4' where vedlhold_p_type_kode = 204000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY21a' where vedlhold_p_type_kode = 432110;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9' where vedlhold_p_type_kode = 439000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9a' where vedlhold_p_type_kode = 439010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9b' where vedlhold_p_type_kode = 439020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9c' where vedlhold_p_type_kode = 439030;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9d' where vedlhold_p_type_kode = 439040;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'BY9e' where vedlhold_p_type_kode = 439050;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD1' where vedlhold_p_type_kode = 441000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD11' where vedlhold_p_type_kode = 441100;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD18' where vedlhold_p_type_kode = 441800;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD18a' where vedlhold_p_type_kode = 441810;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD18b' where vedlhold_p_type_kode = 441820;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD18c' where vedlhold_p_type_kode = 441830;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD2' where vedlhold_p_type_kode = 442000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD2a' where vedlhold_p_type_kode = 442010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD2b' where vedlhold_p_type_kode = 442020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD3' where vedlhold_p_type_kode = 443100;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD3a' where vedlhold_p_type_kode = 443010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD35' where vedlhold_p_type_kode = 443500;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD4' where vedlhold_p_type_kode = 444000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD4a' where vedlhold_p_type_kode = 444010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD4b' where vedlhold_p_type_kode = 444020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD4c' where vedlhold_p_type_kode = 444030;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD45' where vedlhold_p_type_kode = 444500;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD5' where vedlhold_p_type_kode = 445000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD5a' where vedlhold_p_type_kode = 445020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD5b' where vedlhold_p_type_kode = 445030;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD51' where vedlhold_p_type_kode = 445100;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD55' where vedlhold_p_type_kode = 445500;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD55a' where vedlhold_p_type_kode = 445510;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD6' where vedlhold_p_type_kode = 446000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD7a' where vedlhold_p_type_kode = 447010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD7b' where vedlhold_p_type_kode = 447020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD8a' where vedlhold_p_type_kode = 448010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UD8b' where vedlhold_p_type_kode = 448020;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'FO2a' where vedlhold_p_type_kode = 802010;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'AN3' where vedlhold_p_type_kode = 980000;
update fkg.d_6802_groenvedligh_punkt set vedlhold_p_type_label = 'UK3' where vedlhold_p_type_kode = 990000;
