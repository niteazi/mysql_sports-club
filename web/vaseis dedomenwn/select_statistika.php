<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Εμφάνιση Δεδομένων</title>
    <link rel="stylesheet" href="style_statistika.css">
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

    
<table>
        <tr>
            <th>Κωδικός Αγώνα</th>
            <th>Διάρκεια Αγώνα σε Λεπτά</th>
            <th>Αριθμός Θεατών</th>
            <th>Καιρικές Συνθήκες</th>
            <th>Αντίπαλος</th>
        </tr>

        <?php include 'php_select_statistika.php'; ?>
</table>
</body>
</html>