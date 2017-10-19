BEGIN TRANSACTION;

-- New basic lookuptable
CREATE TABLE fkg.d_basis_ansvar_v(
  ansva_v_kode integer NOT NULL, ansva_v character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_basis_ansv_v_pk PRIMARY KEY (ansva_v_kode));

-- New themespecific looktables
CREATE TABLE fkg.d_5800_saeson(saeson_k integer NOT NULL, saeson character varying(50) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5800_saeson_pk PRIMARY KEY (saeson_k));

CREATE TABLE fkg.d_5802_rutetype(rute_ty_k integer NOT NULL, rute_ty character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5802_rutetype_pk PRIMARY KEY (rute_ty_k));

CREATE TABLE fkg.d_5802_svaerhed(svaerhed_k integer NOT NULL, svaerhed character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5802_svaerhed_pk PRIMARY KEY (svaerhed_k));

CREATE TABLE fkg.d_5802_hierarki(hierarki_k integer NOT NULL, hierarki character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5802_hierarki_pk PRIMARY KEY (hierarki_k));
  
CREATE TABLE fkg.d_5802_rute_uty(rute_uty_k integer NOT NULL, rute_uty character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5802_rute_uty_pk PRIMARY KEY (rute_uty_k));
  
CREATE TABLE fkg.d_5802_kategori(kategori_k integer NOT NULL, kategori character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5802_kategori_pk PRIMARY KEY (kategori_k));

ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN fremkommelighed_kode CASCADE;
DROP TABLE fkg.d_5802_fremkommelighed;

-- New lookup value:
INSERT INTO fkg.d_basis_handicapegnet VALUES
(4,'Handicapvenligt', 1, 'Der er taget hensyn til adgang for handicappede.');

