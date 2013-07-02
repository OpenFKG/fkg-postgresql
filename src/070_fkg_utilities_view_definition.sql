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

CREATE OR REPLACE FUNCTION fkg_utilities.get_view_definition(base_table_name character varying, view_type character(1))
  RETURNS character varying AS
$BODY$
DECLARE 
  _record RECORD;
  vd character varying;
  column_name_old character varying;
  constraint_name_old character varying;
  relation_counter integer;
  schema_name character varying;
  view_name character varying;
  theme_code integer;
BEGIN
  IF base_table_name IS NULL THEN
    RAISE EXCEPTION 'base_table_name can''t be NULL';
  END IF;
  IF view_type IS NULL THEN
    RAISE EXCEPTION 'view_type can''t be NULL';
  END IF;

  vd = ''; column_name_old=''; relation_counter=0; constraint_name_old=''; theme_code=NULL;
  schema_name = 'fkg';
  
  -- Get theme_code
  EXECUTE 'SELECT tema_kode FROM ' || schema_name || '.tema WHERE udvekslingsnavn = $1'
  INTO theme_code
  USING base_table_name;
  IF theme_code IS NULL THEN
    RAISE EXCEPTION 'Entry for basetable: "%" is nissing in "%.tema"', base_table_name, schema_name;
  END IF;

  -- Evaluate name of view
  IF view_type = 'B' THEN
    view_name = schema_name || E'.' || base_table_name || E'_vw';
  ELSEIF view_type = 'H' THEN
    view_name = schema_name || E'.' || base_table_name || E'_h_vw';
  ELSE
    RAISE EXCEPTION 'view_type must be ''H'' (historic view) or ''B'' (base view)';
  END IF;

  -- Define the view
  vd = '';
  vd = vd || E'DROP VIEW IF EXISTS ' || view_name || E';\n';
  vd = vd || E'CREATE VIEW ' || view_name || E' AS' || E'\n';
  vd = vd || E'SELECT' || E'\n';
  vd = vd || E'  ' || CAST(theme_code AS character varying) || E'::integer AS temakode,' || E'\n';
  vd = vd || E'  ''' || base_table_name || '''::text AS temanavn,' || E'\n';
  vd = vd || E'  g.objekt_id,' || E'\n';
  vd = vd || E'  g.versions_id,' || E'\n';
  vd = vd || E'  g.systid_fra,' || E'\n';
  vd = vd || E'  g.systid_til,' || E'\n';
  vd = vd || E'  g.oprettet,' || E'\n';
  vd = vd || E'  g.cvr_kode,' || E'\n';
  vd = vd || E'  m.cvr_navn,' || E'\n';
  vd = vd || E'  m.kommunekode,' || E'\n';
  vd = vd || E'  g.bruger_id,' || E'\n';
  vd = vd || E'  g.oprindkode,' || E'\n';
  vd = vd || E'  o.oprindelse,' || E'\n';
  vd = vd || E'  g.statuskode,' || E'\n';
  vd = vd || E'  s.status';

  -- Loop through the columns in theme-table
  FOR _record IN select * FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND column_name <> 'versions_id' ORDER BY ordinal_position, ordinal
  LOOP
    -- The code_field (if not already inserted)
    IF (_record.column_name <> column_name_old) THEN
       vd = vd || ',' || E'\n  ' || E't.' || _record.column_name;
       column_name_old = _record.column_name;
    END IF;

    -- If fk-relation add column from FK-table
    IF (_record.constraint_name IS NOT NULL) THEN
      IF (_record.constraint_name <> constraint_name_old) THEN
        relation_counter = relation_counter + 1;
        constraint_name_old = _record.constraint_name;
      END IF;
      vd = vd || ',' || E'\n  ' || E'k' || relation_counter::text || E'.' || _record.value_field || E' AS ' || _record.field_alias;
    END IF;
  END LOOP;

  -- Now add the from clause
  vd = vd || E'\nFROM\n' ||
  E'  ' || schema_name || E'.generel g JOIN\n' ||
  E'  ' || schema_name || E'.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN\n' ||
  E'  ' || schema_name || E'.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN\n' ||
  E'  ' || schema_name || E'.d_basis_status s ON (g.statuskode=s.statuskode) JOIN\n' ||
  E'  ' || schema_name || E'.' || base_table_name || ' t ON (g.versions_id = t.versions_id)';

  -- Add the codelist relations
  relation_counter = 0;
  FOR _record IN select DISTINCT constraint_name, column_name, ref_column_name, ref_table_name, ordinal_position FROM fkg_utilities.column_metadata WHERE table_name = base_table_name AND constraint_name IS NOT NULL ORDER BY ordinal_position
  LOOP
    relation_counter = relation_counter + 1;
    vd = vd || E' JOIN\n  '  || schema_name || E'.' || _record.ref_table_name || E' k' || relation_counter::text;
    vd = vd || E' ON (t.' || _record.column_name || E' = k' || relation_counter::text || E'.' || _record.ref_column_name || ')';
  END LOOP;

  -- If base view, add the where criteria
  IF view_type = 'B' THEN
    vd = vd || E'\n';
    vd = vd || E'WHERE g.systid_til IS NULL';
  END IF;

  -- Add semicolon
  vd = vd || ';';

  -- Do the view definition
  execute vd;

  return vd;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Test
-- select fkg_utilities.get_view_definition('t_5000_vandl', 'B');
