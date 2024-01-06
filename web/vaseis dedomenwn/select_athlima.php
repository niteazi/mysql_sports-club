<?php
    include 'connect.php';
?>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>Εμφάνιση Δεδομένων</title>
    <link rel="stylesheet" type="text/css" href="style_athlima.css">
</head>

<body>

<div class="navbar">
        <a href="index.html">Αρχική</a>
            <div class="dropdown">
                <button class="dropbtn">Αθλητές 
                <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="prosthiki_athliti.html">Εισαγωγή</a>
                    <a href="delete_athlete.html">Διαγραφή</a>
                    <a href="view_athletes.php">Προβολή</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Αθλήματα 
                <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="insert_athlima.html">Εισαγωγή</a>
                    <a href="delete_athlima.html">Διαγραφή</a>
                    <a href="select_athlima.php">Προβολή</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn">Στατιστικά 
                <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="insert_statistika.html">Εισαγωγή</a>
                    <a href="delete_statistika.html">Διαγραφή</a>
                    <a href="select_statistika.php">Προβολή</a>
                </div>
            </div> 
    </div>

    <div id="center" class="form-container">
        <table class="data-table">
            <tr>
                <th>Άθλημα</th>
                <th>Τύπος παιχνιδιού</th>
                <th>Εξοπλισμός</th>
            </tr>
            <?php
                // Σύνταξη Ερωτήματος για την εμφάνιση δεδομένων
                $qry = "SELECT * FROM A8LIMA";
                
                // Εκτέλεση Ερωτήματος
                $result = mysqli_query($conne, $qry);
                
                // Παρουσίαση αποτελεσμάτων Ερωτήματος
                while($row = mysqli_fetch_array($result, MYSQLI_NUM)) {
                    echo ("<tr>
                        <td>{$row[0]}</td>
                        <td>{$row[1]}</td>
                        <td>{$row[2]}</td>
                    </tr>");
                }
            ?>
        </table>

    </div>

</body>

</html>

