DROP DATABASE IF EXISTS sports_club;
CREATE DATABASE if NOT EXISTS sports_club;

--drop TABLES
DROP TABLE IF EXISTS `EGKATASTASEIS`;
DROP TABLE IF EXISTS `SEASON`;
DROP TABLE IF EXISTS `ATHLIMA`;
DROP TABLE IF EXISTS `A8LITIS`;
DROP TABLE IF EXISTS `PROPONHSEIS_ATHLITI`;

--CREATE TABLES

CREATE TABLE IF NOT EXISTS `EGKATASTASEIS` (
  `kwdikos_egkatastashs` int(3) NOT NULL,
  `typos_gypedou` varchar(25) NOT NULL,
  `xwrhtikothta`  int NOT NULL,
  PRIMARY KEY (`kwdikos_egkatastashs`)
);

CREATE TABLE IF NOT EXISTS `SEASON` (
  `ID_season` int(6) NOT NULL,
  `etos` int(4) NOT NULL,
  `synolo_agwnwn` int(4) NOT NULL,
  `synolo_nikwn` int(3) NOT NULL,
  `synolo_httwn` int(3) NOT NULL,
  PRIMARY KEY (`ID_season`)
);

CREATE TABLE IF NOT EXISTS `ATHLIMA` (
  `onoma_athlimatos`  varchar(25) NOT NULL,
   `tropos_paixnidiou` varchar(10) NOT NULL CHECK (tropos_paixnidiou in ('omadiko', 'atomiko')),
  `exoplismos` int(4),
  `kwdikos_egkatastashs` int(3) NOT NULL,
  PRIMARY KEY (`onoma_athlimatos`),
  FOREIGN KEY (kwdikos_egkatastashs) REFERENCES EGKATASTASEIS(kwdikos_egkatastashs)
);

CREATE TABLE if not exists `PROPONHTHS` (
  `kwdikos_proponhth` int(7) NOT NULL,
  `onomateponymo` varchar(40) NOT NULL,
  `etiypiresias` int(2) NOT NULL,
  `amivi` float NOT NULL,
  `thlefwno_epikoinwnias` VARCHAR(10) NOT NULL,
  UNIQUE (thlefwno_epikoinwnias),
  PRIMARY KEY (`kwdikos_proponhth`)
);

CREATE TABLE IF NOT EXISTS `A8LITIS` (
  `aem_athliti` INT(6) NOT NULL,
  `onomateponymo` VARCHAR(40) NOT NULL,
  `fylo` VARCHAR(10) NOT NULL CHECK (fylo IN ('Andras', 'Gynaika')),
  `hmerominia_eggrafis` DATE NOT NULL,
  `hmerominia_gennhshs` DATE NOT NULL,
  `kwdikos_proponhth` INT(7) NOT NULL,
  `athlima` VARCHAR(25) NOT NULL,
  FOREIGN KEY (`kwdikos_proponhth`) REFERENCES `PROPONHTHS`(`kwdikos_proponhth`),
  FOREIGN KEY (`athlima`) REFERENCES `ATHLIMA`(`onoma_athlimatos`),
  PRIMARY KEY (`aem_athliti`)
);

CREATE TABLE if not exists `PROPONHSH` (
  `kwdikos_proponhshs` int(4) NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `hmera_dieksagwghs` VARCHAR(10) NOT NULL,
  `diarkeia_se_lepta` int(3) NOT NULL,
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
