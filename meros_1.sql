-- drop/create Database
DROP DATABASE IF EXISTS sports_club;
CREATE DATABASE IF NOT EXISTS sports_club;

USE DATABASE IF EXISTS sports_club;

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
  `epoxh_season` VARCHAR(20) NOT NULL,
  `etos` YEAR NOT NULL,
  `hmeromhnia_dieksagwghs` DATE NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `apotelesma` VARCHAR(40) NOT NULL,
  `eidos_match` VARCHAR(20) NOT NULL CHECK(eidos_match IN ('filiko', 'agwnistiko')),
  `topothesia` VARCHAR(20) NOT NULL CHECK(topothesia IN ('edra','ektos edras')),
  PRIMARY KEY (`kwdikos_agwna`),
  FOREIGN KEY (`epoxh_season`, `etos`) REFERENCES `SEASON` (`epoxh`, `etos`),
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
CREATE TABLE if not exists `AGWNES_ATHLITI` (
  `aem_athliti` int(6) NOT NULL CHECK(aem_athliti BETWEEN 100000 AND 999999) , 
  `kwdikos_agwna` int(4) NOT NULL CHECK(kwdikos_agwna BETWEEN 1000 AND 9999),
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
('Tennis', 'atomiko', 'raketes');

INSERT INTO EGKATASTASEIS
VALUES 
(123,'ghpedo podosfairou','Podosfairo', 'kleisto', 200),
(128,'ghpedo basket','Basket', 'kleisto', 200),
(173,'ghpedo tennis', 'Tennis','anoixto', 100);


INSERT INTO SEASON
VALUES 
('Anoiksi',2022, 20, 15,5),
('Ftinoporo',2022, 15, 10,5),
('Anoiksi',2021, 10, 5,5);


INSERT INTO PROPONHTHS
VALUES
(1234567, 'Podosfairo', 'Giorgos Gkolios', 2, 1000),
(1234568, 'Basket', 'Giannis Kapis', 3, 1100),
(1234569, 'Tennis', 'Xrhstos Dimitriadhs', 1, 900);

INSERT INTO A8LITIS
VALUES 
(123456, 'Dimitris Skourths', 'Andras', '2020-09-01', '2000-01-01', 1234567, 'Podosfairo'),
(123457, 'Orfeas Dedes', 'Andras', '2021-09-05', '2001-05-12', 1234568, 'Basket'),
(123458, 'Iosif Tsannis', 'Andras', '2019-10-10', '2000-03-15', 1234569, 'Tennis');

INSERT INTO AGWNAS
VALUES 
(1234, 'Podosfairo','Anoiksi', 2022, '2022-05-01', '15:00:00', 'nikh', 'filiko', 'edra'),
(2434,'Basket','Anoiksi', 2022, '2021-12-12', '17:00:00', 'htta', 'filiko', 'edra'),
(3344, 'Tennis','Anoiksi', 2022, '2022-03-23', '12:00:00', 'nikh', 'agwnistiko', 'ektos edras');

INSERT INTO PROPONHSH
VALUES 
(1111, '13:00:00', 'Trith', 90),
(2222, '11:00:00', 'Deutera', 120),
(3333, '10:00:00', 'Savvato', 60);


INSERT INTO AGWNES_ATHLITI
VALUES 
(123456, 1234),
(123457, 2434),
(123458, 3344);

INSERT INTO PROPONHSH_PROPONHTHS
VALUES 
(1111, 1234567),
(2222, 1234568),
(3333, 1234569);

INSERT INTO TRAUMATISMOS
VALUES 
(123456, '2023-10-10 08:30:00', 'katagma sto xeri', 'epese kai xtypise', 'sovari'),
(123456, '2022-08-05 14:45:00', 'strampouligma astragalou', 'ton esproksan', 'metria'),
(123456, '2022-11-13 18:20:00', 'travigma wmou', 'apotomh kinhsh', 'sovari');


INSERT INTO STATISTIKA
VALUES 
(1234,  90, 50, 'hlios','Asteras Korinthou'),
(2434,  120, 100,NULL,'Aikitoi Xanthis' ),
(3344, 60, 42, 'psixala', 'Giannis Papadopoulos');



--den exoun mpei values gia pinakes N:M 