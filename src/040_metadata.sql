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
	off_kode integer NOT NULL,
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
	ejerstatus character varying(50) NOT NULL,
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
	modeltype character varying(256),
	ydelse integer,
	senest_maalte_ydelse integer,
	placering_kode integer NOT NULL,
	lokalitet character varying(128),
	vejkode integer,
	cvf_vejkode character varying(7),
	husnr character varying(4),
	postnr integer,
	funktionsstatus_kode integer,
	aktiv_kode integer,
	senest_tilsyn date,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6100_brandhane_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6100_brandhane_brandhane_id_ck CHECK (brandhane_id BETWEEN 1 AND 99999),
	CONSTRAINT brandhane_id_ydelse_ck CHECK (ydelse BETWEEN 1 AND 9999),
	CONSTRAINT brandhane_id_senest_maalte_ydelse_ck CHECK (senest_maalte_ydelse BETWEEN 1 AND 9999),
	CONSTRAINT senest_maalte_ydelse_senest_tilsyn_ck CHECK (senest_tilsyn BETWEEN '2006-12-31' AND '2999-12-31')

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
	CONSTRAINT t_5105_rig_fattig_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5105_rig_fattig_stedid_ck CHECK (stedid BETWEEN 100000 AND 999999),
	CONSTRAINT t_5105_rig_fattig_natura_2000_ck CHECK (natura_2000 BETWEEN 1 AND 9999)

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
	CONSTRAINT t_5106_nat_pl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5106_nat_pl_omr_nr_ck CHECK (omr_nr BETWEEN 1 AND 99999),
	CONSTRAINT t_5106_nat_pl_antal_moder_ck CHECK (antal_moder BETWEEN 0 AND 999),
	CONSTRAINT t_5106_nat_pl_chr_ck CHECK (chr BETWEEN 0 AND 9999999),
	CONSTRAINT t_5106_nat_pl_telefon_ck CHECK (telefon BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_5106_nat_pl_mobil_ck CHECK (mobil BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_5106_nat_pl_ajour_ck CHECK (ajour BETWEEN '2006-12-31' AND '2999-12-31'
)

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
	CONSTRAINT versions_id_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5300_genopd_ret_genoptaget_ck CHECK (genoptaget BETWEEN 1999 AND 2999)

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
	CONSTRAINT t_5400_affalds_dis_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5400_affalds_dis_affalddistrikt_nr_ck CHECK (affalddistrikt_nr BETWEEN 1 AND 99999),
	CONSTRAINT t_5400_affalds_dis_renovatoer_cvr_ck CHECK (renovatoer_cvr BETWEEN 10000000 AND 99999999)

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
	gs_type character varying(128) NOT NULL,
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
	dekl_type character varying(25) NOT NULL,
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
	kotesystem character varying(250) NOT NULL,
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
	tilladelse_type character varying(20) NOT NULL,
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
	vedlhold_l_type_lable character varying(6) NOT NULL,
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
	vedlhold_p_type_lable character varying(6) NOT NULL,
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
	gs_navn character varying(50),
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
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5402_genbr_con_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5402_genbr_con_t_dato_ck CHECK (t_dato BETWEEN '1900-01-01' AND '2999-12-31')

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
	CONSTRAINT t_5200_aff_prod_udbr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5200_aff_prod_udbr_ejd_nr_ck CHECK (ejd_nr BETWEEN 1000000000 AND 9999999999),
	CONSTRAINT t_5200_aff_prod_udbr_dosering_toerstof_ck CHECK (dosering_toerstof BETWEEN 0.01 AND 9999.99),
	CONSTRAINT t_5200_aff_prod_udbr_dosering_vaadvaegt_ck CHECK (dosering_vaadvaegt BETWEEN 0.01 AND 9999.99),
	CONSTRAINT t_5200_aff_prod_udbr_phosphor_indhold_ck CHECK (phosphor_indhold BETWEEN 0.01 AND 9999.99),
	CONSTRAINT t_5200_aff_prod_udbr_udbringning_aar_ck CHECK (udbringning_aar BETWEEN 1900 AND 2999)

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
	CONSTRAINT t_5500_elfors_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5500_elfors_omr_net_s_nr_ck CHECK (net_s_nr BETWEEN 0 AND 99999999),
	CONSTRAINT t_5500_elfors_omr_fs_cvr_ck CHECK (fs_cvr BETWEEN 10000000 AND 99999999)

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
	CONSTRAINT t_5507_fiberkabel_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5507_fiberkabel_fs_cvr_ck CHECK (fs_cvr BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_5507_fiberkabel_dybde_ck CHECK (dybde BETWEEN 0.1 AND 9.9),
	CONSTRAINT t_5507_fiberkabel_aar_i_jord_ck CHECK (aar_i_jord BETWEEN 1900 AND 2999),
	CONSTRAINT t_5507_fiberkabel_antal_kabler_ck CHECK (antal_kabler BETWEEN 1 AND 99999)

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
	noegle character varying(128),
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
	CONSTRAINT t_5900_jordfl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5900_jordfl_afs_kommunekode_ck CHECK (afs_kommunekode BETWEEN 100 AND 999),
	CONSTRAINT t_5900_jordfl_modt_kommunekode_ck CHECK (modt_kommunekode BETWEEN 100 AND 999),
	CONSTRAINT t_5900_jordfl_jordflyt_dato_start_ck CHECK (jordflyt_dato_start BETWEEN '2006-12-13' AND '2999-12-31'),
	CONSTRAINT t_5900_jordfl_jordflyt_dato_slut_ck CHECK (jordflyt_dato_slut BETWEEN '2006-12-31' AND '2999-12-31'),
	CONSTRAINT t_5900_jordfl_tillad_dato_ck CHECK (tillad_dato BETWEEN '2006-12-31' AND '2999-12-31'),
	CONSTRAINT t_5900_jordfl_jordmaengde_faktisk_ck CHECK (jordmaengde_faktisk BETWEEN 1.0 AND 9999.9),
	CONSTRAINT t_5900_jordfl_jordmaengde_anmeldt_ck CHECK (jordmaengde_anmeldt BETWEEN 1.0 AND 9999.9)

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
	afslut_aar integer NOT NULL,
	gravstatus_kode integer NOT NULL,
	grusgrav_nr character varying(50),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5901_raastof_till_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5901_raastof_till_indv_cvr_ck CHECK (indv_cvr BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_5901_raastof_till_tillad_dato_ck CHECK (tillad_dato BETWEEN '2006-12-31' AND '2999-12-31'),
	CONSTRAINT t_5901_raastof_till_afslut_aar_ck CHECK (afslut_aar BETWEEN 1900 AND 2999)

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
	CONSTRAINT t_5902_jordv_anl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5902_jordv_anl_strenge_antal_ck CHECK (strenge_antal BETWEEN 1 AND 999),
	CONSTRAINT t_5902_jordv_anl_strenge_laengde_samlede_ck CHECK (strenge_laengde_samlede BETWEEN 1 AND 9999),
	CONSTRAINT t_5902_jordv_anl_tilladelses_dato_ck CHECK (tilladelses_dato BETWEEN '2006-12-31' AND '2999-12-31'),
	CONSTRAINT t_5902_jordv_anl_faerdigmeldingsdato_ck CHECK (faerdigmeldingsdato BETWEEN '2006-12-31' AND '2999-12-31')

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
-- object: fkg.t_5603_hasti_zone | type: TABLE --
-- DROP TABLE fkg.t_5603_hasti_zone;
CREATE TABLE fkg.t_5603_hasti_zone(
	versions_id uuid NOT NULL,
	hastighed_kode integer NOT NULL,
	anbefalet_hastighed_kode integer NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5603_hasti_zone_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5604_koer_begr | type: TABLE --
-- DROP TABLE fkg.t_5604_koer_begr;
CREATE TABLE fkg.t_5604_koer_begr(
	versions_id uuid,
	begr_type_kode integer NOT NULL,
	periode character varying(50) NOT NULL,
	vaegtbegr_akselt integer,
	vaegtbegr_totalv integer,
	fot_id integer,
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832),
	CONSTRAINT t_5604_koer_begr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5604_koer_begr_vaegtbegr_akselt_ck CHECK (vaegtbegr_akselt BETWEEN 1 AND 999),
	CONSTRAINT t_5604_koer_begr_vaegtbegr_totalv_ck CHECK (vaegtbegr_totalv BETWEEN 1 AND 999),
	CONSTRAINT t_5604_koer_begr_fot_id_ck CHECK (fot_id BETWEEN 0000000000 AND 2147483648)

);
-- ddl-end --
-- object: fkg.t_5605_vejbyggel | type: TABLE --
-- DROP TABLE fkg.t_5605_vejbyggel;
CREATE TABLE fkg.t_5605_vejbyggel(
	versions_id uuid NOT NULL,
	dekl_type_kode integer NOT NULL,
	vejkode integer,
	cvf_vejkode character varying(7),
	dekl_link character varying(254),
	bredde double precision,
	forskydning double precision,
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5605_vejbyggel_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5605_vejbyggel_bredde_ck CHECK (bredde BETWEEN 0.01 AND 999.99),
	CONSTRAINT t_5605_vejbyggel_forskydning_ck CHECK (forskydning BETWEEN -999.99 AND 999.99)

);
-- ddl-end --
-- object: fkg.t_5606_vejinv | type: TABLE --
-- DROP TABLE fkg.t_5606_vejinv;
CREATE TABLE fkg.t_5606_vejinv(
	versions_id uuid NOT NULL,
	inventar_nr character varying(50),
	inventar_type_kode integer NOT NULL,
	model character varying(50),
	tilstand_kode integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832),
	CONSTRAINT t_5606_vejinv_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5700_grundej | type: TABLE --
-- DROP TABLE fkg.t_5700_grundej;
CREATE TABLE fkg.t_5700_grundej(
	versions_id uuid NOT NULL,
	forening_type_kode integer NOT NULL,
	forening_navn character varying(50) NOT NULL,
	lokalpl_nr character varying(50),
	formand character varying(128) NOT NULL,
	gf_tlf integer,
	gf_adresse character varying(254),
	gf_mail character varying(254),
	gf_adr_beskyt_kode character,
	vedtaegt_kode integer,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_5700_grundej_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5700_grundej_gf_tlf_ck CHECK (gf_tlf BETWEEN 11111111 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_5701_lok_omr | type: TABLE --
-- DROP TABLE fkg.t_5701_lok_omr;
CREATE TABLE fkg.t_5701_lok_omr(
	versions_id uuid NOT NULL,
	lokalraad_navn character varying(128) NOT NULL,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_5701_lok_omr_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5702_skorst_fej | type: TABLE --
-- DROP TABLE fkg.t_5702_skorst_fej;
CREATE TABLE fkg.t_5702_skorst_fej(
	versions_id uuid NOT NULL,
	skorstenf_distrikt_nr integer,
	skorstenf_distrikt_navn character varying(128),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	skorstensfejer character varying(128) NOT NULL,
	sf_tlf integer,
	sf_adresse character varying(254),
	sf_mail character varying(254),
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5702_skorst_fej_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5702_skorst_fej_skorstenf_distrikt_nr_ck CHECK (skorstenf_distrikt_nr BETWEEN 1 AND 99999),
	CONSTRAINT t_5702_skorst_fej_sf_tlf_ck CHECK (sf_tlf BETWEEN 11111111 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_5703_afstem_sted | type: TABLE --
-- DROP TABLE fkg.t_5703_afstem_sted;
CREATE TABLE fkg.t_5703_afstem_sted(
	versions_id uuid NOT NULL,
	afstemningsomraade_nr character varying(128) NOT NULL,
	lokalitet character varying(128),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832),
	CONSTRAINT t_5703_afstem_sted_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5704_afstem_omr | type: TABLE --
-- DROP TABLE fkg.t_5704_afstem_omr;
CREATE TABLE fkg.t_5704_afstem_omr(
	versions_id uuid NOT NULL,
	afstemningsomraade_nr character varying(128) NOT NULL,
	opstillingskreds_nr integer,
	opstillingskreds_navn character varying(40),
	storkreds_nr integer,
	storkreds_navn character varying(40),
	ansvar_revision character varying(128),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_5704_afstem_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5704_afstem_omr_opstillingskreds_nr_ck CHECK (opstillingskreds_nr BETWEEN 1 AND 92),
	CONSTRAINT opstillingskreds_nr_storkreds_nr CHECK (storkreds_nr BETWEEN 1 AND 10)

);
-- ddl-end --
-- object: fkg.t_5705_forp_are | type: TABLE --
-- DROP TABLE fkg.t_5705_forp_are;
CREATE TABLE fkg.t_5705_forp_are(
	versions_id uuid NOT NULL,
	forpagter_navn character varying(128) NOT NULL,
	forpagter_formaal character varying(128),
	udlejning_kode integer NOT NULL,
	landbrug_kode integer,
	noter character varying(254),
	sagsnr character varying(128),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5705_forp_are_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5706_havn_are | type: TABLE --
-- DROP TABLE fkg.t_5706_havn_are;
CREATE TABLE fkg.t_5706_havn_are(
	versions_id uuid NOT NULL,
	havn_nr integer,
	havn_navn character varying(128),
	havne_type_kode integer NOT NULL,
	cvr_havn integer,
	ejer_admin character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_5706_havn_are_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5706_havn_are_havn_nr_ck CHECK (havn_nr BETWEEN 1 AND 99999),
	CONSTRAINT t_5706_havn_are_cvr_havn_ck CHECK (cvr_havn BETWEEN 10000000 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_5707_grunds | type: TABLE --
-- DROP TABLE fkg.t_5707_grunds;
CREATE TABLE fkg.t_5707_grunds(
	versions_id uuid NOT NULL,
	udstyk_navn character varying(50),
	grund_type_kode integer NOT NULL,
	salg_status_kode integer NOT NULL,
	pris integer,
	mindste_pris integer,
	kvm_pris double precision,
	kontakt_oplys character varying(128),
	grundareal integer,
	bygningareal integer,
	budfrist_slut timestamptz,
	sagsnr character varying(128),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5707_grunds_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5707_grunds_pris_ck CHECK (pris BETWEEN 1 AND 99999999),
	CONSTRAINT t_5707_grunds_mindste_pris_ck CHECK (mindste_pris BETWEEN 1 AND 99999999),
	CONSTRAINT t_5707_grunds_grundareal_ck CHECK (grundareal BETWEEN 1 AND 999999),
	CONSTRAINT t_5707_grunds_bygningareal_ck CHECK (bygningareal BETWEEN 1 AND 99999),
	CONSTRAINT t_5707_grunds_budfrist_slut_ck CHECK (budfrist_slut BETWEEN '2006-12-31T23:59:00.000+01:00' AND '2999-12-31T23:59:00.000+01:00')

);
-- ddl-end --
-- object: fkg.t_5710_born_skole_dis | type: TABLE --
-- DROP TABLE fkg.t_5710_born_skole_dis;
CREATE TABLE fkg.t_5710_born_skole_dis(
	versions_id uuid NOT NULL,
	udd_distrikt_nr integer,
	udd_distrikt_navn character varying(128),
	udd_distrikt_type_kode integer NOT NULL,
	starttrin_kode integer NOT NULL,
	sluttrin_kode integer NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5710_born_skole_dis_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5711_and_dis | type: TABLE --
-- DROP TABLE fkg.t_5711_and_dis;
CREATE TABLE fkg.t_5711_and_dis(
	versions_id uuid NOT NULL,
	an_distrikt_nr integer,
	an_distrikt_navn character varying(128),
	an_distrikt_type_kode integer NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5711_and_dis_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5711_and_dis_an_distrikt_nr_ck CHECK (an_distrikt_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_5712_plej_aeldr_dis | type: TABLE --
-- DROP TABLE fkg.t_5712_plej_aeldr_dis;
CREATE TABLE fkg.t_5712_plej_aeldr_dis(
	versions_id uuid NOT NULL,
	plej_distrikt_nr integer,
	plej_distrikt_navn character varying(128),
	plej_distrikt_type_kode integer NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5712_plej_aeldr_dis_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5712_plej_aeldr_dis_plej_distrikt_nr_ck CHECK (plej_distrikt_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_5713_prog_stat_dis | type: TABLE --
-- DROP TABLE fkg.t_5713_prog_stat_dis;
CREATE TABLE fkg.t_5713_prog_stat_dis(
	versions_id uuid NOT NULL,
	prog_distrikt_nr integer,
	prog_distrikt_navn character varying(128),
	prog_distrikt_type_kode integer NOT NULL,
	noegle character varying(128),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5713_prog_stat_dis_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5713_prog_stat_dis_prog_distrikt_nr_ck CHECK (prog_distrikt_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_5714_laering_udd_inst | type: TABLE --
-- DROP TABLE fkg.t_5714_laering_udd_inst;
CREATE TABLE fkg.t_5714_laering_udd_inst(
	versions_id uuid NOT NULL,
	udd_institution_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	udd_institution_navn character varying(128) NOT NULL,
	starttrin_kode integer NOT NULL,
	sluttrin_kode integer NOT NULL,
	noegle character varying(128),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5714_laering_udd_inst_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5715_botilbud | type: TABLE --
-- DROP TABLE fkg.t_5715_botilbud;
CREATE TABLE fkg.t_5715_botilbud(
	versions_id uuid NOT NULL,
	botilbud_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	botilbud_navn character varying(128) NOT NULL,
	noegle character varying(128),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5715_botilbud_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_5716_servicetilbud | type: TABLE --
-- DROP TABLE fkg.t_5716_servicetilbud;
CREATE TABLE fkg.t_5716_servicetilbud(
	versions_id uuid NOT NULL,
	service_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	servicetilbud_navn character varying(128) NOT NULL,
	nogle character varying(128),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5716_servicetilbud_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_5710_udd_distrikt_type | type: TABLE --
-- DROP TABLE fkg.d_5710_udd_distrikt_type;
CREATE TABLE fkg.d_5710_udd_distrikt_type(
	udd_distrikt_type_kode integer NOT NULL,
	udd_distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5710_udd_distrikt_type_pk PRIMARY KEY (udd_distrikt_type_kode)

);
-- ddl-end --
-- object: fkg.d_5711_an_distrikt_type | type: TABLE --
-- DROP TABLE fkg.d_5711_an_distrikt_type;
CREATE TABLE fkg.d_5711_an_distrikt_type(
	an_distrikt_type_kode integer NOT NULL,
	an_distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5711_an_distrikt_type_pk PRIMARY KEY (an_distrikt_type_kode)

);
-- ddl-end --
-- object: fkg.d_5712_plej_distrikt_type | type: TABLE --
-- DROP TABLE fkg.d_5712_plej_distrikt_type;
CREATE TABLE fkg.d_5712_plej_distrikt_type(
	plej_distrikt_type_kode integer NOT NULL,
	plej_distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5712_plej_distrikt_type_pk PRIMARY KEY (plej_distrikt_type_kode)

);
-- ddl-end --
-- object: fkg.d_5713_prog_distrikt_type | type: TABLE --
-- DROP TABLE fkg.d_5713_prog_distrikt_type;
CREATE TABLE fkg.d_5713_prog_distrikt_type(
	prog_distrikt_type_kode integer NOT NULL,
	prog_distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5713_prog_distrikt_type_pk PRIMARY KEY (prog_distrikt_type_kode)

);
-- ddl-end --
-- object: fkg.d_5714_udd_institution_type | type: TABLE --
-- DROP TABLE fkg.d_5714_udd_institution_type;
CREATE TABLE fkg.d_5714_udd_institution_type(
	udd_institution_type_kode integer NOT NULL,
	udd_institution_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5714_udd_institution_type_pk PRIMARY KEY (udd_institution_type_kode)

);
-- ddl-end --
-- object: fkg.d_basis_trin | type: TABLE --
-- DROP TABLE fkg.d_basis_trin;
CREATE TABLE fkg.d_basis_trin(
	trin_kode integer NOT NULL,
	trin character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_trin_pk PRIMARY KEY (trin_kode)

);
-- ddl-end --
-- object: fkg.d_5715_botilbud_type | type: TABLE --
-- DROP TABLE fkg.d_5715_botilbud_type;
CREATE TABLE fkg.d_5715_botilbud_type(
	botilbud_type_kode integer NOT NULL,
	botilbud_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	"Begrebsdefinition" character varying,
	CONSTRAINT d_5715_botilbud_type_pk PRIMARY KEY (botilbud_type_kode)

);
-- ddl-end --
-- object: fkg.d_5716_servicetilbud_type | type: TABLE --
-- DROP TABLE fkg.d_5716_servicetilbud_type;
CREATE TABLE fkg.d_5716_servicetilbud_type(
	service_type_kode integer NOT NULL,
	service_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5716_servicetilbud_type_pk PRIMARY KEY (service_type_kode)

);
-- ddl-end --
-- object: fkg.t_6000_pot | type: TABLE --
-- DROP TABLE fkg.t_6000_pot;
CREATE TABLE fkg.t_6000_pot(
	versions_id uuid NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	kote double precision NOT NULL,
	navn character varying(50),
	aekvidistance double precision,
	magasin_kode integer,
	pejling character varying(50),
	oprind_kilde character varying(50),
	metode character varying(250),
	reference character varying(250),
	kotesystem_kode integer,
	usikkerhed character varying(250),
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_6000_pot_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6000_pot_kote_ck CHECK (kote BETWEEN -999.99 AND 999.99),
	CONSTRAINT t_6000_pot_aekvidistance_ck CHECK (aekvidistance BETWEEN 0.1 AND 999.9)

);
-- ddl-end --
-- object: fkg.t_6001_pot_m | type: TABLE --
-- DROP TABLE fkg.t_6001_pot_m;
CREATE TABLE fkg.t_6001_pot_m(
	versions_id uuid NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	potentialekort character varying(250),
	stoettep_kode integer NOT NULL,
	dgu_nr character varying(50),
	dybde double precision NOT NULL,
	aekvidistance double precision,
	magasin_kode integer,
	pejling character varying(50),
	oprind_kilde character varying(50),
	kotesystem_kode integer,
	usikkerhed character varying(250),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6001_pot_m_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6001_pot_m_dybde_ck CHECK (dybde BETWEEN 1 AND 999.99),
	CONSTRAINT t_6001_pot_m_aekvidistance_ck CHECK (aekvidistance BETWEEN 0.1 AND 999.9)

);
-- ddl-end --
-- object: fkg.t_6002_indv | type: TABLE --
-- DROP TABLE fkg.t_6002_indv;
CREATE TABLE fkg.t_6002_indv(
	versions_id uuid NOT NULL,
	vandv_nr character varying(25),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	indsatsomraade character varying(128),
	indv_maengde_aar double precision,
	kildeplads character varying(50),
	reference character varying(50),
	metode character varying(50),
	dgu_nr character varying(50),
	indtag character varying(50),
	dato_beregn date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_6002_indv_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6002_indv_indv_maengde_aar_ck CHECK (indv_maengde_aar BETWEEN 0.1 AND 99999.9),
	CONSTRAINT t_6002_indv_dato_beregn_ck CHECK (dato_beregn BETWEEN '2006-12-31' AND '2999-12-31')

);
-- ddl-end --
-- object: fkg.t_6003_besk_zone | type: TABLE --
-- DROP TABLE fkg.t_6003_besk_zone;
CREATE TABLE fkg.t_6003_besk_zone(
	versions_id uuid NOT NULL,
	dgu_nr character varying(10),
	kildeplads character varying(254),
	indsatsomraade character varying(128),
	vandv_nr character varying(25),
	jup_nr character varying(50),
	tilladelse integer,
	tilladelse_gyldig character varying(50),
	beskyt_zone integer,
	beskyt_zone_gyldig character varying(50),
	lokalitet character varying(128),
	zone_type_kode integer NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6003_besk_zone_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6003_besk_zone_tilladelse_ck CHECK (tilladelse BETWEEN 1 AND 999999),
	CONSTRAINT t_6003_besk_zone_beskyt_zone_ck CHECK (beskyt_zone BETWEEN 1 AND 9999)

);
-- ddl-end --
-- object: fkg.t_6004_vandv_fs | type: TABLE --
-- DROP TABLE fkg.t_6004_vandv_fs;
CREATE TABLE fkg.t_6004_vandv_fs(
	versions_id uuid NOT NULL,
	vandv_nr character varying(25),
	fors_omr_type_kode integer,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6004_vandv_fs_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6006_grundv_opl | type: TABLE --
-- DROP TABLE fkg.t_6006_grundv_opl;
CREATE TABLE fkg.t_6006_grundv_opl(
	versions_id uuid NOT NULL,
	vandv_nr character varying(25),
	oplandtype character varying(128),
	indsatsomraade character varying(128),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6006_grundv_opl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6007_inds_omr | type: TABLE --
-- DROP TABLE fkg.t_6007_inds_omr;
CREATE TABLE fkg.t_6007_inds_omr(
	versions_id uuid NOT NULL,
	indsatsomr_navn character varying(50) NOT NULL,
	stoerrelse character varying(50),
	ansvar_myndighed character varying(128) NOT NULL,
	vedtagelse character varying(50),
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6007_inds_omr_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6008_maks_bor | type: TABLE --
-- DROP TABLE fkg.t_6008_maks_bor;
CREATE TABLE fkg.t_6008_maks_bor(
	versions_id uuid NOT NULL,
	boredybde integer NOT NULL,
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6008_maks_bor_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6008_maks_bor_boredybde_ck CHECK (boredybde BETWEEN 1 AND 99)

);
-- ddl-end --
-- object: fkg.t_6009_indv_ovflv | type: TABLE --
-- DROP TABLE fkg.t_6009_indv_ovflv;
CREATE TABLE fkg.t_6009_indv_ovflv(
	versions_id uuid NOT NULL,
	indv_maengde_aar character varying(50),
	indv_kapacitet double precision,
	indvinder_navn character varying(50) NOT NULL,
	indvinder_kontakt character varying(50),
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6009_indv_ovflv_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6009_indv_ovflv_indv_kapacitet_ck CHECK (indv_kapacitet BETWEEN 0.01 AND 99999.99)

);
-- ddl-end --
-- object: fkg.d_basis_vandv_nr | type: TABLE --
-- DROP TABLE fkg.d_basis_vandv_nr;
CREATE TABLE fkg.d_basis_vandv_nr(
	vandv_nr character varying(25) NOT NULL,
	vandv character varying(128),
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_vandv_nr_pk PRIMARY KEY (vandv_nr)

);
-- ddl-end --
-- object: fkg.t_6101_beskyt_rum | type: TABLE --
-- DROP TABLE fkg.t_6101_beskyt_rum;
CREATE TABLE fkg.t_6101_beskyt_rum(
	versions_id uuid NOT NULL,
	beskyt_rum_kode integer NOT NULL,
	klargjort_kode integer NOT NULL,
	pladser integer NOT NULL,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6101_beskyt_rum_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6103_bered_omr | type: TABLE --
-- DROP TABLE fkg.t_6103_bered_omr;
CREATE TABLE fkg.t_6103_bered_omr(
	versions_id uuid NOT NULL,
	bereds_distrikt_nr integer,
	bereds_distrikt_navn character varying(128),
	udrykker character varying(50) NOT NULL,
	noegle character varying(128),
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832),
	CONSTRAINT t_6103_bered_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6103_bered_omr_bereds_distrikt_nr_ck CHECK (bereds_distrikt_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_6104_risiko_virk | type: TABLE --
-- DROP TABLE fkg.t_6104_risiko_virk;
CREATE TABLE fkg.t_6104_risiko_virk(
	versions_id uuid NOT NULL,
	risikotype_kode integer NOT NULL,
	cvr_risi_virk integer,
	kontakt_tlf integer NOT NULL,
	brandhaem_kode integer NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6104_risiko_virk_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6104_risiko_virk_cvr_risi_virk_ck CHECK (cvr_risi_virk BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_6104_risiko_virk_kontakt_tlf_ck CHECK (kontakt_tlf BETWEEN 11111111 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_6105_sbygn_omr | type: TABLE --
-- DROP TABLE fkg.t_6105_sbygn_omr;
CREATE TABLE fkg.t_6105_sbygn_omr(
	versions_id uuid NOT NULL,
	saer_distrikt_nr integer,
	saer_distrikt_navn character varying(128),
	navn character varying(128) NOT NULL,
	kontakt_info character varying(128) NOT NULL,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6105_sbygn_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6105_sbygn_omr_saer_distrikt_nr_ck CHECK (saer_distrikt_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_6107_forholds | type: TABLE --
-- DROP TABLE fkg.t_6107_forholds;
CREATE TABLE fkg.t_6107_forholds(
	versions_id uuid NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	bra_kode character varying(50),
	net_adr character varying(50) NOT NULL,
	cvr_firma integer,
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	adr_i_tekst character varying(128),
	tlf_arbejde integer,
	tlf_dag integer,
	tlf_nat integer,
	aba_kode integer NOT NULL,
	avs_kode integer NOT NULL,
	ars_kode integer NOT NULL,
	noegleboks_kode integer,
	noeglested character varying(128),
	central_placering character varying(128),
	opgave_ankomst character varying(128) NOT NULL,
	prs_1 character varying(128),
	prs_2 character varying(128),
	prs_3 character varying(128),
	prs_4 character varying(128),
	prs_5 character varying(128),
	system_fkt character varying(128),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6107_forholds_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6107_forholds_cvr_firma_ck CHECK (cvr_firma BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_6107_forholds_tlf_arbejde_ck CHECK (tlf_arbejde BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_6107_forholds_tlf_dag_ck CHECK (tlf_dag BETWEEN 10000000 AND 99999999),
	CONSTRAINT t_6107_forholds_tlf_nat_ck CHECK (tlf_nat BETWEEN 10000000 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_6108_moedepl | type: TABLE --
-- DROP TABLE fkg.t_6108_moedepl;
CREATE TABLE fkg.t_6108_moedepl(
	versions_id uuid NOT NULL,
	navn character varying(128) NOT NULL,
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	noter character varying(254),
	bemaerkning character varying(254),
	link_tegn character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6108_moedepl_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6110_noegle | type: TABLE --
-- DROP TABLE fkg.t_6110_noegle;
CREATE TABLE fkg.t_6110_noegle(
	versions_id uuid NOT NULL,
	bra_kode character varying(50),
	tyv_alarm_kode integer NOT NULL,
	noegleboksnr character varying(256),
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	bemaerkning character varying(254),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6110_noegle_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6111_fyrv_till | type: TABLE --
-- DROP TABLE fkg.t_6111_fyrv_till;
CREATE TABLE fkg.t_6111_fyrv_till(
	versions_id uuid NOT NULL,
	firma character varying(128) NOT NULL,
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	tilladelse_type_kode integer NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6111_fyrv_till_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6112_midl_dep | type: TABLE --
-- DROP TABLE fkg.t_6112_midl_dep;
CREATE TABLE fkg.t_6112_midl_dep(
	versions_id uuid NOT NULL,
	cvr integer NOT NULL,
	virksomhed_navn character varying(128),
	virksomhed_type character varying(50),
	depottype_kode integer NOT NULL,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6112_midl_dep_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6112_midl_dep_cvr_ck CHECK (cvr BETWEEN 11111111 AND 99999999)

);
-- ddl-end --
-- object: fkg.t_6113_besk_nat_b | type: TABLE --
-- DROP TABLE fkg.t_6113_besk_nat_b;
CREATE TABLE fkg.t_6113_besk_nat_b(
	versions_id uuid NOT NULL,
	noegle character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6113_besk_nat_b_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6114_midl_oph | type: TABLE --
-- DROP TABLE fkg.t_6114_midl_oph;
CREATE TABLE fkg.t_6114_midl_oph(
	versions_id uuid NOT NULL,
	institution_navn character varying(128) NOT NULL,
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	adr_i_tekst character varying(128),
	suppl_sted_beskrivelse character varying(128),
	kontaktperson character varying(128) NOT NULL,
	kontakttelefonnr integer,
	antal_personer integer,
	gyldig_fra date NOT NULL,
	gyldig_til date,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6114_midl_oph_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6115_afbr_omr | type: TABLE --
-- DROP TABLE fkg.t_6115_afbr_omr;
CREATE TABLE fkg.t_6115_afbr_omr(
	versions_id uuid NOT NULL,
	afbr_nr integer,
	afbr_navn character varying(128),
	afbr_type_kode integer NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6115_afbr_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6115_afbr_omr_afbr_nr_ck CHECK (afbr_nr BETWEEN 1 AND 99999)

);
-- ddl-end --
-- object: fkg.t_6116_olie_ber_pl | type: TABLE --
-- DROP TABLE fkg.t_6116_olie_ber_pl;
CREATE TABLE fkg.t_6116_olie_ber_pl(
	versions_id uuid NOT NULL,
	navn character varying(128),
	strandtype_kode integer NOT NULL,
	prioritet integer,
	esi_klasse_kode integer,
	baad_kode integer,
	sagsnr character varying(128),
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6116_olie_ber_pl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6116_olie_ber_pl_prioritet_ck CHECK (prioritet BETWEEN 1 AND 9)

);
-- ddl-end --
-- object: fkg.t_6117_inds_pkt | type: TABLE --
-- DROP TABLE fkg.t_6117_inds_pkt;
CREATE TABLE fkg.t_6117_inds_pkt(
	versions_id uuid NOT NULL,
	nr_navn character varying(20) NOT NULL,
	beskrivelse character varying(254),
	adgang character varying(254),
	vej_afstand integer,
	ansvar character varying(50),
	indsatstype_kode integer NOT NULL,
	noter character varying(254),
	sagsnr character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6117_inds_pkt_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6117_inds_pkt_vej_afstand_ck CHECK (vej_afstand BETWEEN 1 AND 9999)

);
-- ddl-end --
-- object: fkg.t_6118_bran_redn | type: TABLE --
-- DROP TABLE fkg.t_6118_bran_redn;
CREATE TABLE fkg.t_6118_bran_redn(
	versions_id uuid NOT NULL,
	redarea_type_kode integer NOT NULL,
	rednarea_underomr character varying(20),
	noter character varying(254),
	bygn_kompleks character varying(128),
	byg_sag_nr character varying(50) NOT NULL,
	vejkode integer,
	cvf_vejkode character(7),
	husnr character varying(4),
	postnr integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6118_bran_redn_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_6118_brand_redarea_type | type: TABLE --
-- DROP TABLE fkg.d_6118_brand_redarea_type;
CREATE TABLE fkg.d_6118_brand_redarea_type(
	brand_redarea_type_kode integer NOT NULL,
	brand_redarea_type character varying(15) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6118_brand_redarea_type_pk PRIMARY KEY (brand_redarea_type_kode)

);
-- ddl-end --
-- object: fkg.t_6200_nat_geo | type: TABLE --
-- DROP TABLE fkg.t_6200_nat_geo;
CREATE TABLE fkg.t_6200_nat_geo(
	versions_id uuid NOT NULL,
	data_oprindelse character varying(128),
	omraade_nr integer,
	geologi_kode integer NOT NULL,
	geo_ref character varying(1024),
	jordtype_kode integer NOT NULL,
	terraen_kode integer NOT NULL,
	terraen_ref character varying(1024),
	kompleksitet_kode integer NOT NULL,
	vandelementer character varying(1024),
	farvandsomraade character varying(1024),
	strandbredden character varying(1024),
	begrund_afgraensning character varying(1024),
	omr_sammenhaeng character varying(1024),
	farvand_strand_ref character varying(1024),
	naturgeo_beskrivelse character varying(1024),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6200_nat_geo_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6201_kult_geo | type: TABLE --
-- DROP TABLE fkg.t_6201_kult_geo;
CREATE TABLE fkg.t_6201_kult_geo(
	versions_id uuid NOT NULL,
	data_oprindelse character varying(128),
	omraade_nr integer,
	begrund_afgraensning character varying(1024) NOT NULL,
	link_litteratur character varying(1024),
	link_vejledning character varying(1024),
	link_reg_skema character varying(1024),
	kulturgeo_beskrivelse character varying(1024),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6201_kult_geo_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6202_landk_omr | type: TABLE --
-- DROP TABLE fkg.t_6202_landk_omr;
CREATE TABLE fkg.t_6202_landk_omr(
	versions_id uuid NOT NULL,
	omraade_nr integer,
	dato_besigtig date,
	navn_besigtig character varying(128),
	rev_dato date,
	landskabskarakteren character varying(1024) NOT NULL,
	tidsdybde_kode integer,
	tidsdybde_beskr character varying(1024),
	intakthed_kode integer NOT NULL,
	intakthed_beskr character varying(1024),
	noeglefunktioner character varying(1024),
	afgr_naboomr character varying(1024),
	vejledn_afgr_naboomr character varying(1024),
	skala_kode integer,
	skala_beskrivelse character varying(1024),
	rumlig_afgraensning_kode integer,
	rumlig_beskrivelse character varying(1024),
	kompleksitet_kode integer,
	kompleksitet_beskrivelse character varying(1024),
	struktur_kode integer,
	struktur_beskrivelse character varying(1024),
	visuel_uro_kode integer,
	visuel_uro_beskrivelse character varying(1024),
	kystforhold character varying(1024),
	oplevelser character varying(1024),
	analysekort character varying(1024),
	link_reg_skema character varying(1024),
	link_vejledning character varying(1024),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6202_landk_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6202_landk_omr_dato_besigtig_ck CHECK (dato_besigtig BETWEEN '2006-12-31' AND '2999-12-31'),
	CONSTRAINT t_6202_landk_omr_rev_dato_ck CHECK (rev_dato BETWEEN '2006-12-31' AND '2999-12-31')

);
-- ddl-end --
-- object: fkg.t_6203_landk_vur | type: TABLE --
-- DROP TABLE fkg.t_6203_landk_vur;
CREATE TABLE fkg.t_6203_landk_vur(
	versions_id uuid NOT NULL,
	omraade_nr integer,
	delomraade_nr character varying(4),
	karakterstyrke_kode integer NOT NULL,
	karakterstyrke_notat character varying(1024),
	visuel_notat character varying(1024),
	tilstand_kode integer,
	tilstand_notat character varying(1024),
	udvikling character varying(1024),
	saarbarhed_kode integer,
	saarbarhed_notat character varying(1024),
	tiltag character varying(1024),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6203_landk_vur_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.t_6800_parl_fl | type: TABLE --
-- DROP TABLE fkg.t_6800_parl_fl;
CREATE TABLE fkg.t_6800_parl_fl(
	versions_id uuid NOT NULL,
	vedlhold_f_type_kode integer NOT NULL,
	arbejdssted character varying(150),
	konto_nr character varying(150),
	udfoerer_enterp character varying(50),
	kommunal_kontakt character varying(150),
	anlaegsaar date,
	etabl_pleje_udloeb date,
	udskiftningaar date,
	udtyndaar date,
	klip_hoejde double precision,
	klip_sider integer,
	klip_flade double precision,
	driftniv_kode integer,
	ukrudtsbek_kode integer,
	tilstand_kode integer,
	noegle character varying(128),
	noter character varying(254),
	vejkode integer,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6800_parl_fl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6800_parl_fl_anlaegsaar_ck CHECK (anlaegsaar BETWEEN '01-01-1600' AND '31-12-2999'),
	CONSTRAINT t_6800_parl_fl_etabl_pleje_udloeb_ck CHECK (etabl_pleje_udloeb BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6800_parl_fl_udskiftningaar_ck CHECK (udskiftningaar BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6800_parl_fl_udtyndaar_ck CHECK (udtyndaar BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6800_parl_fl_klip_hoejde_ck CHECK (klip_hoejde BETWEEN 0.01 AND 9.99),
	CONSTRAINT t_6800_parl_fl_klip_sider_ck CHECK (klip_sider BETWEEN 0 AND 2),
	CONSTRAINT t_6800_parl_fl_klip_flade_ck CHECK (klip_flade BETWEEN 0.01 AND 99999.99)

);
-- ddl-end --
-- object: fkg.t_6801_parl_li | type: TABLE --
-- DROP TABLE fkg.t_6801_parl_li;
CREATE TABLE fkg.t_6801_parl_li(
	versions_id uuid NOT NULL,
	vedlhold_l_type_kode integer NOT NULL,
	arbejdssted character varying(150),
	konto_nr character varying(150),
	udfoerer_enterp character varying(50),
	kommunal_kontakt character varying(150),
	anlaegsaar date,
	etabl_pleje_udloeb date,
	udskiftningaar date,
	klip_flade double precision,
	klip_hoejde double precision,
	klip_sider integer,
	klip_bredde double precision,
	driftniv_kode integer,
	ukrudtsbek_kode integer,
	tilstand_kode integer,
	noegle character varying(128),
	noter character varying(254),
	vejkode integer,
	link character varying(1024),
	geometri geometry(MULTILINESTRING, 25832) NOT NULL,
	CONSTRAINT t_6801_parl_li_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6801_parl_li_anlaegsaar_ck CHECK (anlaegsaar BETWEEN '01-01-1600' AND '31-12-2999'),
	CONSTRAINT t_6801_parl_li_etabl_pleje_udloeb_ck CHECK (etabl_pleje_udloeb BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6801_parl_li_udskiftningaar_ck CHECK (udskiftningaar BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6801_parl_li_klip_flade_ck CHECK (klip_flade BETWEEN 0.01 AND 99999.99),
	CONSTRAINT t_6801_parl_li_klip_hoejde_ck CHECK (klip_hoejde BETWEEN 0.01 AND 9.99),
	CONSTRAINT t_6801_parl_li_klip_sider_ck CHECK (klip_sider BETWEEN 0 AND 2),
	CONSTRAINT t_6801_parl_li_klip_bredde_ck CHECK (klip_bredde BETWEEN 0.01 AND 9.99)

);
-- ddl-end --
-- object: fkg.t_6802_parl_pkt | type: TABLE --
-- DROP TABLE fkg.t_6802_parl_pkt;
CREATE TABLE fkg.t_6802_parl_pkt(
	versions_id uuid NOT NULL,
	vedlhold_p_type_kode integer NOT NULL,
	arbejdssted character varying(150),
	konto_nr character varying(150),
	udfoerer_enterp character varying(50),
	kommunal_kontakt character varying(150),
	anlaegsaar date,
	etabl_pleje_udloeb date,
	udskiftningaar date,
	klip_flade double precision,
	driftniv_kode integer,
	ukrudtsbek_kode integer,
	tilstand_kode integer,
	noegle character varying(128),
	noter character varying(254),
	vejkode integer,
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_6802_parl_pkt_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6802_parl_pkt_anlaegsaar_ck CHECK (anlaegsaar BETWEEN '01-01-1600' AND '31-12-2999'),
	CONSTRAINT t_6802_parl_pkt_etabl_pleje_udloeb_ck CHECK (etabl_pleje_udloeb BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6802_parl_pkt_udskiftningaar_ck CHECK (udskiftningaar BETWEEN '01-01-2007' AND '31-12-2999'),
	CONSTRAINT t_6802_parl_pkt_klip_flade_ck CHECK (klip_flade BETWEEN 0.01 AND 99999.99)

);
-- ddl-end --
-- object: fkg.t_6803_parl_omr | type: TABLE --
-- DROP TABLE fkg.t_6803_parl_omr;
CREATE TABLE fkg.t_6803_parl_omr(
	versions_id uuid NOT NULL,
	pg_distrikt_kode integer NOT NULL,
	pg_distrikt_nr character varying(150),
	ansvarlig character varying(50),
	udfoerer character varying(50),
	udfoerer_kontakt1 character varying(50),
	udfoerer_kontakt2 character varying(50),
	kommunal_kontakt character varying(150),
	note character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_6803_parl_omr_pk PRIMARY KEY (versions_id)

);
-- ddl-end --
-- object: fkg.d_basis_offentlig | type: TABLE --
-- DROP TABLE fkg.d_basis_offentlig;
CREATE TABLE fkg.d_basis_offentlig(
	off_kode integer NOT NULL,
	offentlig character varying(60) NOT NULL,
	aktiv integer NOT NULL,
	CONSTRAINT d_basis_offentlig_pk PRIMARY KEY (off_kode)

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


-- object: generel_d_basis_offentlig_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.generel DROP CONSTRAINT generel_d_basis_offentlig_fk;
ALTER TABLE fkg.generel ADD CONSTRAINT generel_d_basis_offentlig_fk FOREIGN KEY (off_kode)
REFERENCES fkg.d_basis_offentlig (off_kode) MATCH FULL
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
REFERENCES fkg.d_basis_trussel_vand (trussel_vand_kode) MATCH FULL
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


-- object: t_6100_brandhane_d_6100_placering_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_6100_placering_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_6100_placering_fk FOREIGN KEY (placering_kode)
REFERENCES fkg.d_6100_placering (placering_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_basis_funktionsstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_basis_funktionsstatus_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_basis_funktionsstatus_fk FOREIGN KEY (funktionsstatus_kode)
REFERENCES fkg.d_basis_funktionsstatus (funktionsstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_vejnavn_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_basis_postnr_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6100_brandhane_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6100_brandhane DROP CONSTRAINT t_6100_brandhane_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_6100_brandhane ADD CONSTRAINT t_6100_brandhane_d_basis_ja_nej_fk FOREIGN KEY (aktiv_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
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


-- object: t_6102_redn_vej_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6102_redn_vej DROP CONSTRAINT t_6102_redn_vej_d_vejnavn_fk;
ALTER TABLE fkg.t_6102_redn_vej ADD CONSTRAINT t_6102_redn_vej_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6102_redn_vej_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6102_redn_vej DROP CONSTRAINT t_6102_redn_vej_d_basis_postnr_fk;
ALTER TABLE fkg.t_6102_redn_vej ADD CONSTRAINT t_6102_redn_vej_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
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


-- object: t_5106_nat_pl_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5106_nat_pl DROP CONSTRAINT t_5106_nat_pl_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5106_nat_pl ADD CONSTRAINT t_5106_nat_pl_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
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


-- object: t_5508_husst_moel_d5508_stoej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5508_husst_moel DROP CONSTRAINT t_5508_husst_moel_d5508_stoej_fk;
ALTER TABLE fkg.t_5508_husst_moel ADD CONSTRAINT t_5508_husst_moel_d5508_stoej_fk FOREIGN KEY (stoej_kode)
REFERENCES fkg.d_5508_stoej (stoej_kode) MATCH FULL
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


-- object: t_5901_raastof_till_d_5901_gravestatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5901_raastof_till DROP CONSTRAINT t_5901_raastof_till_d_5901_gravestatus_fk;
ALTER TABLE fkg.t_5901_raastof_till ADD CONSTRAINT t_5901_raastof_till_d_5901_gravestatus_fk FOREIGN KEY (gravstatus_kode)
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


-- object: t_5902_jordv_anl_d_basis_sag_status_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5902_jordv_anl DROP CONSTRAINT t_5902_jordv_anl_d_basis_sag_status_fk;
ALTER TABLE fkg.t_5902_jordv_anl ADD CONSTRAINT t_5902_jordv_anl_d_basis_sag_status_fk FOREIGN KEY (sag_status_kode)
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


-- object: t_5603_hasti_zone_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5603_hasti_zone DROP CONSTRAINT t_5603_hasti_zone_generel_fk;
ALTER TABLE fkg.t_5603_hasti_zone ADD CONSTRAINT t_5603_hasti_zone_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5603_hasti_zone_d_basis_hastighed_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5603_hasti_zone DROP CONSTRAINT t_5603_hasti_zone_d_basis_hastighed_fk;
ALTER TABLE fkg.t_5603_hasti_zone ADD CONSTRAINT t_5603_hasti_zone_d_basis_hastighed_fk FOREIGN KEY (hastighed_kode)
REFERENCES fkg.d_basis_hastighed (hastighed_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5603_hasti_zone_d_basis_hastighed_anbefalet_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5603_hasti_zone DROP CONSTRAINT t_5603_hasti_zone_d_basis_hastighed_anbefalet_fk;
ALTER TABLE fkg.t_5603_hasti_zone ADD CONSTRAINT t_5603_hasti_zone_d_basis_hastighed_anbefalet_fk FOREIGN KEY (anbefalet_hastighed_kode)
REFERENCES fkg.d_basis_hastighed (hastighed_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5604_koer_begr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5604_koer_begr DROP CONSTRAINT t_5604_koer_begr_generel_fk;
ALTER TABLE fkg.t_5604_koer_begr ADD CONSTRAINT t_5604_koer_begr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5604_koer_begr_d_5604_begr_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5604_koer_begr DROP CONSTRAINT t_5604_koer_begr_d_5604_begr_type_fk;
ALTER TABLE fkg.t_5604_koer_begr ADD CONSTRAINT t_5604_koer_begr_d_5604_begr_type_fk FOREIGN KEY (begr_type_kode)
REFERENCES fkg.d_5604_begr_type (begr_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5605_vejbyggel_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5605_vejbyggel DROP CONSTRAINT t_5605_vejbyggel_generel_fk;
ALTER TABLE fkg.t_5605_vejbyggel ADD CONSTRAINT t_5605_vejbyggel_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5605_vejbyggel_d_5605_dekl_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5605_vejbyggel DROP CONSTRAINT t_5605_vejbyggel_d_5605_dekl_type_fk;
ALTER TABLE fkg.t_5605_vejbyggel ADD CONSTRAINT t_5605_vejbyggel_d_5605_dekl_type_fk FOREIGN KEY (dekl_type_kode)
REFERENCES fkg.d_5605_dekl_type (dekl_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5605_vejbyggel_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5605_vejbyggel DROP CONSTRAINT t_5605_vejbyggel_d_vejnavn_fk;
ALTER TABLE fkg.t_5605_vejbyggel ADD CONSTRAINT t_5605_vejbyggel_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5606_vejinv_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5606_vejinv DROP CONSTRAINT t_5606_vejinv_generel_fk;
ALTER TABLE fkg.t_5606_vejinv ADD CONSTRAINT t_5606_vejinv_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5606_vejinv_d_5606_inventar_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5606_vejinv DROP CONSTRAINT t_5606_vejinv_d_5606_inventar_type_fk;
ALTER TABLE fkg.t_5606_vejinv ADD CONSTRAINT t_5606_vejinv_d_5606_inventar_type_fk FOREIGN KEY (inventar_type_kode)
REFERENCES fkg.d_5606_inventar_type (inventar_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5606_vejinv_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5606_vejinv DROP CONSTRAINT t_5606_vejinv_d_basis_tilstand_fk;
ALTER TABLE fkg.t_5606_vejinv ADD CONSTRAINT t_5606_vejinv_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5700_grundej_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5700_grundej DROP CONSTRAINT t_5700_grundej_generel_fk;
ALTER TABLE fkg.t_5700_grundej ADD CONSTRAINT t_5700_grundej_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5700_grundej_d_5700_forening_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5700_grundej DROP CONSTRAINT t_5700_grundej_d_5700_forening_type_fk;
ALTER TABLE fkg.t_5700_grundej ADD CONSTRAINT t_5700_grundej_d_5700_forening_type_fk FOREIGN KEY (forening_type_kode)
REFERENCES fkg.d_5700_forening_type (forening_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5700_grundej_d_5700_adr_beskyt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5700_grundej DROP CONSTRAINT t_5700_grundej_d_5700_adr_beskyt_fk;
ALTER TABLE fkg.t_5700_grundej ADD CONSTRAINT t_5700_grundej_d_5700_adr_beskyt_fk FOREIGN KEY (gf_adr_beskyt_kode)
REFERENCES fkg.d_5700_adr_beskyt (gf_adr_beskyt_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5700_grundej_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5700_grundej DROP CONSTRAINT t_5700_grundej_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_5700_grundej ADD CONSTRAINT t_5700_grundej_d_basis_ja_nej_fk FOREIGN KEY (vedtaegt_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5701_lok_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5701_lok_omr DROP CONSTRAINT t_5701_lok_omr_generel_fk;
ALTER TABLE fkg.t_5701_lok_omr ADD CONSTRAINT t_5701_lok_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5702_skorst_fej_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5702_skorst_fej DROP CONSTRAINT t_5702_skorst_fej_generel_fk;
ALTER TABLE fkg.t_5702_skorst_fej ADD CONSTRAINT t_5702_skorst_fej_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5703_afstem_sted_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5703_afstem_sted DROP CONSTRAINT t_5703_afstem_sted_generel_fk;
ALTER TABLE fkg.t_5703_afstem_sted ADD CONSTRAINT t_5703_afstem_sted_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5703_afstem_sted_d_basis_afstemningsomraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5703_afstem_sted DROP CONSTRAINT t_5703_afstem_sted_d_basis_afstemningsomraade_fk;
ALTER TABLE fkg.t_5703_afstem_sted ADD CONSTRAINT t_5703_afstem_sted_d_basis_afstemningsomraade_fk FOREIGN KEY (afstemningsomraade_nr)
REFERENCES fkg.d_basis_afstemningsomraade (afstemningsomraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5703_afstem_sted_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5703_afstem_sted DROP CONSTRAINT t_5703_afstem_sted_vejnavn_fk;
ALTER TABLE fkg.t_5703_afstem_sted ADD CONSTRAINT t_5703_afstem_sted_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5703_afstem_sted_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5703_afstem_sted DROP CONSTRAINT t_5703_afstem_sted_d_basis_postnr_fk;
ALTER TABLE fkg.t_5703_afstem_sted ADD CONSTRAINT t_5703_afstem_sted_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5704_afstem_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5704_afstem_omr DROP CONSTRAINT t_5704_afstem_omr_generel_fk;
ALTER TABLE fkg.t_5704_afstem_omr ADD CONSTRAINT t_5704_afstem_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5704_afstem_omr_d_basis_afstemningsomraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5704_afstem_omr DROP CONSTRAINT t_5704_afstem_omr_d_basis_afstemningsomraade_fk;
ALTER TABLE fkg.t_5704_afstem_omr ADD CONSTRAINT t_5704_afstem_omr_d_basis_afstemningsomraade_fk FOREIGN KEY (afstemningsomraade_nr)
REFERENCES fkg.d_basis_afstemningsomraade (afstemningsomraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5705_forp_are_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5705_forp_are DROP CONSTRAINT t_5705_forp_are_generel_fk;
ALTER TABLE fkg.t_5705_forp_are ADD CONSTRAINT t_5705_forp_are_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5705_forp_are_d_5705_udlejning_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5705_forp_are DROP CONSTRAINT t_5705_forp_are_d_5705_udlejning_fk;
ALTER TABLE fkg.t_5705_forp_are ADD CONSTRAINT t_5705_forp_are_d_5705_udlejning_fk FOREIGN KEY (udlejning_kode)
REFERENCES fkg.d_5705_udlejning (udlejning_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5705_forp_are_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5705_forp_are DROP CONSTRAINT t_5705_forp_are_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_5705_forp_are ADD CONSTRAINT t_5705_forp_are_d_basis_ja_nej_fk FOREIGN KEY (landbrug_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5706_havn_are_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5706_havn_are DROP CONSTRAINT t_5706_havn_are_generel_fk;
ALTER TABLE fkg.t_5706_havn_are ADD CONSTRAINT t_5706_havn_are_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5706_havn_are_d_5706_havn_type | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5706_havn_are DROP CONSTRAINT t_5706_havn_are_d_5706_havn_type;
ALTER TABLE fkg.t_5706_havn_are ADD CONSTRAINT t_5706_havn_are_d_5706_havn_type FOREIGN KEY (havne_type_kode)
REFERENCES fkg.d_5706_havn_type (havn_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5707_grunds_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5707_grunds DROP CONSTRAINT t_5707_grunds_generel_fk;
ALTER TABLE fkg.t_5707_grunds ADD CONSTRAINT t_5707_grunds_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5707_grunds_d5707_grund_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5707_grunds DROP CONSTRAINT t_5707_grunds_d5707_grund_type_fk;
ALTER TABLE fkg.t_5707_grunds ADD CONSTRAINT t_5707_grunds_d5707_grund_type_fk FOREIGN KEY (grund_type_kode)
REFERENCES fkg.d_5707_grund_type (grund_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5707_grunds_d5707_salg_status_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5707_grunds DROP CONSTRAINT t_5707_grunds_d5707_salg_status_fk;
ALTER TABLE fkg.t_5707_grunds ADD CONSTRAINT t_5707_grunds_d5707_salg_status_fk FOREIGN KEY (salg_status_kode)
REFERENCES fkg.d_5707_salg_status (salg_status_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5707_grunds_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5707_grunds DROP CONSTRAINT t_5707_grunds_d_vejnavn_fk;
ALTER TABLE fkg.t_5707_grunds ADD CONSTRAINT t_5707_grunds_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5707_grunds_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5707_grunds DROP CONSTRAINT t_5707_grunds_d_basis_postnr_fk;
ALTER TABLE fkg.t_5707_grunds ADD CONSTRAINT t_5707_grunds_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5710_born_skole_dis_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5710_born_skole_dis DROP CONSTRAINT t_5710_born_skole_dis_generel_fk;
ALTER TABLE fkg.t_5710_born_skole_dis ADD CONSTRAINT t_5710_born_skole_dis_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5710_born_skole_dis_d_5710_udd_distrikt_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5710_born_skole_dis DROP CONSTRAINT t_5710_born_skole_dis_d_5710_udd_distrikt_type_fk;
ALTER TABLE fkg.t_5710_born_skole_dis ADD CONSTRAINT t_5710_born_skole_dis_d_5710_udd_distrikt_type_fk FOREIGN KEY (udd_distrikt_type_kode)
REFERENCES fkg.d_5710_udd_distrikt_type (udd_distrikt_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5710_born_skole_dis_d_basis_trin_starttrin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5710_born_skole_dis DROP CONSTRAINT t_5710_born_skole_dis_d_basis_trin_starttrin_fk;
ALTER TABLE fkg.t_5710_born_skole_dis ADD CONSTRAINT t_5710_born_skole_dis_d_basis_trin_starttrin_fk FOREIGN KEY (starttrin_kode)
REFERENCES fkg.d_basis_trin (trin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5710_born_skole_dis_d_basis_trin_sluttrin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5710_born_skole_dis DROP CONSTRAINT t_5710_born_skole_dis_d_basis_trin_sluttrin_fk;
ALTER TABLE fkg.t_5710_born_skole_dis ADD CONSTRAINT t_5710_born_skole_dis_d_basis_trin_sluttrin_fk FOREIGN KEY (sluttrin_kode)
REFERENCES fkg.d_basis_trin (trin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5711_and_dis_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5711_and_dis DROP CONSTRAINT t_5711_and_dis_generel_fk;
ALTER TABLE fkg.t_5711_and_dis ADD CONSTRAINT t_5711_and_dis_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5711_and_dis_d_5711_an_distrikt_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5711_and_dis DROP CONSTRAINT t_5711_and_dis_d_5711_an_distrikt_type_fk;
ALTER TABLE fkg.t_5711_and_dis ADD CONSTRAINT t_5711_and_dis_d_5711_an_distrikt_type_fk FOREIGN KEY (an_distrikt_type_kode)
REFERENCES fkg.d_5711_an_distrikt_type (an_distrikt_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5712_plej_aeldr_dis_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5712_plej_aeldr_dis DROP CONSTRAINT t_5712_plej_aeldr_dis_generel_fk;
ALTER TABLE fkg.t_5712_plej_aeldr_dis ADD CONSTRAINT t_5712_plej_aeldr_dis_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5712_plej_aeldr_dis_d_5712_plej_distrikt_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5712_plej_aeldr_dis DROP CONSTRAINT t_5712_plej_aeldr_dis_d_5712_plej_distrikt_type_fk;
ALTER TABLE fkg.t_5712_plej_aeldr_dis ADD CONSTRAINT t_5712_plej_aeldr_dis_d_5712_plej_distrikt_type_fk FOREIGN KEY (plej_distrikt_type_kode)
REFERENCES fkg.d_5712_plej_distrikt_type (plej_distrikt_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5713_prog_stat_dis_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5713_prog_stat_dis DROP CONSTRAINT t_5713_prog_stat_dis_generel_fk;
ALTER TABLE fkg.t_5713_prog_stat_dis ADD CONSTRAINT t_5713_prog_stat_dis_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5713_prog_stat_dis_d_5713_prog_distrikt_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5713_prog_stat_dis DROP CONSTRAINT t_5713_prog_stat_dis_d_5713_prog_distrikt_type_fk;
ALTER TABLE fkg.t_5713_prog_stat_dis ADD CONSTRAINT t_5713_prog_stat_dis_d_5713_prog_distrikt_type_fk FOREIGN KEY (prog_distrikt_type_kode)
REFERENCES fkg.d_5713_prog_distrikt_type (prog_distrikt_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_generel_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_5714_udd_institution_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_5714_udd_institution_type_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_5714_udd_institution_type_fk FOREIGN KEY (udd_institution_type_kode)
REFERENCES fkg.d_5714_udd_institution_type (udd_institution_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_basis_trin_starttrin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_basis_trin_starttrin_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_basis_trin_starttrin_fk FOREIGN KEY (starttrin_kode)
REFERENCES fkg.d_basis_trin (trin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_basis_trin_sluttrin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_basis_trin_sluttrin_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_basis_trin_sluttrin_fk FOREIGN KEY (sluttrin_kode)
REFERENCES fkg.d_basis_trin (trin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_vejnavn_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_basis_postnr | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_basis_postnr;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_basis_postnr FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5714_laering_udd_inst_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5714_laering_udd_inst DROP CONSTRAINT t_5714_laering_udd_inst_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5714_laering_udd_inst ADD CONSTRAINT t_5714_laering_udd_inst_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5715_botilbud_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5715_botilbud DROP CONSTRAINT t_5715_botilbud_generel_fk;
ALTER TABLE fkg.t_5715_botilbud ADD CONSTRAINT t_5715_botilbud_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5715_botilbud_d_5715_botilbud_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5715_botilbud DROP CONSTRAINT t_5715_botilbud_d_5715_botilbud_type_fk;
ALTER TABLE fkg.t_5715_botilbud ADD CONSTRAINT t_5715_botilbud_d_5715_botilbud_type_fk FOREIGN KEY (botilbud_type_kode)
REFERENCES fkg.d_5715_botilbud_type (botilbud_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5715_botilbud_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5715_botilbud DROP CONSTRAINT t_5715_botilbud_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5715_botilbud ADD CONSTRAINT t_5715_botilbud_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5715_botilbud_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5715_botilbud DROP CONSTRAINT t_5715_botilbud_d_vejnavn_fk;
ALTER TABLE fkg.t_5715_botilbud ADD CONSTRAINT t_5715_botilbud_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5715_botilbud_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5715_botilbud DROP CONSTRAINT t_5715_botilbud_d_basis_postnr_fk;
ALTER TABLE fkg.t_5715_botilbud ADD CONSTRAINT t_5715_botilbud_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5716_servicetilbud_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5716_servicetilbud DROP CONSTRAINT t_5716_servicetilbud_generel_fk;
ALTER TABLE fkg.t_5716_servicetilbud ADD CONSTRAINT t_5716_servicetilbud_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5716_servicetilbud_d_5716_servicetilbud_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5716_servicetilbud DROP CONSTRAINT t_5716_servicetilbud_d_5716_servicetilbud_type_fk;
ALTER TABLE fkg.t_5716_servicetilbud ADD CONSTRAINT t_5716_servicetilbud_d_5716_servicetilbud_type_fk FOREIGN KEY (service_type_kode)
REFERENCES fkg.d_5716_servicetilbud_type (service_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5716_servicetilbud_d_basis_ejerstatus_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5716_servicetilbud DROP CONSTRAINT t_5716_servicetilbud_d_basis_ejerstatus_fk;
ALTER TABLE fkg.t_5716_servicetilbud ADD CONSTRAINT t_5716_servicetilbud_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5716_servicetilbud_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5716_servicetilbud DROP CONSTRAINT t_5716_servicetilbud_d_vejnavn_fk;
ALTER TABLE fkg.t_5716_servicetilbud ADD CONSTRAINT t_5716_servicetilbud_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_5716_servicetilbud_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_5716_servicetilbud DROP CONSTRAINT t_5716_servicetilbud_d_basis_postnr_fk;
ALTER TABLE fkg.t_5716_servicetilbud ADD CONSTRAINT t_5716_servicetilbud_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6000_pot_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6000_pot DROP CONSTRAINT t_6000_pot_generel_fk;
ALTER TABLE fkg.t_6000_pot ADD CONSTRAINT t_6000_pot_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6000_pot_d_basis_magasin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6000_pot DROP CONSTRAINT t_6000_pot_d_basis_magasin_fk;
ALTER TABLE fkg.t_6000_pot ADD CONSTRAINT t_6000_pot_d_basis_magasin_fk FOREIGN KEY (magasin_kode)
REFERENCES fkg.d_basis_magasin (magasin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6000_pot | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6000_pot DROP CONSTRAINT t_6000_pot;
ALTER TABLE fkg.t_6000_pot ADD CONSTRAINT t_6000_pot FOREIGN KEY (kotesystem_kode)
REFERENCES fkg.d_6000_kotesystem (kotesystem_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6001_pot_m_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6001_pot_m DROP CONSTRAINT t_6001_pot_m_generel_fk;
ALTER TABLE fkg.t_6001_pot_m ADD CONSTRAINT t_6001_pot_m_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6001_pot_m_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6001_pot_m DROP CONSTRAINT t_6001_pot_m_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_6001_pot_m ADD CONSTRAINT t_6001_pot_m_d_basis_ja_nej_fk FOREIGN KEY (stoettep_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6001_pot_m_d_basis_magasin_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6001_pot_m DROP CONSTRAINT t_6001_pot_m_d_basis_magasin_fk;
ALTER TABLE fkg.t_6001_pot_m ADD CONSTRAINT t_6001_pot_m_d_basis_magasin_fk FOREIGN KEY (magasin_kode)
REFERENCES fkg.d_basis_magasin (magasin_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6001_pot_m_d_6000_kotesystem_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6001_pot_m DROP CONSTRAINT t_6001_pot_m_d_6000_kotesystem_fk;
ALTER TABLE fkg.t_6001_pot_m ADD CONSTRAINT t_6001_pot_m_d_6000_kotesystem_fk FOREIGN KEY (kotesystem_kode)
REFERENCES fkg.d_6000_kotesystem (kotesystem_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6002_indv_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6002_indv DROP CONSTRAINT t_6002_indv_generel_fk;
ALTER TABLE fkg.t_6002_indv ADD CONSTRAINT t_6002_indv_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6002_indv_d_basis_vandv_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6002_indv DROP CONSTRAINT t_6002_indv_d_basis_vandv_fk;
ALTER TABLE fkg.t_6002_indv ADD CONSTRAINT t_6002_indv_d_basis_vandv_fk FOREIGN KEY (vandv_nr)
REFERENCES fkg.d_basis_vandv_nr (vandv_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6003_besk_zone_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6003_besk_zone DROP CONSTRAINT t_6003_besk_zone_generel_fk;
ALTER TABLE fkg.t_6003_besk_zone ADD CONSTRAINT t_6003_besk_zone_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6003_besk_zone_d_basis_vandv_nr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6003_besk_zone DROP CONSTRAINT t_6003_besk_zone_d_basis_vandv_nr_fk;
ALTER TABLE fkg.t_6003_besk_zone ADD CONSTRAINT t_6003_besk_zone_d_basis_vandv_nr_fk FOREIGN KEY (vandv_nr)
REFERENCES fkg.d_basis_vandv_nr (vandv_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6003_besk_zone_d_6003_zone_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6003_besk_zone DROP CONSTRAINT t_6003_besk_zone_d_6003_zone_type_fk;
ALTER TABLE fkg.t_6003_besk_zone ADD CONSTRAINT t_6003_besk_zone_d_6003_zone_type_fk FOREIGN KEY (zone_type_kode)
REFERENCES fkg.d_6003_zone_type (zone_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6004_vandv_fs_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6004_vandv_fs DROP CONSTRAINT t_6004_vandv_fs_generel_fk;
ALTER TABLE fkg.t_6004_vandv_fs ADD CONSTRAINT t_6004_vandv_fs_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6004_vandv_fs_d_basis_vandv_nr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6004_vandv_fs DROP CONSTRAINT t_6004_vandv_fs_d_basis_vandv_nr_fk;
ALTER TABLE fkg.t_6004_vandv_fs ADD CONSTRAINT t_6004_vandv_fs_d_basis_vandv_nr_fk FOREIGN KEY (vandv_nr)
REFERENCES fkg.d_basis_vandv_nr (vandv_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6004_vandv_fs_d_basis_fors_omr_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6004_vandv_fs DROP CONSTRAINT t_6004_vandv_fs_d_basis_fors_omr_type_fk;
ALTER TABLE fkg.t_6004_vandv_fs ADD CONSTRAINT t_6004_vandv_fs_d_basis_fors_omr_type_fk FOREIGN KEY (fors_omr_type_kode)
REFERENCES fkg.d_basis_fors_omr_type (fors_omr_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6006_grundv_opl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6006_grundv_opl DROP CONSTRAINT t_6006_grundv_opl_generel_fk;
ALTER TABLE fkg.t_6006_grundv_opl ADD CONSTRAINT t_6006_grundv_opl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6006_grundv_opl_d_basis_vandv_nr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6006_grundv_opl DROP CONSTRAINT t_6006_grundv_opl_d_basis_vandv_nr_fk;
ALTER TABLE fkg.t_6006_grundv_opl ADD CONSTRAINT t_6006_grundv_opl_d_basis_vandv_nr_fk FOREIGN KEY (vandv_nr)
REFERENCES fkg.d_basis_vandv_nr (vandv_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6007_inds_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6007_inds_omr DROP CONSTRAINT t_6007_inds_omr_generel_fk;
ALTER TABLE fkg.t_6007_inds_omr ADD CONSTRAINT t_6007_inds_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6008_maks_bor_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6008_maks_bor DROP CONSTRAINT t_6008_maks_bor_generel_fk;
ALTER TABLE fkg.t_6008_maks_bor ADD CONSTRAINT t_6008_maks_bor_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6009_indv_ovflv_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6009_indv_ovflv DROP CONSTRAINT t_6009_indv_ovflv_generel_fk;
ALTER TABLE fkg.t_6009_indv_ovflv ADD CONSTRAINT t_6009_indv_ovflv_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6101_beskyt_rum_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6101_beskyt_rum DROP CONSTRAINT t_6101_beskyt_rum_generel_fk;
ALTER TABLE fkg.t_6101_beskyt_rum ADD CONSTRAINT t_6101_beskyt_rum_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6101_beskyt_rum_d_6101_beskyt_rum_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6101_beskyt_rum DROP CONSTRAINT t_6101_beskyt_rum_d_6101_beskyt_rum_fk;
ALTER TABLE fkg.t_6101_beskyt_rum ADD CONSTRAINT t_6101_beskyt_rum_d_6101_beskyt_rum_fk FOREIGN KEY (beskyt_rum_kode)
REFERENCES fkg.d_6101_beskyt_rum (beskyt_rum_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6101_beskyt_rum_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6101_beskyt_rum DROP CONSTRAINT t_6101_beskyt_rum_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_6101_beskyt_rum ADD CONSTRAINT t_6101_beskyt_rum_d_basis_ja_nej_fk FOREIGN KEY (klargjort_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6103_bered_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6103_bered_omr DROP CONSTRAINT t_6103_bered_omr_generel_fk;
ALTER TABLE fkg.t_6103_bered_omr ADD CONSTRAINT t_6103_bered_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6104_risiko_virk_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6104_risiko_virk DROP CONSTRAINT t_6104_risiko_virk_generel_fk;
ALTER TABLE fkg.t_6104_risiko_virk ADD CONSTRAINT t_6104_risiko_virk_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6104_risiko_virk_d_6104_risikotype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6104_risiko_virk DROP CONSTRAINT t_6104_risiko_virk_d_6104_risikotype_fk;
ALTER TABLE fkg.t_6104_risiko_virk ADD CONSTRAINT t_6104_risiko_virk_d_6104_risikotype_fk FOREIGN KEY (risikotype_kode)
REFERENCES fkg.d_6104_risikotype (risikotype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6104_risiko_virk_d_6104_brandhaem_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6104_risiko_virk DROP CONSTRAINT t_6104_risiko_virk_d_6104_brandhaem_fk;
ALTER TABLE fkg.t_6104_risiko_virk ADD CONSTRAINT t_6104_risiko_virk_d_6104_brandhaem_fk FOREIGN KEY (brandhaem_kode)
REFERENCES fkg.d_6104_brandhaem (brandhaem_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6105_sbygn_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6105_sbygn_omr DROP CONSTRAINT t_6105_sbygn_omr_generel_fk;
ALTER TABLE fkg.t_6105_sbygn_omr ADD CONSTRAINT t_6105_sbygn_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_generel_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_vejnavn_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_basis_postnr_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_basis_ja_nej_aba_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_basis_ja_nej_aba_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_basis_ja_nej_aba_fk FOREIGN KEY (aba_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_basis_ja_nej_avs_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_basis_ja_nej_avs_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_basis_ja_nej_avs_fk FOREIGN KEY (avs_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_basis_ja_nej_ars_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_basis_ja_nej_ars_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_basis_ja_nej_ars_fk FOREIGN KEY (ars_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6107_forholds_d_basis_ja_nej_noegleboks_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6107_forholds DROP CONSTRAINT t_6107_forholds_d_basis_ja_nej_noegleboks_fk;
ALTER TABLE fkg.t_6107_forholds ADD CONSTRAINT t_6107_forholds_d_basis_ja_nej_noegleboks_fk FOREIGN KEY (noegleboks_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6108_moedepl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6108_moedepl DROP CONSTRAINT t_6108_moedepl_generel_fk;
ALTER TABLE fkg.t_6108_moedepl ADD CONSTRAINT t_6108_moedepl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6108_moedepl_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6108_moedepl DROP CONSTRAINT t_6108_moedepl_d_vejnavn_fk;
ALTER TABLE fkg.t_6108_moedepl ADD CONSTRAINT t_6108_moedepl_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6108_moedepl_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6108_moedepl DROP CONSTRAINT t_6108_moedepl_d_basis_postnr_fk;
ALTER TABLE fkg.t_6108_moedepl ADD CONSTRAINT t_6108_moedepl_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6110_noegle_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6110_noegle DROP CONSTRAINT t_6110_noegle_generel_fk;
ALTER TABLE fkg.t_6110_noegle ADD CONSTRAINT t_6110_noegle_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6110_noegle_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6110_noegle DROP CONSTRAINT t_6110_noegle_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_6110_noegle ADD CONSTRAINT t_6110_noegle_d_basis_ja_nej_fk FOREIGN KEY (tyv_alarm_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6110_noegle_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6110_noegle DROP CONSTRAINT t_6110_noegle_d_vejnavn_fk;
ALTER TABLE fkg.t_6110_noegle ADD CONSTRAINT t_6110_noegle_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6110_noegle_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6110_noegle DROP CONSTRAINT t_6110_noegle_d_basis_postnr_fk;
ALTER TABLE fkg.t_6110_noegle ADD CONSTRAINT t_6110_noegle_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6111_fyrv_till_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6111_fyrv_till DROP CONSTRAINT t_6111_fyrv_till_generel_fk;
ALTER TABLE fkg.t_6111_fyrv_till ADD CONSTRAINT t_6111_fyrv_till_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6111_fyrv_till_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6111_fyrv_till DROP CONSTRAINT t_6111_fyrv_till_d_vejnavn_fk;
ALTER TABLE fkg.t_6111_fyrv_till ADD CONSTRAINT t_6111_fyrv_till_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6111_fyrv_till_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6111_fyrv_till DROP CONSTRAINT t_6111_fyrv_till_d_basis_postnr_fk;
ALTER TABLE fkg.t_6111_fyrv_till ADD CONSTRAINT t_6111_fyrv_till_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6111_fyrv_till_d_6111_tilladelse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6111_fyrv_till DROP CONSTRAINT t_6111_fyrv_till_d_6111_tilladelse_fk;
ALTER TABLE fkg.t_6111_fyrv_till ADD CONSTRAINT t_6111_fyrv_till_d_6111_tilladelse_fk FOREIGN KEY (tilladelse_type_kode)
REFERENCES fkg.d_6111_tilladelse (tilladelse_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6112_midl_dep_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6112_midl_dep DROP CONSTRAINT t_6112_midl_dep_generel_fk;
ALTER TABLE fkg.t_6112_midl_dep ADD CONSTRAINT t_6112_midl_dep_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6112_midl_dep_d_6112_depottype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6112_midl_dep DROP CONSTRAINT t_6112_midl_dep_d_6112_depottype_fk;
ALTER TABLE fkg.t_6112_midl_dep ADD CONSTRAINT t_6112_midl_dep_d_6112_depottype_fk FOREIGN KEY (depottype_kode)
REFERENCES fkg.d_6112_depottype (depottype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6113_besk_nat_b_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6113_besk_nat_b DROP CONSTRAINT t_6113_besk_nat_b_generel_fk;
ALTER TABLE fkg.t_6113_besk_nat_b ADD CONSTRAINT t_6113_besk_nat_b_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6114_midl_oph_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6114_midl_oph DROP CONSTRAINT t_6114_midl_oph_generel_fk;
ALTER TABLE fkg.t_6114_midl_oph ADD CONSTRAINT t_6114_midl_oph_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6114_midl_oph_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6114_midl_oph DROP CONSTRAINT t_6114_midl_oph_d_vejnavn_fk;
ALTER TABLE fkg.t_6114_midl_oph ADD CONSTRAINT t_6114_midl_oph_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6114_midl_oph_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6114_midl_oph DROP CONSTRAINT t_6114_midl_oph_d_basis_postnr_fk;
ALTER TABLE fkg.t_6114_midl_oph ADD CONSTRAINT t_6114_midl_oph_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6115_afbr_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6115_afbr_omr DROP CONSTRAINT t_6115_afbr_omr_generel_fk;
ALTER TABLE fkg.t_6115_afbr_omr ADD CONSTRAINT t_6115_afbr_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6115_afbr_omr_d_6115_afbr_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6115_afbr_omr DROP CONSTRAINT t_6115_afbr_omr_d_6115_afbr_type_fk;
ALTER TABLE fkg.t_6115_afbr_omr ADD CONSTRAINT t_6115_afbr_omr_d_6115_afbr_type_fk FOREIGN KEY (afbr_type_kode)
REFERENCES fkg.d_6115_afbr_type (afbr_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6116_olie_ber_pl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6116_olie_ber_pl DROP CONSTRAINT t_6116_olie_ber_pl_generel_fk;
ALTER TABLE fkg.t_6116_olie_ber_pl ADD CONSTRAINT t_6116_olie_ber_pl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6116_olie_ber_pl_d_6116_strandtype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6116_olie_ber_pl DROP CONSTRAINT t_6116_olie_ber_pl_d_6116_strandtype_fk;
ALTER TABLE fkg.t_6116_olie_ber_pl ADD CONSTRAINT t_6116_olie_ber_pl_d_6116_strandtype_fk FOREIGN KEY (strandtype_kode)
REFERENCES fkg.d_6116_strandtype (strandtype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6116_olie_ber_pl_d_6116_esi_klasse_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6116_olie_ber_pl DROP CONSTRAINT t_6116_olie_ber_pl_d_6116_esi_klasse_fk;
ALTER TABLE fkg.t_6116_olie_ber_pl ADD CONSTRAINT t_6116_olie_ber_pl_d_6116_esi_klasse_fk FOREIGN KEY (esi_klasse_kode)
REFERENCES fkg.d_6116_esi_klasse (esi_klasse_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6116_olie_ber_pl_d_basis_ja_nej_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6116_olie_ber_pl DROP CONSTRAINT t_6116_olie_ber_pl_d_basis_ja_nej_fk;
ALTER TABLE fkg.t_6116_olie_ber_pl ADD CONSTRAINT t_6116_olie_ber_pl_d_basis_ja_nej_fk FOREIGN KEY (baad_kode)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6117_inds_pkt_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6117_inds_pkt DROP CONSTRAINT t_6117_inds_pkt_generel_fk;
ALTER TABLE fkg.t_6117_inds_pkt ADD CONSTRAINT t_6117_inds_pkt_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6117_inds_pkt_d_6117_indsatstype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6117_inds_pkt DROP CONSTRAINT t_6117_inds_pkt_d_6117_indsatstype_fk;
ALTER TABLE fkg.t_6117_inds_pkt ADD CONSTRAINT t_6117_inds_pkt_d_6117_indsatstype_fk FOREIGN KEY (indsatstype_kode)
REFERENCES fkg.d_6117_indsatstype (indsatstype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6118_bran_redn_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6118_bran_redn DROP CONSTRAINT t_6118_bran_redn_generel_fk;
ALTER TABLE fkg.t_6118_bran_redn ADD CONSTRAINT t_6118_bran_redn_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6118_bran_redn_d_6118_brand_redarea_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6118_bran_redn DROP CONSTRAINT t_6118_bran_redn_d_6118_brand_redarea_type_fk;
ALTER TABLE fkg.t_6118_bran_redn ADD CONSTRAINT t_6118_bran_redn_d_6118_brand_redarea_type_fk FOREIGN KEY (redarea_type_kode)
REFERENCES fkg.d_6118_brand_redarea_type (brand_redarea_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6118_bran_redn_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6118_bran_redn DROP CONSTRAINT t_6118_bran_redn_d_vejnavn_fk;
ALTER TABLE fkg.t_6118_bran_redn ADD CONSTRAINT t_6118_bran_redn_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6118_bran_redn_d_basis_postnr_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6118_bran_redn DROP CONSTRAINT t_6118_bran_redn_d_basis_postnr_fk;
ALTER TABLE fkg.t_6118_bran_redn ADD CONSTRAINT t_6118_bran_redn_d_basis_postnr_fk FOREIGN KEY (postnr)
REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_generel_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_d_basis_omraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_d_basis_omraade_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_d_basis_omraade_fk FOREIGN KEY (omraade_nr)
REFERENCES fkg.d_basis_omraade (omraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_d_6200_geologi_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_d_6200_geologi_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_d_6200_geologi_fk FOREIGN KEY (geologi_kode)
REFERENCES fkg.d_6200_geologi (geologi_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_d_6200_jordtype_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_d_6200_jordtype_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_d_6200_jordtype_fk FOREIGN KEY (jordtype_kode)
REFERENCES fkg.d_6200_jordtype (jordtype_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_d_6200_terraen_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_d_6200_terraen_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_d_6200_terraen_fk FOREIGN KEY (terraen_kode)
REFERENCES fkg.d_6200_terraen (terraen_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6200_nat_geo_6200_kompleksitet_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6200_nat_geo DROP CONSTRAINT t_6200_nat_geo_6200_kompleksitet_fk;
ALTER TABLE fkg.t_6200_nat_geo ADD CONSTRAINT t_6200_nat_geo_6200_kompleksitet_fk FOREIGN KEY (kompleksitet_kode)
REFERENCES fkg.d_6200_kompleksitet (kompleksitet_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6201_kult_geo_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6201_kult_geo DROP CONSTRAINT t_6201_kult_geo_generel_fk;
ALTER TABLE fkg.t_6201_kult_geo ADD CONSTRAINT t_6201_kult_geo_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6201_kult_geo_d_basis_omraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6201_kult_geo DROP CONSTRAINT t_6201_kult_geo_d_basis_omraade_fk;
ALTER TABLE fkg.t_6201_kult_geo ADD CONSTRAINT t_6201_kult_geo_d_basis_omraade_fk FOREIGN KEY (omraade_nr)
REFERENCES fkg.d_basis_omraade (omraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_generel_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_basis_omraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_basis_omraade_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_basis_omraade_fk FOREIGN KEY (omraade_nr)
REFERENCES fkg.d_basis_omraade (omraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_tidsdybde_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_tidsdybde_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_tidsdybde_fk FOREIGN KEY (tidsdybde_kode)
REFERENCES fkg.d_6202_tidsdybde (tidsdybde_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_basis_tilstand_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_basis_tilstand_fk FOREIGN KEY (intakthed_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_skala_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_skala_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_skala_fk FOREIGN KEY (skala_kode)
REFERENCES fkg.d_6202_skala (skala_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_rumlig_afgraensning_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_rumlig_afgraensning_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_rumlig_afgraensning_fk FOREIGN KEY (rumlig_afgraensning_kode)
REFERENCES fkg.d_6202_rumlig_afgraensning (rumlig_afgraensning_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_kompleksitet_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_kompleksitet_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_kompleksitet_fk FOREIGN KEY (kompleksitet_kode)
REFERENCES fkg.d_6202_kompleksitet (kompleksitet_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_struktur_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_struktur_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_struktur_fk FOREIGN KEY (struktur_kode)
REFERENCES fkg.d_6202_struktur (struktur_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6202_landk_omr_d_6202_visuel_uro_kode_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6202_landk_omr DROP CONSTRAINT t_6202_landk_omr_d_6202_visuel_uro_kode_fk;
ALTER TABLE fkg.t_6202_landk_omr ADD CONSTRAINT t_6202_landk_omr_d_6202_visuel_uro_kode_fk FOREIGN KEY (visuel_uro_kode)
REFERENCES fkg.d_6202_visuel_uro (visuel_uro_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6203_landk_vur_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6203_landk_vur DROP CONSTRAINT t_6203_landk_vur_generel_fk;
ALTER TABLE fkg.t_6203_landk_vur ADD CONSTRAINT t_6203_landk_vur_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6203_landk_vur_d_basis_omraade_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6203_landk_vur DROP CONSTRAINT t_6203_landk_vur_d_basis_omraade_fk;
ALTER TABLE fkg.t_6203_landk_vur ADD CONSTRAINT t_6203_landk_vur_d_basis_omraade_fk FOREIGN KEY (omraade_nr)
REFERENCES fkg.d_basis_omraade (omraade_nr) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6203_landk_vur_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6203_landk_vur DROP CONSTRAINT t_6203_landk_vur_d_basis_tilstand_fk;
ALTER TABLE fkg.t_6203_landk_vur ADD CONSTRAINT t_6203_landk_vur_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6203_landk_vur_d_6203_saarbarhed_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6203_landk_vur DROP CONSTRAINT t_6203_landk_vur_d_6203_saarbarhed_fk;
ALTER TABLE fkg.t_6203_landk_vur ADD CONSTRAINT t_6203_landk_vur_d_6203_saarbarhed_fk FOREIGN KEY (saarbarhed_kode)
REFERENCES fkg.d_6203_saarbarhed (saarbarhed_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6203_landk_vur_d_6203_karakterstyrke_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6203_landk_vur DROP CONSTRAINT t_6203_landk_vur_d_6203_karakterstyrke_fk;
ALTER TABLE fkg.t_6203_landk_vur ADD CONSTRAINT t_6203_landk_vur_d_6203_karakterstyrke_fk FOREIGN KEY (karakterstyrke_kode)
REFERENCES fkg.d_6203_karakterstyrke (karakterstyrke_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_generel_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_d_6800_vedlhold_f_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_d_6800_vedlhold_f_type_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_d_6800_vedlhold_f_type_fk FOREIGN KEY (vedlhold_f_type_kode)
REFERENCES fkg.d_6800_vedlhold_f_type (vedlhold_f_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_d_basis_driftniv_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_d_basis_driftniv_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_d_basis_driftniv_fk FOREIGN KEY (driftniv_kode)
REFERENCES fkg.d_basis_driftniv (driftniv_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_d_basis_ukrudtsbek_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_d_basis_ukrudtsbek_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_d_basis_ukrudtsbek_fk FOREIGN KEY (ukrudtsbek_kode)
REFERENCES fkg.d_basis_ukrudtsbek (ukrudtsbek_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_d_basis_tilstand_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6800_parl_fl_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6800_parl_fl DROP CONSTRAINT t_6800_parl_fl_d_vejnavn_fk;
ALTER TABLE fkg.t_6800_parl_fl ADD CONSTRAINT t_6800_parl_fl_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_generel_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_d_6801_vedlhold_l_type_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_d_6801_vedlhold_l_type_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_d_6801_vedlhold_l_type_fk FOREIGN KEY (vedlhold_l_type_kode)
REFERENCES fkg.d_6801_vedlhold_l_type (vedlhold_l_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_d_basis_driftniv_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_d_basis_driftniv_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_d_basis_driftniv_fk FOREIGN KEY (driftniv_kode)
REFERENCES fkg.d_basis_driftniv (driftniv_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_d_basis_ukrudtsbek_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_d_basis_ukrudtsbek_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_d_basis_ukrudtsbek_fk FOREIGN KEY (ukrudtsbek_kode)
REFERENCES fkg.d_basis_ukrudtsbek (ukrudtsbek_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_d_vejnavn_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6801_parl_li_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6801_parl_li DROP CONSTRAINT t_6801_parl_li_d_basis_tilstand_fk;
ALTER TABLE fkg.t_6801_parl_li ADD CONSTRAINT t_6801_parl_li_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_generel_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_d_6802_groenvedligh_punkt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_d_6802_groenvedligh_punkt_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_d_6802_groenvedligh_punkt_fk FOREIGN KEY (vedlhold_p_type_kode)
REFERENCES fkg.d_6802_groenvedligh_punkt (vedlhold_p_type_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_d_basis_driftniv_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_d_basis_driftniv_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_d_basis_driftniv_fk FOREIGN KEY (driftniv_kode)
REFERENCES fkg.d_basis_driftniv (driftniv_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_d_basis_ukrudtsbek_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_d_basis_ukrudtsbek_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_d_basis_ukrudtsbek_fk FOREIGN KEY (ukrudtsbek_kode)
REFERENCES fkg.d_basis_ukrudtsbek (ukrudtsbek_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_d_vejnavn_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_d_vejnavn_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_d_vejnavn_fk FOREIGN KEY (vejkode)
REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6802_parl_pkt_d_basis_tilstand_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6802_parl_pkt DROP CONSTRAINT t_6802_parl_pkt_d_basis_tilstand_fk;
ALTER TABLE fkg.t_6802_parl_pkt ADD CONSTRAINT t_6802_parl_pkt_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6803_parl_omr_generel_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6803_parl_omr DROP CONSTRAINT t_6803_parl_omr_generel_fk;
ALTER TABLE fkg.t_6803_parl_omr ADD CONSTRAINT t_6803_parl_omr_generel_fk FOREIGN KEY (versions_id)
REFERENCES fkg.generel (versions_id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


-- object: t_6803_parl_omr_d_6803_pg_distrikt_fk | type: CONSTRAINT --
-- ALTER TABLE fkg.t_6803_parl_omr DROP CONSTRAINT t_6803_parl_omr_d_6803_pg_distrikt_fk;
ALTER TABLE fkg.t_6803_parl_omr ADD CONSTRAINT t_6803_parl_omr_d_6803_pg_distrikt_fk FOREIGN KEY (pg_distrikt_kode)
REFERENCES fkg.d_6803_pg_distrikt (pg_distrikt_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --



