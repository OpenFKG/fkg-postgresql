BEGIN TRANSACTION;

-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.7. https://github.com/OpenFKG/fkg-postgresql/milestone/6';

-- https://github.com/OpenFKG/fkg-postgresql/issues/124
-- Facilitetstypen fjernes helt:
-- NB: Kan fejle hvis en eksisterende facilitet i fkg.t_5800_fac_pkt_t eller fkg.t_5801_fac_fl_t peger på den.
DELETE FROM fkg.d_5800_facilitet WHERE facil_ty_k = 1172;


ROLLBACK TRANSACTION;
