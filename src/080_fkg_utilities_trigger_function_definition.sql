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

CREATE OR REPLACE FUNCTION fkg_utilities.get_trigger_function_definition(base_table_name character varying)
  RETURNS character varying AS
$BODY$
DECLARE 
  _record RECORD;
  td                    character varying;
  column_name_old       character varying;
  schema_name           character varying;
  trigger_function_name character varying;
  interface_name        character varying;
  theme_code            integer;
BEGIN

  td = ''; column_name_old=''; theme_code=NULL;
  schema_name = 'fkg';
  interface_name = substring(base_table_name FROM 1 FOR length(base_table_name)-2); -- The last 2 chars "_t" is removed
  
  -- Get theme_code
  EXECUTE 'SELECT tema_kode FROM ' || schema_name || '.d_tabel WHERE udvekslingsnavn = $1'
  INTO theme_code
  USING interface_name;
  IF theme_code IS NULL THEN
    RAISE EXCEPTION 'Entry for basetable: "%" is missing in "%.tema"', base_table_name, schema_name;
  END IF;

  -- Evaluate name of trigger
  trigger_function_name = schema_name || E'.' || interface_name || E'_trg()';


  -- Define the trigger definition
  td = '';
  td = td || E'CREATE OR REPLACE FUNCTION ' || trigger_function_name || E' RETURNS trigger AS $$' || E'\n';
  td = td || E'  BEGIN' || E'\n';
  ----------------------
  -- Delete operation --
  ----------------------
  td = td || E'    IF (TG_OP = ''DELETE'') THEN' || E'\n';
  td = td || E'      -- Return "0 rows deleted" IF NOT EXISTS' || E'\n';
  td = td || E'      IF NOT EXISTS (SELECT ''1'' FROM ' || schema_name || '.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN' || E'\n';
  td = td || E'        RETURN NULL;' || E'\n';
  td = td || E'      END IF;' || E'\n';
  td = td || E'      UPDATE ' || schema_name || '.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;' || E'\n';
  td = td || E'      RETURN OLD;' || E'\n';
  td = td || E'' || E'\n';

  ----------------------
  -- Update operation --
  ----------------------
  td = td || E'    ELSIF (TG_OP = ''UPDATE'') THEN' || E'\n';
  td = td || E'      -- Error handling' || E'\n';
  td = td || E'      IF (NEW.objekt_id <> OLD.objekt_id) THEN' || E'\n';
  td = td || E'        RAISE EXCEPTION ''Update of objekt_id is not allowed'';' || E'\n';
  td = td || E'      END IF;' || E'\n';
  td = td || E'      IF NOT EXISTS (SELECT ''1'' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN' || E'\n';
  td = td || E'        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS' || E'\n';
  td = td || E'      END IF;' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Initialize' || E'\n';
  td = td || E'      NEW.versions_id = uuid_generate_v1();' || E'\n';
  td = td || E'      NEW.systid_fra = current_timestamp;' || E'\n';
  td = td || E'      NEW.systid_til = NULL;' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Insert into general' || E'\n';
  td = td || E'      INSERT INTO ' || schema_name || '.generel (' || E'\n';
  td = td || E'        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)' || E'\n';
  td = td || E'      SELECT' || E'\n';
  td = td || E'        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Insert into theme' || E'\n';
  td = td || E'      INSERT INTO ' || schema_name || '.' || base_table_name || ' (versions_id';
  -- Loop through the columns in theme-table (column-NAME-list)
  FOR _record IN select * FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND column_name <> 'versions_id' ORDER BY ordinal_position, ordinal
  LOOP
    -- The code_field (if not already inserted)
    IF (_record.column_name <> column_name_old) THEN
       td = td || ', ' || _record.column_name;
       column_name_old = _record.column_name;
    END IF;
  END LOOP;
  column_name_old = '';
  td = td || E')' || E'\n';
  td = td || E'      SELECT' || E'\n';
  td = td || E'        NEW.versions_id';
  -- Loop through the columns in theme-table (column-VALUE-list)
  FOR _record IN select * FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND column_name <> 'versions_id' ORDER BY ordinal_position, ordinal
  LOOP
    -- The code_field (if not already inserted)
    IF (_record.column_name <> column_name_old) THEN
       td = td || ', NEW.' || _record.column_name;
       column_name_old = _record.column_name;
    END IF;
  END LOOP;
  column_name_old = '';
  td = td || E';' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Close the old version' || E'\n';
  td = td || E'      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;' || E'\n';
  td = td || E'      RETURN NEW;' || E'\n';
  td = td || E'\n';

  ----------------------
  -- Insert operation --
  ----------------------
  td = td || E'    ELSIF (TG_OP = ''INSERT'') THEN' || E'\n';
  td = td || E'       -- Verify that the objekt doesn''t exists as aktive' || E'\n';
  td = td || E'      IF (NEW.objekt_id IS NOT NULL) THEN' || E'\n';
  td = td || E'        IF EXISTS (SELECT ''1'' FROM ' || schema_name || '.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN' || E'\n';
  td = td || E'          RAISE EXCEPTION ''Objekt with objekt_id="%" already exists'', NEW.objekt_id;' || E'\n';
  td = td || E'        END IF;' || E'\n';
  td = td || E'      END IF;' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Initialize' || E'\n';
  td = td || E'      NEW.versions_id = uuid_generate_v1();' || E'\n';
  td = td || E'      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself' || E'\n';
  td = td || E'      NEW.systid_fra = current_timestamp;' || E'\n';
  td = td || E'      NEW.systid_til = NULL;' || E'\n';
  td = td || E'      NEW.oprettet = current_timestamp;' || E'\n';
  td = td || E'\n';
  td = td || E'      -- Insert into general' || E'\n';
  td = td || E'      INSERT INTO ' || schema_name || '.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)' || E'\n';
  td = td || E'      SELECT' || E'\n';
  td = td || E'        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;' || E'\n';
  td = td || E'\n';

      -- Insert into theme
  td = td || E'      -- Insert into ' || base_table_name || E'\n';
  td = td || E'      INSERT INTO ' || schema_name || '.' || base_table_name || ' (versions_id';
  -- Loop through the columns in theme-table (column-NAME-list)
  FOR _record IN select * FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND column_name <> 'versions_id' ORDER BY ordinal_position, ordinal
  LOOP
    -- The code_field (if not already inserted)
    IF (_record.column_name <> column_name_old) THEN
       td = td || ', ' || _record.column_name;
       column_name_old = _record.column_name;
    END IF;
  END LOOP;
  column_name_old = '';
  td = td || E')' || E'\n';
  td = td || E'      SELECT' || E'\n';
  td = td || E'        NEW.versions_id';
  -- Loop through the columns in theme-table (column-VALUE-list)
  FOR _record IN select * FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND column_name <> 'versions_id' ORDER BY ordinal_position, ordinal
  LOOP
    -- The code_field (if not already inserted)
    IF (_record.column_name <> column_name_old) THEN
       td = td || ', NEW.' || _record.column_name;
       column_name_old = _record.column_name;
    END IF;
  END LOOP;
  column_name_old = '';

  td = td || E';\n';
  td = td || E'      RETURN NEW;' || E'\n';
  td = td || E'    END IF;' || E'\n';
  td = td || E'  END;' || E'\n';
  td = td || E'$$ LANGUAGE plpgsql;' || E'\n';

  -- Now create the trigger itself
  td = td || E'\n';
  td = td || E'DROP TRIGGER IF EXISTS ' || interface_name || E'_trg_iud ON ' || schema_name || '.' || interface_name || E';\n';
  td = td || E'\n';
  td = td || E'CREATE TRIGGER ' || interface_name || E'_trg_iud' || E'\n';
  td = td || E'    INSTEAD OF INSERT OR DELETE OR UPDATE ON ' || schema_name || '.' || interface_name || E'\n';
  td = td || E'    FOR EACH ROW' || E'\n';
  td = td || E'    EXECUTE PROCEDURE ' || trigger_function_name || ';' || E'\n';

  -- Trigger function for make multi-geometry (in stead of single)
  td = td || E'\n';

  td = td || E'CREATE OR REPLACE FUNCTION fkg.make_multi()' || E'\n';
  td = td || E'  RETURNS trigger AS $$' || E'\n';
  td = td || E'  BEGIN' || E'\n';
  td = td || E'    IF (TG_OP = ''DELETE'') THEN' || E'\n';
  td = td || E'      RETURN OLD;' || E'\n';
  td = td || E'    ELSE' || E'\n';
  td = td || E'      NEW.geometri = ST_Multi(NEW.geometri);' || E'\n';
  td = td || E'    END IF;' || E'\n';
  td = td || E'    RETURN NEW;' || E'\n';
  td = td || E'  END;' || E'\n';
  td = td || E'$$LANGUAGE plpgsql VOLATILE' || E'\n';
  td = td || E'  COST 100;' || E'\n';
  td = td || E'\n';
  td = td || E'DROP TRIGGER IF EXISTS make_multi_trg ON ' || schema_name || '.' || base_table_name || ';' || E'\n';
  td = td || E'\n';
  td = td || E'CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE' || E'\n';
  td = td || E'   ON ' || schema_name || '.' || base_table_name || ' FOR EACH ROW' || E'\n';
  td = td || E'   EXECUTE PROCEDURE fkg.make_multi();' || E'\n';

  -- Do the trigger definition
  execute td;

  return td;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Test:
-- select fkg_utilities.get_trigger_function_definition('t_6100_brandhane');
-- select fkg_utilities.get_trigger_function_definition('t_5002_faunasp');
