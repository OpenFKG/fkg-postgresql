
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

-- Each line creates all views (base-view 'B' og view with historic records 'H')
SELECT fkg_utilities.get_view_definition_mapinfo(tablename || '_vw', 'B') FROM pg_tables WHERE schemaname='fkg' AND tablename IN (SELECT udvekslingsnavn FROM fkg.tema);
SELECT fkg_utilities.get_view_definition_mapinfo(tablename || '_h_vw', 'H') FROM pg_tables WHERE schemaname='fkg' AND tablename IN (SELECT udvekslingsnavn FROM fkg.tema);
