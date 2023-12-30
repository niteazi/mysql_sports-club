<?php
//συμπεριλαμβάνουμε το connect file 
include 'connect.php';

// Λήψη των τιμών POST
$aem_athliti = $_POST['aem_athliti'];

// Σύνταξη εντολής SQL για διαγραφή δεδομένων
$qry = "DELETE FROM a8litis WHERE aem_athliti=".$aem_athliti;
// Εκτέλεση εντολής
$qryexe = mysqli_query($conne, $qry);

if ($qryexe) {
    echo "Η διαγραφή έγινε με επιτυχία";
}
 else {
    echo "Σφάλμα κατά τη διαγραφή: " . mysqli_error($conne);
}
   
?>