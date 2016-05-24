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
CREATE OR REPLACE FUNCTION fkg_utilities.get_view_definition_mapinfo(fkg_view_name character varying, view_type character(1))
  RETURNS character varying AS
$BODY$
DECLARE 
  _record RECORD;
  vd character varying;
  mi_schema_name character varying;
  fkg_schema_name character varying;
  view_name character varying;

BEGIN
  mi_schema_name = 'fkg_mapinfo';
  fkg_schema_name = 'fkg';

  IF fkg_view_name IS NULL THEN
    RAISE EXCEPTION 'fkg_view_name can''t be NULL';
  END IF;
  IF view_type IS NULL THEN
    RAISE EXCEPTION 'view_type can''t be NULL';
  END IF;

  -- Evaluate name of view
  IF view_type = 'B' THEN
    view_name = mi_schema_name || E'.' || fkg_view_name || '_mi';
  ELSEIF view_type = 'H' THEN
    view_name = mi_schema_name || E'.' || 'hist_' || fkg_view_name || '_mi';
  ELSE
    RAISE EXCEPTION 'Mapinfo view_type must be ''H'' (historic view) or ''B'' (base view)';
  END IF;

  -- Define the view
  vd = '';
  vd = vd || E'DROP VIEW IF EXISTS ' || view_name || E';\n';

  vd = vd || E'CREATE OR REPLACE VIEW ' || view_name || E' AS\n';
  vd = vd || E'SELECT\n';
  vd = vd || E'  row_number() OVER (ORDER BY oprettet, objekt_id)::integer AS mi_prinx';
  
  -- Loop through the columns in input-view
  FOR _record IN SELECT column_name, data_type, character_maximum_length FROM information_schema.columns
  WHERE table_schema=fkg_schema_name AND table_name = fkg_view_name
  ORDER BY ordinal_position
  LOOP
    vd = vd || E',\n  ' || _record.column_name;
    -- Cast uid to character(36)
    IF _record.data_type = 'uuid' THEN
      vd = vd || E'::char(36)';
    END IF;
    -- Cast to character varying(254) if longer or NULL
    IF _record.data_type IN ('character varying', 'text') AND (_record.character_maximum_length>254 OR _record.character_maximum_length IS NULL) THEN
      vd = vd || E'::character varying(254)';
    END IF;
    -- Case if column name = geometri => cast to geometry(Geometry, 25832)
    IF _record.column_name = 'geometri' THEN
      vd = vd || E'::geometry(Geometry,25832)';
    END IF;
  END LOOP;
  -- FROM clause
  vd = vd || E'\nFROM\n';
  IF view_type = 'B' THEN
    vd = vd || E'  ' || fkg_schema_name || E'.' || fkg_view_name || E';\n' ;
  ELSE
    vd = vd || E'  ' || fkg_schema_name || E'.hist_' || fkg_view_name || E';\n' ;
  END IF;
  
  execute vd;

  return vd;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- Test
-- select fkg_utilities.get_view_definition_mapinfo('t_5001_maalest', 'B');
-- select fkg_utilities.get_view_definition_mapinfo('t_5001_maalest', 'H');
