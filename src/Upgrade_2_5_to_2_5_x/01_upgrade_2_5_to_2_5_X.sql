-- New basic lookuptable
CREATE TABLE fkg.d_basis_ansvar_v(ansvar_v_k integer NOT NULL, ansvar_v character varying(30) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_basis_ansv_v_pk PRIMARY KEY (ansvar_v_k));

-- New themespecific looktables
CREATE TABLE fkg.d_5800_saeson(saeson_k integer NOT NULL, saeson character varying(50) NOT NULL, aktiv integer NOT NULL DEFAULT 1, begrebsdefinition character varying,
  CONSTRAINT d_5800_saeson_pk PRIMARY KEY (saeson_k));

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

-- Changed name
ALTER TABLE fkg.d_5802_facilitetl RENAME TO d_5802_rutetype;
ALTER TABLE fkg.d_5802_rutetype RENAME COLUMN facilitetl_type_kode TO rute_ty_k;
ALTER TABLE fkg.d_5802_rutetype RENAME COLUMN facilitetl_type TO rute_ty;

-- Changes to d_5800_facilitet
ALTER TABLE fkg.d_5800_facilitet RENAME COLUMN facilitet_type_kode TO facil_ty_k;
ALTER TABLE fkg.d_5800_facilitet RENAME COLUMN facilitet_type TO facil_ty;

