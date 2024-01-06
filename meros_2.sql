--TODO erwthma 4

--4a, πληροφορίες κάθε αθλητή που το όνομά του ξεκινάει με Σ
SELECT * FROM A8LITIS
WHERE onomateponymo LIKE 'Σ%';

--4b, πληροφορίες κάθε προπονητή που η αμοιβή του είναι άνω των 900. Αύξουσα σειρά
SELECT * FROM PROPONHTHS
WHERE amivi > 900
ORDER BY amivi ASC;

--4c, every detail from friendly matches where we won 
SELECT * FROM AGWNAS
WHERE apotelesma = 'nikh' AND eidos_match = 'filiko';

-- every detail from matches where we won and it was either a friendly match or the match 1234
SELECT * FROM AGWNAS
WHERE apotelesma = 'nikh' AND (eidos_match = 'filiko' OR kwdikos_agwna = 1234);

-- every detail from matches where we won and it was either a competitive match or the match 1234
SELECT * FROM AGWNAS
WHERE apotelesma = 'nikh' AND (eidos_match = 'agwnistiko' OR kwdikos_agwna = 1234);


--^ erwthma 5

--Count the number of matches for each athlete
SELECT A8LITIS.aem_athliti,
A8LITIS.onomateponymo, 
A8LITIS.athlima, 
COUNT(AGWNES_A8LITI.kwdikos_agwna) AS NumberOfMatches
FROM A8LITIS
JOIN AGWNES_A8LITI ON A8LITIS.aem_athliti = AGWNES_A8LITI.aem_athliti
GROUP BY A8LITIS.aem_athliti, A8LITIS.onomateponymo, A8LITIS.athlima;


--megalytero arithmo theatwn SE AGWNA g kathe athlima
SELECT AGWNAS.athlima, 
MAX(STATISTIKA.arithmos_theatwn) AS MaxTheatwn
FROM STATISTIKA
JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
GROUP BY AGWNAS.athlima;
--TO IDIO ALLA EMFANIZEI K TON KWDIKO AGNWA
SELECT AGWNAS.athlima, 
STATISTIKA.kwdikos_agwna, 
STATISTIKA.arithmos_theatwn AS MaxTheatwn
FROM STATISTIKA
JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
WHERE (AGWNAS.athlima, STATISTIKA.arithmos_theatwn) IN (
  SELECT athlima, MAX(arithmos_theatwn)
  FROM STATISTIKA
  JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
  GROUP BY athlima
);

-- 5 min

SELECT SEASON.epoxh, SEASON.etos, MAX(SEASON.synolo_nikwn) AS MaxWins
FROM SEASON
GROUP BY SEASON.epoxh, SEASON.etos;

--^ erothma 6 

--INNER join αθλητών που έχουν τραυματιστεί, τι άθλημα κάνουν και το τύπο τραυματισμού
SELECT A8LITIS.aem_athliti, A8LITIS.onomateponymo , A8LITIS.athlima, TRAUMATISMOS.hmeromhnia , TRAUMATISMOS.typos_traumatismou
FROM A8LITIS
INNER JOIN TRAUMATISMOS ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;

--LEFT join εμφάνιση όλων των αθλητών ανεξαρτήτως αν έχουν τραυματιστεί ή όχι
SELECT A8LITIS.aem_athliti, A8LITIS.onomateponymo, 
A8LITIS.athlima, TRAUMATISMOS.hmeromhnia, TRAUMATISMOS.typos_traumatismou
FROM A8LITIS
LEFT JOIN TRAUMATISMOS ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;



--^ erwthma 7

-- Δημιουργία Όψης (View) με τα στοιχεία των Αθλητών, προπονήσεων και τα στοιχεία των Προπονητών
--PROPONHSH_PROPONHTHS pinakas g n paroume ton kwdiko proponhsewn g kathe proponhth
CREATE VIEW PROPONHSH_PROPONHTHS_A8LITIS AS
SELECT
    PR.kwdikos_proponhshs AS 'Κωδικός Προπόνησης',
    PT.athlima AS 'Άθλημα',
    ATHL.onomateponymo AS 'Ονοματεπώνυμο Αθλητή',
    PT.onomateponymo AS 'Ονοματεπώνυμο Προπονητή',
    PR.hmera_dieksagwghs AS 'Ημέρα Διεξαγωγής',
    PR.wra_dieksagwghs AS 'Ώρα Διεξαγωγής',
    PR.diarkeia_se_lepta AS 'Διάρκεια σε λεπτά'
