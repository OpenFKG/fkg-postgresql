-- Upgrade script FKG datamodel 2_6_0_1 to 2_6_0_2
BEGIN TRANSACTION;

-- SELECT * FROM fkg.t_5800_fac_pkt_t WHERE vejkode IS NOT null LIMIT 100;

-- Drop dependent views
DROP VIEW fkg.t_5800_fac_pkt;
DROP VIEW fkg.hist_t_5800_fac_pkt;

-- New columns to t_5800_fac_pkt_t
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

-- Deleted columns to t_5800_fac_pkt_t
ALTER TABLE fkg.t_5800_fac_pkt_t
  DROP COLUMN vejkode CASCADE,
  DROP COLUMN husnr CASCADE,
  DROP COLUMN postnr CASCADE
;

-- New check constraints to t_5800_fac_pkt_t
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_st_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_st) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_sl_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_sl) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_antal_pl_ck CHECK (antal_pl BETWEEN 0 AND 9999);

-- New FK constraints to t_5800_fac_pkt_t
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

-- Rereate views
-- TBD
-- TBD

ROLLBACK TRANSACTION;