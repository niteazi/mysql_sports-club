<?php
$h = 'localhost'; // Όνομα server
$u = 'your_username'; // Όνομα χρήστη
$p = 'your_password'; // Password
$n = 'sports_club'; // Όνομα Βάσης
$conne = mysqli_connect($h, $u, $p, $n)
or die("Connection failed");
?>