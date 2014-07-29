-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.7.1
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: Septima - see license in LICENSE.txt

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: data | type: DATABASE --
-- -- DROP DATABASE data;
-- CREATE DATABASE data
-- 	ENCODING = 'UTF8'
-- ;
-- -- ddl-end --
-- 

-- object: fkg | type: SCHEMA --
-- DROP SCHEMA fkg;
CREATE SCHEMA fkg;
-- ddl-end --

SET search_path TO pg_catalog,public,fkg;
-- ddl-end --

-- object: fkg.d_basis_oprindelse | type: TABLE --
-- DROP TABLE fkg.d_basis_oprindelse;
CREATE TABLE fkg.d_basis_oprindelse(
	oprindkode integer NOT NULL,
	oprindelse character varying(35) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	bemaerkning character varying,
	CONSTRAINT d_basis_oprindelse_pk PRIMARY KEY (oprindkode)

);
-- ddl-end --
-- object: fkg.d_basis_status | type: TABLE --
-- DROP TABLE fkg.d_basis_status;
CREATE TABLE fkg.d_basis_status(
	statuskode integer NOT NULL,
	status character varying(30) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_status_pk PRIMARY KEY (statuskode)

);
-- ddl-end --
-- object: fkg.d_basis_ansvarlig_myndighed | type: TABLE --
-- DROP TABLE fkg.d_basis_ansvarlig_myndighed;
CREATE TABLE fkg.d_basis_ansvarlig_myndighed(
	cvr_kode integer NOT NULL,
	cvr_navn character varying(128) NOT NULL,
	kommunekode integer,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_ansvarlig_myndighed_pk PRIMARY KEY (cvr_kode)

);
-- ddl-end --
-- object: fkg.generel | type: TABLE --
-- DROP TABLE fkg.generel;
CREATE TABLE fkg.generel(
	versions_id uuid NOT NULL,
	objekt_id uuid NOT NULL,
	systid_fra timestamptz NOT NULL,
	systid_til timestamptz,
	oprettet timestamptz NOT NULL,
	cvr_kode integer NOT NULL,
	bruger_id character varying(128) NOT NULL,
	oprindkode integer NOT NULL,
	statuskode integer NOT NULL,
	CONSTRAINT generel_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
COMMENT ON COLUMN fkg.generel.versions_id IS 'Unik versions-id databasenøgle';
COMMENT ON COLUMN fkg.generel.objekt_id IS 'Entydig databasenøgle over tid';
COMMENT ON COLUMN fkg.generel.systid_fra IS 'Start systemtid';
COMMENT ON COLUMN fkg.generel.systid_til IS 'Slut systemtid';
-- ddl-end --

-- object: fkg.d_basis_ja_nej | type: TABLE --
-- DROP TABLE fkg.d_basis_ja_nej;
CREATE TABLE fkg.d_basis_ja_nej(
	ja_nej_kode integer NOT NULL,
	ja_nej character varying(7) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ja_nej_pk PRIMARY KEY (ja_nej_kode)

);
-- ddl-end --
-- object: fkg.d_basis_ejerstatus | type: TABLE --
-- DROP TABLE fkg.d_basis_ejerstatus;
CREATE TABLE fkg.d_basis_ejerstatus(
	ejerstatus_kode integer NOT NULL,
	ejerstatus character varying(34) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ejerstatus_pk PRIMARY KEY (ejerstatus_kode)

);
-- ddl-end --
-- object: fkg.d_vejnavn | type: TABLE --
-- DROP TABLE fkg.d_vejnavn;
CREATE TABLE fkg.d_vejnavn(
	vejkode integer NOT NULL,
	vejnavn character varying(40) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	cvf_vejkode character varying(7),
	postnr integer,
	kommunekode integer,
	CONSTRAINT d_vejnavn_pk PRIMARY KEY (vejkode)

);
-- ddl-end --
-- object: fkg.d_basis_sag_status | type: TABLE --
-- DROP TABLE fkg.d_basis_sag_status;
CREATE TABLE fkg.d_basis_sag_status(
	sag_status_kode integer NOT NULL,
	sag_status character varying(18) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_sag_status_pk PRIMARY KEY (sag_status_kode)

);
-- ddl-end --
-- object: fkg.d_basis_dvfi_bedoemmelse | type: TABLE --
-- DROP TABLE fkg.d_basis_dvfi_bedoemmelse;
CREATE TABLE fkg.d_basis_dvfi_bedoemmelse(
	dvfi_bedoemmelse_kode integer NOT NULL,
	dvfi_bedoemmelse character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_dvfi_bedoemmelse_pk PRIMARY KEY (dvfi_bedoemmelse_kode)

);
-- ddl-end --
-- object: fkg.d_basis_trussel_vand | type: TABLE --
-- DROP TABLE fkg.d_basis_trussel_vand;
CREATE TABLE fkg.d_basis_trussel_vand(
	trussel_vand_kode integer NOT NULL,
	trussel_vand character varying(30) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_trussel_vand_pk PRIMARY KEY (trussel_vand_kode)

);
-- ddl-end --
-- object: fkg.d_basis_planstatus | type: TABLE --
-- DROP TABLE fkg.d_basis_planstatus;
CREATE TABLE fkg.d_basis_planstatus(
	planstatus_kode integer NOT NULL,
	planstatus character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_planstatus_pk PRIMARY KEY (planstatus_kode)

);
-- ddl-end --
-- object: fkg.d_basis_afstemningsomraade | type: TABLE --
-- DROP TABLE fkg.d_basis_afstemningsomraade;
CREATE TABLE fkg.d_basis_afstemningsomraade(
	afstemningsomraade_nr character varying(128) NOT NULL,
	afstemningsomraade_navn character varying(128) NOT NULL,
	cvr character varying,
	CONSTRAINT d_basis_afstemningsomraade_pk PRIMARY KEY (afstemningsomraade_nr)

);
-- ddl-end --
-- object: fkg.d_basis_kloak | type: TABLE --
-- DROP TABLE fkg.d_basis_kloak;
CREATE TABLE fkg.d_basis_kloak(
	kloak_kode integer NOT NULL,
	kloak character varying(45) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_kloak_pk PRIMARY KEY (kloak_kode)

);
-- ddl-end --
-- object: fkg.d_basis_postnr | type: TABLE --
-- DROP TABLE fkg.d_basis_postnr;
CREATE TABLE fkg.d_basis_postnr(
	postnr integer NOT NULL,
	postnr_by character varying(128) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_postnr_pk PRIMARY KEY (postnr)

);
-- ddl-end --
-- object: fkg.d_basis_funktionsstatus | type: TABLE --
-- DROP TABLE fkg.d_basis_funktionsstatus;
CREATE TABLE fkg.d_basis_funktionsstatus(
	funktionsstatus_kode integer NOT NULL,
	funktionsstatus character varying(128) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_funktionsstatus_pk PRIMARY KEY (funktionsstatus_kode)

);
-- ddl-end --
-- object: fkg.d_basis_magasin | type: TABLE --
-- DROP TABLE fkg.d_basis_magasin;
CREATE TABLE fkg.d_basis_magasin(
	magasin_kode integer NOT NULL,
	magasin character varying(50) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_magasin_pk PRIMARY KEY (magasin_kode)

);
-- ddl-end --
-- object: fkg.d_basis_fors_omr_type | type: TABLE --
-- DROP TABLE fkg.d_basis_fors_omr_type;
CREATE TABLE fkg.d_basis_fors_omr_type(
	fors_omr_type_kode integer NOT NULL,
	fors_omr_type character varying(50) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_fors_omr_type_pk PRIMARY KEY (fors_omr_type_kode)

);
-- ddl-end --
-- object: fkg.d_basis_omraade | type: TABLE --
-- DROP TABLE fkg.d_basis_omraade;
CREATE TABLE fkg.d_basis_omraade(
	omraade_nr integer NOT NULL,
	omraade character varying(128) NOT NULL,
	cvr_kode character varying,
	CONSTRAINT d_basis_omraade_pk PRIMARY KEY (omraade_nr)

);
-- ddl-end --
-- object: fkg.d_5000_vandl_type | type: TABLE --
-- DROP TABLE fkg.d_5000_vandl_type;
CREATE TABLE fkg.d_5000_vandl_type(
	vandl_type_kode integer NOT NULL,
	vandl_type character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_vandl_type_pk PRIMARY KEY (vandl_type_kode)

);
-- ddl-end --
-- object: fkg.d_5000_maalsaetning | type: TABLE --
-- DROP TABLE fkg.d_5000_maalsaetning;
CREATE TABLE fkg.d_5000_maalsaetning(
	maalsaetning_kode integer NOT NULL,
	maalsaetning character varying(60) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_maalsaetning_pk PRIMARY KEY (maalsaetning_kode)

);
-- ddl-end --
-- object: fkg.d_5000_klasse | type: TABLE --
-- DROP TABLE fkg.d_5000_klasse;
CREATE TABLE fkg.d_5000_klasse(
	klasse_kode integer,
	klasse character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_klasse_pk PRIMARY KEY (klasse_kode)

);
-- ddl-end --
-- object: fkg.t_5000_vandl | type: TABLE --
-- DROP TABLE fkg.t_5000_vandl;
CREATE TABLE fkg.t_5000_vandl(
	versions_id uuid NOT NULL,
	navn character varying(128) NOT NULL,
	dmu_ref character varying(128),
	vandloeb_nr character varying(128),
	maalsaetning_kode integer,
	vandl_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	klasse_kode integer,
	tidl_amt_kode integer,
	vedligehold character varying(100),
	ansvar_vedligehold character varying(254),
	p3vandloeb_kode integer,
	sejlads character varying(100),
	dvfi_bedoemmelse_kode integer,
	station_fra double precision,
	station_til double precision,
	vandloebs_bredde double precision,
	vandfoeringsforhold integer,
	maalsaetning_opfyldt_kode integer,
	fot_id integer,
	trussel_vand_kode integer,
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_5000_vandl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5000_vandl_station_fra_ck CHECK (station_fra >= 0.0 AND station_fra <= 200000.0),
	CONSTRAINT t_5000_vandl_station_til_ck CHECK (station_til >= 0.0 AND station_til <= 200000.0),
	CONSTRAINT t_5000_vandl_vandloebs_bredde_ck CHECK (vandloebs_bredde >= 0.1 AND vandloebs_bredde <=99.9),
	CONSTRAINT t_5000_vandl_vandfoeringsforhold_ck CHECK (vandfoeringsforhold >= 9 AND vandfoeringsforhold <= 45),
	CONSTRAINT t_5000_vandl_fot_id_ck CHECK (fot_id >=0 AND fot_id <= 2147483648)

);
-- ddl-end --
-- object: fkg.temagruppe | type: TABLE --
-- DROP TABLE fkg.temagruppe;
CREATE TABLE fkg.temagruppe(
	temagruppe_id character varying NOT NULL,
	vaerdiomraade_min integer NOT NULL,
	vaerdiomraade_max integer NOT NULL,
	tema_gruppe character varying NOT NULL,
	CONSTRAINT temagruppe_pk PRIMARY KEY (temagruppe_id),
	CONSTRAINT temagruppe_vaerdiomraade_min_uc UNIQUE (vaerdiomraade_min)

);
-- ddl-end --
-- object: fkg.tema | type: TABLE --
-- DROP TABLE fkg.tema;
CREATE TABLE fkg.tema(
	tema_kode integer NOT NULL,
	tema_navn character varying NOT NULL,
	geo character NOT NULL,
	udvekslingsnavn character varying NOT NULL,
	temagruppe_id character varying NOT NULL,
	CONSTRAINT tema_pk PRIMARY KEY (tema_kode),
	CONSTRAINT geo_ck CHECK (geo IN ('P', 'L', 'F')),
	CONSTRAINT tema_udvekslingsnavn_uc UNIQUE (udvekslingsnavn),
	CONSTRAINT tema_temanavn_uc UNIQUE (tema_navn)

);
-- ddl-end --
-- object: fkg.d_basis_tilstand | type: TABLE --
-- DROP TABLE fkg.d_basis_tilstand;
CREATE TABLE fkg.d_basis_tilstand(
	tilstand_kode integer NOT NULL,
	tilstand character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_tilstand_pk PRIMARY KEY (tilstand_kode)

);
-- ddl-end --
-- object: fkg.d_basis_hastighed | type: TABLE --
-- DROP TABLE fkg.d_basis_hastighed;
CREATE TABLE fkg.d_basis_hastighed(
	hastighed_kode integer NOT NULL,
	hastighed character varying(6) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_hastighed_pk PRIMARY KEY (hastighed_kode)

);
-- ddl-end --
-- object: fkg.d_basis_driftniv | type: TABLE --
-- DROP TABLE fkg.d_basis_driftniv;
CREATE TABLE fkg.d_basis_driftniv(
	driftniv_kode integer NOT NULL,
	driftniv character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_driftniv_pk PRIMARY KEY (driftniv_kode)

);
-- ddl-end --
-- object: fkg.d_basis_ukrudtsbek | type: TABLE --
-- DROP TABLE fkg.d_basis_ukrudtsbek;
CREATE TABLE fkg.d_basis_ukrudtsbek(
	ukrudtsbek_kode integer NOT NULL,
	ukrudtsbek character varying(20) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ukrudtsbek_pk PRIMARY KEY (ukrudtsbek_kode)

);
-- ddl-end --
-- object: fkg.d_basis_antal | type: TABLE --
-- DROP TABLE fkg.d_basis_antal;
CREATE TABLE fkg.d_basis_antal(
	antal_kode integer NOT NULL,
	antal character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_antal_pk PRIMARY KEY (antal_kode)

);
-- ddl-end --
-- object: fkg.d_6100_brandhane | type: TABLE --
-- DROP TABLE fkg.d_6100_brandhane;
CREATE TABLE fkg.d_6100_brandhane(
	brandhane_type_kode integer NOT NULL,
	brandhane_type character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6100_brandhane_pk PRIMARY KEY (brandhane_type_kode)

);
-- ddl-end --
-- object: fkg.d_6100_placering | type: TABLE --
-- DROP TABLE fkg.d_6100_placering;
CREATE TABLE fkg.d_6100_placering(
	placering_kode integer NOT NULL,
	placering character varying(12) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6100_placering_pk PRIMARY KEY (placering_kode)

);
-- ddl-end --
-- object: fkg.t_6100_brandhane | type: TABLE --
-- DROP TABLE fkg.t_6100_brandhane;
CREATE TABLE fkg.t_6100_brandhane(
	versions_id uuid NOT NULL,
	brandhane_id integer,
	brandhane_type_kode integer NOT NULL,
	ydelse integer,
	placering_kode integer NOT NULL,
	lokalitet character varying(128),
	vejkode integer,
	cvf_vejkode character varying(7),
	husnr character varying(4),
	postnr integer,
	funktionsstatus_kode integer,
	senest_tilsyn date,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6100_brandhane_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_6102_redvej_type | type: TABLE --
-- DROP TABLE fkg.d_6102_redvej_type;
CREATE TABLE fkg.d_6102_redvej_type(
	redvej_type_kode integer NOT NULL,
	redvej_type character varying(15) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6102_redvej_type_pk PRIMARY KEY (redvej_type_kode)

);
-- ddl-end --
-- object: fkg.t_6102_redn_vej | type: TABLE --
-- DROP TABLE fkg.t_6102_redn_vej;
CREATE TABLE fkg.t_6102_redn_vej(
	versions_id uuid NOT NULL,
	redvej_type_kode integer NOT NULL,
	redn_underomr character varying(20),
	noter character varying(254),
	bygn_kompleks character varying(128),
	byg_sag_nr character varying(50) NOT NULL,
	vejkode integer,
	cvf_vejkode character varying(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6102_redningsvej_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5001_maalest_type | type: TABLE --
-- DROP TABLE fkg.d_5001_maalest_type;
CREATE TABLE fkg.d_5001_maalest_type(
	maalest_type_kode integer NOT NULL,
	maalest_type varchar(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition varchar,
	CONSTRAINT d_5001_maalest_type_pk PRIMARY KEY (maalest_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5001_maalest | type: TABLE --
-- DROP TABLE fkg.t_5001_maalest;
CREATE TABLE fkg.t_5001_maalest(
	versions_id uuid NOT NULL,
	stationsnr character varying(20) NOT NULL,
	lokalitet character varying(128),
	maalest_type_kode integer,
	ejerstatus_kode integer,
	dvfi_bedoemmelse_kode integer,
	dmu_nr character varying(20),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5001_maalest_pk PRIMARY KEY (versions_id)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5002_spaerring | type: TABLE --
-- DROP TABLE fkg.d_5002_spaerring;
CREATE TABLE fkg.d_5002_spaerring(
	spaerring_type_kode integer NOT NULL,
	spaerring_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5002_spaerring_pk PRIMARY KEY (spaerring_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5002_passage | type: TABLE --
-- DROP TABLE fkg.d_5002_passage;
CREATE TABLE fkg.d_5002_passage(
	passage_kode integer NOT NULL,
	passage character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5002_passage_pk PRIMARY KEY (passage_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5002_faunasp | type: TABLE --
-- DROP TABLE fkg.t_5002_faunasp;
CREATE TABLE fkg.t_5002_faunasp(
	versions_id uuid NOT NULL,
	spaerring_nr character varying(20),
	spaerring_type_kode integer NOT NULL,
	passage_kode integer NOT NULL,
	lokalitet character varying(128),
	vandloebsystem character varying(128),
	saneret_aar integer,
	prioritet integer,
	passage_ansvarlig character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5002_faunasp_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5002_faunasp_saneret_aar_ck CHECK (saneret_aar >= 1800 AND saneret_aar <= 2999),
	CONSTRAINT t_5002_faunasp_prioritet_ck CHECK (prioritet >= 1 AND prioritet <= 9)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5003_ledn_type | type: TABLE --
-- DROP TABLE fkg.d_5003_ledn_type;
CREATE TABLE fkg.d_5003_ledn_type(
	ledn_type_kode integer NOT NULL,
	ledn_type character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5003_ledn_type_pk PRIMARY KEY (ledn_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5003_klasse | type: TABLE --
-- DROP TABLE fkg.d_5003_klasse;
CREATE TABLE fkg.d_5003_klasse(
	klasse_kode integer NOT NULL,
	klasse character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5003_klasse_pk PRIMARY KEY (klasse_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5003_draenledn | type: TABLE --
-- DROP TABLE fkg.t_5003_draenledn;
CREATE TABLE fkg.t_5003_draenledn(
	versions_id uuid NOT NULL,
	ledn_nr character varying(20),
	ledn_type_kode integer,
	klasse_kode integer NOT NULL,
	noegle character varying(128),
	anlaeg_aar integer,
	dybde double precision,
	dimension integer,
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832),
	CONSTRAINT t_5003_draenledn_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5003_draenledn_anlaeg_aar_ck CHECK (anlaeg_aar >= 1800 AND anlaeg_aar <= 2999),
	CONSTRAINT t_5003_draenledn_dybde_ck CHECK (dybde >= 0.1 AND dybde <= 99.9),
	CONSTRAINT t_5003_draenledn_dimension_ck CHECK (dimension >= 1 AND dimension <= 99)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5004_omr_type | type: TABLE --
-- DROP TABLE fkg.d_5004_omr_type;
CREATE TABLE fkg.d_5004_omr_type(
	omr_type_kode integer NOT NULL,
	omr_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5004_omr_type_pk PRIMARY KEY (omr_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5004_draenomr | type: TABLE --
-- DROP TABLE fkg.t_5004_draenomr;
CREATE TABLE fkg.t_5004_draenomr(
	versions_id uuid NOT NULL,
	omr_navn character varying(128),
	omr_type_kode integer NOT NULL,
	anlaeg_aar integer,
	projnr character varying(128),
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5004_draenomr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5004_draenomr_anlaeg_aar_ck CHECK (anlaeg_aar >= 1700 AND anlaeg_aar <= 2999)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5005_maalsaetning | type: TABLE --
-- DROP TABLE fkg.d_5005_maalsaetning;
CREATE TABLE fkg.d_5005_maalsaetning(
	maalsaetning_kode integer NOT NULL,
	maalsaetning character varying(60) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_maalsaetning_pk PRIMARY KEY (maalsaetning_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5005_soe_type | type: TABLE --
-- DROP TABLE fkg.d_5005_soe_type;
CREATE TABLE fkg.d_5005_soe_type(
	soe_type_kode integer NOT NULL,
	soe_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_soe_type_pk PRIMARY KEY (soe_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5005_habitat_type | type: TABLE --
-- DROP TABLE fkg.d_5005_habitat_type;
CREATE TABLE fkg.d_5005_habitat_type(
	habitat_type_kode integer NOT NULL,
	habitat_type character varying(100) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_habitat_type_pk PRIMARY KEY (habitat_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5005_soe | type: TABLE --
-- DROP TABLE fkg.t_5005_soe;
CREATE TABLE fkg.t_5005_soe(
	versions_id uuid NOT NULL,
	soe_navn character varying(50) NOT NULL,
	dmu_ref character varying(50),
	soe_nr character varying(50),
	maalsaetning_kode integer NOT NULL,
	soe_type_kode integer NOT NULL,
	habitat_type_kode integer,
	trussel_vand_kode integer,
	sejlads character varying(150),
	tilstand character varying(250),
	opholdstid double precision,
	volumen double precision,
	fot_id integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5005_soe_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5005_soe_opholdstid_ck CHECK (opholdstid >= 0.1 AND opholdstid <= 99.9),
	CONSTRAINT t_5005_soe_volumen_ck CHECK (volumen >= 0.1 AND volumen <= 999.9),
	CONSTRAINT t_5005_soe_fot_id_ck CHECK (fot_id >= 0 AND fot_id <= 2147483648)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5006_dybdekurv | type: TABLE --
-- DROP TABLE fkg.t_5006_dybdekurv;
CREATE TABLE fkg.t_5006_dybdekurv(
	versions_id uuid NOT NULL,
	soe_navn character varying(128),
	dmu_ref character varying(50),
	soe_nr character varying(50),
	dybde double precision NOT NULL,
	lower double precision NOT NULL,
	upper double precision NOT NULL,
	maalt_aar integer,
	opm_metode character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5006_dybdekurv_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5006_dybdekurv_dybde_ck CHECK (dybde >= 0.0 AND dybde <= 999.9),
	CONSTRAINT t_5006_dybdekurv_lower_ck CHECK (lower >= 0.0 AND lower <= 999.9),
	CONSTRAINT t_5006_dybdekurv_upper_ck CHECK (upper >= 0.0 AND upper <= 999.9),
	CONSTRAINT t_5006_dybdekurv_maalt_aar_ck CHECK (maalt_aar >= 1900 AND maalt_aar <= 2999)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5007_opl | type: TABLE --
-- DROP TABLE fkg.d_5007_opl;
CREATE TABLE fkg.d_5007_opl(
	opl_nr integer NOT NULL,
	opl_navn varchar(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition varchar,
	CONSTRAINT d_5007_opl_pk PRIMARY KEY (opl_nr)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5007_opl_type | type: TABLE --
-- DROP TABLE fkg.d_5007_opl_type;
CREATE TABLE fkg.d_5007_opl_type(
	vandl_opl_type_kode integer NOT NULL,
	vandl_opl_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5007_opl_type_pk PRIMARY KEY (vandl_opl_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5007_vandl_opl | type: TABLE --
-- DROP TABLE fkg.t_5007_vandl_opl;
CREATE TABLE fkg.t_5007_vandl_opl(
	versions_id uuid NOT NULL,
	vandloeb_nr character varying(128),
	dmu_ref character varying(128),
	vandl_opl_nr integer,
	opl_type_kode integer NOT NULL,
	hydro_ref character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5007_vandl_opl_pk PRIMARY KEY (versions_id)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5008_opl | type: TABLE --
-- DROP TABLE fkg.d_5008_opl;
CREATE TABLE fkg.d_5008_opl(
	soe_opl_nr integer NOT NULL,
	soeopl_navn character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5008_opl_pk PRIMARY KEY (soe_opl_nr)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5008_soe_opl | type: TABLE --
-- DROP TABLE fkg.t_5008_soe_opl;
CREATE TABLE fkg.t_5008_soe_opl(
	versions_id uuid NOT NULL,
	dmu_ref character varying(128),
	soe_opl_nr integer NOT NULL,
	soe_nr character varying(50),
	hydro_ref character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5008_soe_opl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5008_soe_opl_soe_opl_nr_ck CHECK (soe_opl_nr >= 1 AND soe_opl_nr <= 9999)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5009_lag_type | type: TABLE --
-- DROP TABLE fkg.d_5009_lag_type;
CREATE TABLE fkg.d_5009_lag_type(
	lag_type_kode integer NOT NULL,
	lag_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5009_lag_type_pk PRIMARY KEY (lag_type_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5009_pumpelag | type: TABLE --
-- DROP TABLE fkg.t_5009_pumpelag;
CREATE TABLE fkg.t_5009_pumpelag(
	versions_id uuid NOT NULL,
	lag_navn character varying(128),
	lag_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	vandloebsystem character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5009_pumpelag_pk PRIMARY KEY (versions_id)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5010_element_type | type: TABLE --
-- DROP TABLE fkg.d_5010_element_type;
CREATE TABLE fkg.d_5010_element_type(
	element_kode integer NOT NULL,
	element character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5010_element_type_pk PRIMARY KEY (element_kode)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.t_5010_vandl_elm | type: TABLE --
-- DROP TABLE fkg.t_5010_vandl_elm;
CREATE TABLE fkg.t_5010_vandl_elm(
	versions_id uuid NOT NULL,
	element_nr character varying(20),
	element_kode integer NOT NULL,
	lokalitet character varying(128),
	vstation double precision,
	vandloebsystem character varying(128) NOT NULL,
	anlagt_aar integer,
	saneret_aar integer,
	tilstand_kode integer,
	broend_data character varying(100),
	toemningsfrekvens character varying(20),
	adgangsforhold character varying(100),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5010_vandl_elm_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5010_vandl_elm_vstation_ck CHECK (vstation >= 0.0 AND vstation <= 200000),
	CONSTRAINT t_5010_vandl_elm_anlagt_aar_ck CHECK (anlagt_aar >= 1800 AND anlagt_aar <= 2999),
	CONSTRAINT t_5010_vandl_elm_saneret_aar_ck CHECK (anlagt_aar >= 1800 AND anlagt_aar <= 2999)

)WITH ( OIDS = TRUE );
-- ddl-end --
-- object: fkg.d_5105_kaer_type | type: TABLE --
-- DROP TABLE fkg.d_5105_kaer_type;
CREATE TABLE fkg.d_5105_kaer_type(
	kaer_type_kode integer NOT NULL,
	kaer_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5105_kaer_type_pk PRIMARY KEY (kaer_type_kode)

);
-- ddl-end --
-- object: fkg.t_5105_rig_fattig | type: TABLE --
-- DROP TABLE fkg.t_5105_rig_fattig;
CREATE TABLE fkg.t_5105_rig_fattig(
	versions_id uuid NOT NULL,
	stedid integer,
	natura_2000 integer,
	kaer_type_kode integer NOT NULL,
	noegle character varying(128),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25835) NOT NULL,
	CONSTRAINT t_5105_rig_fattig_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5106_pleje_type | type: TABLE --
-- DROP TABLE fkg.d_5106_pleje_type;
CREATE TABLE fkg.d_5106_pleje_type(
	pleje_type_kode integer NOT NULL,
	pleje_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT pleje_type_kode_pk PRIMARY KEY (pleje_type_kode)

);
-- ddl-end --
-- object: fkg.d_5106_faciliteter | type: TABLE --
-- DROP TABLE fkg.d_5106_faciliteter;
CREATE TABLE fkg.d_5106_faciliteter(
	faciliteter_kode integer NOT NULL,
	faciliteter character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5106_faciliteter_pk PRIMARY KEY (faciliteter_kode)

);
-- ddl-end --
-- object: fkg.t_5106_nat_pl | type: TABLE --
-- DROP TABLE fkg.t_5106_nat_pl;
CREATE TABLE fkg.t_5106_nat_pl(
	versions_id uuid NOT NULL,
	pleje_type_kode integer NOT NULL,
	omr_nr integer,
	omr_navn character varying(128),
	fortidsmindenr character varying(50),
	faciliteter_kode integer,
	aftale_type character varying(128),
	aftale_nr character varying(50),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	ejerstatus_kode integer,
	sagsnr character varying(128),
	projekt_type character varying(50),
	dyrehold character varying(250) NOT NULL,
	antal_moder integer,
	chr integer,
	navn character varying(50),
	telefon integer,
	mobil integer,
	mail character varying(250),
	ajour date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5106_nat_pl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5108_groent_part | type: TABLE --
-- DROP TABLE fkg.t_5108_groent_part;
CREATE TABLE fkg.t_5108_groent_part(
	versions_id uuid NOT NULL,
	navn character varying(150) NOT NULL,
	kontakt_navn character varying(150),
	kontakt_opl character varying(250),
	deltager character varying(250) NOT NULL,
	formaal character varying(250),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	sagsnr character varying(128),
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5108_groent_part_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5300_genopd_ret | type: TABLE --
-- DROP TABLE fkg.t_5300_genopd_ret;
CREATE TABLE fkg.t_5300_genopd_ret(
	versions_id uuid NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	funktion character varying(128) NOT NULL,
	planlagt_aktivitet character varying(128) NOT NULL,
	genoptaget integer NOT NULL,
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT versions_id_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5400_affalds_type | type: TABLE --
-- DROP TABLE fkg.d_5400_affalds_type;
CREATE TABLE fkg.d_5400_affalds_type(
	affaldstype_kode integer NOT NULL,
	affaldstype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5400_affalds_type_pk PRIMARY KEY (affaldstype_kode)

);
-- ddl-end --
-- object: fkg.t_5400_affalds_dis | type: TABLE --
-- DROP TABLE fkg.t_5400_affalds_dis;
CREATE TABLE fkg.t_5400_affalds_dis(
	versions_id uuid NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	affalddistrikt_nr integer,
	affalddistrikt_navn character varying(128),
	affaldstype_kode integer,
	afh_frekvens character varying(128),
	afh_dag character varying(8),
	renovatoer_cvr integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5400_affalds_dis_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5200_affald | type: TABLE --
-- DROP TABLE fkg.d_5200_affald;
CREATE TABLE fkg.d_5200_affald(
	affald_prod_kode integer NOT NULL,
	affald_prod character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5200_affald_pk PRIMARY KEY (affald_prod_kode)

);
-- ddl-end --
-- object: fkg.d_5401_gs_type | type: TABLE --
-- DROP TABLE fkg.d_5401_gs_type;
CREATE TABLE fkg.d_5401_gs_type(
	gs_type_kode integer NOT NULL,
	gs_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5401_gs_type_pk PRIMARY KEY (gs_type_kode)

);
-- ddl-end --
-- object: fkg.d_5402_gc_type | type: TABLE --
-- DROP TABLE fkg.d_5402_gc_type;
CREATE TABLE fkg.d_5402_gc_type(
	gc_type_kode integer NOT NULL,
	gc_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5402_gc_type_pk PRIMARY KEY (gc_type_kode)

);
-- ddl-end --
-- object: fkg.d_5506_anlaegtype | type: TABLE --
-- DROP TABLE fkg.d_5506_anlaegtype;
CREATE TABLE fkg.d_5506_anlaegtype(
	anlaeg_type_kode integer NOT NULL,
	anlaeg_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5506_anlaegtype_pk PRIMARY KEY (anlaeg_type_kode)

);
-- ddl-end --
-- object: fkg.d_5600_rute | type: TABLE --
-- DROP TABLE fkg.d_5600_rute;
CREATE TABLE fkg.d_5600_rute(
	rute_kode integer NOT NULL,
	rute character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5600_rute_pk PRIMARY KEY (rute_kode)

);
-- ddl-end --
-- object: fkg.d_5601_hasti_type | type: TABLE --
-- DROP TABLE fkg.d_5601_hasti_type;
CREATE TABLE fkg.d_5601_hasti_type(
	hasti_type_kode integer NOT NULL,
	hasti_type character varying(55) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5601_hasti_type_pk PRIMARY KEY (hasti_type_kode)

);
-- ddl-end --
-- object: fkg.d_5602_p_tid | type: TABLE --
-- DROP TABLE fkg.d_5602_p_tid;
CREATE TABLE fkg.d_5602_p_tid(
	p_tid_kode integer NOT NULL,
	p_tid character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5602_p_tid_pk PRIMARY KEY (p_tid_kode)

);
-- ddl-end --
-- object: fkg.d_5602_p_type | type: TABLE --
-- DROP TABLE fkg.d_5602_p_type;
CREATE TABLE fkg.d_5602_p_type(
	p_type_kode integer NOT NULL,
	p_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5602_p_type_pk PRIMARY KEY (p_type_kode)

);
-- ddl-end --
-- object: fkg.d_5604_begr_type | type: TABLE --
-- DROP TABLE fkg.d_5604_begr_type;
CREATE TABLE fkg.d_5604_begr_type(
	begr_type_kode integer NOT NULL,
	begr_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5604_begr_type_pk PRIMARY KEY (begr_type_kode)

);
-- ddl-end --
-- object: fkg.d_5605_dekl_type | type: TABLE --
-- DROP TABLE fkg.d_5605_dekl_type;
CREATE TABLE fkg.d_5605_dekl_type(
	dekl_type_kode integer NOT NULL,
	dekl_type character varying(21) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5605_dekl_type_pk PRIMARY KEY (dekl_type_kode)

);
-- ddl-end --
-- object: fkg.d_5606_inventar_type | type: TABLE --
-- DROP TABLE fkg.d_5606_inventar_type;
CREATE TABLE fkg.d_5606_inventar_type(
	inventar_type_kode integer NOT NULL,
	inventar_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5606_inventar_type_pk PRIMARY KEY (inventar_type_kode)

);
-- ddl-end --
-- object: fkg.d_5700_forening_type | type: TABLE --
-- DROP TABLE fkg.d_5700_forening_type;
CREATE TABLE fkg.d_5700_forening_type(
	forening_type_kode integer NOT NULL,
	forening_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5700_forening_type_pk PRIMARY KEY (forening_type_kode)

);
-- ddl-end --
-- object: fkg.d_5700_adr_beskyt | type: TABLE --
-- DROP TABLE fkg.d_5700_adr_beskyt;
CREATE TABLE fkg.d_5700_adr_beskyt(
	gf_adr_beskyt_kode character NOT NULL,
	gf_adr_beskyt character varying(100) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5700_adr_beskyt_pk PRIMARY KEY (gf_adr_beskyt_kode)

);
-- ddl-end --
-- object: fkg.d_5705_udlejning | type: TABLE --
-- DROP TABLE fkg.d_5705_udlejning;
CREATE TABLE fkg.d_5705_udlejning(
	udlejning_kode integer NOT NULL,
	udlejning character varying(40) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5705_udlejning_pk PRIMARY KEY (udlejning_kode)

);
-- ddl-end --
-- object: fkg.d_5706_havn_type | type: TABLE --
-- DROP TABLE fkg.d_5706_havn_type;
CREATE TABLE fkg.d_5706_havn_type(
	havn_type_kode integer NOT NULL,
	havn_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5706_havn_type_pk PRIMARY KEY (havn_type_kode)

);
-- ddl-end --
-- object: fkg.d_5707_grund_type | type: TABLE --
-- DROP TABLE fkg.d_5707_grund_type;
CREATE TABLE fkg.d_5707_grund_type(
	grund_type_kode integer NOT NULL,
	grund_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5707_grund_type_pk PRIMARY KEY (grund_type_kode)

);
-- ddl-end --
-- object: fkg.d_5707_salg_status | type: TABLE --
-- DROP TABLE fkg.d_5707_salg_status;
CREATE TABLE fkg.d_5707_salg_status(
	salg_status_kode integer NOT NULL,
	salg_status character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5707_salg_status_pk PRIMARY KEY (salg_status_kode)

);
-- ddl-end --
-- object: fkg.d_5708_institution_type | type: TABLE --
-- DROP TABLE fkg.d_5708_institution_type;
CREATE TABLE fkg.d_5708_institution_type(
	institution_type_kode integer NOT NULL,
	institution_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5708_institution_type_pk PRIMARY KEY (institution_type_kode)

);
-- ddl-end --
-- object: fkg.d_5709_distrikt_type | type: TABLE --
-- DROP TABLE fkg.d_5709_distrikt_type;
CREATE TABLE fkg.d_5709_distrikt_type(
	distrikt_type_kode integer NOT NULL,
	distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5709_distrikt_type_pk PRIMARY KEY (distrikt_type_kode)

);
-- ddl-end --
-- object: fkg.d_5800_facilitet | type: TABLE --
-- DROP TABLE fkg.d_5800_facilitet;
CREATE TABLE fkg.d_5800_facilitet(
	facilitet_type_kode integer NOT NULL,
	facilitet_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5800_facilitet_pk PRIMARY KEY (facilitet_type_kode)

);
-- ddl-end --
-- object: fkg.d_5802_facilitet | type: TABLE --
-- DROP TABLE fkg.d_5802_facilitet;
CREATE TABLE fkg.d_5802_facilitet(
	facilitet_type_kode integer NOT NULL,
	facilitet_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5802_facilitet_pk PRIMARY KEY (facilitet_type_kode)

);
-- ddl-end --
-- object: fkg.d_5901_gravestatus | type: TABLE --
-- DROP TABLE fkg.d_5901_gravestatus;
CREATE TABLE fkg.d_5901_gravestatus(
	gravstatus_kode integer NOT NULL,
	gravstatus character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5901_gravestatus_pk PRIMARY KEY (gravstatus_kode)

);
-- ddl-end --
-- object: fkg.d_5901_raastof_type | type: TABLE --
-- DROP TABLE fkg.d_5901_raastof_type;
CREATE TABLE fkg.d_5901_raastof_type(
	raastof_type_kode integer NOT NULL,
	raastof_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5901_raastof_type_pk PRIMARY KEY (raastof_type_kode)

);
-- ddl-end --
-- object: fkg.d_5902_vaeske_type | type: TABLE --
-- DROP TABLE fkg.d_5902_vaeske_type;
CREATE TABLE fkg.d_5902_vaeske_type(
	vaesketype_kode integer NOT NULL,
	vaesketype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5902_vaeske_type_pk PRIMARY KEY (vaesketype_kode)

);
-- ddl-end --
-- object: fkg.d_6000_kotesystem | type: TABLE --
-- DROP TABLE fkg.d_6000_kotesystem;
CREATE TABLE fkg.d_6000_kotesystem(
	kotesystem_kode integer NOT NULL,
	kotesystem character varying(255) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6000_kotesystem_pk PRIMARY KEY (kotesystem_kode)

);
-- ddl-end --
-- object: fkg.d_6003_zone_type | type: TABLE --
-- DROP TABLE fkg.d_6003_zone_type;
CREATE TABLE fkg.d_6003_zone_type(
	zone_type_kode integer NOT NULL,
	zone_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6003_zone_type_pk PRIMARY KEY (zone_type_kode)

);
-- ddl-end --
-- object: fkg.d_6101_beskyt_rum | type: TABLE --
-- DROP TABLE fkg.d_6101_beskyt_rum;
CREATE TABLE fkg.d_6101_beskyt_rum(
	beskyt_rum_kode integer NOT NULL,
	beskyt_rum character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6101_beskyt_rum_pk PRIMARY KEY (beskyt_rum_kode)

);
-- ddl-end --
-- object: fkg.d_6104_risikotype | type: TABLE --
-- DROP TABLE fkg.d_6104_risikotype;
CREATE TABLE fkg.d_6104_risikotype(
	risikotype_kode integer NOT NULL,
	risikotype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6104_risikotype_pk PRIMARY KEY (risikotype_kode)

);
-- ddl-end --
-- object: fkg.d_6104_brandhaem | type: TABLE --
-- DROP TABLE fkg.d_6104_brandhaem;
CREATE TABLE fkg.d_6104_brandhaem(
	brandhaem_kode integer NOT NULL,
	brandhaem character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6104_brandhaem_pk PRIMARY KEY (brandhaem_kode)

);
-- ddl-end --
-- object: fkg.d_6111_tilladelse | type: TABLE --
-- DROP TABLE fkg.d_6111_tilladelse;
CREATE TABLE fkg.d_6111_tilladelse(
	tilladelse_type_kode integer NOT NULL,
	tilladelse_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6111_tilladelse_pk PRIMARY KEY (tilladelse_type_kode)

);
-- ddl-end --
-- object: fkg.d_6112_depottype | type: TABLE --
-- DROP TABLE fkg.d_6112_depottype;
CREATE TABLE fkg.d_6112_depottype(
	depottype_kode integer NOT NULL,
	depottype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6112_depottype_pk PRIMARY KEY (depottype_kode)

);
-- ddl-end --
-- object: fkg.d_6115_afbr_type | type: TABLE --
-- DROP TABLE fkg.d_6115_afbr_type;
CREATE TABLE fkg.d_6115_afbr_type(
	afbr_type_kode integer NOT NULL,
	afbr_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6115_afbr_type_pk PRIMARY KEY (afbr_type_kode)

);
-- ddl-end --
-- object: fkg.d_6116_strandtype | type: TABLE --
-- DROP TABLE fkg.d_6116_strandtype;
CREATE TABLE fkg.d_6116_strandtype(
	strandtype_kode integer NOT NULL,
	strandtype character varying(254) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6116_strandtype_pk PRIMARY KEY (strandtype_kode)

);
-- ddl-end --
-- object: fkg.d_6116_esi_klasse | type: TABLE --
-- DROP TABLE fkg.d_6116_esi_klasse;
CREATE TABLE fkg.d_6116_esi_klasse(
	esi_klasse_kode integer NOT NULL,
	esi_klasse character varying(254) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6116_esi_klasse_pk PRIMARY KEY (esi_klasse_kode)

);
-- ddl-end --
-- object: fkg.d_6117_indsatstype | type: TABLE --
-- DROP TABLE fkg.d_6117_indsatstype;
CREATE TABLE fkg.d_6117_indsatstype(
	indsatstype_kode integer NOT NULL,
	indsatstype character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6117_indsatstype_pk PRIMARY KEY (indsatstype_kode)

);
-- ddl-end --
-- object: fkg.d_6200_geologi | type: TABLE --
-- DROP TABLE fkg.d_6200_geologi;
CREATE TABLE fkg.d_6200_geologi(
	geologi_kode integer NOT NULL,
	geologi character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_geologi_pk PRIMARY KEY (geologi_kode)

);
-- ddl-end --
-- object: fkg.d_6200_jordtype | type: TABLE --
-- DROP TABLE fkg.d_6200_jordtype;
CREATE TABLE fkg.d_6200_jordtype(
	jordtype_kode integer NOT NULL,
	jordtype character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_jordtype_pk PRIMARY KEY (jordtype_kode)

);
-- ddl-end --
-- object: fkg.d_6200_terraen | type: TABLE --
-- DROP TABLE fkg.d_6200_terraen;
CREATE TABLE fkg.d_6200_terraen(
	terraen_kode integer NOT NULL,
	terraen character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_terraen_pk PRIMARY KEY (terraen_kode)

);
-- ddl-end --
-- object: fkg.d_6200_kompleksitet | type: TABLE --
-- DROP TABLE fkg.d_6200_kompleksitet;
CREATE TABLE fkg.d_6200_kompleksitet(
	kompleksitet_kode integer NOT NULL,
	kompleksitet character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_kompleksitet_pk PRIMARY KEY (kompleksitet_kode)

);
-- ddl-end --
-- object: fkg.d_6202_skala | type: TABLE --
-- DROP TABLE fkg.d_6202_skala;
CREATE TABLE fkg.d_6202_skala(
	skala_kode integer NOT NULL,
	skala character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_skala_pk PRIMARY KEY (skala_kode)

);
-- ddl-end --
-- object: fkg.d_6202_rumlig_afgraensning | type: TABLE --
-- DROP TABLE fkg.d_6202_rumlig_afgraensning;
CREATE TABLE fkg.d_6202_rumlig_afgraensning(
	rumlig_afgraensning_kode integer NOT NULL,
	rumlig_afgraensning character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_rumlig_afgraensning_pk PRIMARY KEY (rumlig_afgraensning_kode)

);
-- ddl-end --
-- object: fkg.d_6202_kompleksitet | type: TABLE --
-- DROP TABLE fkg.d_6202_kompleksitet;
CREATE TABLE fkg.d_6202_kompleksitet(
	kompleksitet_kode integer NOT NULL,
	kompleksitet character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_kompleksitet_pk PRIMARY KEY (kompleksitet_kode)

);
-- ddl-end --
-- object: fkg.d_6202_struktur | type: TABLE --
-- DROP TABLE fkg.d_6202_struktur;
CREATE TABLE fkg.d_6202_struktur(
	struktur_kode integer NOT NULL,
	struktur character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_struktur_pk PRIMARY KEY (struktur_kode)

);
-- ddl-end --
-- object: fkg.d_6202_visuel_uro | type: TABLE --
-- DROP TABLE fkg.d_6202_visuel_uro;
CREATE TABLE fkg.d_6202_visuel_uro(
	visuel_uro_kode integer NOT NULL,
	visuel_uro character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_visuel_uro_pk PRIMARY KEY (visuel_uro_kode)

);
-- ddl-end --
-- object: fkg.d_6202_tidsdybde | type: TABLE --
-- DROP TABLE fkg.d_6202_tidsdybde;
CREATE TABLE fkg.d_6202_tidsdybde(
	tidsdybde_kode integer NOT NULL,
	tidsdybde character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_tidsdybde_pk PRIMARY KEY (tidsdybde_kode)

);
-- ddl-end --
-- object: fkg.d_6203_karakterstyrke | type: TABLE --
-- DROP TABLE fkg.d_6203_karakterstyrke;
CREATE TABLE fkg.d_6203_karakterstyrke(
	karakterstyrke_kode integer NOT NULL,
	karakterstyrke character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6203_karakterstyrke_pk PRIMARY KEY (karakterstyrke_kode)

);
-- ddl-end --
-- object: fkg.d_6203_saarbarhed | type: TABLE --
-- DROP TABLE fkg.d_6203_saarbarhed;
CREATE TABLE fkg.d_6203_saarbarhed(
	saarbarhed_kode integer NOT NULL,
	saarbarhed character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6203_saarbarhed_pk PRIMARY KEY (saarbarhed_kode)

);
-- ddl-end --
-- object: fkg.d_6800_vedlhold_f_type | type: TABLE --
-- DROP TABLE fkg.d_6800_vedlhold_f_type;
CREATE TABLE fkg.d_6800_vedlhold_f_type(
	vedlhold_f_type_kode integer NOT NULL,
	vedlhold_f_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_f_type_lable character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6800_vedlhold_f_type_pk PRIMARY KEY (vedlhold_f_type_kode)

);
-- ddl-end --
-- object: fkg.d_6801_vedlhold_l_type | type: TABLE --
-- DROP TABLE fkg.d_6801_vedlhold_l_type;
CREATE TABLE fkg.d_6801_vedlhold_l_type(
	vedlhold_l_type_kode integer NOT NULL,
	vedlhold_l_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_l_type_table character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6801_vedlhold_l_type_pk PRIMARY KEY (vedlhold_l_type_kode)

);
-- ddl-end --
-- object: fkg.d_6802_groenvedligh_punkt | type: TABLE --
-- DROP TABLE fkg.d_6802_groenvedligh_punkt;
CREATE TABLE fkg.d_6802_groenvedligh_punkt(
	vedlhold_p_type_kode integer NOT NULL,
	vedlhold_p_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_p_type_table character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6802_groenvedligh_punkt_pk PRIMARY KEY (vedlhold_p_type_kode)

);
-- ddl-end --
-- object: fkg.d_6803_pg_distrikt | type: TABLE --
-- DROP TABLE fkg.d_6803_pg_distrikt;
CREATE TABLE fkg.d_6803_pg_distrikt(
	pg_distrikt_kode integer NOT NULL,
	pg_distrikt character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6803_pg_distrikt_pk PRIMARY KEY (pg_distrikt_kode)

);
-- ddl-end --
-- object: fkg.t_5401_genbr_st | type: TABLE --
-- DROP TABLE fkg.t_5401_genbr_st;
CREATE TABLE fkg.t_5401_genbr_st(
	versions_id uuid NOT NULL,
	gs_navn character varying(51),
	gs_type_kode integer NOT NULL,
	p_nr integer,
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5401_genbr_st_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5402_genbr_con | type: TABLE --
-- DROP TABLE fkg.t_5402_genbr_con;
CREATE TABLE fkg.t_5402_genbr_con(
	versions_id uuid NOT NULL,
	gc_type_kode integer NOT NULL,
	model character varying(25),
	t_frekvens character varying(50),
	t_dato date,
	links character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5402_genbr_con_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5508_husst_moel | type: TABLE --
-- DROP TABLE fkg.t_5508_husst_moel;
CREATE TABLE fkg.t_5508_husst_moel(
	versions_id uuid NOT NULL,
	moelletype character varying(50) NOT NULL,
	hoejde double precision,
	kapacitet double precision,
	stoej_kode integer NOT NULL,
	konsekvenszone double precision,
	sagnr character varying(128),
	vejkode integer,
	husnr character varying(4),
	postnr integer,
	note character varying(254),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5508_husst_moel_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5508_husst_moel_hoejde_ck CHECK (hoejde BETWEEN 0.1 AND 49.9),
	CONSTRAINT t_5508_husst_moel_kapacitet_ck CHECK (kapacitet BETWEEN 0.1 AND 6.0),
	CONSTRAINT t_5508_husst_moel_konsekvenszone_ck CHECK (konsekvenszone BETWEEN 0.1 AND 999.9)

);
-- ddl-end --
-- object: fkg.t_5200_aff_prod_udbr | type: TABLE --
-- DROP TABLE fkg.t_5200_aff_prod_udbr;
CREATE TABLE fkg.t_5200_aff_prod_udbr(
	versions_id uuid NOT NULL,
	affald_prod_kode integer NOT NULL,
	navn character varying(50) NOT NULL,
	ejd_nr integer,
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	markblok character varying(25),
	dosering_toerstof double precision,
	dosering_vaadvaegt double precision,
	phosphor_indhold double precision,
	udbringning_aar integer NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5200_aff_prod_udbr_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5500_elfors_omr | type: TABLE --
-- DROP TABLE fkg.t_5500_elfors_omr;
CREATE TABLE fkg.t_5500_elfors_omr(
	versions_id uuid NOT NULL,
	net_s_nr integer,
	fs_cvr integer NOT NULL,
	fs_navn character varying(128) NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5500_elfors_omr_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5506_spildev_pl_pkt | type: TABLE --
-- DROP TABLE fkg.t_5506_spildev_pl_pkt;
CREATE TABLE fkg.t_5506_spildev_pl_pkt(
	versions_id uuid NOT NULL,
	anlaeg_type_kode integer NOT NULL,
	planstatus_kode integer NOT NULL,
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5506_spildev_pl_pkt_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5507_fiberkabel | type: TABLE --
-- DROP TABLE fkg.t_5507_fiberkabel;
CREATE TABLE fkg.t_5507_fiberkabel(
	versions_id uuid NOT NULL,
	fs_cvr integer,
	fs_navn character varying(128),
	dybde double precision,
	aar_i_jord integer,
	antal_kabler integer,
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_5507_fiberkabel_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5800_fac_pkt | type: TABLE --
-- DROP TABLE fkg.t_5800_fac_pkt;
CREATE TABLE fkg.t_5800_fac_pkt(
	versions_id uuid NOT NULL,
	facilitet_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	navn character varying(50),
	noegle character varying(128),
	noter character varying(254),
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5800_fac_pkt_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5802_fac_li | type: TABLE --
-- DROP TABLE fkg.t_5802_fac_li;
CREATE TABLE fkg.t_5802_fac_li(
	versions_id uuid NOT NULL,
	facilitet_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	navn character varying(50),
	nogle character varying(128),
	noter character varying(254),
	vejkode integer,
	cvf_vejkode char(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_5802_fac_li_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5900_jordfl | type: TABLE --
-- DROP TABLE fkg.t_5900_jordfl;
CREATE TABLE fkg.t_5900_jordfl(
	versions_id uuid NOT NULL,
	afs_vejkode integer,
	afs_cvf_vejkode char(7),
	afs_husnr character varying(4),
	afs_kommunekode integer,
	afs_postnr integer,
	jordflyt_dato_start date NOT NULL,
	jordflyt_dato_slut date NOT NULL,
	modt_vejkode integer,
	modt_cvf_vejkode char(7),
	modt_husnr character varying(4),
	modt_kommunekode integer,
	modt_postnr integer,
	tillad_dato date NOT NULL,
	jordmaengde_faktisk double precision NOT NULL,
	jordmaengde_anmeldt double precision NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5900_jordfl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5901_raastof_till | type: TABLE --
-- DROP TABLE fkg.t_5901_raastof_till;
CREATE TABLE fkg.t_5901_raastof_till(
	versions_id uuid NOT NULL,
	indv_navn character varying(128),
	indv_cvr integer NOT NULL,
	raastof_type_kode integer,
	tillad_dato date NOT NULL,
	aflslut_aar integer NOT NULL,
	gravstatus_kode integer NOT NULL,
	grusgrav_nr character varying(50),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5901_raastof_till_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5902_jordv_anl | type: TABLE --
-- DROP TABLE fkg.t_5902_jordv_anl;
CREATE TABLE fkg.t_5902_jordv_anl(
	versions_id uuid NOT NULL,
	brine character varying(50),
	strenge_antal integer,
	strenge_laengde_samlede integer,
	tilladelses_dato date,
	faerdigmeldingsdato date,
	vaesketype_kode integer,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	sagsnr character varying(128),
	sag_status_kode integer,
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5902_jordv_anl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5104_art_invas | type: TABLE --
-- DROP TABLE fkg.t_5104_art_invas;
CREATE TABLE fkg.t_5104_art_invas(
	versions_id uuid NOT NULL,
	dnavn character varying(50) NOT NULL,
	lnavn character varying(50),
	nobanis_invasiv_opt character varying(50),
	rige_dk character varying(50),
	sortlistet_kode integer,
	noegle character varying(128),
	inventoer character varying(30),
	antal_kode integer NOT NULL,
	forekomst character varying(128),
	sagsnr character varying(128),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5104_art_invas_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5107_art_invas_p | type: TABLE --
-- DROP TABLE fkg.t_5107_art_invas_p;
CREATE TABLE fkg.t_5107_art_invas_p(
	versions_id uuid NOT NULL,
	dnavn character varying(50) NOT NULL,
	lnavn character varying(50),
	nobanis_invasiv_opt character varying(50),
	rige_dk character varying(50),
	sortlistet_kode integer,
	nogle character varying(128),
	inventoer character varying(30),
	antal_kode integer NOT NULL,
	forekomst character varying(128),
	sagsnr character varying(128),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5107_art_invas_p_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5508_stoej | type: TABLE --
-- DROP TABLE fkg.d_5508_stoej;
CREATE TABLE fkg.d_5508_stoej(
	stoej_kode integer NOT NULL,
	stoej character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5508_stoej_pk PRIMARY KEY (stoej_kode)

);
-- ddl-end --
-- object: fkg.t_5600_vintervedl | type: TABLE --
-- DROP TABLE fkg.t_5600_vintervedl;
CREATE TABLE fkg.t_5600_vintervedl(
	versions_id uuid NOT NULL,
	rute_kode integer NOT NULL,
	rute_entreprenoer_sne character varying(128),
	rute_nr_sne character varying(50),
	rute_entreprenoer_salt character varying(128),
	rute_nr_salt character varying(50),
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_5600_vintervedl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5601_hasti_daemp | type: TABLE --
-- DROP TABLE fkg.t_5601_hasti_daemp;
CREATE TABLE fkg.t_5601_hasti_daemp(
	versions_id uuid NOT NULL,
	hasti_type_kode integer NOT NULL,
	hastighed_kode integer NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5601_hasti_daemp_pk_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5602_p_zoner | type: TABLE --
-- DROP TABLE fkg.t_5602_p_zoner;
CREATE TABLE fkg.t_5602_p_zoner(
	versions_id uuid NOT NULL,
	p_type_kode integer NOT NULL,
	p_tid_kode integer,
	p_periode character varying(50),
	p_pladser_personbil integer,
	p_pris_time integer,
	p_pladser_handicap integer,
	p_pladser_lastbil integer,
	p_pladser_elbil integer,
	p_pladser_mc integer,
	p_pladser_cykel integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5602_p_zoner_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5602_p_zoner_p_pladser_personbil_ck CHECK (p_pladser_personbil BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pris_time_ck CHECK (p_pris_time BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pladser_handicap_ck CHECK (p_pladser_handicap BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pladser_lastbil_ck CHECK (p_pladser_lastbil BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pladser_elbil_ck CHECK (p_pladser_elbil BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pladser_mc_ck CHECK (p_pladser_mc BETWEEN 0 AND 9999),
	CONSTRAINT t_5602_p_zoner_p_pladser_cykel_ck CHECK (p_pladser_cykel BETWEEN 0 AND 9999)

);
-- ddl-end --
-- object: generel_d_basis_oprindelse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.generel DROP CONSTRAINT generel_d_basis_oprindelse_fk;
ALTER TABLE fkg.generel ADD CONSTRAINT generel_d_basis_oprindelse_fk FOREIGN KEY (oprindkode)
REFERENCES fkg.d_basis_oprindelse (oprindkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: generel_d_basis_status_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.generel DROP CONSTRAINT generel_d_basis_status_fk;
ALTER TABLE fkg.generel ADD CONSTRAINT generel_d_basis_status_fk FOREIGN KEY (statuskode)
REFERENCES fkg.d_basis_status (statuskode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: generel_d_basis_ansvarlig_myndighed_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.generel DROP CONSTRAINT generel_d_basis_ansvarlig_myndighed_fk;
ALTER TABLE fkg.generel ADD CONSTRAINT generel_d_basis_ansvarlig_myndighed_fk FOREIGN KEY (cvr_kode)
REFERENCES fkg.d_basis_ansvarlig_myndighed (cvr_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_generel_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_5000_klasse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_5000_klasse_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_5000_klasse_fk FOREIGN KEY (klasse_kode)
REFERENCES fkg.d_5000_klasse (klasse_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_5000_vandl_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_5000_vandl_type_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_5000_vandl_type_fk FOREIGN KEY (vandl_type_kode)
REFERENCES fkg.d_5000_vandl_type (vandl_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_ja_nej_tidl_amt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_ja_nej_tidl_amt_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_ja_nej_tidl_amt_fk FOREIGN KEY (tidl_amt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_ja_nej_p3vandloeb_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_ja_nej_p3vandloeb_kode_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_ja_nej_p3vandloeb_kode_fk FOREIGN KEY (p3vandloeb_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_dvfi_bedoemmelse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_dvfi_bedoemmelse_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_dvfi_bedoemmelse_fk FOREIGN KEY (dvfi_bedoemmelse_kode)
REFERENCES fkg.d_basis_dvfi_bedoemmelse (dvfi_bedoemmelse_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_ja_nej_maalsaetning_opfyldt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_ja_nej_maalsaetning_opfyldt_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_ja_nej_maalsaetning_opfyldt_fk FOREIGN KEY (maalsaetning_opfyldt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_basis_trussel_vand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_basis_trussel_vand_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_basis_trussel_vand_fk FOREIGN KEY (trussel_vand_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5000_vandl_d_5000_maalsaetning_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5000_vandl DROP CONSTRAINT t_5000_vandl_d_5000_maalsaetning_fk;
ALTER TABLE fkg.t_5000_vandl ADD CONSTRAINT t_5000_vandl_d_5000_maalsaetning_fk FOREIGN KEY (maalsaetning_kode)
REFERENCES fkg.d_5000_maalsaetning (maalsaetning_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: tema_temagruppe_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.tema DROP CONSTRAINT tema_temagruppe_fk;
ALTER TABLE fkg.tema ADD CONSTRAINT tema_temagruppe_fk FOREIGN KEY (temagruppe_id)
REFERENCES fkg.temagruppe (temagruppe_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_generel_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_6100_brandhane_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_6100_brandhane_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_6100_brandhane_fk FOREIGN KEY (brandhane_type_kode)
REFERENCES fkg.d_6100_brandhane (brandhane_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_6100_placering | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_6100_placering;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_6100_placering FOREIGN KEY (placering_kode)
REFERENCES fkg.d_6100_placering (placering_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_basis_funktionsstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_basis_funktionsstatus_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_basis_funktionsstatus_fk FOREIGN KEY (funktionsstatus_kode)
REFERENCES fkg.d_basis_funktionsstatus (funktionsstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6102_redningsvej_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6102_redn_vej DROP CONSTRAINT t_6102_redningsvej_generel_fk;
ALTER TABLE fkg.t_6102_redn_vej ADD CONSTRAINT t_6102_redningsvej_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6102_redningsvej_d_6102_redvej_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6102_redn_vej DROP CONSTRAINT t_6102_redningsvej_d_6102_redvej_type_fk;
ALTER TABLE fkg.t_6102_redn_vej ADD CONSTRAINT t_6102_redningsvej_d_6102_redvej_type_fk FOREIGN KEY (redvej_type_kode)
REFERENCES fkg.d_6102_redvej_type (redvej_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5001_maalest_d_5001_maalest_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5001_maalest DROP CONSTRAINT t_5001_maalest_d_5001_maalest_type_fk;
ALTER TABLE fkg.t_5001_maalest ADD CONSTRAINT t_5001_maalest_d_5001_maalest_type_fk FOREIGN KEY (maalest_type_kode)
REFERENCES fkg.d_5001_maalest_type (maalest_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5001_maalest_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5001_maalest DROP CONSTRAINT t_5001_maalest_generel_fk;
ALTER TABLE fkg.t_5001_maalest ADD CONSTRAINT t_5001_maalest_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5001_maalest_d_basisdvfi_bedoemmelse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5001_maalest DROP CONSTRAINT t_5001_maalest_d_basisdvfi_bedoemmelse_fk;
ALTER TABLE fkg.t_5001_maalest ADD CONSTRAINT t_5001_maalest_d_basisdvfi_bedoemmelse_fk FOREIGN KEY (dvfi_bedoemmelse_kode)
REFERENCES fkg.d_basis_dvfi_bedoemmelse (dvfi_bedoemmelse_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5001_maalest_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5001_maalest DROP CONSTRAINT t_5001_maalest_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5001_maalest ADD CONSTRAINT t_5001_maalest_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5002_faunasp_d_5002_spaerring_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5002_faunasp DROP CONSTRAINT t_5002_faunasp_d_5002_spaerring_fk;
ALTER TABLE fkg.t_5002_faunasp ADD CONSTRAINT t_5002_faunasp_d_5002_spaerring_fk FOREIGN KEY (spaerring_type_kode)
REFERENCES fkg.d_5002_spaerring (spaerring_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5002_faunasp_d_5002_passage_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5002_faunasp DROP CONSTRAINT t_5002_faunasp_d_5002_passage_fk;
ALTER TABLE fkg.t_5002_faunasp ADD CONSTRAINT t_5002_faunasp_d_5002_passage_fk FOREIGN KEY (passage_kode)
REFERENCES fkg.d_5002_passage (passage_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5002_faunasp_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5002_faunasp DROP CONSTRAINT t_5002_faunasp_generel_fk;
ALTER TABLE fkg.t_5002_faunasp ADD CONSTRAINT t_5002_faunasp_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5003_draenledn_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5003_draenledn DROP CONSTRAINT t_5003_draenledn_generel_fk;
ALTER TABLE fkg.t_5003_draenledn ADD CONSTRAINT t_5003_draenledn_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5003_draenledn_d_5003_ledn_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5003_draenledn DROP CONSTRAINT t_5003_draenledn_d_5003_ledn_type_fk;
ALTER TABLE fkg.t_5003_draenledn ADD CONSTRAINT t_5003_draenledn_d_5003_ledn_type_fk FOREIGN KEY (ledn_type_kode)
REFERENCES fkg.d_5003_ledn_type (ledn_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5003_draenledn_d_5003_klasse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5003_draenledn DROP CONSTRAINT t_5003_draenledn_d_5003_klasse_fk;
ALTER TABLE fkg.t_5003_draenledn ADD CONSTRAINT t_5003_draenledn_d_5003_klasse_fk FOREIGN KEY (klasse_kode)
REFERENCES fkg.d_5003_klasse (klasse_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5004_draenomr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5004_draenomr DROP CONSTRAINT t_5004_draenomr_generel_fk;
ALTER TABLE fkg.t_5004_draenomr ADD CONSTRAINT t_5004_draenomr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5004_draenomr_d_5004_omr_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5004_draenomr DROP CONSTRAINT t_5004_draenomr_d_5004_omr_type_fk;
ALTER TABLE fkg.t_5004_draenomr ADD CONSTRAINT t_5004_draenomr_d_5004_omr_type_fk FOREIGN KEY (omr_type_kode)
REFERENCES fkg.d_5004_omr_type (omr_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5005_soe_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5005_soe DROP CONSTRAINT t_5005_soe_generel_fk;
ALTER TABLE fkg.t_5005_soe ADD CONSTRAINT t_5005_soe_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5005_soe_d_5005_maalsaetning_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5005_soe DROP CONSTRAINT t_5005_soe_d_5005_maalsaetning_fk;
ALTER TABLE fkg.t_5005_soe ADD CONSTRAINT t_5005_soe_d_5005_maalsaetning_fk FOREIGN KEY (maalsaetning_kode)
REFERENCES fkg.d_5005_maalsaetning (maalsaetning_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5005_soe_d_5005_soe_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5005_soe DROP CONSTRAINT t_5005_soe_d_5005_soe_type_fk;
ALTER TABLE fkg.t_5005_soe ADD CONSTRAINT t_5005_soe_d_5005_soe_type_fk FOREIGN KEY (soe_type_kode)
REFERENCES fkg.d_5005_soe_type (soe_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5005_soe_d_5005_habitat_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5005_soe DROP CONSTRAINT t_5005_soe_d_5005_habitat_type_fk;
ALTER TABLE fkg.t_5005_soe ADD CONSTRAINT t_5005_soe_d_5005_habitat_type_fk FOREIGN KEY (habitat_type_kode)
REFERENCES fkg.d_5005_habitat_type (habitat_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5005_soe_d_basis_trussel_vand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5005_soe DROP CONSTRAINT t_5005_soe_d_basis_trussel_vand_fk;
ALTER TABLE fkg.t_5005_soe ADD CONSTRAINT t_5005_soe_d_basis_trussel_vand_fk FOREIGN KEY (trussel_vand_kode)
REFERENCES fkg.d_basis_trussel_vand (trussel_vand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5006_dybdekurv_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5006_dybdekurv DROP CONSTRAINT t_5006_dybdekurv_generel_fk;
ALTER TABLE fkg.t_5006_dybdekurv ADD CONSTRAINT t_5006_dybdekurv_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5007_vandl_opl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5007_vandl_opl DROP CONSTRAINT t_5007_vandl_opl_generel_fk;
ALTER TABLE fkg.t_5007_vandl_opl ADD CONSTRAINT t_5007_vandl_opl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5007_vandl_opl_d_5007_opl_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5007_vandl_opl DROP CONSTRAINT t_5007_vandl_opl_d_5007_opl_fk;
ALTER TABLE fkg.t_5007_vandl_opl ADD CONSTRAINT t_5007_vandl_opl_d_5007_opl_fk FOREIGN KEY (vandl_opl_nr)
REFERENCES fkg.d_5007_opl (opl_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5007_vandl_opl_d_5007_opl_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5007_vandl_opl DROP CONSTRAINT t_5007_vandl_opl_d_5007_opl_type_fk;
ALTER TABLE fkg.t_5007_vandl_opl ADD CONSTRAINT t_5007_vandl_opl_d_5007_opl_type_fk FOREIGN KEY (opl_type_kode)
REFERENCES fkg.d_5007_opl_type (vandl_opl_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5008_soe_opl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5008_soe_opl DROP CONSTRAINT t_5008_soe_opl_generel_fk;
ALTER TABLE fkg.t_5008_soe_opl ADD CONSTRAINT t_5008_soe_opl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5008_soe_opl_d_5008_opl_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5008_soe_opl DROP CONSTRAINT t_5008_soe_opl_d_5008_opl_fk;
ALTER TABLE fkg.t_5008_soe_opl ADD CONSTRAINT t_5008_soe_opl_d_5008_opl_fk FOREIGN KEY (soe_opl_nr)
REFERENCES fkg.d_5008_opl (soe_opl_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5009_pumpelag_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5009_pumpelag DROP CONSTRAINT t_5009_pumpelag_generel_fk;
ALTER TABLE fkg.t_5009_pumpelag ADD CONSTRAINT t_5009_pumpelag_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5009_pumpelag_d_5009_lag_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5009_pumpelag DROP CONSTRAINT t_5009_pumpelag_d_5009_lag_type_fk;
ALTER TABLE fkg.t_5009_pumpelag ADD CONSTRAINT t_5009_pumpelag_d_5009_lag_type_fk FOREIGN KEY (lag_type_kode)
REFERENCES fkg.d_5009_lag_type (lag_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5009_pumpelag_d_basis_erjerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5009_pumpelag DROP CONSTRAINT t_5009_pumpelag_d_basis_erjerstatus_fk;
ALTER TABLE fkg.t_5009_pumpelag ADD CONSTRAINT t_5009_pumpelag_d_basis_erjerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5010_vandl_elm_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5010_vandl_elm DROP CONSTRAINT t_5010_vandl_elm_generel_fk;
ALTER TABLE fkg.t_5010_vandl_elm ADD CONSTRAINT t_5010_vandl_elm_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5010_vandl_elm_d_5010_element_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5010_vandl_elm DROP CONSTRAINT t_5010_vandl_elm_d_5010_element_type_fk;
ALTER TABLE fkg.t_5010_vandl_elm ADD CONSTRAINT t_5010_vandl_elm_d_5010_element_type_fk FOREIGN KEY (element_kode)
REFERENCES fkg.d_5010_element_type (element_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5010_vandl_elm_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5010_vandl_elm DROP CONSTRAINT t_5010_vandl_elm_d_basis_tilstand_fk;
ALTER TABLE fkg.t_5010_vandl_elm ADD CONSTRAINT t_5010_vandl_elm_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5105_rig_fattig_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5105_rig_fattig DROP CONSTRAINT t_5105_rig_fattig_generel_fk;
ALTER TABLE fkg.t_5105_rig_fattig ADD CONSTRAINT t_5105_rig_fattig_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5105_rig_fattig_d_5105_kaer_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5105_rig_fattig DROP CONSTRAINT t_5105_rig_fattig_d_5105_kaer_type_fk;
ALTER TABLE fkg.t_5105_rig_fattig ADD CONSTRAINT t_5105_rig_fattig_d_5105_kaer_type_fk FOREIGN KEY (kaer_type_kode)
REFERENCES fkg.d_5105_kaer_type (kaer_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5106_nat_pl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5106_nat_pl DROP CONSTRAINT t_5106_nat_pl_generel_fk;
ALTER TABLE fkg.t_5106_nat_pl ADD CONSTRAINT t_5106_nat_pl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5106_nat_pl_d_5106_pleje_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5106_nat_pl DROP CONSTRAINT t_5106_nat_pl_d_5106_pleje_type_fk;
ALTER TABLE fkg.t_5106_nat_pl ADD CONSTRAINT t_5106_nat_pl_d_5106_pleje_type_fk FOREIGN KEY (pleje_type_kode)
REFERENCES fkg.d_5106_pleje_type (pleje_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5106_nat_pl_d_5106_faciliteter_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5106_nat_pl DROP CONSTRAINT t_5106_nat_pl_d_5106_faciliteter_fk;
ALTER TABLE fkg.t_5106_nat_pl ADD CONSTRAINT t_5106_nat_pl_d_5106_faciliteter_fk FOREIGN KEY (faciliteter_kode)
REFERENCES fkg.d_5106_faciliteter (faciliteter_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5106_nat_pl_d_basis_ejerstatus | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5106_nat_pl DROP CONSTRAINT t_5106_nat_pl_d_basis_ejerstatus;
ALTER TABLE fkg.t_5106_nat_pl ADD CONSTRAINT t_5106_nat_pl_d_basis_ejerstatus FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5108_groent_part_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5108_groent_part DROP CONSTRAINT t_5108_groent_part_generel_fk;
ALTER TABLE fkg.t_5108_groent_part ADD CONSTRAINT t_5108_groent_part_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5300_genopd_ret_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5300_genopd_ret DROP CONSTRAINT t_5300_genopd_ret_generel_fk;
ALTER TABLE fkg.t_5300_genopd_ret ADD CONSTRAINT t_5300_genopd_ret_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5400_affalds_dis_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5400_affalds_dis DROP CONSTRAINT t_5400_affalds_dis_generel_fk;
ALTER TABLE fkg.t_5400_affalds_dis ADD CONSTRAINT t_5400_affalds_dis_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5400_affalds_dis_d_5400_affalds_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5400_affalds_dis DROP CONSTRAINT t_5400_affalds_dis_d_5400_affalds_type_fk;
ALTER TABLE fkg.t_5400_affalds_dis ADD CONSTRAINT t_5400_affalds_dis_d_5400_affalds_type_fk FOREIGN KEY (affaldstype_kode)
REFERENCES fkg.d_5400_affalds_type (affaldstype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5401_genbr_st_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5401_genbr_st DROP CONSTRAINT t_5401_genbr_st_generel_fk;
ALTER TABLE fkg.t_5401_genbr_st ADD CONSTRAINT t_5401_genbr_st_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5401_genbr_st_d_5401_gs_type | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5401_genbr_st DROP CONSTRAINT t_5401_genbr_st_d_5401_gs_type;
ALTER TABLE fkg.t_5401_genbr_st ADD CONSTRAINT t_5401_genbr_st_d_5401_gs_type FOREIGN KEY (gs_type_kode)
REFERENCES fkg.d_5401_gs_type (gs_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5401_genbr_st_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5401_genbr_st DROP CONSTRAINT t_5401_genbr_st_d_basis_postnr_fk;
ALTER TABLE fkg.t_5401_genbr_st ADD CONSTRAINT t_5401_genbr_st_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5401_genbr_st_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5401_genbr_st DROP CONSTRAINT t_5401_genbr_st_d_vejnavn_fk;
ALTER TABLE fkg.t_5401_genbr_st ADD CONSTRAINT t_5401_genbr_st_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5402_genbr_con_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5402_genbr_con DROP CONSTRAINT t_5402_genbr_con_generel_fk;
ALTER TABLE fkg.t_5402_genbr_con ADD CONSTRAINT t_5402_genbr_con_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5402_genbr_con_d_5402_gc_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5402_genbr_con DROP CONSTRAINT t_5402_genbr_con_d_5402_gc_type_fk;
ALTER TABLE fkg.t_5402_genbr_con ADD CONSTRAINT t_5402_genbr_con_d_5402_gc_type_fk FOREIGN KEY (gc_type_kode)
REFERENCES fkg.d_5402_gc_type (gc_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5508_husst_moel_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5508_husst_moel DROP CONSTRAINT t_5508_husst_moel_generel_fk;
ALTER TABLE fkg.t_5508_husst_moel ADD CONSTRAINT t_5508_husst_moel_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5508_husst_moel_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5508_husst_moel DROP CONSTRAINT t_5508_husst_moel_d_vejnavn_fk;
ALTER TABLE fkg.t_5508_husst_moel ADD CONSTRAINT t_5508_husst_moel_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5508_husst_moel_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5508_husst_moel DROP CONSTRAINT t_5508_husst_moel_d_basis_postnr_fk;
ALTER TABLE fkg.t_5508_husst_moel ADD CONSTRAINT t_5508_husst_moel_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5508_husst_moel_d5508_stoej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5508_husst_moel DROP CONSTRAINT t_5508_husst_moel_d5508_stoej_fk;
ALTER TABLE fkg.t_5508_husst_moel ADD CONSTRAINT t_5508_husst_moel_d5508_stoej_fk FOREIGN KEY (stoej_kode)
REFERENCES fkg.d_5508_stoej (stoej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5200_aff_prod_udbr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5200_aff_prod_udbr DROP CONSTRAINT t_5200_aff_prod_udbr_generel_fk;
ALTER TABLE fkg.t_5200_aff_prod_udbr ADD CONSTRAINT t_5200_aff_prod_udbr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5200_aff_prod_udbr_d_5200_affald_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5200_aff_prod_udbr DROP CONSTRAINT t_5200_aff_prod_udbr_d_5200_affald_fk;
ALTER TABLE fkg.t_5200_aff_prod_udbr ADD CONSTRAINT t_5200_aff_prod_udbr_d_5200_affald_fk FOREIGN KEY (affald_prod_kode)
REFERENCES fkg.d_5200_affald (affald_prod_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5200_aff_prod_udbr_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5200_aff_prod_udbr DROP CONSTRAINT t_5200_aff_prod_udbr_d_basis_postnr_fk;
ALTER TABLE fkg.t_5200_aff_prod_udbr ADD CONSTRAINT t_5200_aff_prod_udbr_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5200_aff_prod_udbr_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5200_aff_prod_udbr DROP CONSTRAINT t_5200_aff_prod_udbr_d_vejnavn_fk;
ALTER TABLE fkg.t_5200_aff_prod_udbr ADD CONSTRAINT t_5200_aff_prod_udbr_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5500_elfors_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5500_elfors_omr DROP CONSTRAINT t_5500_elfors_omr_generel_fk;
ALTER TABLE fkg.t_5500_elfors_omr ADD CONSTRAINT t_5500_elfors_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5506_spildev_pl_pkt_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5506_spildev_pl_pkt DROP CONSTRAINT t_5506_spildev_pl_pkt_generel_fk;
ALTER TABLE fkg.t_5506_spildev_pl_pkt ADD CONSTRAINT t_5506_spildev_pl_pkt_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5506_spildev_pl_pkt_d_5506_anlaegtype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5506_spildev_pl_pkt DROP CONSTRAINT t_5506_spildev_pl_pkt_d_5506_anlaegtype_fk;
ALTER TABLE fkg.t_5506_spildev_pl_pkt ADD CONSTRAINT t_5506_spildev_pl_pkt_d_5506_anlaegtype_fk FOREIGN KEY (anlaeg_type_kode)
REFERENCES fkg.d_5506_anlaegtype (anlaeg_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5506_spildev_pl_pkt_d_basis_planstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5506_spildev_pl_pkt DROP CONSTRAINT t_5506_spildev_pl_pkt_d_basis_planstatus_fk;
ALTER TABLE fkg.t_5506_spildev_pl_pkt ADD CONSTRAINT t_5506_spildev_pl_pkt_d_basis_planstatus_fk FOREIGN KEY (planstatus_kode)
REFERENCES fkg.d_basis_planstatus (planstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5507_fiberkabel_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5507_fiberkabel DROP CONSTRAINT t_5507_fiberkabel_generel_fk;
ALTER TABLE fkg.t_5507_fiberkabel ADD CONSTRAINT t_5507_fiberkabel_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5800_fac_pkt_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5800_fac_pkt DROP CONSTRAINT t_5800_fac_pkt_generel_fk;
ALTER TABLE fkg.t_5800_fac_pkt ADD CONSTRAINT t_5800_fac_pkt_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5800_fac_pkt_d_5800_facilitet_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5800_fac_pkt DROP CONSTRAINT t_5800_fac_pkt_d_5800_facilitet_fk;
ALTER TABLE fkg.t_5800_fac_pkt ADD CONSTRAINT t_5800_fac_pkt_d_5800_facilitet_fk FOREIGN KEY (facilitet_type_kode)
REFERENCES fkg.d_5800_facilitet (facilitet_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5800_fac_pkt_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5800_fac_pkt DROP CONSTRAINT t_5800_fac_pkt_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5800_fac_pkt ADD CONSTRAINT t_5800_fac_pkt_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5800_fac_pkt_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5800_fac_pkt DROP CONSTRAINT t_5800_fac_pkt_d_vejnavn_fk;
ALTER TABLE fkg.t_5800_fac_pkt ADD CONSTRAINT t_5800_fac_pkt_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5800_fac_pkt_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5800_fac_pkt DROP CONSTRAINT t_5800_fac_pkt_d_basis_postnr_fk;
ALTER TABLE fkg.t_5800_fac_pkt ADD CONSTRAINT t_5800_fac_pkt_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5802_fac_li_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5802_fac_li DROP CONSTRAINT t_5802_fac_li_generel_fk;
ALTER TABLE fkg.t_5802_fac_li ADD CONSTRAINT t_5802_fac_li_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5802_fac_li_d_5802_facilitet_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5802_fac_li DROP CONSTRAINT t_5802_fac_li_d_5802_facilitet_fk;
ALTER TABLE fkg.t_5802_fac_li ADD CONSTRAINT t_5802_fac_li_d_5802_facilitet_fk FOREIGN KEY (facilitet_type_kode)
REFERENCES fkg.d_5802_facilitet (facilitet_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5802_fac_li_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5802_fac_li DROP CONSTRAINT t_5802_fac_li_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5802_fac_li ADD CONSTRAINT t_5802_fac_li_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5802_fac_li_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5802_fac_li DROP CONSTRAINT t_5802_fac_li_d_vejnavn_fk;
ALTER TABLE fkg.t_5802_fac_li ADD CONSTRAINT t_5802_fac_li_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5802_fac_li_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5802_fac_li DROP CONSTRAINT t_5802_fac_li_d_basis_postnr_fk;
ALTER TABLE fkg.t_5802_fac_li ADD CONSTRAINT t_5802_fac_li_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5900_jordfl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5900_jordfl DROP CONSTRAINT t_5900_jordfl_generel_fk;
ALTER TABLE fkg.t_5900_jordfl ADD CONSTRAINT t_5900_jordfl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5900_jordfl_d_vejnavn_afs_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5900_jordfl DROP CONSTRAINT t_5900_jordfl_d_vejnavn_afs_fk;
ALTER TABLE fkg.t_5900_jordfl ADD CONSTRAINT t_5900_jordfl_d_vejnavn_afs_fk FOREIGN KEY (afs_vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5900_jordfl_d_basis_postnr_afs_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5900_jordfl DROP CONSTRAINT t_5900_jordfl_d_basis_postnr_afs_fk;
ALTER TABLE fkg.t_5900_jordfl ADD CONSTRAINT t_5900_jordfl_d_basis_postnr_afs_fk FOREIGN KEY (afs_postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5900_jordfl_d_vejnavn_modt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5900_jordfl DROP CONSTRAINT t_5900_jordfl_d_vejnavn_modt_fk;
ALTER TABLE fkg.t_5900_jordfl ADD CONSTRAINT t_5900_jordfl_d_vejnavn_modt_fk FOREIGN KEY (modt_vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5900_jordfl_d_basis_postnr_modt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5900_jordfl DROP CONSTRAINT t_5900_jordfl_d_basis_postnr_modt_fk;
ALTER TABLE fkg.t_5900_jordfl ADD CONSTRAINT t_5900_jordfl_d_basis_postnr_modt_fk FOREIGN KEY (modt_postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5901_raastof_till_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5901_raastof_till DROP CONSTRAINT t_5901_raastof_till_generel_fk;
ALTER TABLE fkg.t_5901_raastof_till ADD CONSTRAINT t_5901_raastof_till_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5901_raastof_till_d_5901_raastof_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5901_raastof_till DROP CONSTRAINT t_5901_raastof_till_d_5901_raastof_type_fk;
ALTER TABLE fkg.t_5901_raastof_till ADD CONSTRAINT t_5901_raastof_till_d_5901_raastof_type_fk FOREIGN KEY (raastof_type_kode)
REFERENCES fkg.d_5901_raastof_type (raastof_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5901_raastof_till_d_5901_gravestatus | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5901_raastof_till DROP CONSTRAINT t_5901_raastof_till_d_5901_gravestatus;
ALTER TABLE fkg.t_5901_raastof_till ADD CONSTRAINT t_5901_raastof_till_d_5901_gravestatus FOREIGN KEY (gravstatus_kode)
REFERENCES fkg.d_5901_gravestatus (gravstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5902_jordv_anl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5902_jordv_anl DROP CONSTRAINT t_5902_jordv_anl_generel_fk;
ALTER TABLE fkg.t_5902_jordv_anl ADD CONSTRAINT t_5902_jordv_anl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5902_jordv_anl_d_5902_vaeske_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5902_jordv_anl DROP CONSTRAINT t_5902_jordv_anl_d_5902_vaeske_type_fk;
ALTER TABLE fkg.t_5902_jordv_anl ADD CONSTRAINT t_5902_jordv_anl_d_5902_vaeske_type_fk FOREIGN KEY (vaesketype_kode)
REFERENCES fkg.d_5902_vaeske_type (vaesketype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5902_jordv_anl_d_basis_sag_status | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5902_jordv_anl DROP CONSTRAINT t_5902_jordv_anl_d_basis_sag_status;
ALTER TABLE fkg.t_5902_jordv_anl ADD CONSTRAINT t_5902_jordv_anl_d_basis_sag_status FOREIGN KEY (sag_status_kode)
REFERENCES fkg.d_basis_sag_status (sag_status_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5104_art_invas_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5104_art_invas DROP CONSTRAINT t_5104_art_invas_generel_fk;
ALTER TABLE fkg.t_5104_art_invas ADD CONSTRAINT t_5104_art_invas_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5104_art_invas_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5104_art_invas DROP CONSTRAINT t_5104_art_invas_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_5104_art_invas ADD CONSTRAINT t_5104_art_invas_d_basis_ja_nej_fk FOREIGN KEY (sortlistet_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5104_art_invas_d_basis_antal_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5104_art_invas DROP CONSTRAINT t_5104_art_invas_d_basis_antal_fk;
ALTER TABLE fkg.t_5104_art_invas ADD CONSTRAINT t_5104_art_invas_d_basis_antal_fk FOREIGN KEY (antal_kode)
REFERENCES fkg.d_basis_antal (antal_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5107_art_invas_p_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5107_art_invas_p DROP CONSTRAINT t_5107_art_invas_p_generel_fk;
ALTER TABLE fkg.t_5107_art_invas_p ADD CONSTRAINT t_5107_art_invas_p_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5107_art_invas_p_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5107_art_invas_p DROP CONSTRAINT t_5107_art_invas_p_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_5107_art_invas_p ADD CONSTRAINT t_5107_art_invas_p_d_basis_ja_nej_fk FOREIGN KEY (sortlistet_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5107_art_invas_p_d_basis_antal_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5107_art_invas_p DROP CONSTRAINT t_5107_art_invas_p_d_basis_antal_fk;
ALTER TABLE fkg.t_5107_art_invas_p ADD CONSTRAINT t_5107_art_invas_p_d_basis_antal_fk FOREIGN KEY (antal_kode)
REFERENCES fkg.d_basis_antal (antal_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5600_vintervedl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5600_vintervedl DROP CONSTRAINT t_5600_vintervedl_generel_fk;
ALTER TABLE fkg.t_5600_vintervedl ADD CONSTRAINT t_5600_vintervedl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5600_vintervedl_d_5600_rute_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5600_vintervedl DROP CONSTRAINT t_5600_vintervedl_d_5600_rute_fk;
ALTER TABLE fkg.t_5600_vintervedl ADD CONSTRAINT t_5600_vintervedl_d_5600_rute_fk FOREIGN KEY (rute_kode)
REFERENCES fkg.d_5600_rute (rute_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5601_hasti_daemp_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5601_hasti_daemp DROP CONSTRAINT t_5601_hasti_daemp_generel_fk;
ALTER TABLE fkg.t_5601_hasti_daemp ADD CONSTRAINT t_5601_hasti_daemp_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5601_hasti_daemp_d_5601_hasti_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5601_hasti_daemp DROP CONSTRAINT t_5601_hasti_daemp_d_5601_hasti_type_fk;
ALTER TABLE fkg.t_5601_hasti_daemp ADD CONSTRAINT t_5601_hasti_daemp_d_5601_hasti_type_fk FOREIGN KEY (hasti_type_kode)
REFERENCES fkg.d_5601_hasti_type (hasti_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5601_hasti_daemp_d_basis_hastighed_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5601_hasti_daemp DROP CONSTRAINT t_5601_hasti_daemp_d_basis_hastighed_fk;
ALTER TABLE fkg.t_5601_hasti_daemp ADD CONSTRAINT t_5601_hasti_daemp_d_basis_hastighed_fk FOREIGN KEY (hastighed_kode)
REFERENCES fkg.d_basis_hastighed (hastighed_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5602_p_zoner_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5602_p_zoner DROP CONSTRAINT t_5602_p_zoner_generel_fk;
ALTER TABLE fkg.t_5602_p_zoner ADD CONSTRAINT t_5602_p_zoner_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5602_p_zoner_d_5602_p_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5602_p_zoner DROP CONSTRAINT t_5602_p_zoner_d_5602_p_type_fk;
ALTER TABLE fkg.t_5602_p_zoner ADD CONSTRAINT t_5602_p_zoner_d_5602_p_type_fk FOREIGN KEY (p_type_kode)
REFERENCES fkg.d_5602_p_type (p_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5602_p_zoner_d_5602_p_tid_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5602_p_zoner DROP CONSTRAINT t_5602_p_zoner_d_5602_p_tid_fk;
ALTER TABLE fkg.t_5602_p_zoner ADD CONSTRAINT t_5602_p_zoner_d_5602_p_tid_fk FOREIGN KEY (p_tid_kode)
REFERENCES fkg.d_5602_p_tid (p_tid_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --



