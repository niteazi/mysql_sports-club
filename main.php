<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php
$h = 'localhost'; // Όνομα server
$u = 'Nik'; // Όνομα χρήστη
$p = 'a1b2c3GR'; // Password
$n = 'sports_club'; // Όνομα Βάσης
$conne = mysqli_connect($h, $u, $p, $n)
or die("Connection failed");
echo "test";
?>


</body>
</html>