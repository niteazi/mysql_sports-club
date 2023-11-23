-- drop/create Database
DROP DATABASE IF EXISTS sports_club;
CREATE DATABASE IF NOT EXISTS sports_club;

--drop TABLES
DROP TABLE IF EXISTS `STATISTIKA`;
DROP TABLE IF EXISTS `TRAUMATISMOS`;
DROP TABLE IF EXISTS `PROPONHSH_PROPONHTHS`;
DROP TABLE IF EXISTS `AGWNES_ATHLITI`;
DROP TABLE IF EXISTS `PROPONHSEIS_ATHLITI`;
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
  `tropos_paixnidiou` ENUM('omadiko', 'atomiko') NOT NULL ,
  `exoplismos` TINYTEXT,
  PRIMARY KEY (`onoma_athlimatos`)
);

CREATE TABLE IF NOT EXISTS `EGKATASTASEIS` (
  `kwdikos_egkatastashs` int(3)  NOT NULL,
  `onoma egkatastashs` varchar(25) NOT NULL,
  `onoma_athlimatos` varchar(25) NOT NULL,
  `typos_gypedou` varchar(25) NOT NULL,
  `xwrhtikothta`  INT(4) NOT NULL,
  PRIMARY KEY (`kwdikos_egkatastashs`),
  foreign key (`onoma_athlimatos`) references `A8LIMA`(`onoma_athlimatos`)
);

CREATE TABLE IF NOT EXISTS `SEASON` (
  `epoxh` VARCHAR(20) NOT NULL,
  `etos` int(4) NOT NULL,
  `synolo_agwnwn` int(4) NOT NULL,
  `synolo_nikwn` int(3) NOT NULL,
  `synolo_httwn` int(3) NOT NULL,
  PRIMARY KEY (epoxh, etos)
);


