-- drop/create Database
DROP DATABASE IF EXISTS sports_club;
CREATE DATABASE IF NOT EXISTS sports_club;

USE sports_club;

--drop TABLES
DROP TABLE IF EXISTS `STATISTIKA`;
DROP TABLE IF EXISTS `TRAUMATISMOS`;
DROP TABLE IF EXISTS `PROPONHSH_PROPONHTHS`;
DROP TABLE IF EXISTS `AGWNES_ATHLITI`;
DROP TABLE IF EXISTS `PROPONHSH`;
DROP TABLE IF EXISTS `AGWNAS`;
DROP TABLE IF EXISTS `A8LITIS`;
DROP TABLE IF EXISTS `PROPONHTHS`;
DROP TABLE IF EXISTS `SEASON`;
DROP TABLE IF EXISTS `EGKATASTASEIS`;

DROP TABLE IF EXISTS `A8LIMA`;


--CREATE TABLES


CREATE TABLE IF NOT EXISTS `A8LIMA` (
  `onoma_athlimatos`  varchar(25) NOT NULL,
  `tropos_paixnidiou` VARCHAR(10) NOT NULL CHECK(tropos_paixnidiou IN ('omadiko', 'atomiko')),
  `exoplismos` TINYTEXT,
  PRIMARY KEY (`onoma_athlimatos`)
);

CREATE TABLE IF NOT EXISTS `EGKATASTASEIS` (
  `kwdikos_egkatastashs` int(3)  NOT NULL CHECK(kwdikos_egkatastashs BETWEEN 100 AND 999),
  `onoma_egkatastashs` varchar(25) NOT NULL,
  `onoma_athlimatos` varchar(25) NOT NULL,
  `typos_gypedou` varchar(25) NOT NULL,
  `xwrhtikothta`  INT(4) NOT NULL,
  PRIMARY KEY (`kwdikos_egkatastashs`),
  foreign key (`onoma_athlimatos`) references `A8LIMA`(`onoma_athlimatos`)
);

CREATE TABLE IF NOT EXISTS `SEASON` (
  `epoxh` VARCHAR(20) NOT NULL,
  `etos` YEAR NOT NULL,
  `synolo_agwnwn` int(4) NOT NULL,
  `synolo_nikwn` int(3) NOT NULL,
  `synolo_httwn` int(3) NOT NULL,
  CHECK (`synolo_agwnwn` = `synolo_nikwn` + `synolo_httwn`),
  PRIMARY KEY (epoxh, etos)
);


CREATE TABLE if not exists `PROPONHTHS` (
  `kwdikos_proponhth` VARCHAR(7) NOT NULL CHECK(LENGTH(kwdikos_proponhth) = 7),
  `athlima` VARCHAR(25) NOT NULL,
  `onomateponymo`  VARCHAR(40) NOT NULL,
  `etiypiresias` int(2) NOT NULL,
  `amivi` float NOT NULL,
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`),
  PRIMARY KEY (`kwdikos_proponhth`)
);

CREATE TABLE IF NOT EXISTS `A8LITIS` (
  `aem_athliti` INT(6) NOT NULL CHECK(aem_athliti BETWEEN 100000 AND 999999),
  `onomateponymo` VARCHAR(40) NOT NULL,
  `fylo` VARCHAR(10) NOT NULL CHECK(fylo IN ('Andras', 'Gynaika')),
  `hmerominia_eggrafis` DATE NOT NULL,
  `hmerominia_gennhshs` DATE NOT NULL,
  `kwdikos_proponhth` VARCHAR(7) NOT NULL CHECK(LENGTH(kwdikos_proponhth) = 7),
  `athlima` VARCHAR(25) NOT NULL,
  FOREIGN KEY (`kwdikos_proponhth`) REFERENCES `PROPONHTHS`(`kwdikos_proponhth`),
  PRIMARY KEY (`aem_athliti`)
);
CREATE TABLE IF NOT EXISTS `AGWNAS` (
  `kwdikos_agwna` INT(4) NOT NULL CHECK(kwdikos_agwna BETWEEN 1000 AND 9999),
  `athlima` VARCHAR(25) NOT NULL,
  `epoxh` VARCHAR(20) NOT NULL,
  `etos` YEAR NOT NULL,
  `hmeromhnia_dieksagwghs` DATE NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `apotelesma` VARCHAR(40) NOT NULL,
  `eidos_match` VARCHAR(20) NOT NULL CHECK(eidos_match IN ('filiko', 'agwnistiko')),
  `topothesia` VARCHAR(20) NOT NULL CHECK(topothesia IN ('edra','ektos edras')),
  PRIMARY KEY (`kwdikos_agwna`),
  FOREIGN KEY (`epoxh`, `etos`) REFERENCES `SEASON` (`epoxh`, `etos`),
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`)
);


