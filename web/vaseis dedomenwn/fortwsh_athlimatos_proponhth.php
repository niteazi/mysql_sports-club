<?php
include 'connect.php';

if (isset($_POST['kwdikos_proponhth'])) {
    $coachCode = $_POST['kwdikos_proponhth'];

    $sql = "SELECT athlima FROM proponhths WHERE kwdikos_proponhth = '$coachCode'";
    $result = $conne->query($sql);

    
    if ($result->num_rows > 0) 
    {
        while ($row = $result->fetch_assoc()) 
        {
            echo "<tr><td>{$row['athlima']}</td></tr>";
            
        }
    }
    else
    {
        echo "<tr><td>Παρακαλώ εισάγετε έναν έγκυρο κωδικό προπονητή</td></tr>";
    }
    
}
$conne->close();
?>

