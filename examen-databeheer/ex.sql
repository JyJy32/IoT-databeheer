/*
Simon de Jager

Dit script bouwt de database structuur voor de padel database gebruikt in de examen oefeningen
De database bestaat uit volgende tabellen:
- tblSpelers
- tblTeams
- tblCompetitie
- tblCafetaria
- tblDirectie

Het Script bevat ook enkele regels om die data toevoegen aan de database
*/
DROP DATABASE IF EXISTS PADEL; #Regel die database verwijderd moest deze al bestaan
CREATE DATABASE PADEL; #Regel die een lege database TENNIS aanmaakt
USE PADEL; #Vanaf nu wordt alles in database TENNIS uitgevoerd, dus hoeft de prefix "`TENNIS`." niet gebruikt te worden

CREATE TABLE tblSpelers
      (SPELERSNR    SMALLINT NOT NULL PRIMARY KEY,
       NAAM         VARCHAR(15) NOT NULL,
       VOORNAAM  	VARCHAR(15) NOT NULL,
       GEB_DATUM    DATE,
       GESLACHT     CHAR(1) NOT NULL
                    CHECK(GESLACHT IN ('V','M','X')),
       JAARTOE      SMALLINT NOT NULL #Jaar van toetrede
                    CHECK(JAARTOE > 1969), #Extra integriteitsregel die beperkt 
       STRAAT       VARCHAR(30)  NOT NULL,
       HUISNR       CHAR(4),
       POSTCODE     CHAR(6) CHECK(POSTCODE LIKE '______'),
       PLAATS       VARCHAR(30) NOT NULL,
       TELEFOON     CHAR(13))
;
CREATE TABLE tblTeams
      (TEAMNR       TINYINT NOT NULL,
       SPELERSNR    SMALLINT NOT NULL,
       DIVISIE      CHAR(6) NOT NULL
                    CHECK(DIVISIE IN ('ere', 'tweede')),
	   PRIMARY KEY (TEAMNR,SPELERSNR),
       FOREIGN KEY  (SPELERSNR) REFERENCES tblSpelers (SPELERSNR))
;
CREATE TABLE tblCompetitie
      (COMPNR  		INT NOT NULL PRIMARY KEY,
       TEAMA       	TINYINT NOT NULL,
       TEAMB		TINYINT NOT NULL,
       AANVOERDERA 	SMALLINT NOT NULL,
       AANVOERDERB	SMALLINT NOT NULL,
       GEWONNEN     SMALLINT NOT NULL
                    CHECK(GEWONNEN BETWEEN 0 AND 3), #gewonnen sets door team A
       VERLOREN     SMALLINT NOT NULL
                    CHECK(VERLOREN BETWEEN 0 AND 3), #verloren sets door team A
       FOREIGN KEY  (TEAMA) REFERENCES tblTeams (TEAMNR),
       FOREIGN KEY  (TEAMB) REFERENCES tblTeams (TEAMNR),
       FOREIGN KEY  (AANVOERDERA) REFERENCES tblSpelers (SPELERSNR),
       FOREIGN KEY  (AANVOERDERB) REFERENCES tblSpelers (SPELERSNR))
;
CREATE TABLE tblCafetaria
      (BETALINGSNR  INT NOT NULL PRIMARY KEY,
       SPELERSNR    SMALLINT NOT NULL,
       DATUM        DATE NOT NULL
                    CHECK(DATUM >= DATE('2010-12-31')),
       BEDRAG       DECIMAL(7,2) NOT NULL,
       FOREIGN KEY  (SPELERSNR) REFERENCES tblSpelers (SPELERSNR))
;
CREATE TABLE tblDirectie
      (SPELERSNR    SMALLINT NOT NULL,
       BEGIN_DATUM  DATE NOT NULL,
       EIND_DATUM   DATE,
       FUNCTIE      CHAR(20),
       PRIMARY KEY  (SPELERSNR, BEGIN_DATUM),
       FOREIGN KEY  (SPELERSNR) REFERENCES tblSpelers (SPELERSNR),
       CHECK(BEGIN_DATUM < EIND_DATUM),
       CHECK(BEGIN_DATUM >= DATE('2010-01-01')))
