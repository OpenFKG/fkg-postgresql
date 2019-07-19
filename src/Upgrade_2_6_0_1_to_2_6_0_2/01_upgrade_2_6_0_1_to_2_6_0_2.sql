-- Upgrade script FKG datamodel 2_6_0_1 to 2_6_0_2
----------------------
-- t_5800_fac_pkt_t --
----------------------
-- Drop dependent views
DROP VIEW fkg.t_5800_fac_pkt;
DROP VIEW fkg.hist_t_5800_fac_pkt;

-- New columns
ALTER TABLE fkg.t_5800_fac_pkt_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN saeson_st date,
  ADD COLUMN saeson_sl date,
  ADD COLUMN doegnaab_k integer,
  ADD COLUMN vandhane_k integer,
  ADD COLUMN bemand_k integer,
  ADD COLUMN betaling_k integer,
  ADD COLUMN book_k integer,
  ADD COLUMN antal_pl integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Deleted columns
ALTER TABLE fkg.t_5800_fac_pkt_t
  DROP COLUMN vejkode CASCADE,
  DROP COLUMN husnr CASCADE,
  DROP COLUMN postnr CASCADE
;

-- Renamed columns
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN kontak_vedl TO kontak_ved;

-- New check constraints
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_st_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_st) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_saeson_sl_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_sl) = 1);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_antal_pl_ck CHECK (antal_pl BETWEEN 0 AND 9999);