CREATE TABLE if not exists `PROPONHSH` (
  `kwdikos_proponhshs` int(4) NOT NULL CHECK(kwdikos_proponhshs BETWEEN 1000 AND 9999),
  `wra_dieksagwghs` TIME NOT NULL,
  `hmera_dieksagwghs` VARCHAR(10) NOT NULL,
  `diarkeia_se_lepta` int(3) NOT NULL,
  PRIMARY KEY (`kwdikos_proponhshs`)
);



--N:M pinakas athliti kai agwnas
CREATE TABLE if not exists `AGWNES_A8LITI` (
  `kwdikos_agwna` int(4) NOT NULL CHECK(kwdikos_agwna BETWEEN 1000 AND 9999),
  `aem_athliti` int(6) NOT NULL CHECK(aem_athliti BETWEEN 100000 AND 999999) , 
  PRIMARY KEY (`aem_athliti`, `kwdikos_agwna`),
  FOREIGN KEY (`aem_athliti`) REFERENCES `A8LITIS`(`aem_athliti`),
  FOREIGN KEY (`kwdikos_agwna`) REFERENCES `AGWNAS`(`kwdikos_agwna`)
);

--N:M pinakas proponhsh kai proponhths
CREATE TABLE if not exists `PROPONHSH_PROPONHTHS` (
  `proponhsh_kwdikos` int(4) NOT NULL CHECK(proponhsh_kwdikos BETWEEN 1000 AND 9999),
  `proponhtes_kwdikos` VARCHAR(7) NOT NULL CHECK(LENGTH(proponhtes_kwdikos) = 7),
  PRIMARY KEY (`proponhsh_kwdikos`, `proponhtes_kwdikos`),
  FOREIGN KEY (`proponhsh_kwdikos`) REFERENCES `PROPONHSH`(`kwdikos_proponhshs`),
  FOREIGN KEY (`proponhtes_kwdikos`) REFERENCES `PROPONHTHS`(`kwdikos_proponhth`)
);

--weak entity table
 
  CREATE TABLE IF NOT EXISTS `TRAUMATISMOS` (
  `aem_athliti` INT(6) NOT NULL,
  `hmeromhnia` DATETIME NOT NULL,
  `typos_traumatismou` VARCHAR(30) NOT NULL,
  `anafora_symvantos` TEXT,
  `sovarotita` VARCHAR(20) NOT NULL CHECK(sovarotita IN ('elafria', 'metria','sovari')),
  FOREIGN KEY (`aem_athliti`) REFERENCES `A8LITIS`(`aem_athliti`) ON DELETE CASCADE
);


--1:1 me agwna
CREATE TABLE IF NOT EXISTS `STATISTIKA` (
  `kwdikos_agwna` INT(4) NOT NULL CHECK(kwdikos_agwna BETWEEN 1000 AND 9999),
  `diarkeia_se_lepta` INT(3) NOT NULL,
  `arithmos_theatwn` INT(5) NOT NULL,
  `kairikes_synthikes` VARCHAR(30),
  `antipalos` VARCHAR(30),
  FOREIGN KEY (`kwdikos_agwna`) REFERENCES `AGWNAS`(`kwdikos_agwna`) ON DELETE CASCADE,
  UNIQUE (`kwdikos_agwna`)
);


--INSERT VALUES
INSERT INTO A8LIMA
VALUES 
('Podosfairo', 'omadiko', 'mpala'),
('Basket', 'omadiko', 'mpala'),
('Tennis', 'atomiko', 'raketes'),
('Volley', 'omadiko', 'mpala'),
('Kolymvish', 'atomiko',NULL);


