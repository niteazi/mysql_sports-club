<?php
    include 'connect.php';

    // Σύνταξη Ερωτήματος για την εμφάνιση δεδομένων
    $qry = "SELECT * FROM statistika";

    // Εκτέλεση Ερωτήματος
    $result = mysqli_query($conne, $qry);

    // Παρουσίαση αποτελεσμάτων Ερωτήματος
    while ($row = mysqli_fetch_array($result, MYSQLI_NUM)) {
        echo "<tr>";
        for ($i = 0; $i < count($row); $i++) {
            echo "<td><div align=\"center\"> $row[$i]</div></td>";
        }
        echo "</tr>";
    }
?>