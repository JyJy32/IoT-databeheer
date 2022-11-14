-- Liégeois Joren
-- S129792
-- prac 26/09 
-- oef1
-- Create Database `sales`;
-- Create Database if not exists `graduaatIoT`;
-- Drop Database `graduaatIoT`;

-- oef 2
/*
1:
Create Table `tblGamesGenre` (
id tinyint UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT 
#tinyint gaat tot 128 en moet maar tot 60 ook unsigned voor positief aleen en als primary key en auto increment als ID
);
2:
Create Table `tblTemperatureHistory` (
Temperature tinyint 
#temperatuur gaat niet zo hoog in °C
);
3:
Create Table `tblDemoGraphicData` (
inhabitnatCount int unsigned
);
4: tinyint unique unsigned primary key
*/

-- oef 3
/*
1: decimal(5,2) een video spel gaat niet meer dan 999 euro kosten en 2 cijfers na de komma voor cent
2: decimal(5,3) 3 cijfers na de komma voor millimeter en maar 5 precisie want een auto gaat niet 100 meters lang/breed/hoog zijn
3: decimal(2,2) percentage uitdrukken als een waarde tussen 0 en 1 
*/

-- oef 4
/*
1: varchar(50) niet lang genoeg voor text dus varchar van 50
2: char(13) altijd 13 getallen
3: varchar(50)
4: char(4) altijd 4 getallen 
*/

-- oef 5
create Database if not exists `ap`;
create table if not exists `ap`.`tblDepartment`(
    DepNr char(5),
    Budget decimal(8,2) not NULL,
    Location varchar(30),
    IsActive tinyint,
    AvrPoints decimal(4,2)
);

-- oef 6
drop table if exists `ap`.`AFDELING`;
create table if not exists `ap`.`tblOpleidingen` (
    Code varchar(10) not null primary key,
    Omschrijving text,
    Duur date
);
create table if not exists `ap`.`tblAfdeling` (
    Nr int unsigned primary key AUTO_INCREMENT,
    Naam varchar(100),
    Replicatiecode char(32)

)AUTO_INCREMENT=10;
create table if not exists `ap`.`tblMedewerkers` (
    Nr int unsigned primary key AUTO_INCREMENT,
    Naam varchar(100),
    Adres tinytext,
    AfdelingNr int unsigned,
    foreign key (`AfdelingNr`) references `tblAfdeling`(`Nr`)
);
create table if not exists `ap`.`tblGevolgdeOpleidingen` (
    MedewerkerNr int unsigned primary key,
    Opleidingscode char(10),
    Datum date,
    Voltooid timestamp,
    foreign key (`MedewerkerNr`) references `tblMedewerkers`(`Nr`),
    foreign key (`Opleidingscode`) references `tblOpleidingen`(`Code`) 
);

-- oef 7
create Database if not exists `Planes`;
create table if not exists `planes`.`tblManufacturers`(
    id smallint primary key auto_increment,
    Name varchar(100) unique

)auto_increment=100;

create table if not exists `planes`.`tblPlaneDefenitions`(
    id mediumint primary key auto_increment,
    ManufacturerId smallint not null,
    Name varchar(100) not null,
    DesignDate date not null,
    isCivilian tinyint,
    NumberOfEngines tinyint,
    Weight mediumint
);