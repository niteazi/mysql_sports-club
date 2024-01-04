<?php
//συμπεριλαμβάνουμε το connect file 
include 'connect.php';

// Λήψη των τιμών POST
$kwdikos_agwna =  $_POST['kwdikos_agwna'];
$diarkeia_se_lepta =  $_POST['diarkeia_se_lepta'];
$arithmos_theatwn =  $_POST['arithmos_theatwn'];
$kairikes_synthikes =  $_POST['kairikes_synthikes'];
$antipalos =$_POST['antipalos'];

// τσεκάρουμε αν υπάρχει ο αγώνας με τον κωδικό που δώσαμε
$checkAgwnaQuery = "SELECT * FROM agwnas WHERE kwdikos_agwna = '$kwdikos_agwna'";
$resultAgwna = mysqli_query($conne, $checkAgwnaQuery);

// τσεκάρουμε αν υπάρχουν ήδη στατιστικά για αυτόν τον αγώνα	
$checkStatistikaQuery = "SELECT * FROM statistika WHERE kwdikos_agwna = '$kwdikos_agwna'";
$resultStatistika = mysqli_query($conne, $checkStatistikaQuery);

// αν υπάρχει resultAgwna τότε βάζουμε τα στοιχεία στον πίνακα statistika 
if (mysqli_num_rows($resultAgwna) > 0) {
    // αν υπάρχουν ήδη στατιστικά για αυτόν τον αγώνα τότε εμφανίζουμε μήνυμα
    if (mysqli_num_rows($resultStatistika) > 0) {
        echo "Υπάρχει ήδη εγγραφή με κωδικό $kwdikos_agwna.";
    } else {
        // αν δεν υπάρχουν ήδη στατιστικά για αυτόν τον αγώνα τότε τα εισάγουμε
        $insertQuery = "INSERT INTO statistika (kwdikos_agwna, diarkeia_se_lepta, arithmos_theatwn, kairikes_synthikes, antipalos)
                        VALUES ('$kwdikos_agwna', '$diarkeia_se_lepta', '$arithmos_theatwn', '$kairikes_synthikes', '$antipalos')";

        $qryexe = mysqli_query($conne, $insertQuery);

        if ($qryexe) {
            echo "Η εγγραφή έγινε με επιτυχία";
        } else {
            echo "Σφάλμα κατά την εγγραφή: " . mysqli_error($conne);
        }
    }
} else {
    // αν δεν υπάρχει resultAgwna τότε εμφανίζουμε μήνυμα
    echo "Δεν υπάρχει αγώνας με κωδικό $kwdikos_agwna.";
}

// Close the database connection
mysqli_close($conne);
?>
