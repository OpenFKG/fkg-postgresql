/* 
    This file is part of the The OpenFKG PostgreSQL implementation of the FKG datamodel
    Copyright (C) 2014 Septima P/S 

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
CREATE OR REPLACE FUNCTION fkg_utilities.get_trigger_function_definition_mapinfo(fkg_view_name character varying)
  RETURNS character varying AS
$BODY$
DECLARE 
  _record RECORD;
  td                    character varying;
  mi_schema_name        character varying;
  fkg_schema_name       character varying;
  mi_view_name          character varying;
  trigger_function_name character varying;
  first_column          boolean;

BEGIN
  mi_schema_name = 'fkg_mapinfo';
  fkg_schema_name = 'fkg';
  mi_view_name = replace(fkg_view_name, '_vw', '_mi_vw');

  -- Evaluate name of trigger
  trigger_function_name = mi_schema_name || E'.' || mi_view_name || E'_trg()';

  -- Define the trigger definition
  td = '';
  td = td || E'DROP FUNCTION IF EXISTS ' || trigger_function_name || E' CASCADE;\n';
  td = td || E'CREATE OR REPLACE FUNCTION ' || trigger_function_name || E' RETURNS trigger AS $$' || E'\n';
  td = td || E'  BEGIN' || E'\n';
  ----------------------
  -- Delete operation --
  ----------------------
  td = td || E'    IF (TG_OP = ''DELETE'') THEN' || E'\n';
  td = td || E'      DELETE FROM ' || fkg_schema_name || E'.' || fkg_view_name || E'\n';
  td = td || E'      WHERE objekt_id = OLD.objekt_id::uuid;\n';
  td = td || E'      RETURN OLD;' || E'\n';
  ----------------------
  -- Update operation --
  ----------------------
  td = td || E'    ELSIF (TG_OP = ''UPDATE'') THEN' || E'\n';
  td = td || E'      IF NOT EXISTS (SELECT ''1'' FROM ' || fkg_schema_name || E'.' || fkg_view_name || E' WHERE objekt_id=OLD.objekt_id::uuid) THEN\n';
  td = td || E'        RETURN NULL;\n';
  td = td || E'      END IF;\n';
  td = td || E'      UPDATE ' || fkg_schema_name || E'.' || fkg_view_name || E'\n';
  td = td || E'      SET';
  -- Loop through the columns in input-view
  first_column=true;
  FOR _record IN SELECT column_name FROM information_schema.columns
  WHERE table_schema=fkg_schema_name AND table_name = fkg_view_name
  ORDER BY ordinal_position
  LOOP
    IF _record.column_name NOT IN ('objekt_id', 'versions_id', 'temakode', 'temanavn') THEN
      IF NOT first_column THEN td = td || E','; ELSE first_column=false; END IF;
        td = td || E'\n        ' || _record.column_name || E'=NEW.' || _record.column_name;
    END IF;
  END LOOP;
  td = td || E'\n';  
  td = td || E'      WHERE\n';
  td = td || E'        objekt_id = OLD.objekt_id::uuid;\n';
  td = td || E'      RETURN NEW;\n';
  ----------------------
  -- Insert operation --
  ----------------------
  td = td || E'    ELSIF (TG_OP = ''INSERT'') THEN' || E'\n';
  td = td || E'      INSERT INTO ' || fkg_schema_name || E'.' || fkg_view_name || E'(';
  -- Loop through the columns in input-view
  first_column=true;
  FOR _record IN SELECT column_name FROM information_schema.columns
  WHERE table_schema=fkg_schema_name AND table_name = fkg_view_name
  ORDER BY ordinal_position
  LOOP
    IF _record.column_name NOT IN ('objekt_id', 'versions_id', 'temakode','temanavn') THEN
      IF NOT first_column THEN td = td || E','; ELSE first_column=false; END IF;
      td = td || E'\n        ' || _record.column_name;
    END IF;
  END LOOP;
  td = td || E')\n      SELECT';
  -- Loop through the columns in input-view
  first_column=true;
  FOR _record IN SELECT column_name FROM information_schema.columns
  WHERE table_schema=fkg_schema_name AND table_name = fkg_view_name
  ORDER BY ordinal_position
  LOOP
    IF _record.column_name NOT IN ('objekt_id', 'versions_id', 'temakode','temanavn') THEN
      IF NOT first_column THEN td = td || E','; ELSE first_column=false; END IF;
      td = td || E'\n        NEW.' || _record.column_name;
    END IF;
  END LOOP;
  td = td || E';\n      RETURN NEW;\n';
  td = td || E'    END IF;\n';
  td = td || E'  END;\n';
  td = td || E'$$ LANGUAGE plpgsql;' || E'\n';
  td = td || E'\n';

  td = td || E'CREATE TRIGGER ' || mi_view_name || E'_trg_iud' || E'\n';
  td = td || E'    INSTEAD OF INSERT OR DELETE OR UPDATE ON ' || mi_schema_name || '.' || mi_view_name || E'\n';
  td = td || E'    FOR EACH ROW' || E'\n';
  td = td || E'    EXECUTE PROCEDURE ' || trigger_function_name || ';' || E'\n';
  
  -- Do the trigger definition
  execute td;

  return td;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Test
-- select fkg_utilities.get_trigger_function_definition_mapinfo('t_5001_maalest_vw');
