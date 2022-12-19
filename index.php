<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

// Require de prerequisites:
require_once("lib/keuken_type.php");
require_once("lib/ingredient.php");
require_once("lib/artikel.php");
require_once("lib/user.php");
require_once("lib/gerecht_info.php");

require_once("lib/database.php");
$db = new database();


/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/gerecht.php");
$gerecht = new gerecht($db->getConnection());

require_once("lib/zoekfunctie.php");
$zoekfunctie = new zoekfunctie($db->getConnection());
// $data = $zoekfunctie->zoekfunctie($query);

/*
URL:
http://localhost/index.php?gerecht_id=4&action=detail
*/

$gerecht_id = isset($_GET["gerecht_id"]) ? $_GET["gerecht_id"] : "";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";
$rating= isset($_GET["rating"]) ? $_GET["rating"] : "";



switch($action) {

        case "homepage": {
            $data = $gerecht->selecteerGerecht();
            $template = 'homepage.html.twig';
            $title = "homepage";
            break;
        }

        case "detail": {
            $data = $gerecht->selecteerGerecht($gerecht_id);
            $template = 'detail.html.twig';
            $title = "detail pagina";
            break;
        }

        case "boodschappen": {

            $data = $gerecht->selecteerGerecht($gerecht_id);
            $template = 'detail.html.twig';
            $title = "boodschappen";
            break;
        }

        case "addrating": {
           // $dataGerecht = $gerecht_info->addRating($gerecht_id, $rating);
            
           
           header('Content-Type: application/json; charset-utf-8');
            // $data Hier komt de data
            echo json_encode($data);
            die ();
            break;
            /* https://stackoverflow.com/questions/4064444/returning-json-from-a-php-script */
        }

        /// etc

}



/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data]);
