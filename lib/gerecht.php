<?php

class gerecht {

    private $connection;
    private $gerecht;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->keuken = new keuken_type($connection);
        $this->ingre = new ingredient($connection);
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
        $ingredienten = $this->ingre->selecteerIngredient($gerecht_id);        // Deze functie kunnen we ophalen uit ingredienten
        return($ingredienten);
    }

    // bereken prijs
    private function berekenPrijs($ingredienten) {
        $totaal = 0;
        foreach($ingredienten as $ingredient) {        // meervoud en dan enkelvoud is beter.
            $prijs = $ingredient["prijs"];
            $aantal = $ingredient["aantal"];
            $verpakking = $ingredient["verpakking"];

            $berekening = $prijs*($aantal/$verpakking);
            $totaal += $berekening;
            // kan je ook berekenen als $totaal = $ingredient["prijs"]*($ingredient["aantal"]/$ingredient["verpakking")
        }

        return($totaal/100);                    // Prijs in euro's
    }

    // Bereken calorieen: 
    private function berekenCalorieen($ingredienten) {      // deze ingredienten halen we uit gerechten
        $totaal = 0;
        foreach($ingredienten as $ingredient) {
            $calorieen = $ingredient["calorieen"];             
            $aantal = $ingredient["aantal"];
            $verpakking = $ingredient["verpakking"];

            $berekening = $calorieen*($aantal/$verpakking);
            $totaal += $berekening;                             // Is hetzelfde als $totaal = $totaal + $berekening;
        }

        return($totaal);
    } 

    // Selecteer User (Dit geeft 1 output. Is dit de user_id in gerecht? De maker van het gerecht?)
    private function selectUser($user_id) {
        $data = $this->user->selecteerUser($user_id);
        return($data);
    }

    // Selecteer bereidingswijze
    private function selectInfo($gerecht_id, $record_type) {
        $data = $this->gerechtInfo->selecteerInfo($gerecht_id, $record_type);
        return($data);
    }

    // Select gerecht -----------------------------------------------------------
    public function selecteerGerecht($gerecht_id=NULL) {    // het mag of gerecht_id zijn of NULL

        $sql = "SELECT * FROM gerecht";
        if(!is_null($gerecht_id)) {
            $sql.=" WHERE id = $gerecht_id";
        }
        $return = [];  

        $result = mysqli_query($this->connection, $sql);
        while ($gerecht = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $gerecht_id = $gerecht["id"];       // Deze worden 

            $keuken_id = $gerecht["keuken_id"];                 // ..._id = $gerecht[Naam van de kolom in de gerecht tabel]
            $keuken = $this->selectKeukenType($keuken_id);
            
            $type_id = $gerecht["type_id"];
            $type= $this->selectKeukenType($type_id);

            $ingredienten = $this->selectIngredient("$gerecht_id");

            $berekenPrijs= $this->berekenPrijs($ingredienten);

            $berekenColorieen = $this->berekenCalorieen($ingredienten);

            $user_id = $gerecht["user_id"];
            $user= $this->selectUser($user_id);

            $bereidingswijze = $this->selectInfo($gerecht_id, 'B');

            $opmerkingen = $this->selectInfo($gerecht_id, 'O');

            $waarderingen = $this->selectInfo($gerecht_id, 'W');

            $favorieten = $this->selectInfo($gerecht_id, 'F');

            $return[] = [                   // noem dit gerechten
                "keuken" => $keuken,
                "type" => $type,
                "ingredienten" => $ingredienten,
                "prijs" => $berekenPrijs,
                "calorieen" => $berekenColorieen,
                "user" => $user,
                "bereidingswijze" => $bereidingswijze,
                "opmerkingen" => $opmerkingen,
                "waarderingen" => $waarderingen,
                "favorieten" => $favorieten
            ];
        }

        return($return);
    }
 
}           