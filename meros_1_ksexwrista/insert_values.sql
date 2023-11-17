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
(1234,  90, 50, 'hlios'),
(2434,  120, 100,NULL ),
(3344, 60, 42, 'psixala');
