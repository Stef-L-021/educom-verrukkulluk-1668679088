<?php

class gerecht {

    private $connection;
    private $gerecht;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->keuken = new keuken_type($connection);
        $this->ingredienten = new ingredient($connection);
        $this->user = new user($connection);
        $this->gerechtInfo = new gerecht_info($connection);
    }

// Opahalen van andere php file functies en 2 calculaties: --------------------------------------

    // select keuken
    private function selectKeukenType($keuken_id) {
        $data= $this->keuken->selecteerKeuken_type($keuken_id);
        return($data);
    }

    // selecteer ingredient
    private function selectIngredient($gerecht_id) {        
        $data = $this->ingredienten->selecteerIngredient($gerecht_id);        // Deze functie kunnen we ophalen uit ingredienten
        return($data);
    }

    // Bereken calorieen: 
    private function berekenCalorieen($gerecht_id) {
        $ingredienten= $this->ingredienten->selecteerIngredient($gerecht_id);   // Dit moet vanuit gerecht wordt opgeroepen      // Deze functie moeten we gaan ophalen uit gerecht
        $calorieen = 0;                                                         // Het wordt aan het begin voor de berekening standaard op 0 gezet
        $aantal = 0;
        $verpakking = 0;
        $totaal = 0;

        foreach($ingredienten as $ingredient) {
            $calorieen = $ingredient["calorieen"];             // Is hetzelfde als $calorieen = $calorieen + $ingredient["calorieen"];
            $aantal = $ingredient["aantal"];
            $verpakking = $ingredient["verpakking"];

            $berekening = $calorieen*($aantal/$verpakking);
            $totaal += $berekening;
        }

        return($totaal);
    }

       // Selecteer User
       private function selectUser($user_id) {
        $data = $this->user->selecteerUser($user_id);
        return($data);
    }

    // Select gerecht -----------------------------------------------------------
    public function selecteerGerecht($gerecht_id) {     // uit gerecht_info

        $sql = "SELECT * FROM gerecht WHERE id = $gerecht_id";
        $return = [];  

        $result = mysqli_query($this->connection, $sql);
        while ($gerecht = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

            $keuken_id = $gerecht["keuken_id"];                 // ..._id = $gerecht[Naam van de kolom in de gerecht tabel]
            $keuken = $this->selectKeukenType($keuken_id);
            
            $type_id = $gerecht["type_id"];
            $type= $this->selectKeukenType($type_id);

            $ingredienten_id= $gerecht["id"];
            $ingredienten = $this->selectIngredient("$ingredienten_id");

            $berekenCalorieen_id = $gerecht["id"];
            $berekenColorieen = $this->berekenCalorieen($berekenCalorieen_id);



            $return[] = [
                "keuken" => $keuken,
                "type" => $type,
                "ingredienten" => $ingredienten,
                "calorieen" => $berekenColorieen
            ];
        }


        return($return);
    }



}               