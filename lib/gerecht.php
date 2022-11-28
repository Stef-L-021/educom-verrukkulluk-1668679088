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

    // Bereken prijs
    private function berekenPrijs($gerecht_id) {
        $dataPrijs = $this->ingredienten->selecteerIngredient($gerecht_id);         // Dit moet vanuit gerecht wordt opgeroepen
        //gebruikt precies dezelfde data als calorieen hieronder
        $totaal = 0;

        foreach($dataPrijs as $ingredient) {
            $prijs = $ingredient["prijs"];
            $aantal = $ingredient["aantal"];
            $verpakking = $ingredient["verpakking"];

            $berekening = $prijs*($aantal/$verpakking);
            $totaal += $berekening;
        }

        return($totaal/100);                    // Prijs is euro's
    }


    // Bereken calorieen: 
    private function berekenCalorieen($gerecht_id) {
        $dataIngredienten= $this->ingredienten->selecteerIngredient($gerecht_id);   // Dit moet vanuit gerecht wordt opgeroepen      
        $calorieen = 0;                                                         // Het wordt aan het begin voor de berekening standaard op 0 gezet
        $aantal = 0;
        $verpakking = 0;
        $totaal = 0;

        foreach($dataIngredienten as $ingredient) {
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
    public function selecteerGerecht($gerecht_id) {    

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

            $berekenPrijs_id = $gerecht["id"];
            $berekenPrijs= $this->berekenPrijs($berekenPrijs_id);

            $berekenCalorieen_id = $gerecht["id"];
            $berekenColorieen = $this->berekenCalorieen($berekenCalorieen_id);

            $user_id = $gerecht["user_id"];
            $user= $this->selectUser($user_id);

            $bereidingswijze_id = $gerecht["id"];
            $bereidingswijze = $this->selectInfo($bereidingswijze_id, 'B');

            $opmerkingen = $this->selectInfo($bereidingswijze_id, 'O');

            $waarderingen = $this->selectInfo($bereidingswijze_id, 'W');

            $favorieten = $this->selectInfo($bereidingswijze_id, 'F');

            $return[] = [
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

    // Issue 11: 2de functie voor ALLE gerechten ophalen:

}               