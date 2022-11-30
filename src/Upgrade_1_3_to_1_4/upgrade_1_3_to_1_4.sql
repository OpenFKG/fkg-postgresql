BEGIN TRANSACTION;
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
	geometri geometry(MULTIPOINT, 25832),
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
	geometri geometry(MULTIPOLYGON, 25832),
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

ROLLBACK;