;
COMMIT WORK
;
INSERT INTO tblSpelers (SPELERSNR,NAAM,VOORNAAM,GEB_DATUM,GESLACHT,JAARTOE,STRAAT,HUISNR,POSTCODE,PLAATS,TELEFOON)
VALUES
(1,"Masset","Yves","2015-03-18","M",2010,"Dorpstraat", 15, "BE2610", "Wilrijk", "0498 12 23 45"),
(2,"Morren","Jill","2012-06-21","V",2010,"Kerkstraat", 312, "BE2000", "Antwerpen", "0498 23 34 56"),
(3,"Mancel","Evelyne","2019-11-01","V",2010,"Nieuwstraat", 465, "BE2018", "Antwerpen", "0498 34 45 67"),
(4,"Roelants","Dieter","1979-05-28","M",2015,"Kloosterstraat", 23, "BE2640", "Mortsel", "0498 45 56 78"),
(5,"Smets","Marc","1965-07-07","M",2000,"Suikerstraat", 879, "BE2530", "Boechout", "0498 56 67 89"),
(6,"de Jager","Simon","2011-11-29","M",2020,"Vosstraat", 45, "BE2000", "Antwerpen", "0498 67 78 90"),
(7,"Van Loo","Erwin","1971-02-28","M",2011,"Vogelstraat", 9, "BE2531", "Vremde", "0498 78 89 01"),
(8,"Van de Velde","Chris","2015-10-16","M",2013,"Kunststraat", 79, "BE2500", "Lier", "0498 89 90 12"),
(9,"Devenyns","Geert","2011-10-23","M",2004,"Paardenstraat", 62, "BE9000", "Gent", "0498 90 01 23"),
(10,"Tillemans","David","1969-03-24","M",2019,"Klokstraat", 93, "BE1000", "Brussel", "0498 01 12 34"),
(11,"Frantzen","Dominique","2019-12-02","M",2014,"Koningstraat", 596, "BE1020", "Laken", "0498 98 87 65"),
(12,"Peetermans","Wouter","2018-05-28","M",2018,"Prinsstraat", 39, "BE1130", "Haren", "0498 87 76 54"),
(13,"Van Houtven","Patrick","2013-05-17","M",2011,"Kersstraat", 82, "BE2140", "Borgerhout", "0498 76 65 43"),
(14,"Van Overveldt","Maarten","2012-08-12","M",2019,"Pruimstraat", 174, "BE3000", "Leuven", "0498 65 54 32"),
(15,"Hendrickx","Maarten","2011-08-29","M",2007,"Avocadostraat", 26, "BE3001", "Heverlee", "0498 54 43 21"),
(16,"Laurent","Koen","2015-09-19","M",2012,"Citroenstraat", 72, "BE3010", "Kessel-Lo", "0498 43 32 10"),
(17,"De Ridder","Ward","2011-08-31","M",2019,"Keizerstraat", 2, "BE9032", "Wondelgem", "0498 32 21 09"),
(18,"Rosseau","Marc","2010-11-16","M",2016,"Belegstraat", 96, "BE9830", "Sint-Martens-Latem", "0498 21 10 98"),
(19,"Stevens","Wouter","1976-01-18","M",2005,"Haantjesstraat", 84, "BE2020", "Antwerpen", "0498 10 09 87"),
(20,"Verhulst","David","1972-07-04","M",2007,"Oudestraat", 63, "BE2800", "Mechelen", "0498 09 98 76");

INSERT INTO tblTeams (TEAMNR,SPELERSNR,DIVISIE) VALUES
(1,1,'ere'),
(1,2,'ere'),
(2,3,'ere'),
(2,4,'ere'),
(3,5,'ere'),
(3,6,'ere'),
(4,7,'ere'),
(4,8,'ere'),
(5,9,'ere'),
(5,10,'ere'),
(6,11,'tweede'),
(6,12,'tweede'),
(7,13,'tweede'),
(7,14,'tweede'),
(8,15,'tweede'),
(8,16,'tweede'),
(9,17,'tweede'),
(9,18,'tweede'),
(10,19,'tweede'),
(10,20,'tweede');

INSERT INTO tblCompetitie (COMPNR,TEAMA,TEAMB,AANVOERDERA,AANVOERDERB,GEWONNEN,VERLOREN) VALUES
( 1, 1,6,2,11, 3, 1),
( 2, 1,6,1,12, 2, 3),
( 3, 3,5,5,9, 3, 0),
( 4, 3,5,6,10, 3, 2),
( 5, 2,9,3,18, 0, 3),
( 6, 2,9,4,17, 1, 3),
( 7, 5,9,5,18, 3, 0),
( 8, 5,9,6,17, 0, 3),
( 9, 4,3,7,6, 3, 2),
(10, 4,3,8,5, 3, 2),
(11, 2,10,3,19, 2, 3),
(12, 2,10,4,20, 1, 3),
(13, 7,8,14,16, 0, 3);

INSERT INTO tblCafetaria VALUES (1,   6, '2011-12-08', 100),
 (2,  4, '2011-05-05',  75),
 (3,  7, '2013-09-10', 100),
 (4, 10, '2014-12-08',  50),
 (5,  14, '2011-12-08',  25),
 (6,   8, '2011-12-08',  25),
 (7,  4, '2012-12-30',  -30),
 (8,  7, '2014-11-12',  -5),
 (9,  4, '2011-05-05',  -5),
 (10,  7, '2013-09-10', -10),
 (11, 10, '2014-12-08',  -51),
 (12,  14, '2011-12-08',  -5),
 (13,   8, '2011-12-08',  -35),
 (14,  4, '2012-12-30',  -30),
 (15,  7, '2014-11-12',  -35);

INSERT INTO tblDirectie VALUES (  6, '2010-01-01', '2010-12-31', 'Secretaris'),
 (  6, '2011-01-01', '2012-12-31', 'Lid'),
 (  6, '2012-01-01', '2013-12-31', 'Penningmeester'),
 (  6, '2013-01-01', NULL, 'Voorzitter'),
 (  2, '2010-01-01', '2012-12-31', 'Voorzitter'),
 (  2, '2014-01-01', NULL, 'Lid'),
 (12, '2012-01-01', '2012-12-31', 'Lid'),
 (12, '2014-01-01', NULL, 'Secretaris'),
 (  8, '2010-01-01', '2010-12-31', 'Penningmeester'),
 (  8, '2011-01-01', '2011-12-31', 'Secretaris'),
 (  8, '2013-01-01', '2013-12-31', 'Lid'),
 (  8, '2014-01-01', NULL, 'Lid'),
 ( 5, '2012-01-01', '2012-12-31', 'Secretaris'),
 ( 7, '2010-01-01', '2010-12-31', 'Lid'),
 ( 7, '2011-01-01', '2011-12-31', 'Penningmeester'),
 ( 11, '2013-01-01', '2013-12-31', 'Penningmeester'),
 ( 20, '2014-01-01', NULL, 'Penningmeester')
;
COMMIT WORK
;