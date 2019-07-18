set PGCLIENTENCODING=UTF8;
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 030_clean.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 040_metadata.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 050_coredata.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 060_fkg_utilities.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 070_fkg_utilities_view_definition.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 080_fkg_utilities_trigger_function_definition.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 085_fkg_utilities_index_definition.sql cf2
"C:\Program Files\PostgreSQL\10\bin\psql" --quiet -h localhost -p 5432 -U postgres -f 120_create_l_fotoforbindelse.sql cf2
