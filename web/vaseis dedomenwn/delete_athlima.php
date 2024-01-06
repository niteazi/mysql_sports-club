<?php
include 'connect.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title> Διαγραφή Δεδομένων </title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

    <div id="center">
        <h1 align=center>Διαγραφή Δεδομένων</h1>

        <?php
        // Λήψη των τιμών POST
        $onoma_athlimatos = mysqli_real_escape_string($conne, $_POST['onoma_athlimatos']);

        // Check if onoma_athlimatos is not empty
        if (empty($onoma_athlimatos)) {
            echo "Error: Athlima name cannot be empty.";
            exit;
        }

        // Σύνταξη εντολής SQL για διαγραφή δεδομένων
        $qry = "DELETE FROM A8LIMA WHERE onoma_athlimatos = '$onoma_athlimatos'";

        // Εκτέλεση εντολής
        $qryexe = mysqli_query($conne, $qry);

        if ($qryexe) {
            echo "Το αθλημα \"$onoma_athlimatos\" διαγράφηκε με επιτυχία ✔️";
        } else {
            echo "Σφάλμα κατά τη διαγραφή του αθλήματος.";
        }
        
        echo "<br><button onclick=\"location.href='delete_athlima.html';\"> Επιστροφή </button>";
        ?>
    </div>

</body>

</html>
