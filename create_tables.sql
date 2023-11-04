
CREATE TABLE `A8LITIS` (
  `aem` int(6) NOT NULL,
  `onomateponymo` varchar(40) NOT NULL,
  `fylo` varchar(10) NOT NULL CHECK (fylo in ('Andras', 'Gynaika')),
  `hmerominia_eggrafis` date NOT NULL,
  PRIMARY KEY (`aem`)
);


CREATE TABLE `PROPONHTHS` (
  `kwdikos` int(7) NOT NULL,
  `onomateponymo` varchar(40) NOT NULL,
  `etiypiresias` int(2) NOT NULL,
  `amivi` float NOT NULL,
  PRIMARY KEY (`kwdikos`)
);


CREATE TABLE `PROPONHSH` (
  `kwdikos` int(4) NOT NULL,
  `wra dieksagwghs` TIME NOT NULL,
  `hmera dieksagwghs` VARCHAR(10) NOT NULL,
  `diarkeia se lepta` int(3) NOT NULL,
  PRIMARY KEY (`kwdikos`)
);

