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

-- One liner that generates triggers for every present table
SELECT fkg_utilities.get_trigger_function_definition(CAST(tablename AS character varying)) FROM pg_tables  WHERE schemaname='fkg' AND tablename IN (SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel);

-- For 5800, 5801 and 5802, 5607, 5608
/*
SELECT fkg_utilities.get_trigger_function_definition(CAST(tablename AS character varying)) FROM pg_tables  WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE tema_kode IN (5800, 5801, 5802, 5607, 5608));
*/

--The following gets only for 5607, 7900, 7901, 5800, 5801, 5802
/*
SELECT fkg_utilities.get_trigger_function_definition(CAST(tablename AS character varying)) FROM pg_tables  WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE tema_kode IN (5607, 7900, 7901, 5800, 5801, 5802));
*/

--The following gets only for 5607
/*
SELECT fkg_utilities.get_trigger_function_definition(CAST(tablename AS character varying)) FROM pg_tables  WHERE schemaname='fkg' AND tablename IN 
(SELECT udvekslingsnavn || '_t' FROM fkg.d_tabel WHERE tema_kode IN (5607));
*/
