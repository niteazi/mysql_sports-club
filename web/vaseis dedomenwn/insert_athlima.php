<?php
include 'connect.php';
?>

<?php
// Λήψη των τιμών POST
$onoma_athlimatos = mysqli_real_escape_string($conne, $_POST['onoma_athlimatos']);
$tropos_paixnidiou = mysqli_real_escape_string($conne, $_POST['tropos_paixnidiou']);
$exoplismos = mysqli_real_escape_string($conne, $_POST['exoplismos']);

// Check if onoma_athlimatos is not empty
if (empty($onoma_athlimatos)) {
    echo "Error: Athlima name cannot be empty.";
    exit;
}

// Σύνταξη εντολής SQL για εισαγωγή δεδομένων με χρήση παραμέτρων
$qry = "INSERT INTO A8LIMA (onoma_athlimatos, tropos_paixnidiou, exoplismos) 
        SELECT ?, ?, ? FROM DUAL 
        WHERE NOT EXISTS (SELECT onoma_athlimatos FROM A8LIMA WHERE onoma_athlimatos = ?)";

// Εκτέλεση εντολής με χρήση παραμέτρων
$stmt = mysqli_prepare($conne, $qry);
mysqli_stmt_bind_param($stmt, "ssss", $onoma_athlimatos, $tropos_paixnidiou, $exoplismos, $onoma_athlimatos);
mysqli_stmt_execute($stmt);

// Έλεγχος για το εάν προστέθηκε επιτυχώς
if (mysqli_affected_rows($conne) > 0) {
    echo "<div id='success-message' class='bordered'>";
    echo "Προστέθηκε με επιτυχία!";
} else {
    echo "Το άθλημα υπάρχει ήδη!";
}
echo "<br>";
echo "<button id='return-button' onclick=\"location.href='insert_athlima.html';\"> Επιστροφή </button>";
// Κλείσιμο της προετοιμασμένης δήλωσης
mysqli_stmt_close($stmt);
?>

<!-- Include the link to the CSS file -->
<link rel="stylesheet" type="text/css" href="style.css">
