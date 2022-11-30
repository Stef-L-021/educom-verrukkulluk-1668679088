<?php

class boodschappen {
    private $connection;
    private $ingredient;
    private $user;
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

    // ophalen van de boodschappen tabel
    public function ophalenBoodschappen($user_id) {
        $sql = "select * from boodschappen where user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
        $boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return($boodschappen);
    }



    private function toevoegenartikel($ingredient, $user_id) {
        $artikel_id = $ingredient["artikel_id"];
        $sql = "INSERT INTO boodschappen (artikel_id, user_id, aantal) VALUES ($artikel_id, $user_id, 10)";
        $result = mysqli_query($this->connection, $sql); 
        return TRUE;
    }

    private function artikelBijwerken($boodschap) {
        echo "Bijwerken";
    }

    private function artikelOpLijst($artikel_id, $user_id) {
        $boodschappen = $this->boodschappen->ophalenBoodschappen($user_id);
        if($boodschappen["artikel_id"] == $artikel_id) {
            return($boodschappen);
        } else {
            return FALSE;       // dan moet het worden toegevoegd in boodschappenToevoegen
        }
    }

    public function boodschappenToevoegen($gerecht_id, $user_id) {
        $ingredienten = $this->selectIngredienten($gerecht_id); 
        foreach ($ingredienten as $ingredient) {
            $gevonden = $this->artikelOpLijst($ingredient["artikel_id"], $user_id);
            if(!$gevonden) {    
                $this->toevoegenartikel($ingredient, $user_id);
            } else {
                $this->artikelBijwerken($gevonden);
            }
        }            

    

    } // Einde public function



















      
} // Einde class

    

    // we moeten zoeken of de unieke combinatie van user en gerecht al in de boodschappenlijst staat. als dit niet het geval is voegen we die toe.
    // user id 
    //check if value is not in array

    // we moeten ook kijken wat we nodig hebben op de pagina zelf en deze info ophalen. Is hier de gerecht tabel voor nodig?




?>