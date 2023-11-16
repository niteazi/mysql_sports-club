DROP DATABASE IF EXISTS sports_club;
CREATE DATABASE if NOT EXISTS sports_club;

--drop TABLE
DROP TABLE IF EXISTS `a8litis`;
DROP TABLE IF EXISTS `proponhsh_proponhths`; --prepei panw apo proponhsh proponhths gt apoteleitai apo auta? bgazei error alliws
DROP TABLE IF EXISTS `proponhsh`;

DROP TABLE IF EXISTS `proponhths`;

--CREATE TABLES

CREATE TABLE IF NOT EXISTS `EGKATASTASEIS` (
  `kwdikos` int(3) NOT NULL,
  `typos_gypedou` varchar(25) NOT NULL,
  `xwrhtikothta`  int NOT NULL,
  PRIMARY KEY (`kwdikos`)
);

CREATE TABLE IF NOT EXISTS `SEASON` (
  `ID` int(6) NOT NULL,
  `etos` int(4) NOT NULL,
  `synolo_agwnwn` int(4) NOT NULL,
  `synolo_nikwn` int(3) NOT NULL,
  `synolo_httwn` int(3) NOT NULL,
  PRIMARY KEY (`ID`)
);