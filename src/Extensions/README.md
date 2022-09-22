# Udvidelser til GeoFA datamodellen

Udvidelser på dabaseniveau til GeoFA-datamodellen, placeres i databasen i særskilte skemaer. Udvidelser er afhængig af geofa datamodellen, der skal være placeret i schemaet `fkg`. De enkelte udvidelser er beskrivet i hver sit afsnit nedenfor.

## foto_gpx_link
 - Formål:
   - at udvide temaerne `t_5800_fac_pkt`, `t_5801_fac_fl` og `t_5801_fac_fl` med url-information til hvor man kan downloade [gpx-filer](https://fileinfo.com/extension/gpx) til ruter eller punkter og hvor man kan finde fotos
 - Placering:
   - Databasefunktionaliteten til udvidelsen er placeret i schemaet `fkg_foto_gpx_link`
 - Konfiguration:
   - Tabellen `fkg_foto_gpx_link.konfiguration` indeholder 5 rækker, som definerer placering (basisurl) af gpx-filer (for linje og punkt) og fotos. Tabellen er efter installationen populeret med:
     - 'gpx_base_url_t_5800_fac_pkt',  'https://geofa.geodanmark.dk/extensions/fkgupload/api/gpx/point/'),
     - 'gpx_base_url_t_5802_fac_li',   'https://geofa.geodanmark.dk/extensions/fkgupload/api/gpx/line/'),
     - 'foto_base_url_t_5800_fac_pkt', 'https://geofa-foto.geodanmark.dk/1600/'),
     - 'foto_base_url_t_5801_fac_fl',  'https://geofa-foto.geodanmark.dk/1600/'),
     - 'foto_base_url_t_5802_fac_li',  'https://geofa-foto.geodanmark.dk/1600/')
 - Virkemåde:
   - Der er etableret 3 views i schemaet `fkg_foto_gpx_link.t_5800_fac_pkt`, `fkg_foto_gpx_link.t_5801_fac_fl` og `fkg_foto_gpx_link.t_5802_fac_li`
   - CRUD operationer foretages på disse 3 views i stedet for standard-views i GeoFA.
   - Bemærk at man ikke kan opdatere eller indsætte i de nye beregnede kolonner.
 - Installation:
     - Kør scriptet [010_foto_gpx_link.sql](https://github.com/OpenFKG/fkg-postgresql/blob/master/src/010_foto_gpx_link.sql) 
 - Historik:
   - Version 1.0: oprettet ifm. GeoFA version 1.3
