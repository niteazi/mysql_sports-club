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


-- Διαγραφή της Όψης
DROP VIEW IF EXISTS v_PROPONHSH_PROPONHTHS_A8LITIS;

-- Ερώτημα για την εμφάνιση όλων των δεδομένων της Όψης
SELECT * FROM v_PROPONHSH_PROPONHTHS_A8LITIS;