INSERT INTO EGKATASTASEIS
VALUES 
(123,'ghpedo podosfairou 5x5','Podosfairo', 'kleisto', 200),
(124,'ghpedo podosfairou 3x3','Podosfairo', 'kleisto', 180),
(125,'ghpedo podosfairou 5x5','Podosfairo', 'anoixto', 220),
(128,'ghpedo basket','Basket', 'kleisto', 200),
(127,'ghpedo basket','Basket', 'anoixto', 210),
(173,'ghpedo tennis', 'Tennis','anoixto', 110),
(174,'ghpedo volley', 'Volley','anoixto', 120),
(176,'pisina kolymvishs', 'Kolymvish','kleisto', 80),
(175,'pisina kolymvishs', 'Kolymvish','anoixto', 100);

INSERT INTO SEASON
VALUES 
('Xeimerino',2023, 20, 10,10),
('Earino',2022, 20, 15,5),
('Xeimerino',2022, 15, 10,5),
('Earino',2021, 10, 5,5),
('Xeimerino',2021, 11, 5,6);


INSERT INTO PROPONHTHS
VALUES
(1234567, 'Podosfairo', 'Georgios Gkolios', 2, 1000),
(1234568, 'Basket', 'Ioannis Kapis', 3, 1100),
(1234569, 'Tennis', 'Xrhstos Dimitriadhs', 1, 900),
(1235469, 'Volley', 'Emanouil Emanouilidis', 2, 800),
(2359487, 'Kolymvish', 'Isidoros Panagiotou', 5, 1200); 

INSERT INTO A8LITIS
VALUES 
(123456, 'Dimitrios Skourths', 'Andras', '2022-09-01', '2000-01-01', 1234567, 'Podosfairo'),
(133456, 'Trifwnas Anastasiadhs', 'Andras', '2022-09-14', '2000-07-07', 1234567, 'Podosfairo'),
(123457, 'Orfeas Dedes', 'Andras', '2021-09-05', '2001-05-12', 1234568, 'Basket'),
(123458, 'Iosif Tsannis', 'Andras', '2021-10-10', '2000-03-15', 1234569, 'Tennis'),
(123459, 'Maria Papadopoulou', 'Gynaika', '2021-09-13', '2003-01-20', 1234567, 'Podosfairo'),
(123460, 'Eleni Papadopoulou', 'Gynaika', '2021-09-13', '2003-01-20', 1234568, 'Basket'),
(123461, 'Euaggelia Kritsotaki', 'Gynaika', '2022-11-16', '2005-04-16', 1234569, 'Tennis'),
(153456, 'Athina Matziouni', 'Gynaika', '2021-10-01','2001-10-06',1235469,'Volley'),
(195842, 'Frideriki Papadofasomanolaki','Gynaika','2021-10-03','2008-11-13',2359487,'Kolymvish'),
(123462, 'Giannis Athanasopoulos', 'Andras', '2022-10-20', '2002-02-25', 1234567, 'Podosfairo'),
(123463, 'Maria Koutoukou', 'Gynaika', '2022-09-05', '2003-03-10', 1234567, 'Podosfairo'),
(123464, 'Nikos Papadopoulos', 'Andras', '2022-09-10', '2001-08-15', 1234568, 'Basket'),
(123465, 'Eirini Georgiou', 'Gynaika', '2022-08-25', '2002-05-20', 1234568, 'Basket'),
(123466, 'Alexandros Karagiannis', 'Andras', '2022-07-15', '2000-11-30', 1234569, 'Tennis'),
(123467, 'Sophia Antoniou', 'Gynaika', '2022-10-30', '2001-04-05', 1234569, 'Tennis'),
(153457, 'Dimitra Karavasili', 'Gynaika', '2021-09-05', '2002-09-15', 1235469, 'Volley'),
(153458, 'Panagiotis Koutsopoulos', 'Andras', '2022-12-05', '2000-10-10', 1235469, 'Volley'),
(195843, 'Konstantinos Papadopoulos', 'Andras', '2023-01-10', '2009-02-18', 2359487, 'Kolymvish'),
(195844, 'Eleni Mitsou', 'Gynaika', '2023-02-15', '2007-07-23', 2359487, 'Kolymvish');

