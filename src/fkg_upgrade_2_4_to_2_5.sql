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
