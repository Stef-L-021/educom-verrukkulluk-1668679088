<?php

class boodschappen {
    private $connection;
    private $ingredient;
    private $user;
    //private $gerecht;
    private $boodschappen;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->ingredient = new ingredient ($connection);
        $this->user = new user($connection);
    }

    //ophalen ingredienten voor het artikel_id te krijgen
    private function selectIngredienten($gerecht_id){
        $data = $this->ingredient->selecteerIngredient($gerecht_id);
        return($data);
    }

    private function selectUser($user_id) {
        $data = $this->user->selecteerUser($user_id);
        return($data);
    }

    
    public function boodschappenToevoegen($gerecht_id, $user_id) {
        $sql = "SELECT * FROM boodschappen WHERE gerecht_id = $gerecht_id";

        $x = 0;
        $result = mysqli_query($this->connection, $sql);
        while ($boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $boodschappenGerecht_id = $boodschappen["gerecht_id"];
            $boodschappenUser_id = $boodschappen["user_id"];

            if($boodschappenGerecht_id == $gerecht_id AND
            $boodschappenUser_id == $user_id) {
                $x=1;
            }
        } // einde while functie

        echo "var x = " . $x . "<br>";
        switch ($x) {
            case 1:     // Geval waar het al bestaat
                echo "Deze bestaat al in de database, er wordt 1 bij het aantal toegevoegd<br>";
                $sql = "UPDATE boodschappen
                SET aantal = aantal +1
                WHERE gerecht_id = $gerecht_id AND user_id = $user_id";
                return ($this->connection->query($sql));
                break;
            case 0:     // Hier moet een nieuwe row aan worden toegevoegd
                echo "Deze bestaat nog niet in de database, het wordt nieuw toegevoegd<br>";
                $sql = "INSERT INTO boodschappen (gerecht_id, user_id, aantal)
                VALUES ($gerecht_id, $user_id, 1)";
                return ($this->connection->query($sql));
                break;
        }

    } // Einde public function



















        // ophalen boodschappen
        public function selectBoodschappen($gerecht_id) {
            $sql = "SELECT * FROM boodschappen WHERE gerecht_id = $gerecht_id";
            $return = [];  
    
            $result = mysqli_query($this->connection, $sql);
            while ($boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
                $boodschappenGerecht_id = $boodschappen["gerecht_id"];
                $boodschappenUser_id = $boodschappen["user_id"];
    
                //$ingredienten = 
    
                $return[] =[ 
                    "gerecht_id_van_boodschappen" => $boodschappenGerecht_id,
                    "user_id_van_boodschappen" => $boodschappenUser_id
                ];
            }
    
            // dit willen we loopen om alles te zien 
    
            return($return);
        }
} // Einde class

    

    // we moeten zoeken of de unieke combinatie van user en gerecht al in de boodschappenlijst staat. als dit niet het geval is voegen we die toe.
    // user id 
    //check if value is not in array

    // we moeten ook kijken wat we nodig hebben op de pagina zelf en deze info ophalen. Is hier de gerecht tabel voor nodig?




?>