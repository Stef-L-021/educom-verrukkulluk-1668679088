<?php

class ingredient {

    private $connection; 
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->art = new artikel($connection);
    }

    // 
    private function selectArtikel($art_id) {
        $data = $this->art->selecteerArtikel($art_id);          // dit moet selecteer zijn omdat het in de artikel.php ook selecteer is
        return($data);  
    }

    // selectie ingredient
    public function selecteerIngredient($gerecht_id) {
        $sql = "SELECT * FROM ingredient WHERE gerecht_id= $gerecht_id";
        $return = [];

        $result = mysqli_query($this->connection, $sql);

            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                $art_id = $row["artikel_id"];
                $artikel = $this->selectArtikel($art_id);

                $return[] = [

                    "id" => $row["id"],                         // ingredient_id
                    "gerecht_id" => $row["gerecht_id"],
                    "artikel_id" => $row["artikel_id"],
                    "aantal" => $row["aantal"],
                    "naam" => $artikel["naam"],
                    "omschrijving" => $artikel["omschrijving"],
                    "prijs" => $artikel["prijs"],
                    "eenheid" => $artikel["eenheid"],
                    "verpakking" => $artikel["verpakking"]
                    //"calorien"

                ]; // Einde return             
            } // Einde while functie

            return($return);
    }
}

?>