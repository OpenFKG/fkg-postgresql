-- Version on DB:
COMMENT ON SCHEMA fkg IS E'GeoFA DB version 1.6.1. https://github.com/OpenFKG/fkg-postgresql/milestone/5';

-- https://github.com/OpenFKG/fkg-postgresql/issues/121
-- Ikke-aktiv facilitetstype
UPDATE fkg.d_5800_facilitet SET aktiv = 0 WHERE facil_ty_k = 1172;
