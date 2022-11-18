<?php

// Importeer de DB en de verschillende tabel scripts:
require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");

/// INIT    link de classes aan variables
$db = new database();
$art = new artikel($db->getConnection());
$usr = new user($db->getConnection());
$keuken = new keuken_type($db->getConnection());


/// VERWERK     de varialbe + select functie in een nieuwe variable
$data = $art->selecteerArtikel(2);
$dataUser = $usr->selecteerUser(3);
$datakeuken = $keuken->selecteerKeuken_type(4);

/// RETURN      de nieuwe var
echo "<pre>";
var_dump($data);
var_dump($dataUser);
var_dump($datakeuken);