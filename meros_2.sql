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


-- Δημιουργία Όψης (View) με τα στοιχεία των Αθλητών και των Αγώνων που έχουν συμμετάσχει
CREATE VIEW v_A8LITIS_AGWNAS AS
SELECT
    A8LITIS.aem_athliti,
    A8LITIS.onomateponymo AS onoma_athliti,
    A8LITIS.fylo,
    AGWNAS.kwdikos_agwna,
    AGWNAS.athlima AS onoma_athlimatos,
    AGWNAS.epoxh_season,
    AGWNAS.etos,
    AGWNAS.hmeromhnia_dieksagwghs,
    AGWNAS.wra_dieksagwghs
FROM
    A8LITIS
JOIN AGWNAS ON A8LITIS.athlima = AGWNAS.athlima;

-- Διαγραφή της Όψης
DROP VIEW IF EXISTS v_A8LITIS_AGWNAS;

-- Ερώτημα για την εμφάνιση όλων των δεδομένων της Όψης
SELECT * FROM v_A8LITIS_AGWNAS;
