<?php
//συμπεριλαμβάνουμε το connect file 
include 'connect.php';

// Λήψη των τιμών POST
$aem_athliti = $_POST['aem_athliti'];
$onomateponymo = $_POST['onomateponymo'];
$fylo = $_POST['fylo'];
$hmerominia_eggrafis = $_POST['hmerominia_eggrafis'];
$hmerominia_gennhshs = $_POST['hmerominia_gennhshs'];
$kwdikos_proponhth = $_POST['kwdikos_proponhth'];
$athlima = $_POST['athlima'];

// Σύνταξη εντολής SQL για εισαγωγή δεδομένων
$qry = "INSERT INTO a8litis (aem_athliti, onomateponymo, fylo, hmerominia_eggrafis, hmerominia_gennhshs, kwdikos_proponhth, athlima)
    VALUES ('$aem_athliti', '$onomateponymo', '$fylo', '$hmerominia_eggrafis', '$hmerominia_gennhshs', '$kwdikos_proponhth', '$athlima')";


    // Εκτέλεση εντολής
$qryexe = mysqli_query($conne, $qry);

if ($qryexe) {
    echo "Η εγγραφή έγινε με επιτυχία";
}
 else {
    echo "Σφάλμα κατά την εγγραφή: " . mysqli_error($conne);
}
    
    
// Close the database connection
mysqli_close($conne);
?>
