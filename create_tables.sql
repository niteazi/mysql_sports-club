CREATE TABLE `PROPONHTHS` (
  `kwdikos` int(7) NOT NULL,
  `onomateponymo` varchar(40) NOT NULL,
  `etiypiresias` int(2) NOT NULL,
  `amivi` float NOT NULL,
  PRIMARY KEY (`kwdikos`)
);

CREATE TABLE `A8LITIS` (
  `aem` int(6) NOT NULL PRIMARY KEY,
  `onomateponymo` varchar(40) NOT NULL,
  `fylo` varchar(10) NOT NULL CHECK (fylo in ('Andras', 'Gynaika')),
  `hmerominia_eggrafis` date NOT NULL,
  `kwdikos` int(7) NOT NULL,
  FOREIGN KEY (`kwdikos`) REFERENCES PROPONHTHS(`kwdikos`) --foreign key references the primary key of Proponhths
);




CREATE TABLE `PROPONHSH` (
  `kwdikos` int(4) NOT NULL,
  `wra_dieksagwghs` TIME NOT NULL,
  `hmera_dieksagwghs` VARCHAR(10) NOT NULL,
  `diarkeia_se_lepta` int(3) NOT NULL,
  PRIMARY KEY (`kwdikos`)
);

--sxesh many-to-many so it needs a joining table https://www.youtube.com/watch?v=1eUn6lsZ7c4
CREATE TABLE `PROPONHSH_PROPONHTHS` (
  `proponhsh_kwdikos` int(4) NOT NULL,
  `proponhtes_kwdikos` int(7) NOT NULL,
  PRIMARY KEY (`proponhsh_kwdikos`, `proponhtes_kwdikos`), --creates a composite primary key,it uses the combination of two or more columns to uniquely identify each row in the table.
  FOREIGN KEY (`proponhsh_kwdikos`) REFERENCES `PROPONHSH`(`kwdikos`),
  FOREIGN KEY (`proponhtes_kwdikos`) REFERENCES `PROPONHTHS`(`kwdikos`)
);