CREATE TABLE if not exists `PROPONHTHS` (
  `kwdikos_proponhth` VARCHAR(7) NOT NULL,
  `athlima` VARCHAR(25) NOT NULL,
  `onomateponymo`  VARCHAR(40) NOT NULL,
  `etiypiresias` int(2) NOT NULL,
  `amivi` float NOT NULL,
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`),
  PRIMARY KEY (`kwdikos_proponhth`)
);

CREATE TABLE IF NOT EXISTS `A8LITIS` (
  `aem_athliti` INT(6) NOT NULL,
  `onomateponymo` VARCHAR(40) NOT NULL,
  `fylo` ENUM('Andras', 'Gynaika') NOT NULL,
  `hmerominia_eggrafis` DATE NOT NULL,
  `hmerominia_gennhshs` DATE NOT NULL,
  `kwdikos_proponhth` INT(7) NOT NULL,
  `athlima` VARCHAR(25) NOT NULL,
  FOREIGN KEY (`kwdikos_proponhth`) REFERENCES `PROPONHTHS`(`kwdikos_proponhth`),
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`),
  PRIMARY KEY (`aem_athliti`)
);
CREATE TABLE IF NOT EXISTS `AGWNAS` (
  `kwdikos_agwna` INT(4) NOT NULL,
  `athlima` VARCHAR(25) NOT NULL,
  `epoxh_season` VARCHAR(20) NOT NULL,
  `etos_season` INT(4) NOT NULL,
  `hmeromhnia_dieksagwghs` DATE NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `apotelesma` VARCHAR(40) NOT NULL,
  `eidos_match` ENUM('filiko', 'agwnistiko') NOT NULL,
  `topothesia` ENUM('edra','ektos edras') NOT NULL,
  PRIMARY KEY (`kwdikos_agwna`),
  FOREIGN KEY (`epoxh_season`, `etos_season`) REFERENCES `SEASON` (`epoxh`, `etos`),
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`)
);


CREATE TABLE if not exists `PROPONHSH` (
  `kwdikos_proponhshs` int(4) NOT NULL,
  `athlima` VARCHAR(25) NOT NULL,
  `kwdikos_egkatastashs` int(3) NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `hmera_dieksagwghs` VARCHAR(10) NOT NULL,
  `diarkeia_se_lepta` int(3) NOT NULL,
  FOREIGN KEY (`athlima`) REFERENCES `A8LIMA`(`onoma_athlimatos`),
  FOREIGN KEY (`kwdikos_egkatastashs`) REFERENCES `EGKATASTASEIS`(`kwdikos_egkatastashs`),
  PRIMARY KEY (`kwdikos_proponhshs`)
);

--N:M pinakas athliti kai proponhseis
CREATE TABLE if not exists `PROPONHSEIS_ATHLITI` (
  `aem_athliti` int(6) NOT NULL,
  `kwdikos_proponhshs` int(4) NOT NULL,
  PRIMARY KEY (`aem_athliti`, `kwdikos_proponhshs`),
  FOREIGN KEY (`aem_athliti`) REFERENCES `A8LITIS`(`aem_athliti`),
  FOREIGN KEY (`kwdikos_proponhshs`) REFERENCES `PROPONHSH`(`kwdikos_proponhshs`)
);

--N:M pinakas athliti kai agwnas
CREATE TABLE if not exists `AGWNES_ATHLITI` (
  `aem_athliti` int(6) NOT NULL,
  `kwdikos_agwna` int(4) NOT NULL,
  PRIMARY KEY (`aem_athliti`, `kwdikos_agwna`),
  FOREIGN KEY (`aem_athliti`) REFERENCES `A8LITIS`(`aem_athliti`),
  FOREIGN KEY (`kwdikos_agwna`) REFERENCES `AGWNAS`(`kwdikos_agwna`)
);

--N:M pinakas proponhsh kai proponhths
CREATE TABLE if not exists `PROPONHSH_PROPONHTHS` (
  `proponhsh_kwdikos` int(4) NOT NULL,
  `proponhtes_kwdikos` int(7) NOT NULL,
  PRIMARY KEY (`proponhsh_kwdikos`, `proponhtes_kwdikos`),
  FOREIGN KEY (`proponhsh_kwdikos`) REFERENCES `PROPONHSH`(`kwdikos_proponhshs`),
  FOREIGN KEY (`proponhtes_kwdikos`) REFERENCES `PROPONHTHS`(`kwdikos_proponhth`)
);

--weak entity table
 
  CREATE TABLE IF NOT EXISTS `TRAUMATISMOS` (
  `trauma_id` INT(5),
  `aem_athliti` INT(6) NOT NULL,
  `hmeromhnia` DATE NOT NULL,
  `typos_traumatismou` VARCHAR(30) NOT NULL,
  `anafora_symvantos` TEXT,
  `sovarotita` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`aem_athliti`, `trauma_id`),
  FOREIGN KEY (`aem_athliti`) REFERENCES `A8LITIS`(`aem_athliti`) ON DELETE CASCADE
);

--g n mporei n mpei sta statistika to apotelesma tou agwna
--CREATE INDEX idx_agwnas_apotelesma ON AGWNAS(apotelesma);
  --`apotelesma` VARCHAR(255) NOT NULL,
  --FOREIGN KEY (`apotelesma`) REFERENCES `AGWNAS`(`apotelesma`),


--1:1 me agwna
CREATE TABLE IF NOT EXISTS `STATISTIKA` (
  `kwdikos_agwna` INT(4) NOT NULL,
  `diarkeia_se_lepta` INT(3) NOT NULL,
  `arithmos_theatwn` INT(5) NOT NULL,
  `kairikes_synthikes` VARCHAR(30),
  `antipalos` VARCHAR(30),
  PRIMARY KEY (`kwdikos_agwna`),
  FOREIGN KEY (`kwdikos_agwna`) REFERENCES `AGWNAS`(`kwdikos_agwna`),
  UNIQUE (`kwdikos_agwna`)
);



--INSERT VALUES

INSERT INTO EGKATASTASEIS
VALUES 
(123,'ghpedo podosfairou', 'kleisto', 200),
(128,'ghpedo basket', 'kleisto', 200),
(173,'ghpedo tennis', 'anoixto', 100);


INSERT INTO SEASON
VALUES 
('Anoiksi',2022, 20, 15,5),
('Ftinoporo',2022, 15, 10,5),
('Anoiksi',2021, 10, 5,5);


INSERT INTO A8LIMA
VALUES 
('Podosfairo', 'omadiko', 'mpala', 123),
('Basket', 'omadiko', 'mpala', 128),
('Tennis', 'atomiko', 'raketes', 173);

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
(1234, 'Podosfairo','Anoiksi', 2022, '2022-05-01', '15:00:00', 'nikh', 'filiko', 'ghpedo podosfairou'),
(2434,'Basket','Anoiksi', 2022, '2021-12-12', '17:00:00', 'htta', 'filiko', 'ghpedo Asteras '),
(3344, 'Tennis','Anoiksi', 2022, '2022-03-23', '12:00:00', 'nikh', 'antagwnistiko', 'ghpedo Phgasos');

INSERT INTO PROPONHSH
VALUES 
(1111, 'Podosfairo', 123, '13:00:00', 'Trith', 90),
(2222, 'Basket', 128, '11:00:00', 'Deutera', 120),
(3333, 'Tennis', 173, '10:00:00', 'Savvato', 60);

INSERT INTO PROPONHSEIS_ATHLITI
VALUES 
(123456, 1111),
(123457, 2222),
(123458, 3333);

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
(12345, 123456, '2023-10-10', 'katagma sto xeri', 'kakos', 'sovaro'),
(23452, 123457, '2022-08-05', 'strampouligma astragalou', 'kakos', 'metrio'),
(32445, 123458, '2022-11-13', 'travigma wmou', 'kakos', 'sovaro');

INSERT INTO STATISTIKA
VALUES 
(1234,  90, 50, 'hlios','Asteras Korinthou'),
(2434,  120, 100,NULL,'Aikitoi Xanthis' ),
(3344, 60, 42, 'psixala', 'Giannis');