-- Changes to t_5800_fac_pkt_t
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN facilitet_type_kode TO facil_ty_k;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN handicapegnet_kode to handicap_k;
ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN belaegning_kode CASCADE;
ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN ejerstatus_kode CASCADE;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN saeson_k integer;
ALTER TABLE fkg.t_5800_fac_pkt_t RENAME COLUMN note TO beskrivels;
ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN noegle;
ALTER TABLE fkg.t_5800_fac_pkt_t DROP COLUMN cvf_vejkode;
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN ansvar_org character varying(254);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN kontak_vedl character varying(254);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN foto_link1 character varying(1024);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN foto_link2 character varying(1024);
ALTER TABLE fkg.t_5800_fac_pkt_t ADD COLUMN ansvar_v_k integer;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_5800_saeson_fk FOREIGN KEY (saeson_k)
REFERENCES fkg.d_5800_saeson (saeson_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5800_fac_pkt_t ADD CONSTRAINT t_5800_fac_pkt_d_basis_ansvar_v_fk FOREIGN KEY (ansvar_v_k)
REFERENCES fkg.d_basis_ansvar_v (ansvar_v_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Changes to t_5801
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN facilitet_type_kode TO facil_ty_k;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN belaegning_kode CASCADE;
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN handicapegnet_kode to handicap_k;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN ejerstatus_kode CASCADE;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN noegle;
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN saeson_k integer;
ALTER TABLE fkg.t_5801_fac_fl_t RENAME COLUMN note TO beskrivels;
ALTER TABLE fkg.t_5801_fac_fl_t DROP COLUMN cvf_vejkode;
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN ansvar_org character varying(254);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN kontak_vedl character varying(254);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN foto_link1 character varying(1024);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN foto_link2 character varying(1024);
ALTER TABLE fkg.t_5801_fac_fl_t ADD COLUMN ansvar_v_k integer;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_5800_saeson_fk FOREIGN KEY (saeson_k)
REFERENCES fkg.d_5800_saeson (saeson_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5801_fac_fl_t ADD CONSTRAINT t_5801_fac_fl_d_basis_ansvar_v_fk FOREIGN KEY (ansvar_v_k)
REFERENCES fkg.d_basis_ansvar_v (ansvar_v_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Changes to t_5802
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN facilitetl_type_kode TO rute_ty_k;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN ejerstatus_kode CASCADE;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN rute_uty_k integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN kategori_k integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN hierarki_k integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN svaerhed_k integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN navndels character varying(128);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN straekn_nr character varying(128);
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN straekningsnr;

ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN ansvar_org character varying(128);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN konta_vedl character varying(128);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN laengde float;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN folder_k integer;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN folde_link character varying(1024);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN gpx_link character varying(1024);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN foto_link1 character varying(1024);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN foto_link2 character varying(1024);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN obs character varying(254);
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN beskrivels character varying(254);
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN belaegning_kode TO belaegn_k;
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN handicapegnet_kode TO handikap_k;
ALTER TABLE fkg.t_5802_fac_li_t ADD COLUMN ansvar_v_k integer;
ALTER TABLE fkg.t_5802_fac_li_t RENAME COLUMN afmaerket_rute_kode TO afm_rute_k;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN noegle;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN note;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN vejkode CASCADE;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN cvf_vejkode CASCADE;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN husnr;
ALTER TABLE fkg.t_5802_fac_li_t DROP COLUMN postnr CASCADE;

ALTER TABLE fkg.t_5802_fac_li_t DROP CONSTRAINT t_5802_fac_li_d_5802_facilitet_fk;
ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_rutetype_fk FOREIGN KEY (rute_ty_k)
REFERENCES fkg.d_5802_rutetype (rute_ty_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_rute_uty_fk FOREIGN KEY (rute_uty_k)
REFERENCES fkg.d_5802_rute_uty (rute_uty_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_kategori_fk FOREIGN KEY (kategori_k)
REFERENCES fkg.d_5802_kategori (kategori_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_hierarki_fk FOREIGN KEY (hierarki_k)
REFERENCES fkg.d_5802_hierarki (hierarki_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_5802_svaerhed_fk FOREIGN KEY (svaerhed_k)
REFERENCES fkg.d_5802_svaerhed (svaerhed_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_folder_fk FOREIGN KEY (folder_k)
REFERENCES fkg.d_basis_ja_nej (ja_nej_kode) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE fkg.t_5802_fac_li_t ADD CONSTRAINT t_5802_fac_li_d_basis_ansvar_v_fk FOREIGN KEY (ansvar_v_k)
REFERENCES fkg.d_basis_ansvar_v (ansvar_v_k) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;



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
  facil_ty = changes.column2,
  begrebsdefinition = changes.column4
FROM
  changes
WHERE
  changes.column1 = fkg.d_5800_facilitet.facil_ty_k;

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
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.navn,
  t.saeson_k,
  k3.saeson AS saeson,
  t.beskrivels,
  t.ansvar_org,
  t.kontak_vedl,
  t.foto_link1,
  t.foto_link2,
  t.vejkode,
  k4.vejnavn AS vejnavn,
  t.ansvar_v_k,
  k5.ansvar_v AS ansvar_v,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
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
  fkg.d_vejnavn k4 ON (t.vejkode = k4.vejkode) LEFT JOIN
  fkg.d_basis_ansvar_v k5 ON (t.ansvar_v_k = k5.ansvar_v_k) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr)
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
  t.kategori_k,
  k3.kategori AS kategori,
  t.hierarki_k,
  k4.hierarki AS hierarki,
  t.svaerhed_k,
  k5.svaerhed AS svaerhed,
  t.navn,
  t.navndels,
  t.straekn_nr,
  t.ansvar_org,
  t.konta_vedl,
  t.laengde,
  t.folder_k,
  k6.ja_nej AS folder,
  t.folde_link,
  t.gpx_link,
  t.foto_link1,
  t.foto_link2,
  t.obs,
  t.beskrivels,
  t.belaegn_k,
  k7.belaegning AS belaegn,
  t.handikap_k,
  k8.handicapegnet AS handikap,
  t.ansvar_v_k,
  k9.ansvar_v AS ansvar_v,
  t.startpunkt_x,
  t.startpunkt_y,
  t.afm_rute_k,
  k10.ja_nej AS afm_rute,
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
  fkg.d_5802_kategori k3 ON (t.kategori_k = k3.kategori_k) LEFT JOIN
  fkg.d_5802_hierarki k4 ON (t.hierarki_k = k4.hierarki_k) LEFT JOIN
  fkg.d_5802_svaerhed k5 ON (t.svaerhed_k = k5.svaerhed_k) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.folder_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k7 ON (t.belaegn_k = k7.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k8 ON (t.handikap_k = k8.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansvar_v k9 ON (t.ansvar_v_k = k9.ansvar_v_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.afm_rute_k = k10.ja_nej_kode)
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
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.navn,
  t.saeson_k,
  k3.saeson AS saeson,
  t.beskrivels,
  t.ansvar_org,
  t.kontak_vedl,
  t.foto_link1,
  t.foto_link2,
  t.vejkode,
  k4.vejnavn AS vejnavn,
  t.ansvar_v_k,
  k5.ansvar_v AS ansvar_v,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
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
  fkg.d_vejnavn k4 ON (t.vejkode = k4.vejkode) LEFT JOIN
  fkg.d_basis_ansvar_v k5 ON (t.ansvar_v_k = k5.ansvar_v_k) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr)
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
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.navn,
  t.saeson_k,
  k3.saeson AS saeson,
  t.beskrivels,
  t.ansvar_org,
  t.kontak_vedl,
  t.foto_link1,
  t.foto_link2,
  t.vejkode,
  k4.vejnavn AS vejnavn,
  t.ansvar_v_k,
  k5.ansvar_v AS ansvar_v,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
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
  fkg.d_vejnavn k4 ON (t.vejkode = k4.vejkode) LEFT JOIN
  fkg.d_basis_ansvar_v k5 ON (t.ansvar_v_k = k5.ansvar_v_k) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr);
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
  t.kategori_k,
  k3.kategori AS kategori,
  t.hierarki_k,
  k4.hierarki AS hierarki,
  t.svaerhed_k,
  k5.svaerhed AS svaerhed,
  t.navn,
  t.navndels,
  t.straekn_nr,
  t.ansvar_org,
  t.konta_vedl,
  t.laengde,
  t.folder_k,
  k6.ja_nej AS folder,
  t.folde_link,
  t.gpx_link,
  t.foto_link1,
  t.foto_link2,
  t.obs,
  t.beskrivels,
  t.belaegn_k,
  k7.belaegning AS belaegn,
  t.handikap_k,
  k8.handicapegnet AS handikap,
  t.ansvar_v_k,
  k9.ansvar_v AS ansvar_v,
  t.startpunkt_x,
  t.startpunkt_y,
  t.afm_rute_k,
  k10.ja_nej AS afm_rute,
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
  fkg.d_5802_kategori k3 ON (t.kategori_k = k3.kategori_k) LEFT JOIN
  fkg.d_5802_hierarki k4 ON (t.hierarki_k = k4.hierarki_k) LEFT JOIN
  fkg.d_5802_svaerhed k5 ON (t.svaerhed_k = k5.svaerhed_k) LEFT JOIN
  fkg.d_basis_ja_nej k6 ON (t.folder_k = k6.ja_nej_kode) LEFT JOIN
  fkg.d_basis_belaegning k7 ON (t.belaegn_k = k7.belaegning_kode) LEFT JOIN
  fkg.d_basis_handicapegnet k8 ON (t.handikap_k = k8.handicapegnet_kode) LEFT JOIN
  fkg.d_basis_ansvar_v k9 ON (t.ansvar_v_k = k9.ansvar_v_k) LEFT JOIN
  fkg.d_basis_ja_nej k10 ON (t.afm_rute_k = k10.ja_nej_kode);
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
  t.handicap_k,
  k2.handicapegnet AS handicap,
  t.navn,
  t.saeson_k,
  k3.saeson AS saeson,
  t.beskrivels,
  t.ansvar_org,
  t.kontak_vedl,
  t.foto_link1,
  t.foto_link2,
  t.vejkode,
  k4.vejnavn AS vejnavn,
  t.ansvar_v_k,
  k5.ansvar_v AS ansvar_v,
  t.husnr,
  t.postnr,
  k6.postnr_by AS postnr_by,
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
  fkg.d_vejnavn k4 ON (t.vejkode = k4.vejkode) LEFT JOIN
  fkg.d_basis_ansvar_v k5 ON (t.ansvar_v_k = k5.ansvar_v_k) LEFT JOIN
  fkg.d_basis_postnr k6 ON (t.postnr = k6.postnr);

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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, handicap_k, navn, saeson_k, beskrivels, ansvar_org, kontak_vedl, foto_link1, foto_link2, vejkode, ansvar_v_k, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.handicap_k, NEW.navn, NEW.saeson_k, NEW.beskrivels, NEW.ansvar_org, NEW.kontak_vedl, NEW.foto_link1, NEW.foto_link2, NEW.vejkode, NEW.ansvar_v_k, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;

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
      INSERT INTO fkg.t_5800_fac_pkt_t (versions_id, facil_ty_k, handicap_k, navn, saeson_k, beskrivels, ansvar_org, kontak_vedl, foto_link1, foto_link2, vejkode, ansvar_v_k, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.handicap_k, NEW.navn, NEW.saeson_k, NEW.beskrivels, NEW.ansvar_org, NEW.kontak_vedl, NEW.foto_link1, NEW.foto_link2, NEW.vejkode, NEW.ansvar_v_k, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;
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
$$LANGUAGE plpgsql VOLATILE
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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, kategori_k, hierarki_k, svaerhed_k, navn, navndels, straekn_nr, ansvar_org, konta_vedl, laengde, folder_k, folde_link, gpx_link, foto_link1, foto_link2, obs, beskrivels, belaegn_k, handikap_k, ansvar_v_k, startpunkt_x, startpunkt_y, afm_rute_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.kategori_k, NEW.hierarki_k, NEW.svaerhed_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.ansvar_org, NEW.konta_vedl, NEW.laengde, NEW.folder_k, NEW.folde_link, NEW.gpx_link, NEW.foto_link1, NEW.foto_link2, NEW.obs, NEW.beskrivels, NEW.belaegn_k, NEW.handikap_k, NEW.ansvar_v_k, NEW.startpunkt_x, NEW.startpunkt_y, NEW.afm_rute_k, NEW.link, NEW.geometri;

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
      INSERT INTO fkg.t_5802_fac_li_t (versions_id, rute_ty_k, rute_uty_k, kategori_k, hierarki_k, svaerhed_k, navn, navndels, straekn_nr, ansvar_org, konta_vedl, laengde, folder_k, folde_link, gpx_link, foto_link1, foto_link2, obs, beskrivels, belaegn_k, handikap_k, ansvar_v_k, startpunkt_x, startpunkt_y, afm_rute_k, link, geometri)
      SELECT
        NEW.versions_id, NEW.rute_ty_k, NEW.rute_uty_k, NEW.kategori_k, NEW.hierarki_k, NEW.svaerhed_k, NEW.navn, NEW.navndels, NEW.straekn_nr, NEW.ansvar_org, NEW.konta_vedl, NEW.laengde, NEW.folder_k, NEW.folde_link, NEW.gpx_link, NEW.foto_link1, NEW.foto_link2, NEW.obs, NEW.beskrivels, NEW.belaegn_k, NEW.handikap_k, NEW.ansvar_v_k, NEW.startpunkt_x, NEW.startpunkt_y, NEW.afm_rute_k, NEW.link, NEW.geometri;
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
$$LANGUAGE plpgsql VOLATILE
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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, handicap_k, navn, saeson_k, beskrivels, ansvar_org, kontak_vedl, foto_link1, foto_link2, vejkode, ansvar_v_k, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.handicap_k, NEW.navn, NEW.saeson_k, NEW.beskrivels, NEW.ansvar_org, NEW.kontak_vedl, NEW.foto_link1, NEW.foto_link2, NEW.vejkode, NEW.ansvar_v_k, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;

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
      INSERT INTO fkg.t_5801_fac_fl_t (versions_id, facil_ty_k, handicap_k, navn, saeson_k, beskrivels, ansvar_org, kontak_vedl, foto_link1, foto_link2, vejkode, ansvar_v_k, husnr, postnr, link, geometri)
      SELECT
        NEW.versions_id, NEW.facil_ty_k, NEW.handicap_k, NEW.navn, NEW.saeson_k, NEW.beskrivels, NEW.ansvar_org, NEW.kontak_vedl, NEW.foto_link1, NEW.foto_link2, NEW.vejkode, NEW.ansvar_v_k, NEW.husnr, NEW.postnr, NEW.link, NEW.geometri;
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
$$LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS make_multi_trg ON fkg.t_5801_fac_fl_t;

CREATE TRIGGER make_multi_trg BEFORE INSERT OR UPDATE
   ON fkg.t_5801_fac_fl_t FOR EACH ROW
   EXECUTE PROCEDURE fkg.make_multi();

DROP INDEX IF EXISTS fkg.t_5800_fac_pkt_t_gist;CREATE INDEX t_5800_fac_pkt_t_gist ON fkg.t_5800_fac_pkt_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5802_fac_li_t_gist;CREATE INDEX t_5802_fac_li_t_gist ON fkg.t_5802_fac_li_t USING gist (geometri);
DROP INDEX IF EXISTS fkg.t_5801_fac_fl_t_gist;CREATE INDEX t_5801_fac_fl_t_gist ON fkg.t_5801_fac_fl_t USING gist (geometri);

-- Noter

-- Tekst på lookupværdi 9 i d_basis_ansvar_v:
-- "Mangler viden om fremkommelighed" ændret til
-- "Mangler viden om vedligeholder"

-- fkg.d_5800_facilitet
-- "Hundeskov/Hundepark/fritløbsareal" ændret til
-- "Hundeskov/park/fritløbsareal" (>30 tegn)

-- fkg.d_5802_rutetype
-- Kolonnenavn rute_t_k ændret til rute_ty_k (som det fremgår af temaspecifikationen)

-- fkg.t_5800_fac_pkt
-- Kolonnenavn ændret fra ansva_v_k til ansvar_v_k, tilsvarende med lookuptabel

-- fkg.t_5801_fac_fl
-- Kolonnenavn ændret fra ansva_v_k til ansvar_v_k, tilsvarende med lookuptabel

-- fkg.t_5802_fac_li_t
-- De 2 ens kolonner svaergra / svaergra (efter beskrivels) er udeladt. Dubleret ift. svaerhed_k hhv. svaerhed



-- Hvorfor er I begyndt at ændre semantik på nøgle felter: "_k" i stedet for "_kode" som det hidtil har været?

