<?php
include 'connect.php';

// Λήψη των τιμών POST
$kwdikos_agwna = $_POST['kwdikos_agwna'];

// Σύνταξη εντολής SQL για διαγραφή δεδομένων
$qry = "DELETE FROM statistika WHERE kwdikos_agwna=".$kwdikos_agwna;
// Εκτέλεση εντολής
$qryexe = mysqli_query($conne, $qry);

if ($qryexe) {
    echo "Η διαγραφή έγινε με επιτυχία";
}
 else {
    echo "Σφάλμα κατά τη διαγραφή: " . mysqli_error($conne);
}
   
?>