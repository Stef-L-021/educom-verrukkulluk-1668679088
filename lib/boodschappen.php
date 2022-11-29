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

    // ophalen boodschappen
    public function selectBoodschappen($gerecht_id) {
        $sql = "SELECT * FROM boodschappen WHERE gerecht_id = $gerecht_id";
        $result = mysqli_query($this->connection, $sql);
        $boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC);
        return($boodschappen);
        // dit willen we loopen om alles te zien 
    }

    public function selecteerartikel() {}

    // we moeten zoeken of de unieke combinatie van user en gerecht al in de boodschappenlijst staat. als dit niet het geval is voegen we die toe.
    // user id 
    //check if value is not in array

    // we moeten ook kijken wat we nodig hebben op de pagina zelf en deze info ophalen. Is hier de gerecht tabel voor nodig?
}



?>