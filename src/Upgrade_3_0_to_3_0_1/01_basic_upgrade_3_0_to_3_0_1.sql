-- Upgrade script FKG datamodel 3.0 til 3.0.1
BEGIN TRANSACTION;

-- Omdøbning af filmlink: https://github.com/OpenFKG/fkg-postgresql/issues/69
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN film_link TO filmlink;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN film_link1 TO filmlink1;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN film_link2 TO filmlink2;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN film_link3 TO filmlink3;

ALTER TABLE fkg.t_5801_fac_fl_t  RENAME COLUMN film_link TO filmlink;
ALTER TABLE fkg.t_5801_fac_fl_t  RENAME COLUMN film_link1 TO filmlink1;
ALTER TABLE fkg.t_5801_fac_fl_t  RENAME COLUMN film_link2 TO filmlink2;
ALTER TABLE fkg.t_5801_fac_fl_t  RENAME COLUMN film_link3 TO filmlink3;

ALTER TABLE fkg.t_5802_fac_li_t  RENAME COLUMN film_link TO filmlink;
ALTER TABLE fkg.t_5802_fac_li_t  RENAME COLUMN film_link1 TO filmlink1;
ALTER TABLE fkg.t_5802_fac_li_t  RENAME COLUMN film_link2 TO filmlink2;
ALTER TABLE fkg.t_5802_fac_li_t  RENAME COLUMN film_link3 TO filmlink3;

-- Nye foldelink kolonner: https://github.com/OpenFKG/fkg-postgresql/issues/71
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN foldelink1 character varying(1024) NULL;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN foldelink2 character varying(1024) NULL;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN foldelink3 character varying(1024) NULL;

ALTER TABLE fkg.t_5801_fac_fl_t  ADD COLUMN foldelink1 character varying(1024) NULL;
ALTER TABLE fkg.t_5801_fac_fl_t  ADD COLUMN foldelink2 character varying(1024) NULL;
ALTER TABLE fkg.t_5801_fac_fl_t  ADD COLUMN foldelink3 character varying(1024) NULL;

ALTER TABLE fkg.t_5802_fac_li_t  ADD COLUMN foldelink1 character varying(1024) NULL;
ALTER TABLE fkg.t_5802_fac_li_t  ADD COLUMN foldelink2 character varying(1024) NULL;
ALTER TABLE fkg.t_5802_fac_li_t  ADD COLUMN foldelink3 character varying(1024) NULL;

-- saeson_st og saeson_sl ændrer type (fejlagtigt rettet i 3.0.0): https://github.com/OpenFKG/fkg-postgresql/issues/70
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN saeson_st TO saeson_st_old;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN saeson_sl TO saeson_sl_old;
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN saeson_st TO saeson_st_old;
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN saeson_sl TO saeson_sl_old;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN saeson_st date NULL;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN saeson_sl date NULL;
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN saeson_st date NULL;
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN saeson_sl date NULL;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_sl_aar_skal_vaere_1_ck CHECK ((date_part('year'::text, saeson_sl) = (1)::double precision));
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_st_aar_skal_vaere_1_ck CHECK ((date_part('year'::text, saeson_st) = (1)::double precision));
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_t_saeson_sl_aar_skal_vaere_1_ck CHECK ((date_part('year'::text, saeson_sl) = (1)::double precision));
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_t_saeson_st_aar_skal_vaere_1_ck CHECK ((date_part('year'::text, saeson_st) = (1)::double precision));

UPDATE fkg.t_5800_fac_pkt_t
SET
  saeson_st =  ('1901' || '-' || substring(saeson_st_old FROM 4 FOR 2) || '-' || substring(saeson_st_old FROM 1 FOR 2))::date,
  saeson_sl =  ('1901' || '-' || substring(saeson_sl_old FROM 4 FOR 2) || '-' || substring(saeson_sl_old FROM 1 FOR 2))::date
;
UPDATE fkg.t_5801_fac_fl_t
SET
  saeson_st =  ('1901' || '-' || substring(saeson_st_old FROM 4 FOR 2) || '-' || substring(saeson_st_old FROM 1 FOR 2))::date,
  saeson_sl =  ('1901' || '-' || substring(saeson_sl_old FROM 4 FOR 2) || '-' || substring(saeson_sl_old FROM 1 FOR 2))::date
;

ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN saeson_st_old cascade;
ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN saeson_sl_old cascade;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN saeson_st_old cascade;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN saeson_sl_old cascade;

ROLLBACK TRANSACTION;
