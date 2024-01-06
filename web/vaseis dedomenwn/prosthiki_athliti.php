<?php
// Σύνδεση με τη βάση δεδομένων
include 'connect.php';

// Λήψη των τιμών POST
$aem_athliti = $_POST['aem_athliti'];
$onomateponymo = $_POST['onomateponymo'];
$fylo = $_POST['fylo'];
$hmerominia_eggrafis = $_POST['hmerominia_eggrafis'];
$hmerominia_gennhshs = $_POST['hmerominia_gennhshs'];
$kwdikos_proponhth = $_POST['kwdikos_proponhth'];

// τσεκάρουμε αν υπάρχει ήδη αθλητής με το ΑΕΜ που δώσαμε
$checkA8litisQuery = "SELECT * FROM a8litis WHERE aem_athliti = '$aem_athliti'";
$resultA8litis = mysqli_query($conne, $checkA8litisQuery);

// Λήψη του τύπου αθλήματος (proponitis_athlima) από τον πίνακα "proponitis"
$proponitisQuery = "SELECT athlima FROM proponhths WHERE kwdikos_proponhth = '$kwdikos_proponhth'";
$resultProponitis = mysqli_query($conne, $proponitisQuery);

if(mysqli_num_rows($resultA8litis) > 0) {
    echo "Υπάρχει ήδη εγγραφή με ΑΕΜ $aem_athliti.";
}
 else
  {
    $row = mysqli_fetch_assoc($resultProponitis);
    $proponitis_athlima = $row['athlima'];

    // Εισαγωγή δεδομένων στον πίνακα "a8litis" με τη χρήση του proponitis_athlima
    $insertA8litisQuery = "INSERT INTO a8litis (aem_athliti, onomateponymo, fylo, hmerominia_eggrafis, hmerominia_gennhshs, kwdikos_proponhth, athlima )
                           VALUES ('$aem_athliti', '$onomateponymo', '$fylo', '$hmerominia_eggrafis', '$hmerominia_gennhshs', '$kwdikos_proponhth', '$proponitis_athlima')";

    $resultInsertA8litis = mysqli_query($conne, $insertA8litisQuery);

    if ($resultInsertA8litis) {
        echo "Η εγγραφή έγινε με επιτυχία";
    } else {
        echo "Σφάλμα κατά την εγγραφή: " . mysqli_error($conne);
    }
}

// Κλείσιμο της σύνδεσης με τη βάση δεδομένων
mysqli_close($conne);

echo "<br><button onclick=\"location.href='prosthiki_athliti.html';\"> Επιστροφή </button>";

?>
