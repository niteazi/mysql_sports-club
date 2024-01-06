--^ ερώτημα 4

--πληροφορίες κάθε αθλητή που το όνομά του ξεκινάει με Σ
SELECT * FROM A8LITIS
WHERE onomateponymo LIKE 'Σ%';

--πληροφορίες κάθε προπονητή που η αμοιβή του είναι άνω των 900. Αύξουσα σειρά
SELECT * FROM PROPONHTHS
WHERE amivi > 900
ORDER BY amivi ASC;

--πληροφορίες κάθε φιλικού αγώνα με αποτέλεσμα νίκη
SELECT * FROM AGWNAS
WHERE apotelesma = 'νίκη' AND eidos_match = 'φιλικό';

-- πληροφορίες κάθε αγώνα που είχε αποτέλεσμα νίκη και ήταν φιλικός ή ο αγώνας με κωδικό 1234
SELECT * FROM AGWNAS
WHERE apotelesma = 'νίκη' AND (eidos_match = 'φιλικό' OR kwdikos_agwna = 1234);

-- πληροφορίες κάθε αγώνα που είχε αποτέλεσμα νίκη και ήταν αγωνιστικός ή ο αγώνας με κωδικό 1234
SELECT * FROM AGWNAS
WHERE apotelesma = 'νίκη' AND (eidos_match = 'αγωνιστικό' OR kwdikos_agwna = 1234);


--^ ερώτημα 5

--σε πόσους αγώνες έχει συμμετάσχει κάθε αθλητής που έχει λάβει μέρος σε αγώνα τουλάχιστον 1 φορά
SELECT A8LITIS.aem_athliti,
A8LITIS.onomateponymo, 
A8LITIS.athlima, 
COUNT(AGWNES_A8LITI.kwdikos_agwna) AS NumberOfMatches
FROM A8LITIS
JOIN AGWNES_A8LITI ON A8LITIS.aem_athliti = AGWNES_A8LITI.aem_athliti
GROUP BY A8LITIS.aem_athliti, A8LITIS.onomateponymo, A8LITIS.athlima;


--ο αγώνας με το μεγαλύτερο αριθμό θεατών ανά άθλημα
SELECT AGWNAS.athlima, 
MAX(STATISTIKA.arithmos_theatwn) AS MaxTheatwn
FROM STATISTIKA
JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
GROUP BY AGWNAS.athlima;


--^ ερώτημα 6 

--INNER join,εμφάνιση αθλητών που έχουν τραυματιστεί, τι άθλημα κάνουν και το τύπο τραυματισμού
SELECT 
A8LITIS.aem_athliti, 
A8LITIS.onomateponymo , 
A8LITIS.athlima, 
TRAUMATISMOS.hmeromhnia , 
TRAUMATISMOS.typos_traumatismou
FROM A8LITIS
INNER JOIN TRAUMATISMOS ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;

--LEFT join, εμφάνιση όλων των αθλητών ανεξαρτήτως αν έχουν τραυματιστεί ή όχι
SELECT 
A8LITIS.aem_athliti, 
A8LITIS.onomateponymo, 
A8LITIS.athlima, 
TRAUMATISMOS.hmeromhnia, 
TRAUMATISMOS.typos_traumatismou
FROM A8LITIS
LEFT JOIN TRAUMATISMOS ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;



--^ ερώτημα 7

-- Δημιουργία Όψης (View) με τα στοιχεία των Αθλητών, προπονήσεων και τα στοιχεία των Προπονητών
--Χρησιμοποιούμε τον πίνακα PROPONHSH_PROPONHTHS για να πάρουμε τον κωδικό προπόνησης για κάθε προπονητή
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
--LEFT JOIN είναι για να εμφανιζεται ακόμη και αν δεν εχει στατιστικα..απλο join ειναι για να εμφανίζεται μονο αν εχει και στους 2 πινακες
--LEFT JOIN = δεξι μερος xwris αριστερό μερος  = αγωνας χωρις στατιστικα = δεξι μερος null
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

--^ ερώτημα 8
--εμφάνιση όλων των πινάκων ταυτόχρονα
DELIMITER //
CREATE PROCEDURE ViewAll()  
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


--^ ερώτημα 9 

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

