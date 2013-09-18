-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- PostgreSQL version: 9.2
-- Project Site: pgmodeler.com.br
-- Model Author: Septima - see license in LICENSE.txt

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: data | type: DATABASE --
-- CREATE DATABASE data
-- 	ENCODING = 'UTF8'
-- ;
-- -- ddl-end --
-- 

-- object: fkg | type: SCHEMA --
CREATE SCHEMA fkg;
-- ddl-end --

-- object: fkg.d_basis_oprindelse | type: TABLE --
CREATE TABLE fkg.d_basis_oprindelse(
	oprindkode integer NOT NULL,
	oprindelse character varying(35) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	bemaerkning character varying,
	CONSTRAINT d_basis_oprindelse_pk PRIMARY KEY (oprindkode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_status | type: TABLE --
CREATE TABLE fkg.d_basis_status(
	statuskode integer NOT NULL,
	status character varying(30) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_status_pk PRIMARY KEY (statuskode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_ansvarlig_myndighed | type: TABLE --
CREATE TABLE fkg.d_basis_ansvarlig_myndighed(
	cvr_kode integer NOT NULL,
	cvr_navn character varying(128) NOT NULL,
	kommunekode integer,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_ansvarlig_myndighed_pk PRIMARY KEY (cvr_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.generel | type: TABLE --
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
	CONSTRAINT generel_pk PRIMARY KEY (versions_id),
	CONSTRAINT generel_d_basis_oprindelse_fk FOREIGN KEY (oprindkode)
	REFERENCES fkg.d_basis_oprindelse (oprindkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT generel_d_basis_status_fk FOREIGN KEY (statuskode)
	REFERENCES fkg.d_basis_status (statuskode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT generel_d_basis_ansvarlig_myndighed_fk FOREIGN KEY (cvr_kode)
	REFERENCES fkg.d_basis_ansvarlig_myndighed (cvr_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

COMMENT ON COLUMN fkg.generel.versions_id IS 'Unik versions-id databasenøgle';
COMMENT ON COLUMN fkg.generel.objekt_id IS 'Entydig databasenøgle over tid';
COMMENT ON COLUMN fkg.generel.systid_fra IS 'Start systemtid';
COMMENT ON COLUMN fkg.generel.systid_til IS 'Slut systemtid';
-- ddl-end --

-- object: fkg.d_basis_ja_nej | type: TABLE --
CREATE TABLE fkg.d_basis_ja_nej(
	ja_nej_kode integer NOT NULL,
	ja_nej character varying(7) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ja_nej_pk PRIMARY KEY (ja_nej_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_ejerstatus | type: TABLE --
CREATE TABLE fkg.d_basis_ejerstatus(
	ejerstatus_kode integer NOT NULL,
	ejerstatus character varying(34) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ejerstatus_pk PRIMARY KEY (ejerstatus_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_vejnavn | type: TABLE --
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

-- ddl-end --

-- object: fkg.d_basis_sag_status | type: TABLE --
CREATE TABLE fkg.d_basis_sag_status(
	sag_status_kode integer NOT NULL,
	sag_status character varying(18) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_sag_status_pk PRIMARY KEY (sag_status_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_dvfi_bedoemmelse | type: TABLE --
CREATE TABLE fkg.d_basis_dvfi_bedoemmelse(
	dvfi_bedoemmelse_kode integer NOT NULL,
	dvfi_bedoemmelse character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_dvfi_bedoemmelse_pk PRIMARY KEY (dvfi_bedoemmelse_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_trussel_vand | type: TABLE --
CREATE TABLE fkg.d_basis_trussel_vand(
	trussel_vand_kode integer NOT NULL,
	trussel_vand character varying(30) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_trussel_vand_pk PRIMARY KEY (trussel_vand_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_planstatus | type: TABLE --
CREATE TABLE fkg.d_basis_planstatus(
	planstatus_kode integer NOT NULL,
	planstatus character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_planstatus_pk PRIMARY KEY (planstatus_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_afstemningsomraade | type: TABLE --
CREATE TABLE fkg.d_basis_afstemningsomraade(
	afstemningsomraade_nr character varying(128) NOT NULL,
	afstemningsomraade_navn character varying(128) NOT NULL,
	cvr character varying,
	CONSTRAINT d_basis_afstemningsomraade_pk PRIMARY KEY (afstemningsomraade_nr)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_kloak | type: TABLE --
CREATE TABLE fkg.d_basis_kloak(
	kloak_kode integer NOT NULL,
	kloak character varying(45) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_kloak_pk PRIMARY KEY (kloak_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_postnr | type: TABLE --
CREATE TABLE fkg.d_basis_postnr(
	postnr integer NOT NULL,
	postnr_by character varying(128) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	CONSTRAINT d_basis_postnr_pk PRIMARY KEY (postnr)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_funktionsstatus | type: TABLE --
CREATE TABLE fkg.d_basis_funktionsstatus(
	funktionsstatus_kode integer NOT NULL,
	funktionsstatus character varying(128) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_funktionsstatus_pk PRIMARY KEY (funktionsstatus_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_magasin | type: TABLE --
CREATE TABLE fkg.d_basis_magasin(
	magasin_kode integer NOT NULL,
	magasin character varying(50) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_magasin_pk PRIMARY KEY (magasin_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_fors_omr_type | type: TABLE --
CREATE TABLE fkg.d_basis_fors_omr_type(
	fors_omr_type_kode integer NOT NULL,
	fors_omr_type character varying(50) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_fors_omr_type_pk PRIMARY KEY (fors_omr_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_omraade | type: TABLE --
CREATE TABLE fkg.d_basis_omraade(
	omraade_nr integer NOT NULL,
	omraade character varying(128) NOT NULL,
	cvr_kode character varying,
	CONSTRAINT d_basis_omraade_pk PRIMARY KEY (omraade_nr)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5000_vandl_type | type: TABLE --
CREATE TABLE fkg.d_5000_vandl_type(
	vandl_type_kode integer NOT NULL,
	vandl_type character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_vandl_type_pk PRIMARY KEY (vandl_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5000_maalsaetning | type: TABLE --
CREATE TABLE fkg.d_5000_maalsaetning(
	maalsaetning_kode integer NOT NULL,
	maalsaetning character varying(60) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_maalsaetning_pk PRIMARY KEY (maalsaetning_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5000_klasse | type: TABLE --
CREATE TABLE fkg.d_5000_klasse(
	klasse_kode integer,
	klasse character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_5000_klasse_pk PRIMARY KEY (klasse_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5000_vandl | type: TABLE --
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
	CONSTRAINT t_5000_vandl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_5000_klasse_fk FOREIGN KEY (klasse_kode)
	REFERENCES fkg.d_5000_klasse (klasse_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_5000_vandl_type_fk FOREIGN KEY (vandl_type_kode)
	REFERENCES fkg.d_5000_vandl_type (vandl_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_ja_nej_tidl_amt_fk FOREIGN KEY (tidl_amt_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_ja_nej_p3vandloeb_kode_fk FOREIGN KEY (p3vandloeb_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_dvfi_bedoemmelse_fk FOREIGN KEY (dvfi_bedoemmelse_kode)
	REFERENCES fkg.d_basis_dvfi_bedoemmelse (dvfi_bedoemmelse_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_ja_nej_maalsaetning_opfyldt_fk FOREIGN KEY (maalsaetning_opfyldt_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_basis_trussel_vand_fk FOREIGN KEY (trussel_vand_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5000_vandl_d_5000_maalsaetning_fk FOREIGN KEY (maalsaetning_kode)
	REFERENCES fkg.d_5000_maalsaetning (maalsaetning_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.temagruppe | type: TABLE --
CREATE TABLE fkg.temagruppe(
	temagruppe_id character varying NOT NULL,
	vaerdiomraade_min integer NOT NULL,
	vaerdiomraade_max integer NOT NULL,
	tema_gruppe character varying NOT NULL,
	CONSTRAINT temagruppe_pk PRIMARY KEY (temagruppe_id),
	CONSTRAINT temagruppe_vaerdiomraade_min_uc UNIQUE (vaerdiomraade_min)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.tema | type: TABLE --
CREATE TABLE fkg.tema(
	tema_kode integer NOT NULL,
	tema_navn character varying NOT NULL,
	geo character NOT NULL,
	udvekslingsnavn character varying NOT NULL,
	temagruppe_id character varying NOT NULL,
	CONSTRAINT tema_pk PRIMARY KEY (tema_kode),
	CONSTRAINT geo_ck CHECK (geo IN ('P', 'L', 'F')),
	CONSTRAINT tema_udvekslingsnavn_uc UNIQUE (udvekslingsnavn),
	CONSTRAINT tema_temanavn_uc UNIQUE (tema_navn),
	CONSTRAINT tema_temagruppe_fk FOREIGN KEY (temagruppe_id)
	REFERENCES fkg.temagruppe (temagruppe_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_tilstand | type: TABLE --
CREATE TABLE fkg.d_basis_tilstand(
	tilstand_kode integer NOT NULL,
	tilstand character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_tilstand_pk PRIMARY KEY (tilstand_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_hastighed | type: TABLE --
CREATE TABLE fkg.d_basis_hastighed(
	hastighed_kode integer NOT NULL,
	hastighed character varying(6) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_hastighed_pk PRIMARY KEY (hastighed_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_driftniv | type: TABLE --
CREATE TABLE fkg.d_basis_driftniv(
	driftniv_kode integer NOT NULL,
	driftniv character varying(10) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_driftniv_pk PRIMARY KEY (driftniv_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_ukrudtsbek | type: TABLE --
CREATE TABLE fkg.d_basis_ukrudtsbek(
	ukrudtsbek_kode integer NOT NULL,
	ukrudtsbek character varying(20) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_ukrudtsbek_pk PRIMARY KEY (ukrudtsbek_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_basis_antal | type: TABLE --
CREATE TABLE fkg.d_basis_antal(
	antal_kode integer NOT NULL,
	antal character varying(25) NOT NULL,
	aktiv integer NOT NULL DEFAULT 1,
	begrebsdefinition character varying,
	CONSTRAINT d_basis_antal_pk PRIMARY KEY (antal_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6100_brandhane | type: TABLE --
CREATE TABLE fkg.d_6100_brandhane(
	brandhane_type_kode integer NOT NULL,
	brandhane_type character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6100_brandhane_pk PRIMARY KEY (brandhane_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6100_placering | type: TABLE --
CREATE TABLE fkg.d_6100_placering(
	placering_kode integer NOT NULL,
	placering character varying(12) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6100_placering_pk PRIMARY KEY (placering_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_6100_brandhane | type: TABLE --
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
	CONSTRAINT t_6100_brandhane_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6100_brandhane_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_6100_brandhane_d_6100_brandhane_fk FOREIGN KEY (brandhane_type_kode)
	REFERENCES fkg.d_6100_brandhane (brandhane_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_6100_brandhane_d_6100_placering FOREIGN KEY (placering_kode)
	REFERENCES fkg.d_6100_placering (placering_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_6100_brandhane_d_basis_funktionsstatus_fk FOREIGN KEY (funktionsstatus_kode)
	REFERENCES fkg.d_basis_funktionsstatus (funktionsstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6102_redvej_type | type: TABLE --
CREATE TABLE fkg.d_6102_redvej_type(
	redvej_type_kode integer NOT NULL,
	redvej_type character varying(15) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6102_redvej_type_pk PRIMARY KEY (redvej_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_6102_redn_vej | type: TABLE --
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
	CONSTRAINT t_6102_redningsvej_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_6102_redningsvej_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_6102_redningsvej_d_6102_redvej_type_fk FOREIGN KEY (redvej_type_kode)
	REFERENCES fkg.d_6102_redvej_type (redvej_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5001_maalest_type | type: TABLE --
CREATE TABLE fkg.d_5001_maalest_type(
	maalest_type_kode integer NOT NULL,
	maalest_type varchar(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition varchar,
	CONSTRAINT d_5001_maalest_type_pk PRIMARY KEY (maalest_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5001_maalest | type: TABLE --
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
	CONSTRAINT t_5001_maalest_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5001_maalest_d_5001_maalest_type_fk FOREIGN KEY (maalest_type_kode)
	REFERENCES fkg.d_5001_maalest_type (maalest_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5001_maalest_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5001_maalest_d_basisdvfi_bedoemmelse_fk FOREIGN KEY (dvfi_bedoemmelse_kode)
	REFERENCES fkg.d_basis_dvfi_bedoemmelse (dvfi_bedoemmelse_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5001_maalest_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5002_spaerring | type: TABLE --
CREATE TABLE fkg.d_5002_spaerring(
	spaerring_type_kode integer NOT NULL,
	spaerring_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5002_spaerring_pk PRIMARY KEY (spaerring_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5002_passage | type: TABLE --
CREATE TABLE fkg.d_5002_passage(
	passage_kode integer NOT NULL,
	passage character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5002_passage_pk PRIMARY KEY (passage_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5002_faunasp | type: TABLE --
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
	CONSTRAINT t_5002_faunasp_d_5002_spaerring_fk FOREIGN KEY (spaerring_type_kode)
	REFERENCES fkg.d_5002_spaerring (spaerring_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5002_faunasp_d_5002_passage_fk FOREIGN KEY (passage_kode)
	REFERENCES fkg.d_5002_passage (passage_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5002_faunasp_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5003_ledn_type | type: TABLE --
CREATE TABLE fkg.d_5003_ledn_type(
	ledn_type_kode integer NOT NULL,
	ledn_type character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5003_ledn_type_pk PRIMARY KEY (ledn_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5003_klasse | type: TABLE --
CREATE TABLE fkg.d_5003_klasse(
	klasse_kode integer NOT NULL,
	klasse character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5003_klasse_pk PRIMARY KEY (klasse_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5003_draenledn | type: TABLE --
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
	CONSTRAINT t_5003_draenledn_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5003_draenledn_d_5003_ledn_type_fk FOREIGN KEY (ledn_type_kode)
	REFERENCES fkg.d_5003_ledn_type (ledn_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5003_draenledn_d_5003_klasse_fk FOREIGN KEY (klasse_kode)
	REFERENCES fkg.d_5003_klasse (klasse_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5004_omr_type | type: TABLE --
CREATE TABLE fkg.d_5004_omr_type(
	omr_type_kode integer NOT NULL,
	omr_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5004_omr_type_pk PRIMARY KEY (omr_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5004_draenomr | type: TABLE --
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
	CONSTRAINT t_5004_draenomr_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5004_draenomr_d_5004_omr_type_fk FOREIGN KEY (omr_type_kode)
	REFERENCES fkg.d_5004_omr_type (omr_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5005_maalsaetning | type: TABLE --
CREATE TABLE fkg.d_5005_maalsaetning(
	maalsaetning_kode integer NOT NULL,
	maalsaetning character varying(60) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_maalsaetning_pk PRIMARY KEY (maalsaetning_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5005_soe_type | type: TABLE --
CREATE TABLE fkg.d_5005_soe_type(
	soe_type_kode integer NOT NULL,
	soe_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_soe_type_pk PRIMARY KEY (soe_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5005_habitat_type | type: TABLE --
CREATE TABLE fkg.d_5005_habitat_type(
	habitat_type_kode integer NOT NULL,
	habitat_type character varying(100) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5005_habitat_type_pk PRIMARY KEY (habitat_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5005_soe | type: TABLE --
CREATE TABLE fkg.t_5005_soe(
	versions_id uuid NOT NULL,
	soe_navn character varying(50),
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
	CONSTRAINT t_5005_soe_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5005_soe_d_5005_maalsaetning_fk FOREIGN KEY (maalsaetning_kode)
	REFERENCES fkg.d_5005_maalsaetning (maalsaetning_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5005_soe_d_5005_soe_type_fk FOREIGN KEY (soe_type_kode)
	REFERENCES fkg.d_5005_soe_type (soe_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5005_soe_d_5005_habitat_type_fk FOREIGN KEY (habitat_type_kode)
	REFERENCES fkg.d_5005_habitat_type (habitat_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5005_soe_d_basis_trussel_vand_fk FOREIGN KEY (trussel_vand_kode)
	REFERENCES fkg.d_basis_trussel_vand (trussel_vand_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5006_dybdekurv | type: TABLE --
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
	CONSTRAINT t_5006_dybdekurv_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5007_opl | type: TABLE --
CREATE TABLE fkg.d_5007_opl(
	opl_nr integer NOT NULL,
	opl_navn varchar(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition varchar,
	CONSTRAINT d_5007_opl_pk PRIMARY KEY (opl_nr)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5007_opl_type | type: TABLE --
CREATE TABLE fkg.d_5007_opl_type(
	vandl_opl_type_kode integer NOT NULL,
	vandl_opl_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5007_opl_type_pk PRIMARY KEY (vandl_opl_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5007_vandl_opl | type: TABLE --
CREATE TABLE fkg.t_5007_vandl_opl(
	versions_id uuid NOT NULL,
	vandloeb_nr character varying(128),
	dmu_ref character varying(128),
	vandl_opl_nr integer,
	opl_type_kode integer NOT NULL,
	hydro_ref character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5007_vandl_opl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5007_vandl_opl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5007_vandl_opl_d_5007_opl_fk FOREIGN KEY (vandl_opl_nr)
	REFERENCES fkg.d_5007_opl (opl_nr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5007_vandl_opl_d_5007_opl_type_fk FOREIGN KEY (opl_type_kode)
	REFERENCES fkg.d_5007_opl_type (vandl_opl_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5008_opl | type: TABLE --
CREATE TABLE fkg.d_5008_opl(
	soe_opl_nr integer NOT NULL,
	soeopl_navn character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5008_opl_pk PRIMARY KEY (soe_opl_nr)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5008_soe_opl | type: TABLE --
CREATE TABLE fkg.t_5008_soe_opl(
	versions_id uuid NOT NULL,
	dmu_ref character varying(128),
	soe_opl_nr integer NOT NULL,
	soe_nr character varying(50),
	hydro_ref character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5008_soe_opl_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5008_soe_opl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5008_soe_opl_d_5008_opl_fk FOREIGN KEY (soe_opl_nr)
	REFERENCES fkg.d_5008_opl (soe_opl_nr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5009_lag_type | type: TABLE --
CREATE TABLE fkg.d_5009_lag_type(
	lag_type_kode integer NOT NULL,
	lag_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5009_lag_type_pk PRIMARY KEY (lag_type_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5009_pumpelag | type: TABLE --
CREATE TABLE fkg.t_5009_pumpelag(
	versions_id uuid NOT NULL,
	lag_navn character varying(128),
	lag_type_kode integer NOT NULL,
	ejerstatus_kode integer,
	vandloebsystem character varying(128),
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5009_pumpelag_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5009_pumpelag_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5009_pumpelag_d_5009_lag_type_fk FOREIGN KEY (lag_type_kode)
	REFERENCES fkg.d_5009_lag_type (lag_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5009_pumpelag_d_basis_erjerstatus_fk FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5010_element_type | type: TABLE --
CREATE TABLE fkg.d_5010_element_type(
	element_kode integer NOT NULL,
	element character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5010_element_type_pk PRIMARY KEY (element_kode)
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5010_vandl_elm | type: TABLE --
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
	CONSTRAINT t_5010_vandl_elm_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5010_vandl_elm_d_5010_element_type_fk FOREIGN KEY (element_kode)
	REFERENCES fkg.d_5010_element_type (element_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5010_vandl_elm_d_basis_tilstand_fk FOREIGN KEY (tilstand_kode)
	REFERENCES fkg.d_basis_tilstand (tilstand_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
)WITH ( OIDS = TRUE );
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5105_kaer_type | type: TABLE --
CREATE TABLE fkg.d_5105_kaer_type(
	kaer_type_kode integer NOT NULL,
	kaer_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5105_kaer_type_pk PRIMARY KEY (kaer_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5105_rig_fattig | type: TABLE --
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
	CONSTRAINT t_5105_rig_fattig_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5105_rig_fattig_d_5105_kaer_type_fk FOREIGN KEY (kaer_type_kode)
	REFERENCES fkg.d_5105_kaer_type (kaer_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5106_pleje_type | type: TABLE --
CREATE TABLE fkg.d_5106_pleje_type(
	pleje_type_kode integer NOT NULL,
	pleje_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT pleje_type_kode_pk PRIMARY KEY (pleje_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5106_faciliteter | type: TABLE --
CREATE TABLE fkg.d_5106_faciliteter(
	faciliteter_kode integer NOT NULL,
	faciliteter character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5106_faciliteter_pk PRIMARY KEY (faciliteter_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5106_nat_pl | type: TABLE --
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
	CONSTRAINT t_5106_nat_pl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5106_nat_pl_d_5106_pleje_type_fk FOREIGN KEY (pleje_type_kode)
	REFERENCES fkg.d_5106_pleje_type (pleje_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5106_nat_pl_d_5106_faciliteter_fk FOREIGN KEY (faciliteter_kode)
	REFERENCES fkg.d_5106_faciliteter (faciliteter_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5106_nat_pl_d_basis_ejerstatus FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5108_groent_part | type: TABLE --
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
	CONSTRAINT t_5108_groent_part_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5108_groent_part_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5300_genopd_ret | type: TABLE --
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
	CONSTRAINT t_5300_genopd_ret_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5400_affalds_type | type: TABLE --
CREATE TABLE fkg.d_5400_affalds_type(
	affaldstype_kode integer NOT NULL,
	affaldstype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5400_affalds_type_pk PRIMARY KEY (affaldstype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5400_affalds_dis | type: TABLE --
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
	CONSTRAINT t_5400_affalds_dis_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5400_affalds_dis_d_5400_affalds_type_fk FOREIGN KEY (affaldstype_kode)
	REFERENCES fkg.d_5400_affalds_type (affaldstype_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5200_affald | type: TABLE --
CREATE TABLE fkg.d_5200_affald(
	affald_prod_kode integer NOT NULL,
	affald_prod character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5200_affald_pk PRIMARY KEY (affald_prod_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5401_gs_type | type: TABLE --
CREATE TABLE fkg.d_5401_gs_type(
	gs_type_kode integer NOT NULL,
	gs_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5401_gs_type_pk PRIMARY KEY (gs_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5402_gc_type | type: TABLE --
CREATE TABLE fkg.d_5402_gc_type(
	gc_type_kode integer NOT NULL,
	gc_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5402_gc_type_pk PRIMARY KEY (gc_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5506_anlaegtype | type: TABLE --
CREATE TABLE fkg.d_5506_anlaegtype(
	anlaeg_type_kode integer NOT NULL,
	anlaeg_type character varying(25) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5506_anlaegtype_pk PRIMARY KEY (anlaeg_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5600_rute | type: TABLE --
CREATE TABLE fkg.d_5600_rute(
	rute_kode integer NOT NULL,
	rute character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5600_rute_pk PRIMARY KEY (rute_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5601_hasti_type | type: TABLE --
CREATE TABLE fkg.d_5601_hasti_type(
	hasti_type_kode integer NOT NULL,
	hasti_type character varying(55) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5601_hasti_type_pk PRIMARY KEY (hasti_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5602_p_tid | type: TABLE --
CREATE TABLE fkg.d_5602_p_tid(
	p_tid_kode integer NOT NULL,
	p_tid character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5602_p_tid_pk PRIMARY KEY (p_tid_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5602_p_type | type: TABLE --
CREATE TABLE fkg.d_5602_p_type(
	p_type_kode integer NOT NULL,
	p_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5602_p_type_pk PRIMARY KEY (p_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5604_begr_type | type: TABLE --
CREATE TABLE fkg.d_5604_begr_type(
	begr_type_kode integer NOT NULL,
	begr_type character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5604_begr_type_pk PRIMARY KEY (begr_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5605_dekl_type | type: TABLE --
CREATE TABLE fkg.d_5605_dekl_type(
	dekl_type_kode integer NOT NULL,
	dekl_type character varying(21) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5605_dekl_type_pk PRIMARY KEY (dekl_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5606_inventar_type | type: TABLE --
CREATE TABLE fkg.d_5606_inventar_type(
	inventar_type_kode integer NOT NULL,
	inventar_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5606_inventar_type_pk PRIMARY KEY (inventar_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5700_forening_type | type: TABLE --
CREATE TABLE fkg.d_5700_forening_type(
	forening_type_kode integer NOT NULL,
	forening_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5700_forening_type_pk PRIMARY KEY (forening_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5700_adr_beskyt | type: TABLE --
CREATE TABLE fkg.d_5700_adr_beskyt(
	gf_adr_beskyt_kode character NOT NULL,
	gf_adr_beskyt character varying(100) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5700_adr_beskyt_pk PRIMARY KEY (gf_adr_beskyt_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5705_udlejning | type: TABLE --
CREATE TABLE fkg.d_5705_udlejning(
	udlejning_kode integer NOT NULL,
	udlejning character varying(40) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5705_udlejning_pk PRIMARY KEY (udlejning_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5706_havn_type | type: TABLE --
CREATE TABLE fkg.d_5706_havn_type(
	havn_type_kode integer NOT NULL,
	havn_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5706_havn_type_pk PRIMARY KEY (havn_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5707_grund_type | type: TABLE --
CREATE TABLE fkg.d_5707_grund_type(
	grund_type_kode integer NOT NULL,
	grund_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5707_grund_type_pk PRIMARY KEY (grund_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5707_salg_status | type: TABLE --
CREATE TABLE fkg.d_5707_salg_status(
	salg_status_kode integer NOT NULL,
	salg_status character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5707_salg_status_pk PRIMARY KEY (salg_status_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5708_institution_type | type: TABLE --
CREATE TABLE fkg.d_5708_institution_type(
	institution_type_kode integer NOT NULL,
	institution_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5708_institution_type_pk PRIMARY KEY (institution_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5709_distrikt_type | type: TABLE --
CREATE TABLE fkg.d_5709_distrikt_type(
	distrikt_type_kode integer NOT NULL,
	distrikt_type character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5709_distrikt_type_pk PRIMARY KEY (distrikt_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5800_facilitet | type: TABLE --
CREATE TABLE fkg.d_5800_facilitet(
	facilitet_type_kode integer NOT NULL,
	facilitet_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5800_facilitet_pk PRIMARY KEY (facilitet_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5802_facilitet | type: TABLE --
CREATE TABLE fkg.d_5802_facilitet(
	facilitet_type_kode integer NOT NULL,
	facilitet_type character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5802_facilitet_pk PRIMARY KEY (facilitet_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5901_gravestatus | type: TABLE --
CREATE TABLE fkg.d_5901_gravestatus(
	gravstatus_kode integer NOT NULL,
	gravstatus character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5901_gravestatus_pk PRIMARY KEY (gravstatus_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5901_raastof_type | type: TABLE --
CREATE TABLE fkg.d_5901_raastof_type(
	raastof_type_kode integer NOT NULL,
	raastof_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5901_raastof_type_pk PRIMARY KEY (raastof_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_5902_vaeske_type | type: TABLE --
CREATE TABLE fkg.d_5902_vaeske_type(
	vaesketype_kode integer NOT NULL,
	vaesketype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_5902_vaeske_type_pk PRIMARY KEY (vaesketype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6000_kotesystem | type: TABLE --
CREATE TABLE fkg.d_6000_kotesystem(
	kotesystem_kode integer NOT NULL,
	kotesystem character varying(255) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6000_kotesystem_pk PRIMARY KEY (kotesystem_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6003_zone_type | type: TABLE --
CREATE TABLE fkg.d_6003_zone_type(
	zone_type_kode integer NOT NULL,
	zone_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6003_zone_type_pk PRIMARY KEY (zone_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6101_beskyt_rum | type: TABLE --
CREATE TABLE fkg.d_6101_beskyt_rum(
	beskyt_rum_kode integer NOT NULL,
	beskyt_rum character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6101_beskyt_rum_pk PRIMARY KEY (beskyt_rum_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6104_risikotype | type: TABLE --
CREATE TABLE fkg.d_6104_risikotype(
	risikotype_kode integer NOT NULL,
	risikotype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6104_risikotype_pk PRIMARY KEY (risikotype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6104_brandhaem | type: TABLE --
CREATE TABLE fkg.d_6104_brandhaem(
	brandhaem_kode integer NOT NULL,
	brandhaem character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6104_brandhaem_pk PRIMARY KEY (brandhaem_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6111_tilladelse | type: TABLE --
CREATE TABLE fkg.d_6111_tilladelse(
	tilladelse_type_kode integer NOT NULL,
	tilladelse_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6111_tilladelse_pk PRIMARY KEY (tilladelse_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6112_depottype | type: TABLE --
CREATE TABLE fkg.d_6112_depottype(
	depottype_kode integer NOT NULL,
	depottype character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6112_depottype_pk PRIMARY KEY (depottype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6115_afbr_type | type: TABLE --
CREATE TABLE fkg.d_6115_afbr_type(
	afbr_type_kode integer NOT NULL,
	afbr_type character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6115_afbr_type_pk PRIMARY KEY (afbr_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6116_strandtype | type: TABLE --
CREATE TABLE fkg.d_6116_strandtype(
	strandtype_kode integer NOT NULL,
	strandtype character varying(254) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6116_strandtype_pk PRIMARY KEY (strandtype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6116_esi_klasse | type: TABLE --
CREATE TABLE fkg.d_6116_esi_klasse(
	esi_klasse_kode integer NOT NULL,
	esi_klasse character varying(254) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6116_esi_klasse_pk PRIMARY KEY (esi_klasse_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6117_indsatstype | type: TABLE --
CREATE TABLE fkg.d_6117_indsatstype(
	indsatstype_kode integer NOT NULL,
	indsatstype character varying(128) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6117_indsatstype_pk PRIMARY KEY (indsatstype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6200_geologi | type: TABLE --
CREATE TABLE fkg.d_6200_geologi(
	geologi_kode integer NOT NULL,
	geologi character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_geologi_pk PRIMARY KEY (geologi_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6200_jordtype | type: TABLE --
CREATE TABLE fkg.d_6200_jordtype(
	jordtype_kode integer NOT NULL,
	jordtype character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_jordtype_pk PRIMARY KEY (jordtype_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6200_terraen | type: TABLE --
CREATE TABLE fkg.d_6200_terraen(
	terraen_kode integer NOT NULL,
	terraen character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_terraen_pk PRIMARY KEY (terraen_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6200_kompleksitet | type: TABLE --
CREATE TABLE fkg.d_6200_kompleksitet(
	kompleksitet_kode integer NOT NULL,
	kompleksitet character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6200_kompleksitet_pk PRIMARY KEY (kompleksitet_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_skala | type: TABLE --
CREATE TABLE fkg.d_6202_skala(
	skala_kode integer NOT NULL,
	skala character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_skala_pk PRIMARY KEY (skala_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_rumlig_afgraensning | type: TABLE --
CREATE TABLE fkg.d_6202_rumlig_afgraensning(
	rumlig_afgraensning_kode integer NOT NULL,
	rumlig_afgraensning character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_rumlig_afgraensning_pk PRIMARY KEY (rumlig_afgraensning_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_kompleksitet | type: TABLE --
CREATE TABLE fkg.d_6202_kompleksitet(
	kompleksitet_kode integer NOT NULL,
	kompleksitet character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_kompleksitet_pk PRIMARY KEY (kompleksitet_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_struktur | type: TABLE --
CREATE TABLE fkg.d_6202_struktur(
	struktur_kode integer NOT NULL,
	struktur character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_struktur_pk PRIMARY KEY (struktur_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_visuel_uro | type: TABLE --
CREATE TABLE fkg.d_6202_visuel_uro(
	visuel_uro_kode integer NOT NULL,
	visuel_uro character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_visuel_uro_pk PRIMARY KEY (visuel_uro_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6202_tidsdybde | type: TABLE --
CREATE TABLE fkg.d_6202_tidsdybde(
	tidsdybde_kode integer NOT NULL,
	tidsdybde character varying(20) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6202_tidsdybde_pk PRIMARY KEY (tidsdybde_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6203_karakterstyrke | type: TABLE --
CREATE TABLE fkg.d_6203_karakterstyrke(
	karakterstyrke_kode integer NOT NULL,
	karakterstyrke character varying(30) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6203_karakterstyrke_pk PRIMARY KEY (karakterstyrke_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6203_saarbarhed | type: TABLE --
CREATE TABLE fkg.d_6203_saarbarhed(
	saarbarhed_kode integer NOT NULL,
	saarbarhed character varying(10) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6203_saarbarhed_pk PRIMARY KEY (saarbarhed_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6800_vedlhold_f_type | type: TABLE --
CREATE TABLE fkg.d_6800_vedlhold_f_type(
	vedlhold_f_type_kode integer NOT NULL,
	vedlhold_f_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_f_type_lable character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6800_vedlhold_f_type_pk PRIMARY KEY (vedlhold_f_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6801_vedlhold_l_type | type: TABLE --
CREATE TABLE fkg.d_6801_vedlhold_l_type(
	vedlhold_l_type_kode integer NOT NULL,
	vedlhold_l_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_l_type_table character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6801_vedlhold_l_type_pk PRIMARY KEY (vedlhold_l_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6802_groenvedligh_punkt | type: TABLE --
CREATE TABLE fkg.d_6802_groenvedligh_punkt(
	vedlhold_p_type_kode integer NOT NULL,
	vedlhold_p_type character varying(150) NOT NULL,
	aktiv integer NOT NULL,
	vedlhold_p_type_table character varying(6) NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6802_groenvedligh_punkt_pk PRIMARY KEY (vedlhold_p_type_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.d_6803_pg_distrikt | type: TABLE --
CREATE TABLE fkg.d_6803_pg_distrikt(
	pg_distrikt_kode integer NOT NULL,
	pg_distrikt character varying(50) NOT NULL,
	aktiv integer NOT NULL,
	begrebsdefinition character varying,
	CONSTRAINT d_6803_pg_distrikt_pk PRIMARY KEY (pg_distrikt_kode)
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5401_genbr_st | type: TABLE --
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
	CONSTRAINT t_5401_genbr_st_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5401_genbr_st_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5401_genbr_st_d_5401_gs_type FOREIGN KEY (gs_type_kode)
	REFERENCES fkg.d_5401_gs_type (gs_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5401_genbr_st_d_basis_postnr_fk FOREIGN KEY (postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5401_genbr_st_d_vejnavn_fk FOREIGN KEY (vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5402_genbr_con | type: TABLE --
CREATE TABLE fkg.t_5402_genbr_con(
	versions_id uuid NOT NULL,
	gc_type_kode integer NOT NULL,
	model character varying(25),
	t_frekvens character varying(50),
	t_dato date,
	links character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5402_genbr_con_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5402_genbr_con_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5402_genbr_con_d_5402_gc_type_fk FOREIGN KEY (gc_type_kode)
	REFERENCES fkg.d_5402_gc_type (gc_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5403_husst_moel | type: TABLE --
CREATE TABLE fkg.t_5403_husst_moel(
	versions_id uuid NOT NULL,
	type character varying(50) NOT NULL,
	hoejde double precision,
	stoej_kode integer NOT NULL,
	konsekvenszone double precision,
	sagnr character varying(128),
	vejkode integer,
	husnr character varying(4),
	postnr integer,
	note character varying(254),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5403_husst_moel_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5403_husst_moel_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5403_husst_moel_d_vejnavn_fk FOREIGN KEY (vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5403_husst_moel_d_basis_postnr_fk FOREIGN KEY (postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5200_aff_prod_udbr | type: TABLE --
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
	CONSTRAINT t_5200_aff_prod_udbr_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5200_aff_prod_udbr_d_5200_affald_fk FOREIGN KEY (affald_prod_kode)
	REFERENCES fkg.d_5200_affald (affald_prod_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5200_aff_prod_udbr_d_basis_postnr_fk FOREIGN KEY (postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5200_aff_prod_udbr_d_vejnavn_fk FOREIGN KEY (vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5500_elfors_omr | type: TABLE --
CREATE TABLE fkg.t_5500_elfors_omr(
	versions_id uuid NOT NULL,
	net_s_nr integer,
	fs_cvr integer NOT NULL,
	fs_navn character varying(128) NOT NULL,
	link character varying(1024),
	geometri geometry(MULTIPOLYGON, 25832) NOT NULL,
	CONSTRAINT t_5500_elfors_omr_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5500_elfors_omr_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5506_spildev_pl_pkt | type: TABLE --
CREATE TABLE fkg.t_5506_spildev_pl_pkt(
	versions_id uuid NOT NULL,
	anlaeg_type_kode integer NOT NULL,
	planstatus_kode integer NOT NULL,
	noter character varying(254),
	link character varying(1024),
	geometri geometry(MULTIPOINT, 25832) NOT NULL,
	CONSTRAINT t_5506_spildev_pl_pkt_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5506_spildev_pl_pkt_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5506_spildev_pl_pkt_d_5506_anlaegtype_fk FOREIGN KEY (anlaeg_type_kode)
	REFERENCES fkg.d_5506_anlaegtype (anlaeg_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5506_spildev_pl_pkt_d_basis_planstatus_fk FOREIGN KEY (planstatus_kode)
	REFERENCES fkg.d_basis_planstatus (planstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5507_fiberkabel | type: TABLE --
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
	CONSTRAINT t_5507_fiberkabel_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5800_fac_pkt | type: TABLE --
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
	CONSTRAINT t_5800_fac_pkt_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5800_fac_pkt_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5800_fac_pkt_d_5800_facilitet_fk FOREIGN KEY (facilitet_type_kode)
	REFERENCES fkg.d_5800_facilitet (facilitet_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5800_fac_pkt_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5800_fac_pkt_d_vejnavn_fk FOREIGN KEY (vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5800_fac_pkt_d_basis_postnr_fk FOREIGN KEY (postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5802_fac_li | type: TABLE --
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
	CONSTRAINT t_5802_fac_li_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5802_fac_li_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5802_fac_li_d_5802_facilitet_fk FOREIGN KEY (facilitet_type_kode)
	REFERENCES fkg.d_5802_facilitet (facilitet_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5802_fac_li_d_basis_ejerstatus_fk FOREIGN KEY (ejerstatus_kode)
	REFERENCES fkg.d_basis_ejerstatus (ejerstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5802_fac_li_d_vejnavn_fk FOREIGN KEY (vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5802_fac_li_d_basis_postnr_fk FOREIGN KEY (postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5900_jordfl | type: TABLE --
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
	CONSTRAINT t_5900_jordfl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5900_jordfl_d_vejnavn_afs_fk FOREIGN KEY (afs_vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5900_jordfl_d_basis_postnr_afs_fk FOREIGN KEY (afs_postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5900_jordfl_d_vejnavn_modt_fk FOREIGN KEY (modt_vejkode)
	REFERENCES fkg.d_vejnavn (vejkode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5900_jordfl_d_basis_postnr_modt_fk FOREIGN KEY (modt_postnr)
	REFERENCES fkg.d_basis_postnr (postnr) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5901_raastof_till | type: TABLE --
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
	CONSTRAINT t_5901_raastof_till_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5901_raastof_till_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5901_raastof_till_d_5901_raastof_type_fk FOREIGN KEY (raastof_type_kode)
	REFERENCES fkg.d_5901_raastof_type (raastof_type_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5901_raastof_till_d_5901_gravestatus FOREIGN KEY (gravstatus_kode)
	REFERENCES fkg.d_5901_gravestatus (gravstatus_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5902_jordv_anl | type: TABLE --
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
	CONSTRAINT t_5902_jordv_anl_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5902_jordv_anl_d_5902_vaeske_type_fk FOREIGN KEY (vaesketype_kode)
	REFERENCES fkg.d_5902_vaeske_type (vaesketype_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5902_jordv_anl_d_basis_sag_status FOREIGN KEY (sag_status_kode)
	REFERENCES fkg.d_basis_sag_status (sag_status_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5104_art_invas | type: TABLE --
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
	geometri geometry(POINT, 25832) NOT NULL,
	CONSTRAINT t_5104_art_invas_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5104_art_invas_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5104_art_invas_d_basis_ja_nej_fk FOREIGN KEY (sortlistet_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5104_art_invas_d_basis_antal_fk FOREIGN KEY (antal_kode)
	REFERENCES fkg.d_basis_antal (antal_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --

-- object: fkg.t_5107_art_invas_p | type: TABLE --
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
	CONSTRAINT t_5107_art_invas_p_pk PRIMARY KEY (versions_id),
	CONSTRAINT t_5107_art_invas_p_generel_fk FOREIGN KEY (versions_id)
	REFERENCES fkg.generel (versions_id) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5107_art_invas_p_d_basis_ja_nej_fk FOREIGN KEY (sortlistet_kode)
	REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE,
	CONSTRAINT t_5107_art_invas_p_d_basis_antal_fk FOREIGN KEY (antal_kode)
	REFERENCES fkg.d_basis_antal (antal_kode) MATCH FULL
	ON DELETE NO ACTION ON UPDATE NO ACTION NOT DEFERRABLE
);
-- ddl-end --

-- ddl-end --


