BEGIN TRANSACTION;

-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.6. https://github.com/OpenFKG/fkg-postgresql/milestone/4';

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/114
-- link4 på ladestander
ALTER TABLE t_5607_ladefacilitet_t ADD COLUMN link4 CHARACTER varying(1024) NULL;

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/116
-- tilgaeng_beskriv på 3 friluftstemaer
ALTER TABLE t_5800_fac_pkt_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000) NULL;
ALTER TABLE t_5801_fac_fl_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000) NULL;
ALTER TABLE t_5802_fac_li_t ADD COLUMN tilgaeng_beskriv CHARACTER varying(3000) NULL;



/*
-- Issue: https://github.com/OpenFKG/fkg-postgresql/issues/106
-- Nedlæg ladefaciliteter:
DELETE FROM fkg.d_tabel WHERE tema_kode = 5608;
DROP TABLE IF EXISTS fkg.t_5608_plan_ladefaciliteter_t CASCADE;

-- Issue: https://github.com/OpenFKG/fkg-postgresql/issues/107
-- Omdøb ladepunkter til ladefacilitet
UPDATE fkg.d_tabel SET tema_navn = 'Ladefacilitet', udvekslingsnavn = 't_5607_ladefacilitet' WHERE tema_kode = 5607;
ALTER TABLE fkg.t_5607_ladepunkter_t RENAME TO t_5607_ladefacilitet_t;
ALTER TABLE fkg.t_5607_ladefacilitet_t RENAME CONSTRAINT t_5607_ladepunkter_pk TO t_5607_ladefacilitet_pk;
ALTER TABLE fkg.t_5607_ladefacilitet_t RENAME CONSTRAINT t_5607_ladepunkter_generel_fk TO t_5607_ladefacilitet_generel_fk;
ALTER TABLE fkg.t_5607_ladefacilitet_t RENAME CONSTRAINT t_5607_lade_pkt_d_5607_ladefacilitet_type_fk TO t_5607_ladefacilitet_d_5607_ladefacilitet_type_fk;
ALTER TABLE fkg.t_5607_ladefacilitet_t RENAME CONSTRAINT t_5607_lade_pkt_d_5607_effekt_kode_fk TO t_5607_ladefacilitet_d_5607_effekt_kode_fk;
ALTER TABLE fkg.t_5607_ladefacilitet_t RENAME CONSTRAINT t_5607_lade_pkt_d_5607_tilgaengelighed_type_kode_fk TO t_5607_ladefacilitet_d_5607_tilgaengelighed_type_kode_fk;

-- Issue https://github.com/OpenFKG/fkg-postgresql/issues/108
-- Tilføj nye felter til ladefacilitet
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN planstatus_kode integer NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN foto_link CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN foto_link1 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN foto_link2 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN foto_link3 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN link CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN link1 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN link2 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN link3 CHARACTER varying(1024) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN adr_id uuid NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN ansvar_org CHARACTER varying(254) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN kontak_ved CHARACTER varying(254) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN omraade_navn CHARACTER varying(254) NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN gyldig_fra date NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD COLUMN gyldig_til date NULL;
ALTER TABLE fkg.t_5607_ladefacilitet_t ADD CONSTRAINT t_5607_ladefacilitet_d_planstatus_fk FOREIGN KEY (planstatus_kode) REFERENCES fkg.d_basis_planstatus (planstatus_kode);
UPDATE fkg.t_5607_ladefacilitet_t SET planstatus_kode = 1;

-- https://github.com/OpenFKG/fkg-postgresql/issues/111
-- Ændringer til postdistrikter
INSERT INTO fkg.d_basis_postnr VALUES (1162,'København K',1);
INSERT INTO fkg.d_basis_postnr VALUES (4244,'Agersø',1);
INSERT INTO fkg.d_basis_postnr VALUES (4245,'Omø',1);
INSERT INTO fkg.d_basis_postnr VALUES (4305,'Orø',1);
INSERT INTO fkg.d_basis_postnr VALUES (4942,'Askø',1);
INSERT INTO fkg.d_basis_postnr VALUES (4945,'Femø',1);
INSERT INTO fkg.d_basis_postnr VALUES (5601,'Lyø',1);
INSERT INTO fkg.d_basis_postnr VALUES (5602,'Avernakø',1);
INSERT INTO fkg.d_basis_postnr VALUES (5603,'Bjørnø',1);
INSERT INTO fkg.d_basis_postnr VALUES (5943,'Strynø',1);
INSERT INTO fkg.d_basis_postnr VALUES (5965,'Birkholm',1);
INSERT INTO fkg.d_basis_postnr VALUES (6210,'Barsø',1);
INSERT INTO fkg.d_basis_postnr VALUES (8789,'Endelave',1);
INSERT INTO fkg.d_basis_postnr VALUES (8799,'Tunø',1);
UPDATE fkg.d_basis_postnr SET postnr_by = 'Kongens Lyngby' WHERE postnr =  2800;

SELECT fkg_utilities.get_view_definition('t_5607_ladefacilitet_t', 'B');
SELECT fkg_utilities.get_view_definition('t_5607_ladefacilitet_t', 'H');
SELECT fkg_utilities.get_trigger_function_definition('t_5607_ladefacilitet_t');
SELECT fkg_utilities.get_index_definition('t_5607_ladefacilitet_t');
*/
ROLLBACK TRANSACTION;