FROM
    PROPONHSH PR,
    PROPONHSH_PROPONHTHS PP,
    PROPONHTHS PT,
    A8LITIS ATHL
WHERE
    PR.kwdikos_proponhshs = PP.proponhsh_kwdikos
    AND PP.proponhtes_kwdikos = PT.kwdikos_proponhth
    AND PT.kwdikos_proponhth = ATHL.kwdikos_proponhth
ORDER BY ATHL.aem_athliti;

-- Δημιουργία Όψης (View) με το κάθε αγώνα μαζί με το άθλημά του, την σεζόν,τον αντίπαλο και το αποτέλεσμα
--left join einai gia na emfanizetai kai an den exei statistika..aplo join einai gia na emfanizetai mono an exei yparxoun k stous 2 pinakes
--left join = deksi meros xwris aristero meros = agwnas xwris statistika = aristero meros null
CREATE VIEW SEASON_AGWNAS_ATHLIMA_APOTELESMA_ANTIPALOS AS
SELECT 
    CONCAT(SE.epoxh, ' ', SE.etos) AS 'Σεζόν', 
    AG.kwdikos_agwna AS 'Κωδικός Αγώνα', 
    ATH.onoma_athlimatos AS 'Αθλήμα', 
    AG.apotelesma AS 'Αποτέλεσμα', 
    ST.antipalos AS 'Αντίπαλος'
FROM AGWNAS AG
JOIN SEASON SE ON AG.epoxh = SE.epoxh AND AG.etos = SE.etos
JOIN A8LIMA ATH ON AG.athlima = ATH.onoma_athlimatos
LEFT JOIN STATISTIKA ST ON AG.kwdikos_agwna = ST.kwdikos_agwna
ORDER BY SE.etos, SE.epoxh, AG.kwdikos_agwna;

-- Διαγραφή Όψεων (View)
DROP VIEW IF EXISTS PROPONHSH_PROPONHTHS_A8LITIS;
DROP VIEW IF EXISTS SEASON_AGWNAS_ATHLIMA_APOTELESMA_ANTIPALOS;
-- Ερώτημα για την εμφάνιση όλων των δεδομένων των Οψεων (View)
SELECT * FROM PROPONHSH_PROPONHTHS_A8LITIS;
SELECT * FROM SEASON_AGWNAS_ATHLIMA_APOTELESMA_ANTIPALOS;

--^ erwthma 8

DELIMITER //
CREATE PROCEDURE ViewAll()  -- TO PROCEDURE ΣΩΖΕΙ ΧΡΟΝΟ, ΑΝΤΙ ΝΑ ΤΑ ΓΡΑΦΩ ΟΛΑ ΞΑΝΑ ΑΠΛΟΣ ΤΟ ΚΑΛΩ 
BEGIN
    SELECT * FROM A8LITIS;
    SELECT * FROM A8LIMA;
    SELECT * FROM PROPONHTHS;
    SELECT * FROM PROPONHSH;
    SELECT * FROM AGWNAS;
    SELECT * FROM SEASON;
    SELECT * FROM EGKATASTASEIS;
    SELECT * FROM STATISTIKA;
    SELECT * FROM TRAUMATISMOS;
END //
DELIMITER ;  -- Reverting back to ;

CALL ViewAll();


--^ erwthma 9 

CREATE TABLE TRIGGER_TABLE (  
    MESSAGE VARCHAR(100)
); -- Δημιουργω νεο πινακα για τα μυνηματα του Trigger

DELIMITER //
CREATE TRIGGER myTrigger BEFORE INSERT ON TRAUMATISMOS
FOR EACH ROW  
BEGIN         
    IF NEW.typos_traumatismou = 'σοβαρή' THEN
        INSERT INTO TRIGGER_TABLE VALUES('CALL AN AMBULANCE');
    ELSEIF NEW.typos_traumatismou = 'μέτρια' THEN
        INSERT INTO TRIGGER_TABLE VALUES('CALL A DOCTOR');
    ELSE
        INSERT INTO TRIGGER_TABLE VALUES('NOT CONCERNING');
    END IF;
END //
DELIMITER ;

INSERT INTO TRAUMATISMOS VALUES
(153457, '2023-12-05 16:30:00', 'κάταγμα στο χέρι', 'έπεσε και χτύπησε', 'σοβαρή');

SELECT * FROM TRIGGER_TABLE;

DROP TRIGGER IF EXISTS myTrigger;

