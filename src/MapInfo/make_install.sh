#!/bin/bash
#    This file is part of the The OpenFKG PostgreSQL implementation of the FKG datamodel
#    Copyright (C) 2013 Septima P/S 
#
#    The OpenFKG PostgreSQL implementation of the FKG datamodel is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    The OpenFKG PostgreSQL implementation of the FKG datamodel is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with The OpenFKG PostgreSQL implementation of the FKG datamodel.  If not, see <http://www.gnu.org/licenses/>.
#
#    See more about the OpenFKG project at http://github.com/OpenFKG

# HOWTO:
# 1) Make your alterations to the model - fkg.dbm - in PgModeler
# 2) Export the model from PgModeler as 040_metadata.sql
# 3) Make any necessary alterations to 050_coredata.sql and 060_fkg_utilities.sql
# 4) Alter the SETTINGS section below to point at your BUILD! database
# 5) run make_install.sh
# 6) Your install package script is now present in the INSTALL/ folder


################## SETTINGS

# Information about your _build_ database (not your production database!)
USER=postgres
PGPASSWORD="W<+q~.\$K)lsOW\`^D3m8M"
DB=fkg_build
HOST=localhost
PORT=5432
export PGPASSFILE=.pgpass

# What to call the installation script
INSTALL_FILE=fkg_v_XXX_install_mapinfo_extension.sql

################## END SETTINGS - do not correct below


# make a .pgpass file -hostname:port:database:username:password 
echo $HOST:$PORT:$DB:$USER:$PGPASSWORD > .pgpass 
chmod 0600 .pgpass

# Make an install directory
mkdir INSTALL

# Remove any old files from INSTALL
rm INSTALL/*

# Add our copyright NOTICE
echo "/*" >> INSTALL/$INSTALL_FILE
cat ../NOTICE >> INSTALL/$INSTALL_FILE
echo "*/" >> INSTALL/$INSTALL_FILE

# Copy the stuff
cat 030_clean_mapinfo.sql >> INSTALL/$INSTALL_FILE
cat 040_metadata_mapinfo.sql >> INSTALL/$INSTALL_FILE

# Run the scripting files like this
# psql --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=

# CLEAN the build database of any signs of old builds
psql --quiet --tuples-only --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=030_clean_mapinfo.sql

# Create the meta data and simple table forms
psql --quiet --tuples-only --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=040_metadata_mapinfo.sql

# Create the view definition functions
psql --quiet --tuples-only --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=070_fkg_utilities_view_definition_mapinfo.sql

# Create the trigger definition functions
psql --quiet --tuples-only --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=080_fkg_utilities_trigger_function_definition_mapinfo.sql

# Create the views and store output
psql --quiet --tuples-only --pset linestyle=old-ascii --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=090_create_views_mapinfo.sql  -o INSTALL/_tmp.sql
cat INSTALL/_tmp.sql >> INSTALL/$INSTALL_FILE

# Create the triggers and store output
psql --quiet --tuples-only --pset linestyle=old-ascii --host=$HOST --port=$PORT --dbname=$DB --username=$USER --no-password --file=100_create_trigger_functions_mapinfo.sql  -o INSTALL/_tmp.sql
cat INSTALL/_tmp.sql >> INSTALL/$INSTALL_FILE


# remove tmp file
rm INSTALL/_tmp.sql

# Remove the .pgpass file
rm .pgpass
