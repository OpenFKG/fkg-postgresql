-- Re: https://github.com/OpenFKG/fkg-postgresql/issues/98
DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_7900_fotoforbindelse_t;

-- Re: https://github.com/OpenFKG/fkg-postgresql/issues/93
INSERT INTO fkg.d_5800_facilitet VALUES (1351, 'Parkeringsplads', 1, 'En parkeringsplads/et område er et officielt sted beregnet til at henstille køretøjer på, når de ikke bruges.');
