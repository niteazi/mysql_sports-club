<?php
//συμπεριλαμβάνουμε το connect file 
include 'connect.php';

// Λήψη των τιμών POST
$aem_athliti = $_POST['aem_athliti'];

$checkA8litisQuery = "SELECT * FROM a8litis WHERE aem_athliti = '$aem_athliti'";
$resultA8litis = mysqli_query($conne, $checkA8litisQuery);

if(mysqli_num_rows($resultA8litis) == 0) {
    echo "Δεν υπάρχει εγγραφή με ΑΕΜ $aem_athliti.";
}
else 
{
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
}

echo "<br><button onclick=\"location.href='delete_athlete.html';\"> Επιστροφή </button>";

?>