-- New FK constraints
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_doegnaab_fk FOREIGN KEY (doegnaab_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_vandhane_fk FOREIGN KEY (vandhane_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_bemand_fk FOREIGN KEY (bemand_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_betaling_fk FOREIGN KEY (betaling_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ja_nej_book_fk FOREIGN KEY (book_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;

---------------------
-- t_5801_fac_fl_t --
---------------------
-- Drop dependent views
DROP VIEW fkg.t_5801_fac_fl;
DROP VIEW fkg.hist_t_5801_fac_fl;

-- New columns
ALTER TABLE fkg.t_5801_fac_fl_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN saeson_st date,
  ADD COLUMN saeson_sl date,
  ADD COLUMN doegnaab_k integer,
  ADD COLUMN vandhane_k integer,
  ADD COLUMN bemand_k integer,
  ADD COLUMN betaling_k integer,
  ADD COLUMN book_k integer,
  ADD COLUMN antal_pl integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Deleted columns
ALTER TABLE fkg.t_5801_fac_fl_t
  DROP COLUMN vejkode CASCADE,
  DROP COLUMN husnr CASCADE,
  DROP COLUMN postnr CASCADE
;

-- Renamed columns
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN kontak_vedl TO kontak_ved;

-- New check constraints
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_saeson_st_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_st) = 1);
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_saeson_sl_aar_skal_vaere_1_ck CHECK (date_part('year', saeson_sl) = 1);
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_antal_pl_ck CHECK (antal_pl BETWEEN 0 AND 9999);

-- New FK constraints
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_doegnaab_fk FOREIGN KEY (doegnaab_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_vandhane_fk FOREIGN KEY (vandhane_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_bemand_fk FOREIGN KEY (bemand_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_betaling_fk FOREIGN KEY (betaling_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;
ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ja_nej_book_fk FOREIGN KEY (book_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;

---------------------
-- t_5802_fac_li_t --
---------------------
-- Drop dependent views
DROP VIEW fkg.t_5802_fac_li;
DROP VIEW fkg.hist_t_5802_fac_li;

-- New codelist Table
CREATE TABLE fkg.d_5802_certifi (
  certifi_k integer NOT NULL,
  certifi character varying(40) NOT NULL,
  aktiv integer NOT NULL,
  begrebsdefinition character varying,
  CONSTRAINT d_5802_certifi_pk PRIMARY KEY (certifi_k)
);

-- New columns
ALTER TABLE fkg.t_5802_fac_li_t
  ADD COLUMN lang_beskr character varying(1000),
  ADD COLUMN uk_k_beskr character varying(254),
  ADD COLUMN uk_l_beskr character varying(1000),
  ADD COLUMN d_k_beskr character varying(254),
  ADD COLUMN d_l_beskr character varying(1000),
  ADD COLUMN betaling_k integer,
  ADD COLUMN slutpkt_x integer,
  ADD COLUMN slutpkt_y integer,
  ADD COLUMN certifi_k integer,
  ADD COLUMN filmlink character varying(1024),
  ADD COLUMN adr_id uuid
;

-- Renamed columns
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN konta_vedl TO kontak_ved;

-- Deleted columns
ALTER TABLE fkg.t_5802_fac_li_t
  DROP COLUMN straekn_nr CASCADE
;

-- New FK constraints
ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_certifi_fk FOREIGN KEY (certifi_k)
  REFERENCES fkg.d_5802_certifi (certifi_k) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_ja_nej_betaling_fk FOREIGN KEY (betaling_k)
  REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
  ON DELETE NO ACTION ON UPDATE NO ACTION
;

----------------------
-- d_5800_facilitet --
----------------------
ALTER TABLE fkg.d_5800_facilitet
  ALTER COLUMN facil_ty TYPE CHARACTER VARYING(35);

-- Changes to core data
UPDATE fkg.d_5800_saeson SET begrebsdefinition = 'Faciliteten er åbent kun i sæsonen. Sæson/åbningstider kan/bør noteres i andre felter' WHERE saeson_k = 2;
UPDATE fkg.d_5802_rutetype SET aktiv = 0 WHERE rute_ty_k IN (10,11,12);
INSERT INTO fkg.d_5802_rutetype VALUES
  (13,'Margueritruten',   1, 'Skiltet rute forbi seværdigheder og smuk natur. Tiltænkt til biler og motorcyklister. Store dele også velegnet for cyklister.'),
  (14,'Trec-bane',        1, 'Rideaktivitetsbane i naturen for heste og ryttere.')
;
INSERT INTO fkg.d_5802_certifi VALUES
( 0, 'Ikke certificeret',               1, 'Ej certificeret'),
( 1, 'Premiumrute - rundvandrerute ',   1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/deutsches-wandersiegel/premiumwegtypen/'),
( 2, 'Premiumrute – let-vandrerute',    1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/premium-spazierwanderwege/'),
( 3, 'Premiumrute - langdistancerute',  1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/deutsches-wandersiegel/premiumwegtypen/'),
( 4, 'Premiumrute – byvandrerute',      1, 'Vandrerute certificeret af Deutsches Wanderinstitut. https://www.wanderinstitut.de/premium-stadtwanderwege/'),
( 5, 'Leading Quality Trail',           1, 'Vandrerute certificeret efter European Ramblers Associaltions ordning. https://www.era-ewv-ferp.org/lqt/'),
( 6, 'Kvalitetssti – Vandresti',        1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 7, 'Kvalitetssti – Natursti',         1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 8, 'Kvalitetssti – Kultursti',        1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
( 9, 'Kvalitetssti – Gastronomisk sti', 1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(10, 'Kvalitetssti – Familiesti',       1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(11, 'Kvalitetssti – Komfortsti',       1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(12, 'Kvalitetssti – Bysti',            1, 'Vandrerute godkendt af Dansk Vandrelaug https://dvl.dk/kvalitetssti/'),
(98, 'Anden',                           1, 'Anden certificering'),
(99, 'Ukendt',                          1, 'Mangler viden om certificereing')
;

WITH new_data AS
(
SELECT * FROM (VALUES
  (1012, 'Toilet', 1, 'WC i bygning/muldtoilet, der er åbent for offentligheden.'),
  (1022, 'Bålplads', 1, 'Afgrænset plads til bål eller grill til offentlig brug.  Ikke alle bålsteder har grill-muligheden.'),
  (1031, 'Legeplads', 1, 'En legeplads er et afgrænset sted udendørs, som er tilrettelagt for at børn kan lege der.'),
  (1041, 'Naturlegeplads', 1, 'Legeplads ude i naturen typisk bygget med naturens egne matrialer. Træstammer og sten m.v.'),
  (1051, 'Badestrand/-sted', 1, 'Område, der anvendes til badning. Særligt udpegede, servicerede ikke nødvendigvis certificerede. Fælles navn for hav- og søbade.'),
  (1061, 'Blå Flag strand', 1, 'Badeområde eller havne, der er tildelt Blå Flag.'),
  (1072, 'Blå Flag facilitet', 1, 'Faciliteter til Blå Flag badestrande, f.eks. infostandere, redningsposter mm.'),
  (1082, 'Spejderhytte', 1, 'Bygning, hvor en eller flere spejdergrupper holder til.'),
  (1091, 'Friluftsbad/Svømmebad', 1, 'Område med et eller flere badebassinner, der kan være overdækket eller under åben himmel. Dækker også havnebad.'),
  (1102, 'Slæbested', 1, 'Anlæg til ophaling eller isætning af mindre både, evt. med spil.'),
  (1112, 'Motionsmødested', 1, 'Herunder trailhead og lignende. Mødested hvorfra flere rekreative ruter udgår, som kan være udgangspunkt for fælles motion og aktivitet. Ved et Trailhead findes infotavler eller anden form for information, p-plads og evt. andre simple faciliteter i umiddelbar nærhed.'),
  (1122, 'Cykelpumpestation/-servicepost', 1, 'Sted hvor der er opstillet cykelpumpe og evt. andre faciliteter til service af cykler.'),
  (1132, 'Tørvejrsrum/Madpakkehus', 1, 'Halvåbent, overdækket sted, hvor du kan raste og spise medbragt mad.'),
  (1142, 'Virtuelt oplevelsespunkt', 1, 'Virtuelle oplevelsespunkter/Hotspots, som kan tilgås fx via apps eller lignende.'),
  (1152, 'Info-tavle', 1, 'Opstillet skilt, planche eller tavle med information om et område og dets muligheder.'),
  (1162, 'Cykelparkering', 1, 'Opstillet cykelstativ eller anden fast opstilling, der gør det muligt at parkere sin cykel.'),
  (1172, 'Ladestation', 1, 'Ladestation til el-cykler.'),
  (1182, 'Turistinformation', 1, 'Kontor/lokaler, der har til formål at informere turister om lokalområdet.'),
  (1191, 'Hundeskov/Hundepark/fritløbsareal', 1, 'Særligt udpeget og eventuelt indhegnet område for hundeluftning, hvor hunde må løbe frit, under forudsætning af ”fuld kontrol af hunden”. Kommunale og private områder.'),
  (1201, 'Borde-bænke/Picnic', 1, 'Plads med borde, siddepladser, evt. hængekøjer og andre ting til roligt ophold.'),
  (1211, 'Vandlegeplads', 1, 'Legeplads med særlige redskaber og faciliteter til leg med vand.'),
  (1222, 'Vandpost', 1, 'Offentligt tilgængeligt drikkevand. Kan være lukket om vinteren.'),
  (1232, 'Trækfærge', 1, 'En trækfærge er en pram som er forbundet med en wire. Trækfærgen forbinder bredderne på en å eller et vandløb så man kan med egen trækkraft komme over på den anden side.'),
  (1242, 'Livreddertårn', 1, 'Bemandet redningspost (rød og hvidstribet tårn) af specieluddannede kystlivreddere og udstyret med blandt andet hjertestartere, rescue boards og førstehjælpsudstyr.'),
  (1252, 'Livredderpost', 1, 'Ubemandet redningspost der typisk indeholder: Vejlednig, 1 redningskrans, 1 sejldugstaske med 220 m nylon line, 2 redningsveste, 2 gjordbælter med karbinhage og evt. isstige og issyle.'),
  (1261, 'Badevandsflag', 1, 'Badeområde der er tildelt badevandsflag, der ikke er Blå Flag.'),
  (1272, 'Badevandsflag facilitet', 1, 'Faciliteter til strande med badevandsflag, der ikke er Blå Flag, f.eks. førstehjælpskasser, skilte på vandkvalitetsmålinger, nødtelefon.'),
  (1281, 'Hesteophold', 1, 'Mindre indhegning m.v. til heste, som kan benyttes i forbindelse med midlertidigt ophold. Evt. en del af et høhotel.'),
  (1291, 'Parkeringplads', 1, 'P-plads i tilknytning til rekreative områder/faciliteter og som ikke er registreret andre steder (vejregister). Man kan angive om parkeringspladsen er egnet til f.eks. hestetrailer i beskrivelsesfeltet.'),
  (1302, 'Formidlingscenter', 1, 'Herunder trailcenter, gateway, port mv. Sted eller bygning som er udgangs- og knudepunkt for formidling af natur og aktiviteter samt oplevelser og ophold i det omkringliggende landskab. Indeholder relevante services og faciliteter eller skiltning/vejvisning dertil.'),
  (2012, 'Fugletårn/Udsigtstårn', 1, 'Platform, tårn eller skjul som giver mulighed for udsigt over et område eller særlige seværdigheder, fx udsyn til områdets fugle, dyreliv, landskab mv.'),
  (2022, 'Udsigtspunkt', 1, 'Punkt med en god udsigt. Ofte på toppen af en høj eller skrænt. Kan også være fra en bygning.'),
  (2031, 'Fiskesø', 1, 'Put&take sø. Sted hvor man kan købe dagskort til at fiske efter udsatte fisk.'),
  (2041, 'Rekreativt naturområde', 1, 'Naturområde hvor borgere kan opholde sig og rekreere. Fordybelsessted.'),
  (2051, 'Park', 1, 'Grønt byområde anlagt med en blanding af buske, træer, blomster og græs.'),
  (2062, 'Naturcenter', 1, 'Bygningsfacilitet som er udgangspunkt for offentlig naturformidling og aktivteter i et naturområde. Oftest med ansat personale.'),
  (2072, 'Naturbase', 1, 'Plads i naturområde med mulighed for ophold, lån af grej, bålplads mm.'),
  (2082, 'Naturskole', 1, 'Bygningsfacilitet med primært formål at facilitere naturaktiviteter og undervisning for skoler og institutioner o.lign.'),
  (2092, 'Udstilling', 1, 'Offentlig tilgængelig formidling eller introduktion til et områdes natur- eller kulturforhold. Ofte placeret i mindre bygning eller vejrly.'),
  (2102, 'Naturrum', 1, 'Bygning og støttepunkt for naturformidling efter Friluftsrådets koncept og definition.'),
  (2111, 'Naturpark', 1, 'Naturpark af regional betydning, jf. mærkningsordning ved Friluftsrådet.'),
  (2121, 'Nationalpark', 1, 'Nationalpark anerkendt af staten.'),
  (2132, 'Kælkebakke', 1, 'Område med mulighed for at kælke, når der er snedække.'),
  (2141, 'Terapihave', 1, 'Specielt indrettede haveanlæg med terapeutisk og stressforebyggende formål.'),
  (2151, 'Spiselig vegetation', 1, 'Areal med offentligt tilgængelige spiselige planter, frugt, nødder, grønsager mm.'),
  (2161, 'Oplevelsespunkt', 1, 'Plads i naturområde eller friluftsanlæg med mulighed for ophold, naturoplevelser, evt. lån af grej, bålplads, information mm. Herunder oplevelsespunkt i havne f.eks. kaldet Oplevelseshavn.'),
  (2171, 'Frit fiskeri', 1, 'Område ved sø eller å, hvor der er en udvidet ret ud over den almindelig ret til at fiske ved danske kyster med gyldigt dansk fisketegn.'),
  (2183, 'Geopark', 1, 'Et særligt udpeget naturområde, hvor den geologiske historie kan studeres og opleves. Geoparker har til formål at beskytte, formidle og understøtte den geologiske arv.'),
  (2191, 'Seværdighed - Fauna', 1, 'Seværdighed indenfor dyreriget'),
  (2201, 'Seværdighed – Flora', 1, 'Seværdighed indenfor planteriget'),
  (2211, 'Seværdighed – Geologi', 1, 'Geologisk seværdighed '),
  (2223, 'Naturkanon', 1, 'Statens udpegede steder. Naturkanon steder/områder. Indmeldes kun af staten/MST.'),
  (3012, 'Shelter', 1, 'Primitiv overdækket overnatningsmulighed. En shelter kan være alt fra nogle stolper og en presenning, over klassiske sheltere, til simple hytter med overnatningspladser. Åbne i en eller flere sider eller helt lukkede.'),
  (3022, 'Kano/kajak overnatningsplads', 1, 'Rasteplads til kano-/kajakfarer med mulighed for overnatning.'),
  (3031, 'Teltplads', 1, 'Sted til at slå telt op for overnatning.'),
  (3041, 'Campingplads', 1, 'Overnatningssted til campingvogne og telte.'),
  (3051, 'Hytter og Lejrskoler', 1, 'Udlejningshytter med plads til mange. Typiske med sovesale og storkøkken.'),
  (3061, 'Feriecenter', 1, 'En samling ferielejligheder, der danner rammen om familiens ophold på feriecenteret, samt en række fælles faciliteter, hvor der tilbydes en bred vifte af aktiviteter.'),
  (3071, 'Fri teltning', 1, 'Større område, hvor der frit må slås telt op og overnattes en enkelt nat, uden at der skal søges tilladelse i forvejen. Der må højest slå to telte og teltene må maks være trepersoners telte.'),
  (3081, 'Hængekøjelund', 1, 'Område indrettet enten med træer eller pæle, som er placeret med en afstand, som passer til at opsætte hængekøjer imellem. De anvendes ofte til overnatning af store grupper, som ønsker at sove i hængekøje.'),
  (3091, 'Bålhytte', 1, 'Overdækket bålsted. Ofte med delvis sidebeklædning og hul i taget, så røgen kan slippe ud.'),
  (4011, 'Idrætshal', 1, 'Kaldes også for sportshal. Stor hal hvor i der kan dyrkes en eller flere former for fysisk sport.'),
  (4021, 'Svømmehal', 1, 'Opvarmet svømmebassin inde i en bygning.'),
  (4031, 'Idrætsanlæg', 1, 'Bane hvor på der kan dyrkes en eller flere former for fysisk sport, f.eks. atletik, fodbold, baseball mm.'),
  (4041, 'Cykelbane', 1, 'Område til fx MTB  og BMX.'),
  (4051, 'Agilitybane', 1, 'Agilitybane er en hundesportsbane, hvor hundene skal tage en række forhindringer korrekt og i den rette rækkefølge.'),
  (4061, 'Modelflyveplads', 1, '”Lufthavn” for modelflyvere.'),
  (4071, 'Skøjtebane', 1, 'Bane til skøjteløb om vinteren på søer eller kunstige isbaner i byer både indendørs og udendørs.'),
  (4081, 'Minigolfbane', 1, 'Anlæg til at spille minigolf på, hvor banelængden normalt er under 10 m.'),
  (4091, 'Golfbane', 1, 'En golfbane er et idrætsanlæg, hvorpå man spiller golf. Den består af et antal huller, oftest 18, men for mindre baners vedkommende 9, mens store baner kan have 27 eller 36 huller.'),
  (4101, 'Discgolfanlæg', 1, 'Område med udpegede fairways og opstillede ”kurve” til spillet frisbee-golf/discgolf.'),
  (4111, 'Boldbane', 1, 'Baner indrettet til boldspil.'),
  (4121, 'Skydebaneanlæg', 1, 'En eller flere baner til skydning, fx kort- og langdistanceskydning.'),
  (4132, 'Pentanquebane', 1, 'En eller flere baner til petanque.'),
  (4142, 'Skateranlæg', 1, 'Anlæg, plads eller bane som rummer anlagte udfordringer til skatere, BMXcykler m.fl.'),
  (4152, 'Parkouranlæg', 1, 'Plads/område med særlige faciliteter til at udøve parkour i.'),
  (4161, 'Rideanlæg', 1, 'Placering for ridecenter eller –klub.'),
  (4172, 'Beachvolleybane', 1, 'Udendørs areal afsat til spillet beachvolley.'),
  (4182, 'Dykkerspot', 1, 'Område med seværdigheder og oplevelsesmuligheder under vand, fx vrag, rev, dyreliv mv.'),
  (4191, 'Kitesurf område', 1, 'Område anvist til kitesurfing.'),
  (4201, 'Windsurfområde', 1, 'Område anvist til windsurfing.'),
  (4211, 'Kitebuggyområde', 1, 'Område anvist til kørsel med kitebuggy.'),
  (4222, 'Udendørs Fitness/Motionsplads', 1, 'Baner, områder og redskaber under åben himmel, evt. i naturen som er designet til at dyrke motion og fitness, fx naturfitness, sundhedsplads, motionsplads, pulspark mv.'),
  (4231, 'Flugtskydningsbane', 1, 'Lerdueskydningsbane.'),
  (4241, 'Motorsportsbane', 1, 'Bane, hvor der udøves motorsport.'),
  (4251, 'Ketchersportsanlæg', 1, 'Udendørs og/eller indendørs anlæg eller bane til ketchersport, herunder tennis og squash.'),
  (4262, 'Rulleskøjtebane', 1, 'Udendørs eller indendørs anlæg indrettet til rulleskøjteløb.'),
  (4272, 'Klatreanlæg', 1, 'Område med opsatte klatreudfordringer eller forhindringsbane f.eks. i træer, klatrevægge, wireforløb mm.'),
  (4281, 'Cricketbane', 1, 'Bane til spillet Cricket'),
  (4291, 'Krolfbane', 1, 'Bane til spillet Krolf'),
  (4301, 'UV-jagtspot', 1, 'Område der er velegnet til undervands-jagt.'),
  (4311, 'Snorkelsti/-område', 1, 'Rute/område under vandet til snorkling, markeret f.eks. med et tov langs bunden eller med bøjer. Der kan i forbindelse med ruten formidles om de ting der kan opleves, fx via billeder, tekst eller effekter.'),
  (4322, 'Orienteringsrute startpunkt', 1, '"Find vej i"/orienteringsrute med afmærkede poster, hvor det handler om at finde vej til de opsatte poster ved hjælp af et kort. Viser blot startpunktet/-pælen.'),
  (4332, 'Orienteringsrute slutpunkt', 1, '"Find vej i"/orienteringsrute med afmærkede poster, hvor det handler om at finde vej til de opsatte poster ved hjælp af et kort. Viser blot slutpunktet/-pælen.'),
  (4342, 'Bindebom', 1, 'Sted hvor man kan tøjre en hest'),
  (4351, 'Skibakke', 1, 'Område med mulighed for at stå på ski i forbindelse med snevejr.'),
  (4361, 'Fodboldgolf', 1, 'Anlæg/bane til fodboldgolf.'),
  (4371, 'Bueskydning', 1, 'Bane til bueskydning.'),
  (4381, 'Strandhåndboldbane', 1, 'Bane hvor man kan spille strandhåndbold.'),
  (5011, 'Forsamlingshus', 1, 'Et forsamlingshus er byens kulturhus og mødested.'),
  (5021, 'Museum', 1, 'Museum er en permanent institution med udstilling og formidling af f.eks. kunst, kulturhistorie eller naturhistorie.'),
  (5031, 'Teater', 1, 'Sted, hvor der opføres teater eller andre kulturelle opførelser. Herunder også amfiteater.'),
  (5041, 'Forlystelsesanlæg', 1, 'En park med flere faste forlystelser, typisk for hele familien.'),
  (5051, 'Biograf', 1, 'En biograf er et sted, sædvanligvis en bygning, hvor man fremviser film.'),
  (5061, 'Foreningshus', 1, 'Hus der kan huse en række forskellige foreningers aktiviteter og administration.'),
  (5072, 'Formidling af fortidsminder', 1, 'Særligt udvalgte fortidsminder til fokus.'),
  (5082, 'Historiske steder', 1, 'Lokalitet eller område, hvor særlige historiske begivenheder har fundet sted.'),
  (5092, 'Lokal- eller sogne-arkiv', 1, 'Lokalt arkiv til opbevaring af indsamlet viden om kultur og historie i nærmiljøet – herunder evt også kirkehistorie.'),
  (5102, 'Kunst', 1, 'Udendørs kunst, som fx skulpturer, gavlmalerier og land-art'),
  (6011, 'Bådplads', 1, 'Fortøjningssted til både/joller.'),
  (6021, 'Rostadion', 1, 'Område på sø til konkurrence roning.'),
  (6031, 'Umotoriseret sejlads tilladt', 1, 'Område, hvor det er tilladt at sejle i kano el. lign. Udpeges f.eks. på vandflade, hvor der ellers er generelt sejlforbud.'),
  (6042, 'Sejlsports- og roklub', 1, 'Klubhus, hvorfra der udøves sejlsport.'),
  (6052, 'Kano-/kajakrasteplads', 1, 'Rasteplads til kano- og/eller kajakfarer samt SUP (StandUpPadleboard).'),
  (6062, 'Ophaler-/isætningsplads', 1, 'Plads til isætning optagning af ikke motoriserede småbåde (kano, kajak o.lign.)'),
  (6071, 'Svajeplads', 1, 'Svajeplads/Bøje med mulighed for opankning.'),
  (6081, 'Vandscooter tilladt', 1, 'Sejlads med vandscooter tilladt. Dog i 300m-kystzonen kun vinkelret på kysten og med max 5 knob.'),
  (9981, 'Andet', 1, 'Hvor andre facilitetsbetegnelser ikke er dækkende.'),
  (9991, 'Ukendt', 1, 'Mangler viden om typen.')
) AS t (facil_ty_k, facil_ty, aktiv, begrebsdefinition)
)
SELECT * INTO fkg.d_5800_facilitet_new FROM NEW_data
;

INSERT INTO fkg.d_5800_facilitet SELECT * FROM fkg.d_5800_facilitet_new WHERE facil_ty_k NOT IN (SELECT facil_ty_k FROM fkg.d_5800_facilitet);

UPDATE fkg.d_5800_facilitet
SET facil_ty = n.facil_ty
FROM fkg.d_5800_facilitet_new n
WHERE fkg.d_5800_facilitet.facil_ty_k = n.facil_ty_k AND fkg.d_5800_facilitet.facil_ty <> n.facil_ty;

UPDATE fkg.d_5800_facilitet
SET aktiv = n.aktiv
FROM fkg.d_5800_facilitet_new n
WHERE fkg.d_5800_facilitet.facil_ty_k = n.facil_ty_k AND fkg.d_5800_facilitet.aktiv <> n.aktiv;

UPDATE fkg.d_5800_facilitet
SET begrebsdefinition = n.begrebsdefinition
FROM fkg.d_5800_facilitet_new n
WHERE fkg.d_5800_facilitet.facil_ty_k = n.facil_ty_k AND fkg.d_5800_facilitet.begrebsdefinition <> n.begrebsdefinition;

DROP TABLE fkg.d_5800_facilitet_new;

-- Replaced views and triggers
DROP VIEW IF EXISTS fkg.t_5800_fac_pkt;
CREATE VIEW fkg.t_5800_fac_pkt AS
SELECT
  5800::integer AS temakode,
  't_5800_fac_pkt_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.adr_id,
  t.ansva_v_k,
  k9.ansva_v AS ansva_v,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5800_fac_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ansva_v k9 ON (t.ansva_v_k = k9.ansva_v_k)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5802_fac_li;
CREATE VIEW fkg.t_5802_fac_li AS
SELECT
  5802::integer AS temakode,
  't_5802_fac_li_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navndels,
  t.afm_rute_k,
  k3.ja_nej AS afm_rute,
  t.laengde,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.betaling_k,
  k4.ja_nej AS betaling,
  t.belaegn_k,
  k5.belaegning AS belaegn,
  t.handicap_k,
  k6.handicapegnet AS handikap,
  t.ansva_v_k,
  k7.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k8.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k9.kategori AS kategori,
  t.certifi_k,
  k10.certifi_k AS certifi,
  t.hierarki_k,
  k11.hierarki AS hierarki,
  t.folder_k,
  k12.ja_nej AS folder,
  t.folde_link,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.gpx_link,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5802_fac_li_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5802_rutetype k1 ON (t.rute_ty_k = k1.rute_ty_k) LEFT JOIN
  fkg.d_5802_rute_uty k2 ON (t.rute_uty_k = k2.rute_uty_k) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.afm_rute_k = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.betaling_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k5 ON (t.belaegn_k = k5.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k6 ON (t.handicap_k = k6.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansva_v k7 ON (t.ansva_v_k = k7.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k8 ON (t.svaerhed_k = k8.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k9 ON (t.kategori_k = k9.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k10 ON (t.certifi_k = k10.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k11 ON (t.hierarki_k = k11.hierarki_k) LEFT JOIN
  fkg.d_basis_ja_nej k12 ON (t.folder_k = k12.ja_nej_kode)
WHERE g.systid_til IS NULL;
DROP VIEW IF EXISTS fkg.t_5801_fac_fl;
CREATE VIEW fkg.t_5801_fac_fl AS
SELECT
  5801::integer AS temakode,
  't_5801_fac_fl_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.adr_id,
  t.ansva_v_k,
  k9.ansva_v AS ansva_v,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ansva_v k9 ON (t.ansva_v_k = k9.ansva_v_k)
WHERE g.systid_til IS NULL;

DROP VIEW IF EXISTS fkg.hist_t_5800_fac_pkt;
CREATE VIEW fkg.hist_t_5800_fac_pkt AS
SELECT
  5800::integer AS temakode,
  't_5800_fac_pkt_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.adr_id,
  t.ansva_v_k,
  k9.ansva_v AS ansva_v,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5800_fac_pkt_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ansva_v k9 ON (t.ansva_v_k = k9.ansva_v_k);
DROP VIEW IF EXISTS fkg.hist_t_5802_fac_li;
CREATE VIEW fkg.hist_t_5802_fac_li AS
SELECT
  5802::integer AS temakode,
  't_5802_fac_li_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.rute_ty_k,
  k1.rute_ty AS rute_ty,
  t.rute_uty_k,
  k2.rute_uty AS rute_uty,
  t.navn,
  t.navndels,
  t.afm_rute_k,
  k3.ja_nej AS afm_rute,
  t.laengde,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.betaling_k,
  k4.ja_nej AS betaling,
  t.belaegn_k,
  k5.belaegning AS belaegn,
  t.handicap_k,
  k6.handicapegnet AS handikap,
  t.ansva_v_k,
  k7.ansva_v AS ansva_v,
  t.startpkt_x,
  t.startpkt_y,
  t.slutpkt_x,
  t.slutpkt_y,
  t.svaerhed_k,
  k8.svaerhed AS svaerhed,
  t.obs,
  t.kategori_k,
  k9.kategori AS kategori,
  t.certifi_k,
  k10.certifi_k AS certifi,
  t.hierarki_k,
  k11.hierarki AS hierarki,
  t.folder_k,
  k12.ja_nej AS folder,
  t.folde_link,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.gpx_link,
  t.adr_id,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5802_fac_li_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5802_rutetype k1 ON (t.rute_ty_k = k1.rute_ty_k) LEFT JOIN
  fkg.d_5802_rute_uty k2 ON (t.rute_uty_k = k2.rute_uty_k) LEFT JOIN
  fkg.d_basis_ja_nej k3 ON (t.afm_rute_k = k3.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.betaling_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k5 ON (t.belaegn_k = k5.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k6 ON (t.handicap_k = k6.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansva_v k7 ON (t.ansva_v_k = k7.ansva_v_k) LEFT JOIN
  fkg.d_5802_svaerhed k8 ON (t.svaerhed_k = k8.svaerhed_k) LEFT JOIN
  fkg.d_5802_kategori k9 ON (t.kategori_k = k9.kategori_k) LEFT JOIN
  fkg.d_5802_certifi k10 ON (t.certifi_k = k10.certifi_k) LEFT JOIN
  fkg.d_5802_hierarki k11 ON (t.hierarki_k = k11.hierarki_k) LEFT JOIN
  fkg.d_basis_ja_nej k12 ON (t.folder_k = k12.ja_nej_kode);
DROP VIEW IF EXISTS fkg.hist_t_5801_fac_fl;
CREATE VIEW fkg.hist_t_5801_fac_fl AS
SELECT
  5801::integer AS temakode,
  't_5801_fac_fl_t'::text AS temanavn,
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.facil_ty_k,
  k1.facil_ty AS facil_ty,
  t.navn,
  t.beskrivels,
  t.lang_beskr,
  t.uk_k_beskr,
  t.uk_l_beskr,
  t.d_k_beskr,
  t.d_l_beskr,
  t.ansvar_org,
  t.kontak_ved,
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.saeson_k,
  k3.saeson AS saeson,
  t.saeson_st,
  t.saeson_sl,
  t.doegnaab_k,
  k4.ja_nej AS doegnaab,
  t.vandhane_k,
  k5.ja_nej AS vandhane,
  t.bemand_k,
  k6.ja_nej AS bemand,
  t.betaling_k,
  k7.ja_nej AS betaling,
  t.book_k,
  k8.ja_nej AS book,
  t.antal_pl,
  t.foto_link1,
  t.foto_link2,
  t.filmlink,
  t.adr_id,
  t.ansva_v_k,
  k9.ansva_v AS ansva_v,
  t.link,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.t_5801_fac_fl_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_5800_facilitet k1 ON (t.facil_ty_k = k1.facil_ty_k) LEFT JOIN
  fkg.d_basis_handicapegnet k2 ON (t.handicap_k = k2.handicapegnet_kode) LEFT JOIN
  fkg.d_5800_saeson k3 ON (t.saeson_k = k3.saeson_k) LEFT JOIN
  fkg.d_basis_ja_nej k4 ON (t.doegnaab_k = k4.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k5 ON (t.vandhane_k = k5.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.bemand_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k7 ON (t.betaling_k = k7.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ja_nej k8 ON (t.book_k = k8.ja_nej_kode) LEFT JOIN
  fkg.d_basis_ansva_v k9 ON (t.ansva_v_k = k9.ansva_v_k);

CREATE OR REPLACE FUNCTION fkg.t_5800_fac_pkt_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, foto_link1, foto_link2, filmlink, adr_id, ansva_v_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.geometri;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into t_5800_fac_pkt_t
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, foto_link1, foto_link2, filmlink, adr_id, ansva_v_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5800_fac_pkt_trg_iud ON fkg.t_5800_fac_pkt;

CREATE TRIGGER t_5800_fac_pkt_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5800_fac_pkt
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5800_fac_pkt_trg();

CREATE OR REPLACE FUNCTION fkg.make_multi()
  RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      NEW.geometri = ST_Multi(NEW.geometri);
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5800_fac_pkt_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5800_fac_pkt_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

CREATE OR REPLACE FUNCTION fkg.t_5802_fac_li_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foto_link1, foto_link2, filmlink, gpx_link, adr_id, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.gpx_link, NEW.adr_id, NEW.link, NEW.geometri;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into t_5802_fac_li_t
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, navn, navndels, afm_rute_k, laengde, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, betaling_k, belaegn_k, handicap_k, ansva_v_k, startpkt_x, startpkt_y, slutpkt_x, slutpkt_y, svaerhed_k, obs, kategori_k, certifi_k, hierarki_k, folder_k, folde_link, foto_link1, foto_link2, filmlink, gpx_link, adr_id, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.navn, NEW.navndels, NEW.afm_rute_k, NEW.laengde, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.betaling_k, NEW.belaegn_k, NEW.handicap_k, NEW.ansva_v_k, NEW.startpkt_x, NEW.startpkt_y, NEW.slutpkt_x, NEW.slutpkt_y, NEW.svaerhed_k, NEW.obs, NEW.kategori_k, NEW.certifi_k, NEW.hierarki_k, NEW.folder_k, NEW.folde_link, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.gpx_link, NEW.adr_id, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5802_fac_li_trg_iud ON fkg.t_5802_fac_li;

CREATE TRIGGER t_5802_fac_li_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5802_fac_li
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5802_fac_li_trg();

CREATE OR REPLACE FUNCTION fkg.make_multi()
  RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      NEW.geometri = ST_Multi(NEW.geometri);
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5802_fac_li_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5802_fac_li_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

CREATE OR REPLACE FUNCTION fkg.t_5801_fac_fl_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into theme
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, foto_link1, foto_link2, filmlink, adr_id, ansva_v_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.geometri;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into t_5801_fac_fl_t
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, navn, beskrivels, lang_beskr, uk_k_beskr, uk_l_beskr, d_k_beskr, d_l_beskr, ansvar_org, kontak_ved, handicap_k, saeson_k, saeson_st, saeson_sl, doegnaab_k, vandhane_k, bemand_k, betaling_k, book_k, antal_pl, foto_link1, foto_link2, filmlink, adr_id, ansva_v_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.navn, NEW.beskrivels, NEW.lang_beskr, NEW.uk_k_beskr, NEW.uk_l_beskr, NEW.d_k_beskr, NEW.d_l_beskr, NEW.ansvar_org, NEW.kontak_ved, NEW.handicap_k, NEW.saeson_k, NEW.saeson_st, NEW.saeson_sl, NEW.doegnaab_k, NEW.vandhane_k, NEW.bemand_k, NEW.betaling_k, NEW.book_k, NEW.antal_pl, NEW.foto_link1, NEW.foto_link2, NEW.filmlink, NEW.adr_id, NEW.ansva_v_k, NEW.link, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS t_5801_fac_fl_trg_iud ON fkg.t_5801_fac_fl;

CREATE TRIGGER t_5801_fac_fl_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.t_5801_fac_fl
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.t_5801_fac_fl_trg();

CREATE OR REPLACE FUNCTION fkg.make_multi()
  RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      NEW.geometri = ST_Multi(NEW.geometri);
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5801_fac_fl_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5801_fac_fl_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

-- Fotoforbindelse
CREATE TABLE fkg.l_fotoforbindelse_t (
  versions_id uuid NOT NULL,
  geometri geometry(POINT),
  noegle character varying(128),
  note character varying(254),
  tema_kode integer NOT NULL,
  foto_objek uuid NOT NULL,
  foto_prefix uuid NOT NULL,
  foto_navn character varying(128),
  CONSTRAINT l_fotoforbindelse_pk PRIMARY KEY (versions_id)

);

ALTER TABLE fkg.l_fotoforbindelse_t ADD CONSTRAINT l_fotoforbindelse_generel_fk FOREIGN KEY (versions_id)
  REFERENCES fkg.generel (versions_id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.l_fotoforbindelse_t ADD CONSTRAINT l_fotoforbindelse_d_tabel_fk FOREIGN KEY (tema_kode)
  REFERENCES fkg.d_tabel (tema_kode) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION;

DROP VIEW IF EXISTS fkg.l_fotoforbindelse;
CREATE VIEW fkg.l_fotoforbindelse AS
SELECT
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.noegle,
  t.note,
  t.foto_objek,
  t.foto_prefix,
  t.foto_navn,
  k1.tema_kode,
  k1.tema_navn,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.l_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_tabel k1 ON (t.tema_kode = k1.tema_kode)
WHERE g.systid_til IS NULL;

DROP VIEW IF EXISTS fkg.hist_l_fotoforbindelse;
CREATE VIEW fkg.hist_l_fotoforbindelse AS
SELECT
  g.objekt_id,
  g.versions_id,
  g.systid_fra,
  g.systid_til,
  g.oprettet,
  g.cvr_kode,
  m.cvr_navn,
  m.kommunekode,
  g.bruger_id,
  g.oprindkode,
  o.oprindelse,
  g.statuskode,
  s.status,
  g.off_kode,
  f.offentlig,
  t.noegle,
  t.note,
  t.foto_objek,
  t.foto_prefix,
  t.foto_navn,
  k1.tema_kode,
  k1.tema_navn,
  t.geometri
FROM
  fkg.generel g JOIN
  fkg.d_basis_ansvarlig_myndighed m ON (g.cvr_kode=m.cvr_kode) JOIN
  fkg.d_basis_oprindelse o ON (g.oprindkode=o.oprindkode) JOIN
  fkg.d_basis_status s ON (g.statuskode=s.statuskode) JOIN
  fkg.d_basis_offentlig f ON (g.off_kode=f.off_kode) JOIN
  fkg.l_fotoforbindelse_t t ON (g.versions_id = t.versions_id) LEFT JOIN
  fkg.d_tabel k1 ON (t.tema_kode = k1.tema_kode);

CREATE OR REPLACE FUNCTION fkg.l_fotoforbindelse_trg() RETURNS trigger AS $$
  BEGIN
    IF (TG_OP = 'DELETE') THEN
      -- Return "0 rows deleted" IF NOT EXISTS
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL;
      END IF;
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN OLD;

    ELSIF (TG_OP = 'UPDATE') THEN
      -- Error handling
      IF (NEW.objekt_id <> OLD.objekt_id) THEN
        RAISE EXCEPTION 'Update of objekt_id is not allowed';
      END IF;
      IF NOT EXISTS (SELECT '1' FROM fkg.generel WHERE versions_id=OLD.versions_id AND systid_til IS NULL) THEN
        RETURN NULL; -- Return "0 rows updated" IF NOT EXISTS
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;

      -- Insert into general
      INSERT INTO fkg.generel (
        versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into l_fotoforbindelse_t
      INSERT INTO fkg.l_fotoforbindelse_t (versions_id, noegle, note,   foto_objek, foto_prefix, foto_navn, tema_kode, geometri)
      SELECT
        NEW.versions_id, NEW.noegle, NEW.note, NEW.foto_objek, NEW.foto_prefix, NEW.foto_navn, NEW.tema_kode, NEW.geometri;

      -- Close the old version
      UPDATE fkg.generel SET systid_til = current_timestamp WHERE versions_id=OLD.versions_id;
      RETURN NEW;

    ELSIF (TG_OP = 'INSERT') THEN
       -- Verify that the objekt doesn't exists as aktive
      IF (NEW.objekt_id IS NOT NULL) THEN
        IF EXISTS (SELECT '1' FROM fkg.generel WHERE objekt_id=NEW.objekt_id AND systid_til IS NULL) THEN
          RAISE EXCEPTION 'Objekt with objekt_id="%" already exists', NEW.objekt_id;
        END IF;
      END IF;

      -- Initialize
      NEW.versions_id = uuid_generate_v1();
      NEW.objekt_id = COALESCE(NEW.objekt_id, uuid_generate_v1()); -- If NULL from client make one ourself
      NEW.systid_fra = current_timestamp;
      NEW.systid_til = NULL;
      NEW.oprettet = current_timestamp;

      -- Insert into general
      INSERT INTO fkg.generel (versions_id, objekt_id, systid_fra, systid_til, oprettet, cvr_kode, bruger_id, oprindkode, statuskode, off_kode)
      SELECT
        NEW.versions_id, NEW.objekt_id, NEW.systid_fra, NEW.systid_til, NEW.oprettet, NEW.cvr_kode, NEW.bruger_id, NEW.oprindkode, NEW.statuskode, NEW.off_kode;

      -- Insert into l_fotoforbindelse_t
      INSERT INTO fkg.l_fotoforbindelse_t (versions_id, noegle, note,   foto_objek, foto_prefix, foto_navn, tema_kode, geometri)
      SELECT
        NEW.versions_id, NEW.noegle, NEW.note, NEW.foto_objek, NEW.foto_prefix, NEW.foto_navn, NEW.tema_kode, NEW.geometri;
      RETURN NEW;
    END IF;
  END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS l_fotoforbindelse_trg_iud ON fkg.l_fotoforbindelse;

CREATE TRIGGER l_fotoforbindelse_trg_iud
    INSTEAD OF INSERT OR DELETE OR UPDATE ON fkg.l_fotoforbindelse
    FOR EACH ROW
    EXECUTE PROCEDURE fkg.l_fotoforbindelse_trg();
