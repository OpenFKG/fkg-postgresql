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

-- https://github.com/OpenFKG/fkg-postgresql/issues/83
UPDATE
  fkg.d_5802_rutetype
SET
  rute_ty = 'Bilrute',
  begrebsdefinition = 'Skiltet rute forbi seværdigheder og smuk natur. Tiltænkt biler og motorcyklister. Kan også være velegnet for cyklister.'
WHERE
  rute_ty_k = 13
;
INSERT INTO fkg.d_5802_rutetype
VALUES (15,'Svømmerute', 1, 'Svømmerute.')
;

-- https://github.com/OpenFKG/fkg-postgresql/issues/85
INSERT INTO fkg.d_5800_facilitet VALUES (4391, 'Hundetræningsareal', 1, 'Areal hvor man kan træne hunde.')
;
INSERT INTO fkg.d_5800_facilitet VALUES (2231, 'Naturnationalpark', 1  , 'Statens udpegede naturnationalparker.')
;




ROLLBACK TRANSACTION;