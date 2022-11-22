<?php

class gerecht {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->usr = new user($connection);
        $this->ingr = new ingredient($connection);
    }

    // Selecteer User
    public function selectUser($usr_id) {                   // Dit geeft een error als je een private functie probeert te gebruiken
        $datausr = $this->usr->selecteerUser($usr_id);
        return($datausr);
    }

    // selecteer ingredient
    // We geven hier het gerecht_id opgeven en dat krijgen we arrays met de ingredienten uit
    public function selectIngredient($gerecht_id){          // het staat rechts in de ASD dus moet dat dan een private function zijn?
        $dataingr = $this->ingr->selecteerIngredient($gerecht_id);        // Deze functie kunnen we ophalen uit ingredienten
        return($dataingr);
    }

    // Selecteer etc...


    // Select gerecht
    public function selecteerGerecht($gerecht_id) {     // uit gerecht_info

        $sql = "SELECT * FROM gerecht WHERE id = $gerecht_id";

        $result = mysqli_query($this->connection, $sql);
        $gerecht = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($gerecht);
    }



}               