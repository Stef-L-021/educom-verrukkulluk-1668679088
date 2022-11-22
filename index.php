<?php

// Importeer de DB en de verschillende tabel scripts:
require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
require_once("lib/gerecht_info.php");

/// INIT    link de classes aan variables
$db = new database();
$art = new artikel($db->getConnection());
$usr = new user($db->getConnection());
$keuken = new keuken_type($db->getConnection());
$gerecht_info = new gerecht_info($db->getConnection());
$ingr = new ingredient($db->getConnection());

/// VERWERK     de variable + select functie in een nieuwe variable
// $data = $art->selecteerArtikel(2);
//$dataUser = $usr->selecteerUser(3);
// $datakeuken = $keuken->selecteerKeuken_type(4);
// $data_gerecht_info_user = $gerecht_info->selecteerUserGerecht_info(8);
// $dataIngredient = $ingr->selecteerIngredient(1);                      // test bij gerecht 2
// $dataUser_gerecht_info_new = $gerecht_info->selecteerUsersId(1);                     // Als t goed is wordt hier user_id ingevuld in de gerecht_info tabel
$selectBereidingswijze = $gerecht_info->selecteerInfo(1, 'O');

// Add en delete favoriten:
//$addFavorite = $gerecht_info->addFavorite(3);               // Voeg tussen haakjes in het GERECHT_ID voor deze TOE TE VOEGEN
//$deleteFavorite = $gerecht_info->deleteFavorite(3);         // Voeg tussen haakjes in het GERECHT_ID voor te VERWIJDEREN

/// RETURN      de nieuwe var
echo "<pre>";
//var_dump($data);
//var_dump($dataUser);
//var_dump($datakeuken);
//var_dump($data_gerecht_info_user);

// var_dump($dataIngredient);
var_dump($selectBereidingswijze);

// var_dump(om te checken of een bepaald ID van gerecht_info er wel of niet is);
//echo "data gerecht 10: <br>";
//$data_gerecht_info = $gerecht_info->selecteerGerecht_info(10);
//var_dump($data_gerecht_info);
