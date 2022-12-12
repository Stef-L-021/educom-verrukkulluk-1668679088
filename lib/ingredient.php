<?php

class ingredient {

    // 2 nieuwe private variablen maken:
    private $connection; 
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    // functie voor het selecteren van de artikel tabel
    private function selectArtikel($art_id) {                   // We maken hier een nieuwe tabel
        $data = $this->art->selecteerArtikel($art_id);          // dit moet selecteer zijn omdat het in de artikel.php ook selecteer is. We gebruiken de data van artikel.php
        return($data);                                          // aan het einde van de functie wordt de data returned
    }

    // selectie ingredient
    public function selecteerIngredient($gerecht_id) {                      // nieuwe functie opstellen: Noem dit voortaan meervouw omdat we hier een array krijgen
        $sql = "SELECT * FROM ingredient WHERE gerecht_id= $gerecht_id";    // Dit moet gerecht_id zijn omdat we dit ook in willen vullen!!
        $return = [];                                                       // We returnen een array

        $result = mysqli_query($this->connection, $sql);                    // we maken een nieuwe variable genaamd $result en hier komt de sql in die geconnenct is via de connection

            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {      // als er een array is is er een loop

                $art_id = $row["artikel_id"];                            
                $artikel = $this->selectArtikel($art_id);                   // variable artikel is de selectArtikel functie de we hebben gemaakt met art_id als invoer

                $ingredienten[] = [

                    "id" => $row["id"],                                 // ingredient_id
                    "gerecht_id" => $row["gerecht_id"],                 // pakt de artikel_id van de row
                    "artikel_id" => $art_id,                            // kan ook via $row["artikel_id"],  
                    "aantal" => $row["aantal"],
                    "naam" => $artikel["naam"],                         // vanaf hier pakken we ze uit de artkel tabel
                    "omschrijving" => $artikel["omschrijving"],
                    "prijs" => $artikel["prijs"],
                    "eenheid" => $artikel["eenheid"],
                    "verpakking" => $artikel["verpakking"],
                    "calorieen" => $artikel["calorieen"],
                    "afbeelding" => $artikel["afbeelding"]

                ]; // Einde return             
            } // Einde while functie

        return($ingredienten);                                                // Aan t einde van de selecteerIngredient functie returnen we de $return variable die we eerder hebben gemaakt
    }
}

?>