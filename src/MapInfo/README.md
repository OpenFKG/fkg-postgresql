FKG til PostgreSQL/PostGIS - Mapinfo variant
==============
Mapinfo-udvidelsen til FKG datamodel i PostgreSQL/PostGIS er udvidelser til FKG basismodellen. Udvidelserne er nødvendige, idet Mapinfo har nogle begrænsninger i at læse/skrive til standardimplementering til PostgreSQL.

Mapinfo-udvidelsen forudsætter, at FKG-datamodellen er installeret som bekrevet i XXX...henvisning til README...XXX

Features
-------------
Mapinfo-udvidelsen indeholder:
* Et schema, hvor alle Mapinfo specifikke elementer placeres: **fkg_mapinfo**
* Et "skrivbart" view for hvert FKG tema. Navngivning: [udvekslingsnavn]_mi_vw. F.eks: **t_5000_vandl_mi_vw**
* Et read-only view for hvert FKG tema, som indeholder både aktuelle og historiske versioner af objekter. Navngivning: [udvekslingsnavn]_mi_h_vw. F.eks: **t_5000_vandl_mi_h_vw**
* En række triggerfunktioner, som muliggør skrivning til de skrivbare views

Begrænsninger
-------------
* Det kan ikke gemmes data i tekstfelter der er længere end 254 (max. feltlængde i Mapinfo). Felter som er længere i FKG datamodellen kan stadig opdateres fra Mapinfo, men data bliver klippet af efter 254 tegn.
* Mapinfo kan ikke håndtere unique-identifiers som primærnøgle. FKG datamodellen foreskriver, at primærnøglen (forretningsnøglen på et objekt) er **objekt_id**, som er af typen unique-identifier. Fordi Mapinfo *ikke* tillader dette, er der implementeret en pseudo-nøgle **mi_prinx** på alle views. Nøglen persisteres ikke i databasen, men benyttes alene for at mapinfo kan opdatere de enkelte views
* Mapinfo tillader ikke skrivning til views i en Postgres database (fremgår af Mapinfo dokumentation). En workaround er beskrevet i afsnittet xxxOpsætning i MapInfo***

Installation
-------------
Forudsætning for installation af Mapinfo udvidelsen er at der allerede er installeret en FKG datamodel.

For udvikler-information (kompilering af modellen) se afsnittet "For udviklere" nedenfor. 

Ønsker du bare at installere den "kompilerede version" af datamodellen (og ikke selv udvikle på den), så findes der færdige installationspakker på [Septimas hjemmeside](http://septima.dk/openfkgdownload). Installationspakkerne består af SQL scripts, som køres på din PostgreSQL-server, f.eks. ved hjælp af administrationsprogrammet pgAdmin.

Mapinfo udvidelsen stiller ikke yderligere krav til PostgreSQL end basis FKG modellen.

Når modellen er installeret, anbefaler vi, at man laver en bruger med reducerede rettigheder, som tilgår databasen via de funktionelle views og som derfor ikke kan se `t_...`-tabeller mv.
Brugeren skal have rettigheder til at:
* skrive i og læse fra `..._mi_vw`-views (interfaceviews til temaer - placeret i fkg_mapinfo schemaet)
* læse i `d_...`-tabeller (kodelistetabeller - placeret i fkg schemaet)
* læse fra `..._mi_h_vw`-views (views, som også udstiller historiske data - placeret i fkg_mapinfo schemaet)

Licens
-------------
Hele dette projekt (dvs. databasemodel og scripts til dannelse af den nødvendige SQL, samt output fra disse) er frigivet under [GNU General Public License version 3](http://opensource.org/licenses/GPL-3.0). Det betyder, at du frit kan downloade og installere modellen, og at hvis du laver ændringer til modellen er også denne nye ændrede model GPL-licenseret. På den måde håber vi, at denne implementering af FKG-datamodellen vil møde bred opbakning og komme så mange som muligt til gode.

Ovennævnte betyder til gengæld *IKKE*, at de data, der senere fyldes i databasen, skal frigives. Data i databasen er - og vedbliver med at være - dine!


Status
-------------
Mapinfo udvidelsen til FKG følger basisversionen. 

Bidrag
------------
Der er adskillige måder, hvorpå du kan bidrage til at gøre dette projekt endnu bedre for alles bedste.

Fejl, mangler og ideer til forbedringer opsamles i projektets [issuetracker](../../issues). Vær venlig at beskrive dit issue grundigt, så udvikleren kan gå lige til sagen.

Er du teknisk minded kan du følge det klassiske GitHub work flow og lave en "[Fork](https://help.github.com/articles/fork-a-repo)" af projektet, lave dine ændringer i din egen fork og sende et "[Pull request](https://help.github.com/articles/using-pull-requests)" til dette projekt. Kerneudviklere vil få direkte commit-adgang til projektet.

Er du mindre teknisk interesseret, kan du alligevel bidrage med værdifuld hjælp. Der er altid brug for hjælp til udvidelse og forbedring af dokumentation, vejledninger osv.

Det er også en mulighed at sponsorere udvikling på projektet. Det kan være udvikling af specifikke features eller udvikling af mere generel karakter. Kontakt eventuelt [Septima](http://www.septima.dk) for et uforpligtende tilbud.

Historie
-----------
Mapinfo udvidelsen er udviklet sommer 2014 med økonomisk støtte fra [KL](http://kl.dk).

For udviklere
-----------
Basis for Mapinfo udvidelsen, er FKG datamodellen til PostgreSQL / PostGIS (læs mere her.....). Ovenpå basismodellen er der etableret views og triggers, som muliggør kommunikation mellem PostgreSQL og Mapinfo. I et udviklingsmiljø anbefaler vi at man kører på en lokal og tom database, som man kan teste på -test ikke på en database, som kører produktion.

SQL-scriptene er nummereret fra 000 til 999 køres i rækkefølge og den eksisterende FKG-database som du kører disse på, vil derefter være en FKG-database med Mapinfo udvidelser.

Rettelser / ændringer foretages normalt i **070_fkg_utilities_view_definition_mapinfo.sql** eller **080_fkg_utilities_trigger_function_definition_mapinfo.sql* som definerer views og triggere. De øvrige script-filer indeholder intet programmatisk funktionalitet.

Installations/kompileringsscriptet [make_install.sh](src/make_install.sh), kan anvendes til at etablere et færdigt installationssæt. Du skal blot ændre oplysningerne i scriptet om din lokale *test/build*-database. 
Dette gøres enklest således:

1. Ændr dine *build*-database-indstillinger og installationsfilens navn i toppen af [make_install.sh](src/make_install.sh)
5. Kør [make_install.sh](src/make_install.sh) i terminalen 
6. Dit installationsscript er nu at finde i folderen kaldet INSTALL

En installationspakke genereres ved at tage scriptene i 010 - 050 og output fra 090 + 100 og samle dette i en SQL-fil.
