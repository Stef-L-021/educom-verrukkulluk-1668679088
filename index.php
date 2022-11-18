<?php

// Importeer de DB en de verschillende tabel scripts:
require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");

/// INIT
$db = new database();
$art = new artikel($db->getConnection());
$usr = new user($db->getConnection());


/// VERWERK 
$data = $art->selecteerArtikel(2);
$dataUser = $usr->selecteerUser(3);

/// RETURN
echo "<pre>";
var_dump($data);
var_dump($dataUser);