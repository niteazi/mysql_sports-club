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