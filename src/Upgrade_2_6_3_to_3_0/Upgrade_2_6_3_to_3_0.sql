-- Upgrade script FKG datamodel 2_6_0_3 til 3_0_0_0

-- Nye kolonner i generel (https://github.com/OpenFKG/fkg-postgresql/issues/57)
BEGIN TRANSACTION;
ALTER TABLE fkg.generel
  ADD COLUMN noegle character varying(128) NULL,
  ADD COLUMN note character varying(254) NULL;
-- Overfør data fra kolonne noegle i specific tables til generel (undgå at miste data):
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5003_draenledn_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5004_draenomr_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5104_art_invas_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5105_rig_fattig_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5107_art_invas_p_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5200_aff_prod_udbr_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5700_grundej_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5701_lok_omr_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5702_skorst_fej_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5703_afstem_sted_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5710_born_skole_dis_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5711_and_dis_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5712_plej_aeldr_dis_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5713_prog_stat_dis_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5714_laering_udd_inst_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5715_botilbud_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5716_servicetilbud_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_5900_jordfl_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6101_beskyt_rum_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6103_bered_omr_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6105_sbygn_omr_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6113_besk_nat_b_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6121_stor_ud_arr_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6800_parl_fl_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6801_parl_li_t  t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET noegle = t.noegle FROM fkg.t_6802_parl_pkt_t t WHERE fkg.generel.versions_id = t.versions_id;
-- Overfør data fra kolonne note  i specific tables til generel (undgå at miste data):
UPDATE fkg.generel SET note = t.note FROM fkg.t_5104_art_invas_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5105_rig_fattig_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5107_art_invas_p_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5108_groent_part_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5506_spildev_pl_pkt_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5508_husst_moel_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5705_forp_are_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_5902_jordv_anl_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6007_inds_omr_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6008_maks_bor_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6009_indv_ovflv_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6102_redn_vej_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6107_forholds_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6108_moedepl_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6110_noegle_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6116_olie_ber_pl_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6117_inds_pkt_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6118_bran_redn_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6119_evaku_centr_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6120_midl_overn_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6800_parl_fl_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6801_parl_li_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6802_parl_pkt_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_6803_parl_omr_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_7900_fotoforbindelse_t t WHERE fkg.generel.versions_id = t.versions_id;
UPDATE fkg.generel SET note = t.note FROM fkg.t_7901_foto_t t WHERE fkg.generel.versions_id = t.versions_id;
-- Drop kolonner
-- Helper:
-- SELECT
--  'ALTER TABLE fkg.' || t.table_name || ' DROP COLUMN ' || c.column_name || ' CASCADE;'
--FROM
--  information_schema.tables t JOIN information_schema."columns" c USING (table_schema, table_name)
--WHERE
--  table_type = 'BASE TABLE' AND column_name  IN ('note', 'noegle') ORDER BY table_name, column_name 
ALTER TABLE fkg.t_5003_draenledn_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5004_draenomr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5104_art_invas_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5105_rig_fattig_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5105_rig_fattig_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5107_art_invas_p_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5108_groent_part_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5200_aff_prod_udbr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5506_spildev_pl_pkt_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5508_husst_moel_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5700_grundej_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5701_lok_omr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5702_skorst_fej_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5703_afstem_sted_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5705_forp_are_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_5710_born_skole_dis_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5711_and_dis_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5712_plej_aeldr_dis_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5713_prog_stat_dis_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5714_laering_udd_inst_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5715_botilbud_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5716_servicetilbud_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5900_jordfl_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_5902_jordv_anl_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6007_inds_omr_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6008_maks_bor_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6009_indv_ovflv_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6101_beskyt_rum_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6102_redn_vej_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6103_bered_omr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6105_sbygn_omr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6107_forholds_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6108_moedepl_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6110_noegle_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6113_besk_nat_b_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6116_olie_ber_pl_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6117_inds_pkt_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6118_bran_redn_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6119_evaku_centr_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6120_midl_overn_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6121_stor_ud_arr_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6800_parl_fl_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6800_parl_fl_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6801_parl_li_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6801_parl_li_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6802_parl_pkt_t DROP COLUMN noegle CASCADE;
ALTER TABLE fkg.t_6802_parl_pkt_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_6803_parl_omr_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_7900_fotoforbindelse_t DROP COLUMN note CASCADE;
ALTER TABLE fkg.t_7901_foto_t DROP COLUMN note CASCADE;

-- Nye rækker i ansvarlig (https://github.com/OpenFKG/fkg-postgresql/issues/57)
INSERT INTO fkg.d_basis_ansvarlig_myndighed VALUES ( 25798376, 'Miljøstyrelsen', NULL, 1);
INSERT INTO fkg.d_basis_ansvarlig_myndighed VALUES ( 33157274, 'Naturstyrelsen', NULL, 1);
INSERT INTO fkg.d_basis_ansvarlig_myndighed VALUES ( 33284114, 'Styrelsen for Dataforsyning og Effektivisering', NULL, 1);
INSERT INTO fkg.d_basis_ansvarlig_myndighed VALUES ( 99999999, 'Øvrige/private', NULL, 1);

-- Nyt fejlt i t_5508_husst_moel_t (https://github.com/OpenFKG/fkg-postgresql/issues/60)
ALTER TABLE fkg.t_5508_husst_moel_t ADD COLUMN cvf_vejkode character varying(7) NULL;


ROLLBACK TRANSACTION;