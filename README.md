FKG til PostgreSQL/PostGIS
==============
Dette projekt er en fysisk implementering af den [fælleskommunale geodatamodel (GeoDF)](https://www.geodanmark.dk/om-geodanmark/)
i databasesystemet [PostgreSQL](http://www.postgresql.org/). Implementeringen benytter sig af [PostGIS](http://postgis.net/), som er en udvidelse, der tilføjer spatiel funktionalitet til PostgreSQL.

![Udsnit af FKG model i pgModeler](http://OpenFKG.github.io/fkg-postgresql/img/dataModel_cut_3_0.png "Udsnit af modellen i modelleringsværktøjet pgModeler")
Se diagram af [hele modellen](http://OpenFKG.github.io/fkg-postgresql/img/dataModel_2_4.png "Se diagram af modellen i modelleringsværktøjet pgModeler")

Features
-------------
Denne fysiske implementering af FKG-datamodellen udstiller en relationel FKG-datamodel som en ”flad” tabel struktur. Det betyder:
* at konsistensen i data sikres gennem regler for værdier og sammenhænge (constraints). Dermed sikres at data altid overholder de forretningsregler, som er implementeret ihht. FKG-datamodellen
* at databasen indeholder fuld databasehistorik, som i det daglige er skjult for den almindelige bruger
* at tilgang til databasen foregår på traditionel GIS manér (et tema=en tabel) gennem views, der kan opdateres
* at historiske data kan tilgås gennem særlige views, som udstiller historiske rækker
* at look-up tabeller kan benyttes som udgangspunkt for indhold i drop-down bokse

De generelle principper i implementeringen og værktøjer til generering af views og triggers, gør det muligt at benytte principperne til at danne andre temaer udenfor FKG-datamodellen.

Installation
-------------
For udvikler-information (kompilering af modellen) se afsnittet "For udviklere" nedenfor. 

Ønsker du bare at installere den "kompilerede version" af datamodellen (og ikke selv udvikle på den), så findes der færdige installationspakker på [Septimas hjemmeside](http://septima.dk/openfkgdownload). Installationspakkerne består af SQL scripts, som køres på din PostgreSQL-server, f.eks. ved hjælp af administrationsprogrammet pgAdmin.

PostgreSQL skal være version 9.* og databasen skal have følgende karakteristika:
* ENCODING = 'UTF8'
* LC_COLLATE = 'Danish, Denmark'
* LC_CTYPE = 'Danish, Denmark'

Når modellen er installeret, anbefaler vi, at man laver en bruger med reducerede rettigheder, som tilgår databasen via de funktionelle views og som derfor ikke kan se `..._t`-tabeller mv.
Brugeren skal have rettigheder til at:
* skrive i og læse fra `t_...`-views (interfaceviews til temaer)
* læse i `d_...`-tabeller (kodelistetabeller)
* læse fra `hist_t_...`-views (views, som også udstiller historiske data)

Licens
-------------
Hele dette projekt (dvs. databasemodel og scripts til dannelse af den nødvendige SQL, samt output fra disse) er frigivet under [GNU General Public License version 3](http://opensource.org/licenses/GPL-3.0). Det betyder, at du frit kan downloade og installere modellen, og at hvis du laver ændringer til modellen er også denne nye ændrede model GPL-licenseret. På den måde håber vi, at denne implementering af FKG-datamodellen vil møde bred opbakning og komme så mange som muligt til gode.

Ovennævnte betyder til gengæld *IKKE*, at de data, der senere fyldes i databasen, skal frigives. Data i databasen er - og vedbliver med at være - dine!


Status
-------------
Der er lagt et stort stykke arbejde med at udvikle programmellet, så hele basis for datamodellen med historik, constraints etc er på plads. Efterfølgende er det meget enkelt at implementere temaer - se afsnittet "Bidrag" nedenfor for mere om, hvordan dette kan gøres.

Primo juli 2015 blev der foretaget en opdatering fra version 2.4 til 2.5 økonomisk fra [KL](http://kl.dk). Alle temaer er således bragt op på version 2.5 og modellen er fuldt klar til brug.

I efteråret 2017 blev der udviklet en midlertidig "branch" på Datamodellen, som primært omhandlede ændringer til de 3 frilufttemaer `FACILITET_PUNKT (5800)` `FACILITET_FLADE (5801)` og `FACILITET_LINJE (5802)`. Disse ændringer er efterfølgende merget i hovedmodellen i version 2_6_0_1.

Medio juli 2019 er FKG datamodellen opdateret til version 2_6_0_2. Ændringer omfatter de 3 friluftstemaer, samt understøttelse for lagring af eksterne billed-filer. 

Bidrag
------------
Der er adskillige måder, hvorpå du kan bidrage til at gøre dette projekt endnu bedre for alles bedste.

Fejl, mangler og ideer til forbedringer opsamles i projektets [issuetracker](../../issues). Vær venlig at beskrive dit issue grundigt, så udvikleren kan gå lige til sagen.

Er du teknisk minded kan du følge det klassiske GitHub work flow og lave en "[Fork](https://help.github.com/articles/fork-a-repo)" af projektet, lave dine ændringer i din egen fork og sende et "[Pull request](https://help.github.com/articles/using-pull-requests)" til dette projekt. Kerneudviklere vil få direkte commit-adgang til projektet.

Er du mindre teknisk interesseret, kan du alligevel bidrage med værdifuld hjælp. Der er altid brug for hjælp til udvidelse og forbedring af dokumentation, vejledninger osv.

Det er også en mulighed at sponsorere udvikling på projektet. Det kan være udvikling af specifikke features eller udvikling af mere generel karakter. Kontakt eventuelt [Septima](http://www.septima.dk) for et uforpligtende tilbud.

Historie
-----------
Dette projekt er oprindeligt startet af firmaet [Septima](http://www.septima.dk). Septima så tidligt behovet for en fælles fysisk implementering af FKG på PostgreSQL og investerede derfor nogle hundrede timer i at lave en gennemført og fungerende implementering. Det var fra starten intentionen, at denne implementering skulle frigives som Open Source, så den kunne benyttes af alle interesserede, og så en situation med adskillige konkurrerende implementeringer med deraf følgende inkompatibiliteter kunne undgås.

Projektet blev endeligt frigivet som Open Source i begyndelsen af juli 2013 med udgangspunkt i FKG-datamodellen version 2.3.

Sommer 2014 blev alle temaer i version 2.4 implementeret / opgraderet med økonomisk støtte fra [KL](http://kl.dk).

Primo juli 2015 blev der foretaget en opdatering fra version 2.4 til 2.5 økonomisk fra [KL](http://kl.dk).

Efterår 2017 er datamodellen opgraderet fra 2.5 til version 2_6_0_1 (i særskilt branch) med økonomisk støtte fra [KL](http://kl.dk).

Sommer 2019 er datamodellen opgraderet fra version 2_6_0_1 til version 2_6_0_2 med økonomisk støtte fra [KL](http://kl.dk).


For udviklere
-----------
Basis for databasemodellen opsættes i databasemodelleringsværktøjet [pgModeler](http://www.pgmodeler.com.br/). Værktøjet er Open Source og under aktiv udvikling på [github.com/pgmodeler/pgmodeler](https://github.com/pgmodeler/pgmodeler). Sidste nye version til Mac OSX, Linux og Windows kan downloades [her](http://www.pgmodeler.com.br/).

Derudover er der lavet en lang række SQL scripts, metatabeller, funktioner mv., som tilsammen gør det muligt at oprette en fuld FKG database med views, constraints, historik, relationer osv. 

I et udviklingsmiljø anbefaler vi at man kører på en lokal og tom database, som man kan teste på -test ikke på en database, som kører produktion.

SQL-scriptene nummereret fra 000 til 999 køres i rækkefølge og databasen som du kører disse på vil derefter være en FKG-database - udover den almindelige databasemodel vil den have indlagte funktioner til at generere databasemodellen. Filen [040_metadata.sql](src/040_metadata.sql) generes først fra pgModeler, ved at vælge "Files" -> "Export".
Det er enklest at køre denne proces ved at bruge installations/kompileringsscriptet [make_install.sh](src/make_install.sh), hvori du bare skal ændre oplysningerne om din lokale *test/build*-database. 
Dette gøres enklest således:

1. Lav dine ændringer i modellen - fkg.dbm - i PgModeler
2. Eksportér dine ændringer fra PgModeler til filen [040_metadata.sql](src/040_metadata.sql)  (gem som seneste PostgreSQL version)
3. Lav de nødvendige ændringer i [050_coredata.sql](src/050_coredata.sql) og [060_fkg_utilities.sql](src/060_fkg_utilities.sql)
4. Ændr dine *build*-database-indstillinger og installationsfilens navn i toppen af [make_install.sh](src/make_install.sh)
5. Kør [make_install.sh](src/make_install.sh) i terminalen 
6. Dit installationsscript er nu at finde i folderen kaldet INSTALL

En installationspakke genereres ved at tage scriptene i 010 - 050 og output fra 090 - 110 og samle dette i en SQL-fil.

![FKG model i pgModeler](http://OpenFKG.github.io/fkg-postgresql/img/FKG-DM-screenshot.png "Udsnit af modellen i modelleringsværktøjet pgModeler")