INSERT INTO fkg.d_basis_ansvar_v VALUES
(1, 'Privat/forening',  1, 'Vedligeholdes af privatpersoner/organisationer/foreninger og lign.'),
(2, 'Kommune',          1, 'Vedligeholdes af kommune.'),
(3, 'Staten',           1, 'Vedligeholdes af staten eller en myndighed under staten f.eks. Naturstyrelsen.'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om vedligeholder');

INSERT INTO fkg.d_5800_saeson VALUES
(1, 'Helårsåbent',      1, 'Faciliteten er åbent hele året'),
(2, 'Sæsonåbent',       1, 'Faciliteten er åbent kun i sæsonen. Sæson/åbningstider kan noteres i beskrivelsesfeltet'),
(7, 'Ej relevant',      1, 'Angivelse af sæson er ikke relevant-'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om fremkommeligheden');

INSERT INTO fkg.d_5802_rutetype VALUES
(1, 'Skirute',          1, 'Skiløberute på afmærkede og uafmærkede ruter i naturen.'),
(2, 'Løberute',         1, 'Løberute på afmærkede og uafmærkede ruter langs veje og i naturen.'),
(3, 'Cykelrute',        1, 'Rute for cykler, afmærket på kort og evt. i terræn.'),
(4, 'Mountainbikerute', 1, 'Afmærket eller uafmærket rute for mountainbikes.'),
(5, 'Vandrerute',       1, 'Rute velegnet til vandring.'),
(6, 'Motionsrute',      1, 'Rute udpeget til motionsformål – typisk løb eller gang.'),
(7, 'Undervandsrute',   1, 'Afmærket eller uafmærket rute under vand for snorkeldykkere/dykkere.'),
(8, 'Riderute',	        1, 'Afmærket eller uafmærket rute til færdsel til hest.'),
(9, 'Sejlrute',	        1, 'Afmærket eller uafmærket rute for kano- og kajak-sejlads.'),
(10,'Gratis fiskeri',	0, 'Strækning med gratis fiskeri.'),
(11,'Rekreativ sti',	1, 'Vandresti med fokus på det rekreative.'),
(12,'Adgangsvej',	0, 'Sti eller spor med fri adgang, der fører hen til facilitet.'),
(98,'Andet',            1, 'Hvor andre facilitetsbetegnelser ikke er dækkende.'),
(99,'Ukendt',           1, 'Mangler viden om rutetypen.');

INSERT INTO fkg.d_5802_svaerhed VALUES
(1, 'Meget let',        1, 'MTB: MTB rytter nybegynder/uden grundlæggende færdigheder'),
(2, 'Let',              1, 'Vandreruter: Asfalt, stenmel eller andet fast underlag. Fortrinsvis flad rute, moderate stigninger ingen stejle op og nedgange. Cykelruter: Landeveje og cykelstier, asfalt underlag, ingen eller få/korte svære passager, egnet til ryttercykel. MTB: MTB rytter med grundlæggende færdigheder'),
(3, 'Middel/Moderat',   1, 'Vandreruter: Blandet underlag f.eks. asfalt, stenmel eller andet fast underlag, men også mere udfordrende og blødt underlag i form af f.eks. skovstier og spor. Mere udfordrende stigninger og nedgange kan forekomme (varieret terræn!), med broovergange, klaplåger, trapper og lignende. Cykelruter: Blanding af asfalt og grusveje, kan indeholde sværere passager, egnet til turcykling. MTB: Den øvede MTB rytter'),
(4, 'Svær/udfordrende', 1, 'Vandreruter: Trampestier i åbent og lukket terræn – skove, kyster mv. Udfordrende stigninger og nedgange kan forekomme (stejlt terræn), med stenter, gangbrædder, trin og lignende. Mange typer af udfordringer kan forekomme. Cykelruter: Forvent skovveje og mindre vedligeholdte spor, bedst egnet til kraftigere turcykler med brede dæk. MTB: Ekspert MTB rytter'),
(5, 'Ekstrem',          1, 'MTB: Specialiserede discipliner og ofte højrisiko MTB kørsel'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om sværhedsgraden');

INSERT INTO fkg.d_5802_hierarki VALUES
(1, 'Hovedrute',        1, 'Den primære rute.'),
(2, 'Sløjfe',           1, 'Ekstra sløjfer på en hovedrute.'),
(3, 'Genvej',           1, 'Forbindelse som afkorter en hovedrute.'),
(4, 'Adgangssti',       1, 'Forbindelse til en hovedrute, en facilitet eller seværdighed.'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om hieraki');

INSERT INTO fkg.d_5802_rute_uty VALUES
(1, 'Sundhedsspor',     1, 'Sundhedsspor er Naturstyrelsens landsdækkende koncept. Et sundhedsspor er en afmærket naturrute på 1-2½ km, som kan gås eller løbes på tid. Ved ruterne er der sat tavler op, som viser BMI og kondital ift. tid og alder.'),
(2, 'Kløversti',        1, 'Kløverstier er Friluftsrådets landsdækkende koncept. En Kløversti består af fire ruter, der alle udgår fra en centralt placeret Kløversti pæl. Hver af de fire ruter har en bestemt længde og farve, afmærket med Friluftsrådets Kløversti logo.'),
(3, 'Hjertesti',        1, 'Hjertestier er Hjerteforeningens landsdækkende koncept. En hjertesti er en afmærket motionsrute, hvor der langs ruten er opsat skilte med Hjerteforeningens logo.'),
(4, 'Spor i landskabet',1, 'Spor i Landskabet er spor er ”Spor i Landskabets” landsdækkende koncept. Sporene bliver lavet på baggrund af en frivillig aftale med lodsejerne om vandreadgang på deres private jord. Sporene er normalt ikke markerede men skal findes via foldere/hjemmeside.'),
(5, 'Panoramarute',     1, 'Dagsture koblet på de nationale cykelruter. Ruten skal være en rundtur og være mellem 20 og 50 km lang.'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om rutetype');

INSERT INTO fkg.d_5802_kategori VALUES
(1, 'Lokal',            1, 'En lokal rute er planlagt af en eller flere kommuner. Den lokale cykelrute er typisk beregnet til udflugts eller hverdagsture, dvs. kortere rundture eller direkte ture mellem bolig og arbejdsplads / skole / indkøbsmuligheder. Bedre definition til at den passer til både vandre-, cykler og rideruter.'),
(2, 'Regional',         1, 'En regional rute forløber gennem flere kommuner. Den regionale rute er typisk lidt længere end beregnet til en dagstur.'),
(3, 'National',         1, 'En national rute er af national betydning, går gennem flere landsdele (for cykelruter mindst 200 km lang).'),
(7, 'Ej relevant',      1, 'Ikke relevant for dette objekt.'),
(8, 'Andet',            1, 'Andet'),
(9, 'Ukendt',           1, 'Mangler viden om kategori');



WITH changes AS
(
VALUES
(1051, 'Badestrand/-sted', 1, 'Område, der anvendes til badning. Særligt udpegede, servicerede ikke nødvendigvis certificerede. Fælles navn for hav- og søbade.'),
(1112, 'Motionsmødested/Trailhead', 1, 'Sted i bygning eller i naturen, hvor man mødes med andre motionister, som udgangspunkt for fælles motion. Mødested hvorfra flere rekreative ruter udgår, som kan være udgangspunkt for fælles motion og aktivitet. Ved et Trailhead findes som regel infotavler eller anden form for information, p-plads, evt. toilet og andre faciliteter i umiddelbar nærhed.'),
(1122, 'Cykelpumpestation/-servicepost', 1, 'Opstillet cykelpumpe. Sted hvor der er opstillet cykelpumpe og evt. andre faciliteter til service af cykler.'),
(1132, 'Tørvejrsrum/Madpakkehus', 1, 'Halvåbent, overdækket sted, hvor du kan raste og spise medbragt mad.'),
(1152, 'Information /Info-tavle', 1, 'Opstillet skilt, planche eller tavle med information om et område og dets muligheder. Informationstavler, informationsstandere, QR koder, audioguides eller anden form for information, der ikke falder inden for definitionen af Trailhead eller Gateway.'),
(1191, 'Hundeskov/park/fritløbsareal', 1, 'Særligt udpeget og eventuelt indhegnet område for hundeluftning. Kommunale og private områder. Særligt udpeget, eventuelt indhegnet område for hundeluftning, hvor hunde må løbe frit, under forudsætning af ”fuld kontrol af hunden”. Kommunale såvel som private områder.'),
(1201, 'Borde-bænke/Picnic', 1, 'Plads med borde, siddepladser, evt. hængekøjer og andre ting til roligt ophold.'),
(2012, 'Fugletårn /Udsigtstårn', 1, 'Fugletårn er en indretning rejst ved en fuglelokalitet for at give offentligheden udsyn til områdets fugleliv og ofte skjule observatørerne således at fuglene ikke forstyrres. Platform, tårn eller skjul som giver mulighed for udsigt over et område eller særlige seværdigheder, fx udsyn til områdets fugle, dyreliv, landskab mv.'),
(3012, 'Shelter', 1, 'En lav træbarak, traditionelt åben på den ene langside, gulvet hævet ca. 0,5 m over jorden og stort tagudhæng, således at man er relativt beskyttet mod regn. Primitiv overdækket overnatningsmulighed. En shelter kan være alt fra nogle stolper og en presenning, over klassiske sheltere, til simple hytter med overnatningspladser. Åbne i en eller flere sider eller helt lukkede.'),
(4182, 'Dykkerspot', 1, 'Seværdighed under vand. Område med seværdigheder og oplevelsesmuligheder under vand, fx vrag, rev, dyreliv mv.'),
(4222, 'Udendørs Fitness/Motionsplads', 1, 'Sted i naturen, hvor der er opstillet div. motionsredskaber til fri afbenyttelse, fx  sundhedsplads, motionsplads, fitnessplads, pulspark. Baner, områder og redskaber under åben himmel, evt. i naturen som er designet til at dyrke motion og fitness, fx naturfitness, sundhedsplads, motionsplads, pulspark mv.')
)
UPDATE
  fkg.d_5800_facilitet
SET
  facilitet_type = changes.column2,
  begrebsdefinition = changes.column4
FROM
  changes
WHERE
  changes.column1 = fkg.d_5800_facilitet.facilitet_type_kode;

WITH nye AS
(
VALUES
(1261, 'Badevandsflag', 1, 'Badeområde der er tildelt badevandsflag, der ikke er Blå Flag.'),
(1272, 'Badevandsflag facilitet', 1, 'Faciliteter til strande med badevandsflag, der ikke er Blå Flag, f.eks. infostandere, redningsposter.'),
(1281, 'Hesteophold/pausefenne', 1, 'Mindre indhegning til heste, som kan benyttes i forbindelse med midlertidig ophold.'),
(1291, 'Parkeringplads', 1, 'P-plads i tilknytning til rekreative områder/faciliteter  . Man kan angive om parkeringspladsen er egnet til f.eks. hestetrailer i beskrivelsesfeltet.'),
(1302, 'Gateway', 1, 'Knudepunkt for service, information og faciliteter som udgangspunkt for oplevelser og ophold i det omkringliggende landskab. På en Gateway findes digital, - evt. også anden information, som minimum god skiltning/vejvisning til relevante services og faciliteter.'),
(2171, 'Frit fiskeri', 1, 'Område ved sø eller å, hvor der er frit/gratis fiskeri med gyldigt dansk fisketegn.'),
(3071, 'Fri teltning', 1, 'Større område, hvor der frit må slås telt op og overnattes en enkelt nat, uden at der skal søges tilladelse i forvejen. Der må højest sår to telte og teltene må maks være trepersoners telte.'),
(4311, 'Snorkelsti/-område', 1, 'Rute/område under vandet til snorkling, markeret f.eks. med et tov langs bunden eller med bøjer. Der vil i forbindelse med ruten formidles om de ting der kan opleves, fx via billeder, tekst eller effekter.'),
(6062, 'Ophaler-/isætningsplads', 1, 'Plads til isætning optagning af ikke motoriserede småbåde (kano, kajak o.lign.)')
)
INSERT INTO
  fkg.d_5800_facilitet
SELECT * FROM nye;




ROLLBACK TRANSACTION;

-- Noter

-- Tekst på lookupværdi 9 i d_basis_ansvar_v:
-- "Mangler viden om fremkommelighed" ændret til
-- "Mangler viden om vedligeholder"

-- fkg.d_5800_facilitet
-- "Hundeskov/Hundepark/fritløbsareal" ændret til
-- "Hundeskov/park/fritløbsareal" (>30 tegn)

-- Hvorfor er I begyndt at ændre semantik på nøgle felter: "_k" i stedet for "_kode" som det hidtil har været?

