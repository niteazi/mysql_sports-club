-- erothma 6 INNER join
SELECT A8LITIS.aem_athliti, A8LITIS.onomateponymo , A8LITIS.athlima
FROM A8LITIS
INNER JOIN TRAUMATISMOS
ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;

-- erothma 6 LEFT join
SELECT A8LITIS.aem_athliti, A8LITIS.onomateponymo, 
A8LITIS.athlima, TRAUMATISMOS.hmeromhnia, TRAUMATISMOS.typos_traumatismou
FROM A8LITIS
LEFT JOIN TRAUMATISMOS ON A8LITIS.aem_athliti = TRAUMATISMOS.aem_athliti;


--erwthma 9 

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


--erwthma 5

--Count the number of matches for each athlete
SELECT A8LITIS.aem_athliti, A8LITIS.onomateponymo, A8LITIS.athlima, COUNT(AGWNES_A8LITI.kwdikos_agwna) AS NumberOfMatches
FROM A8LITIS
JOIN AGWNES_A8LITI ON A8LITIS.aem_athliti = AGWNES_A8LITI.aem_athliti
GROUP BY A8LITIS.aem_athliti, A8LITIS.onomateponymo, A8LITIS.athlima;


--megalytero arithmo theatwn SE AGWNA g kathe athlima
SELECT AGWNAS.athlima, MAX(STATISTIKA.arithmos_theatwn) AS MaxTheatwn
FROM STATISTIKA
JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
GROUP BY AGWNAS.athlima;
--TO IDIO ALLA EMFANIZEI K TON KWDIKO AGNWA
SELECT AGWNAS.athlima, STATISTIKA.kwdikos_agwna, STATISTIKA.arithmos_theatwn AS MaxTheatwn
FROM STATISTIKA
JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
WHERE (AGWNAS.athlima, STATISTIKA.arithmos_theatwn) IN (
  SELECT athlima, MAX(arithmos_theatwn)
  FROM STATISTIKA
  JOIN AGWNAS ON STATISTIKA.kwdikos_agwna = AGWNAS.kwdikos_agwna
  GROUP BY athlima
);



--erwthma 7


-- Δημιουργία Όψης (View) με τα στοιχεία των Αθλητών, προπονήσεων και τα στοιχεία των Προπονητών
CREATE VIEW v_PROPONHSH_PROPONHTHS_A8LITIS AS
SELECT
    A.aem_athliti,
    A.onomateponymo AS onoma_athliti,
    PR.kwdikos_proponhshs,
    PT.athlima AS athlima,
    PR.hmera_dieksagwghs,
    PR.wra_dieksagwghs,
    PR.diarkeia_se_lepta,
    PT.kwdikos_proponhth,
    PT.onomateponymo AS onomateponymo_proponhth
FROM
    PROPONHSH PR
JOIN PROPONHSH_PROPONHTHS PP ON PR.kwdikos_proponhshs = PP.proponhsh_kwdikos
JOIN PROPONHTHS PT ON PP.proponhtes_kwdikos = PT.kwdikos_proponhth
JOIN A8LITIS A ON PT.kwdikos_proponhth = A.kwdikos_proponhth
ORDER BY A.aem_athliti;

--sezon (etos epoxh ) kwdikos agwna athlima apotelesma antipalos
--left join einai gia na emfanizetai kai an den exei statistika..aplo join einai gia na emfanizetai mono an exei yparxoun k stous 2 pinakes
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

-- Διαγραφή της Όψης
DROP VIEW IF EXISTS v_PROPONHSH_PROPONHTHS_A8LITIS;
DROP VIEW IF EXISTS SEASON_AGWNAS_ATHLIMA_APOTELESMA_ANTIPALOS;
-- Ερώτημα για την εμφάνιση όλων των δεδομένων της Όψης
SELECT * FROM v_PROPONHSH_PROPONHTHS_A8LITIS;
SELECT * FROM SEASON_AGWNAS_ATHLIMA_APOTELESMA_ANTIPALOS;