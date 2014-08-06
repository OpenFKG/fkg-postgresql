"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 030_clean.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 040_metadata.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 050_coredata.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 060_fkg_utilities.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 070_fkg_utilities_view_definition.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 080_fkg_utilities_trigger_function_definition.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 090_create_views.sql
"C:\Program Files\PostgreSQL\9.1\bin\psql" -U postgres -f 100_create_trigger_functions.sql
