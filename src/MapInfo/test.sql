--select * from fkg.d_basis_ansvarlig_myndighed


-- Insert Multipoint
INSERT INTO fkg_mapinfo.t_5001_maalest_mi (cvr_kode, bruger_id, oprindkode, statuskode, off_kode, stationsnr, geometri) values (29189854, 'cfi', 1, 1, 1, 'X', 
  ST_Multi(ST_Setsrid(ST_Point(1,1), 25832)));

-- Insert Point
INSERT INTO fkg_mapinfo.t_5001_maalest_mi (cvr_kode, bruger_id, oprindkode, statuskode, off_kode, stationsnr, geometri) values (29189854, 'cfi', 1, 1, 1, 'X', 
  ST_Setsrid(ST_Point(1,1), 25832));

-- Update
UPDATE fkg_mapinfo.t_5001_maalest_mi SET geometri = ST_Multi(ST_Setsrid(ST_Point(2,2), 25832)) WHERE mi_prinx=1;

-- Delete
DELETE FROM fkg_mapinfo.t_5001_maalest_mi WHERE mi_prinx = (SELECT MAX(mi_prinx) FROM fkg_mapinfo.t_5001_maalest_mi);

select ST_Astext(geometri),* from fkg_mapinfo.t_5001_maalest_mi;
select ST_Astext(geometri),* from fkg_mapinfo.hist_t_5001_maalest_mi;
