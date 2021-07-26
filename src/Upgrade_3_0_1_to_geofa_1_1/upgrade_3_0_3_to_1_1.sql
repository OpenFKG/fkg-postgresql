BEGIN TRANSACTION;
-- https://github.com/OpenFKG/fkg-postgresql/issues/80
INSERT INTO fkg.d_basis_ansvarlig_myndighed VALUES ( 16287180, 'Forsvarsministeriets Ejendomsstyrelse', NULL, 1)
;

-- https://github.com/OpenFKG/fkg-postgresql/issues/81
UPDATE
  fkg.d_5800_facilitet 
SET
  facil_ty = 'Holdeplads',
  begrebsdefinition = 'Holdeplads i tilknytning til rekreative områder/faciliteter og som ikke er registreret andre steder. Man kan angive om holdepladsen er egnet til f.eks. hestetrailer i beskrivelsesfeltet.'
WHERE
  facil_ty_k = 1291
;


ROLLBACK TRANSACTION;