INSERT INTO AGWNAS
VALUES 
(1234, 'Podosfairo','Xeimerino', 2023, '2023-05-01', '15:00:00', 'nikh', 'filiko', 'edra'),
(2434,'Basket','Xeimerino', 2022, '2022-10-12', '17:00:00', 'htta', 'filiko', 'edra'),
(3344, 'Tennis','Earino', 2022, '2022-03-23', '12:00:00', 'nikh', 'agwnistiko', 'ektos edras'),
(3476, 'Volley','Xeimerino', 2021, '2021-11-01', '18:00:00', 'nikh', 'filiko', 'edra'),
(3477, 'Kolymvish','Xeimerino', 2022, '2022-10-01', '11:30:00', 'nikh', 'filiko', 'edra'),
(3478, 'Podosfairo','Earino', 2022, '2022-05-14', '16:00:00', 'htta', 'agwnistiko', 'ektos edras'),
(3479, 'Basket','Earino', 2022, '2022-05-02', '17:00:00', 'nikh', 'filiko', 'edra'),
(3480, 'Tennis','Earino', 2022, '2022-04-03', '18:00:00', 'htta', 'agwnistiko', 'edra'),
(3481, 'Volley','Xeimerino', 2021, '2021-02-04', '19:00:00', 'nikh', 'filiko', 'edra'),
(3482, 'Kolymvish','Xeimerino', 2023, '2023-11-24', '20:00:00', 'htta', 'agwnistiko', 'ektos edras'),
(3483, 'Podosfairo','Earino', 2022, '2022-06-06', '14:00:00', 'nikh', 'filiko', 'edra'),
(3484, 'Basket','Earino', 2021, '2023-07-07', '16:30:00', 'htta', 'agwnistiko', 'ektos edras'),
(3485, 'Tennis','Xeimerino', 2023, '2023-12-08', '10:00:00', 'nikh', 'filiko', 'edra');

INSERT INTO PROPONHSH
VALUES 
(1001, '19:00:00', 'Tetarti', 60),
(2002, '16:30:00', 'Paraskeui', 90),
(3003, '14:50:00', 'Triti', 120),
(4004, '16:00:00', 'Deutera', 90),
(4059, '17:30:00', 'Deutera', 90),
(5005, '18:00:00', 'Pempti', 60),
(6006, '11:00:00', 'Savvato', 120),
(7007, '12:00:00', 'Savvato', 90),
(8008, '15:00:00', 'Tetarti', 120);

INSERT INTO AGWNES_A8LITI 
VALUES 
(1234,123456),
(1234,133456),
(1234,123462),
(2434,123457),
(3344,123458),
(3476,153457),
(3476,153456),
(3477,195842),
(3483,123459),
(3483,123463),
(3478,123459);

INSERT INTO PROPONHSH_PROPONHTHS
VALUES 
(1001, 1234567), 
(2002, 1234568), 
(3003, 1234569),
(4004,1235469), 
(4059,2359487), 
(5005,1235469),
(6006,1234569),
(7007,1234567),
(8008,2359487);

INSERT INTO TRAUMATISMOS
VALUES 
(123458, '2023-10-10 08:30:00', 'katagma sto xeri', 'epese kai xtypise', 'sovari'),
(123456, '2022-08-05 14:45:00', 'strampouligma astragalou', 'ton esproksan', 'metria'),
(195843, '2022-11-13 18:20:00', 'travigma wmou', 'apotomh kinhsh', 'sovari'),
(195843, '2023-12-13 14:20:00', 'travigma wmou', 'apotomh kinhsh', 'metria'),
(153457, '2023-12-13 14:20:00', 'traumatismos daktylou', 'xtypise thn mpala lathos', 'elafria');


INSERT INTO STATISTIKA
VALUES 
(1234,  90, 50, 'hlios','Asteras Korinthou'),
(2434,  120, 100,NULL,'Aikitoi Xanthis' ),
(3485,90,86,'synefia','Marios Karathanasis'),
(3344, 60, 42, 'psixala', 'Giannis Papadopoulos'),
(3479,120,103,NULL,'Phgasos Viotias');

