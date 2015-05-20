-- Alter script FKG 2.4 => 2.5
-- Slet temaer
DROP TABLE IF EXISTS fkg.t_5901_raastof_till_t CASCADE;
DROP TABLE IF EXISTS fkg.t_6114_midl_oph_t CASCADE;
DELETE FROM fkg.d_tabel WHERE tema_kode IN (5901, 6114);


