/* 
    This file is part of the The OpenFKG PostgreSQL implementation of the FKG datamodel
    Copyright (C) 2013 Septima P/S 

    The OpenFKG PostgreSQL implementation of the FKG datamodel is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The OpenFKG PostgreSQL implementation of the FKG datamodel is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with The OpenFKG PostgreSQL implementation of the FKG datamodel.  If not, see <http://www.gnu.org/licenses/>.

    See more about the OpenFKG project at http://github.com/OpenFKG
*/

CREATE OR REPLACE FUNCTION fkg_utilities.get_index_definition(base_table_name character varying)
  RETURNS character varying AS
$BODY$
DECLARE 
  _record RECORD;
  id                    character varying;
  schema_name           character varying;
  index_name            character varying;
BEGIN

  id = '';
  schema_name = 'fkg';
  
  -- Evaluate name of gist index
  index_name = base_table_name || E'_gist';

  -- Define the index
  id = '';
  id = id || E'DROP INDEX IF EXISTS ' || schema_name || '.' || base_table_name || E'_gist;';
  id = id || E'CREATE INDEX ' || index_name || ' ON ' || schema_name || '.' || base_table_name || ' USING gist (geometri);';

  -- Create the index
  execute id;

  return id;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Test:
-- select fkg_utilities.get_index_definition('t_6100_brandhane_t');
