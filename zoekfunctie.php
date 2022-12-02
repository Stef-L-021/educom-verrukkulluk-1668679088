<?php
require "lib/database.php";

$query = $_GET['query'];
    $sql = "SELECT * FROM gerecht WHERE ('titel' LIKE '%'.$query.'%')";
    echo $sql;
    if(mysqli_num_rows($sql)>0) {
        while($results = mysqli_fetch_array($sql)) {
            echo "<p><h3>".$results['title']."</h3>";
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> zoekfunctie</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
</style> 
<body>
    <div class="container">
        <form action="check_zoekfunctie.php" method="GET">
            <input type= "text" placeholder="Zoek op gerecht" name="query" />
            <input type ="submit" value = "smullen maar!" name="submit" />
        </form>
    </div>
</body
</html>