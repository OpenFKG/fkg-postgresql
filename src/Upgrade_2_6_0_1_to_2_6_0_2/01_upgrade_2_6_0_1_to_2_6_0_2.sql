-- Upgrade script FKG datamodel 2_6_0_1 to 2_6_0_2
BEGIN TRANSACTION;

----------------------
-- t_5800_fac_pkt_t --
----------------------
-- Drop dependent views
DROP VIEW fkg.t_5800_fac_pkt;
DROP VIEW fkg.hist_t_5800_fac_pkt;

-- New columns
ALTER TABLE fkg.t_5800_fac_pkt_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN saeson_st date,
  ADD COLUMN saeson_sl date,
  ADD COLUMN doegnaab_k integer,
  ADD COLUMN vandhane_k integer,
  ADD COLUMN bemand_k integer,
  ADD COLUMN betaling_k integer,
  ADD COLUMN book_k integer,
  ADD COLUMN antal_pl integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Deleted columns
ALTER TABLE fkg.t_5800_fac_pkt_t
  DROP COLUMN vejkode CASCADE,
  DROP COLUMN husnr CASCADE,
  DROP COLUMN postnr CASCADE
;

-- New check constraints
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_st_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_st) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_sl_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_sl) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_antal_pl_ck CHECK (antal_pl BETWEEN 0 AND 9999);

-- New FK constraints
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_doegnaab_fk FOREIGN KEY (doegnaab_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_vandhane_fk FOREIGN KEY (vandhane_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_bemand_fk FOREIGN KEY (bemand_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_betaling_fk FOREIGN KEY (betaling_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_book_fk FOREIGN KEY (book_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;

---------------------
-- t_5801_fac_fl_t --
---------------------
-- Drop dependent views
DROP VIEW fkg.t_5801_fac_fl;
DROP VIEW fkg.hist_t_5801_fac_fl;

-- New columns
ALTER TABLE fkg.t_5801_fac_fl_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN saeson_st date,
  ADD COLUMN saeson_sl date,
  ADD COLUMN doegnaab_k integer,
  ADD COLUMN vandhane_k integer,
  ADD COLUMN bemand_k integer,
  ADD COLUMN betaling_k integer,
  ADD COLUMN book_k integer,
  ADD COLUMN antal_pl integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Deleted columns
ALTER TABLE fkg.t_5801_fac_fl_t
  DROP COLUMN vejkode CASCADE,
  DROP COLUMN husnr CASCADE,
  DROP COLUMN postnr CASCADE
;

-- New check constraints
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_saeson_st_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_st) = 1);
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_saeson_sl_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_sl) = 1);
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_antal_pl_ck CHECK (antal_pl BETWEEN 0 AND 9999);

-- New FK constraints
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_doegnaab_fk FOREIGN KEY (doegnaab_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_vandhane_fk FOREIGN KEY (vandhane_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_bemand_fk FOREIGN KEY (bemand_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_betaling_fk FOREIGN KEY (betaling_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_book_fk FOREIGN KEY (book_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;

---------------------
-- t_5802_fac_li_t --
---------------------
-- Drop dependent views
DROP VIEW fkg.t_5802_fac_li;
DROP VIEW fkg.hist_t_5802_fac_li;

-- New codelist Table
CREATE TABLE fkg.d_5802_certifi (
  certifi_k integer NOT NULL,
  certifi character varying(40) NOT NULL,
  aktiv integer NOT NULL,
  begrebsdefinition character varying,
  CONSTRAINT d_5802_certifi_pk PRIMARY KEY (certifi_k)
);

-- New columns
ALTER TABLE fkg.t_5802_fac_li_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN betaling_k integer,
  ADD COLUMN slutpkt_x integer,
  ADD COLUMN slutpkt_y integer,
  ADD COLUMN certifi_k integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Renamed columns
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN konta_vedl TO kontak_ved;

-- Deleted columns
ALTER TABLE fkg.t_5802_fac_li_t
  DROP COLUMN straekn_nr CASCADE
;

-- New FK constraints
ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_certifi_fk FOREIGN KEY (certifi_k)
  REFERENCES fkg.d_5802_certifi (certifi_k) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Changes to core data
UPDATE fkg.d_5800_saeson SET begrebsdefinition = 'Faciliteten er åbent kun i sæsonen. Sæson/åbningstider kan/bør noteres i andre felter' WHERE saeson_k = 2;
UPDATE fkg.d_5802_rutetype SET aktiv = 0 WHERE rute_ty_k IN (10,11,12);
INSERT INTO fkg.d_5802_rutetype VALUES
  (13,'Margueritruten',   1, 'Skiltet rute forbi seværdigheder og smuk natur. Tiltænkt til biler og motorcyklister. Store dele også velegnet for cyklister.'),
  (14,'Trec-bane',        1, 'Rideaktivitetsbane i naturen for heste og ryttere.')
;
INSERT INTO fkg.d_5802_certifi VALUES
( 0, 'Ikke certificeret',               1, 'Ej certificeret'),
( 1, 'Premiumrute - rundvandrerute ',   1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/deutsches-wandersiegel/premiumwegtypen/'),
( 2, 'Premiumrute – let-vandrerute',    1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/premium-spazierwanderwege/'),
( 3, 'Premiumrute - langdistancerute',  1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/deutsches-wandersiegel/premiumwegtypen/'),
( 4, 'Premiumrute – byvandrerute',      1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/premium-stadtwanderwege/'),
( 5, 'Leading Quality Trail',           1, 'Vandrerute certificeret efter European Ramblers Associaltions ordning. https://www.era-ewv-ferp.org/lqt/'),
( 6, 'Kvalitetssti – Vandresti',        1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 7, 'Kvalitetssti – Natursti',         1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 8, 'Kvalitetssti – Kultursti',        1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 9, 'Kvalitetssti – Gastronomisk sti', 1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(10, 'Kvalitetssti – Familiesti',       1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(11, 'Kvalitetssti – Komfortsti',       1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(12, 'Kvalitetssti – Bysti',            1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(98, 'Anden',                           1, 'Anden certificering'),
(99, 'Ukendt',                          1, 'Mangler viden om certificereing')
;


-- TBD d_5800_facilitet

-- Rereate views
-- TBD
-- TBD


ROLLBACK TRANSACTION;
