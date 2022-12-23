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

require_once("lib/database.php");
$db = new database();


/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/gerecht_info.php");
$gerecht_info = new gerecht_info($db->getConnection());

require_once("lib/gerecht.php");
$gerecht = new gerecht($db->getConnection());

require_once("lib/zoekfunctie.php");
$zoekfunctie = new zoekfunctie($db->getConnection());
// $data = $zoekfunctie->zoekfunctie($query);

require_once("lib/boodschappen.php");
$boodschappen = new boodschappen($db->getConnection());

/*
URL:
http://localhost/index.php?gerecht_id=4&action=detail
*/

$gerecht_id = isset($_GET["gerecht_id"]) ? $_GET["gerecht_id"] : "";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";
$rating= isset($_GET["rating"]) ? $_GET["rating"] : []; 
$user_id=6;
$totaalprijs=$boodschappen->totaalPrijsBerekening($user_id);                // Wordt gebruikt bij boodschappen

$search = $_GET['search'] ? $_GET["search"] : "";
$zoekfunctie=$zoekfunctie->zoekfunctie($search);
var_dump($zoekfunctie);


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

        case "addrating": {
            /* Gerecht_id wordt gepakt uit hierboven de GET */
            $addWaardering= $gerecht_info->addWaardering($gerecht_id, $rating);
            
            $gemiddeldeWaardering= $gerecht_info->berekenGemiddelde($gerecht_id);
            
           header('Content-Type: application/json; charset-utf-8');
           $data = ["average" => $gemiddeldeWaardering];
           
           echo json_encode($data);
           die ();
            /* https://stackoverflow.com/questions/4064444/returning-json-from-a-php-script */
            
        }

        case "ophalen_boodschappen": {
            $data= $boodschappen->ophalenUitgebreideBoodschappen($user_id);
            $template = 'boodschappen.html.twig';
            $title = "boodschappen";
            break;
            // http://localhost/educom-verrukkulluk-1668679088/index.php?action=ophalen_boodschappen
        }

        case "add_boodschappen": {
            // Dit moet de boodschappen toevoegen en daarna openen
            $data= $boodschappen->boodschappenToevoegen($gerecht_id, $user_id);
            $data= $boodschappen->ophalenUitgebreideBoodschappen($user_id);
            $totaalprijs=$boodschappen->totaalPrijsBerekening($user_id);                // Wordt gebruikt bij boodschappen
            $template = 'boodschappen.html.twig';
            $title = "boodschappen";
            break;
            // http://localhost/educom-verrukkulluk-1668679088/index.php?action=ophalen_boodschappen
        }
}

switch($search) {

    case "detail": {
        $data = $gerecht->selecteerGerecht(1);
        $template = 'detail.html.twig';
        $title = "detail pagina";
        break;
    }
}



/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data, "totaalprijs"=> $totaalprijs]);
