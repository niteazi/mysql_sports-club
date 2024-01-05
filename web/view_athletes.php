<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="styles.css">
    <title>Προβολή Αθλητών</title>
</head>

<body>

<div class="navbar">
        <a href="#home">Αρχική</a>
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
      </div>



<table id="provoli_pinaka">
    
    <caption id="provoli_caption">Προβολή Αθλητών</caption>
        <tr>
            <th>ΑΕΜ</th>
            <th>Ονοματεπώνυμο</th>
            <th>Φύλο</th>
            <th>Ημερομηνία Εγγραφής</th>
            <th>Ημερομηνία Γέννησης</th>
            <th>Κωδικός Προπονητή</th>
            <th>Άθλημα</th>
        </tr>

        <?php include 'php_view_athletes.php'; ?>
</table>
</body>
</html>
