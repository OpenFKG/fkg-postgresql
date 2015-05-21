

SELECT fkg_utilities.get_view_definition(CAST(tablename AS character varying), 'H') FROM pg_tables WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE 
udvekslingsnavn IN ('t_5801_fac_fl','t_6119_evaku_centr','t_6120_midl_overn','t_6121_stor_ud_arr')) order by 1;


SELECT fkg_utilities.get_view_definition(CAST(tablename AS character varying), 'B') FROM pg_tables WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE 
udvekslingsnavn IN ('t_5801_fac_fl','t_6119_evaku_centr','t_6120_midl_overn','t_6121_stor_ud_arr')) order by 1;


SELECT fkg_utilities.get_trigger_function_definition(CAST(tablename AS character varying)) FROM pg_tables WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE 
udvekslingsnavn IN ('t_5801_fac_fl','t_6119_evaku_centr','t_6120_midl_overn','t_6121_stor_ud_arr'));
