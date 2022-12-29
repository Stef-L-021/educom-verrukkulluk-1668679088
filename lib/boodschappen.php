<?php

class boodschappen {
    private $connection;
    private $ingredient;
    private $art;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->ingredient = new ingredient ($connection);
        $this->art = new artikel($connection);
    }

    // Ophalen van tabellen --------------------------------------------------------------------------------------------------------------------------------------------

    // ophalen van ingredienten:
    private function selectIngredienten($gerecht_id) {
        $ingredienten = $this->ingredient->selecteerIngredient($gerecht_id);
        return($ingredienten);
    }

    // Ophalen van de boodschappenlijst tabel
    public function ophalenBoodschappen($user_id) {
        $return = [];
        $sql = "select * FROM boodschappen where user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
        while ($boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $return[] = $boodschappen;
        }
    return($return);
    }



    // uitgebreidere boodschappen ophalen met artikel drbij
    private function selectArtikel($art_id) {                   // We maken hier een nieuwe tabel
        $data = $this->art->selecteerArtikel($art_id);          // dit moet selecteer zijn omdat het in de artikel.php ook selecteer is. We gebruiken de data van artikel.php
        return($data);                                          // aan het einde van de functie wordt de data returned
    }

    public function totaalPrijsBerekening($user_id) {
        $sql = "select * FROM boodschappen where user_id = $user_id";
        $totaalprijs=0;

        $result = mysqli_query($this->connection, $sql);

        while ($boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $art_id = $boodschappen["artikel_id"];
            $artikel = $this->selectArtikel($art_id);

            $prijsMeerArt = number_format(($boodschappen["aantal"]*$artikel["prijs"])/100,2);

            $totaalprijs=$totaalprijs+$prijsMeerArt;
        }
    return($totaalprijs);
    }

    public function ophalenUitgebreideBoodschappen($user_id) {
        $sql = "select * FROM boodschappen where user_id = $user_id";
        $return = [];
        $totaalprijs=0;

        $result = mysqli_query($this->connection, $sql);

        while ($boodschappen = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $art_id = $boodschappen["artikel_id"];
            $artikel = $this->selectArtikel($art_id);

            $prijsMeerArt = number_format(($boodschappen["aantal"]*$artikel["prijs"])/100,2);

            $return[] = [
                "boodschappen"=> $boodschappen,
                "artikel" => $artikel,
                "prijzen" => $prijsMeerArt,
            ];
        }
    return($return);
    }

    // Aantal functie berekeningen ----------------------------------------------------------------------------------------------------------------------------------

    // aantal berekening die voor latere berekeningen worden gebruikt
    private function aantalBerekenen($ingredient) {
        $ingredientAantal = $ingredient["aantal"];
        $ingredientVerpakking = $ingredient["verpakking"];
        $aantalBerekening = $ingredientAantal/$ingredientVerpakking;
        return $aantalBerekening;
    }

    // precies aantal berekenen
    private function preciesAantalUpdate($ingredient, $boodschap) {
        $aantalBerekening = $this->aantalBerekenen($ingredient);        // Ophalen van aantalberkenening van hierboven
        $berekeningPreciesAantal = $boodschap["precies_aantal"] +$aantalBerekening;     // Hier tellen we de cell uit de DB van het precieze aantal bij de aantalberekening
        return($berekeningPreciesAantal);
    }

    // functies maken die worden gebruikt in de final functie --------------------------------------------------------------------------------------------------------

    // check of het artikel al op de lijst staat:
    private function artikelOpLijst($artikel_id, $user_id) {
        $boodschappen = $this->ophalenBoodschappen($user_id);       // Ophalen van de boodschappen tabel
        foreach ($boodschappen as $boodschap) {                     // Loop waar we door iedere rij van de tabel gaat genaamd $boodschap
            if($boodschap["artikel_id"] == $artikel_id) {           // Als het artikel_id van de boodschappen tabel aan het $artikel_id wat we in de functie invullen (en die weer uit $ingredient komt)
                return($boodschap);                                 // DAN returnen we die rij
            }                                                       // Anders gebeurd er niks
        }                                                           // blijf dat loopen totdat er geen nieuwe $boodschap rij is
        return FALSE;                                               
    }

    // toevoegen van artikelen
    private function toevoegenArtikel($ingredient, $user_id) {
        $artikel_id = $ingredient["artikel_id"];                        // We halen hier artikel_id op omdat we deze in de tabel gaan invullen

        $aantalBerekening = $this->aantalBerekenen($ingredient);        // Deze gaan we toevoegen in de kolom precies aantal
        $aantal = ceil($aantalBerekening);                              // Dit wordt het afgeronde aantal dat wordt ingevuld in de DB voor de eerste keer
        
        $sql = "INSERT INTO boodschappen (artikel_id, user_id, aantal, precies_aantal)
        VALUES($artikel_id, $user_id,  $aantal, $aantalBerekening)";
        $result = mysqli_query($this->connection, $sql);
    }

    // artikel bijwerken
    private function artikelBijwerken($boodschap, $ingredient) {
        $berekeningPreciesAantal = $this->preciesAantalUpdate($ingredient, $boodschap);     // Hier halen we het precieze aantal op
        $aantal = ceil($berekeningPreciesAantal);                       // Hier doen we dat ceilingen om het afgeronde aantal te krijgen

        $sql = "UPDATE boodschappen SET aantal = $aantal, precies_aantal = $berekeningPreciesAantal
        WHERE id = $boodschap[id]";                                     // aantal en precies aantal updaten in DB. deze where statement heb ik werkende gekregen, maar ik heb geen idee meer hoe dat werkt
        $result = mysqli_query($this->connection, $sql);
    }

    // Finale --------------------------------------------------------------------------------------------------------------------------------------------------------

    // final functie:
    public function boodschappenToevoegen($gerecht_id, $user_id) {
        $ingredienten = $this->selectIngredienten($gerecht_id);     // Ophalen van ingredienten
        foreach ($ingredienten as $ingredient) {                    // Loopen voor ieder ingredient
            $gevonden = $this->artikelOpLijst($ingredient["artikel_id"], $user_id);
        if(!$gevonden) {
            $this->toevoegenartikel($ingredient, $user_id);
        } else {
            $this->artikelBijwerken($gevonden, $ingredient);
        }
        } // Einde foreach functie
    } // Einde final public functie





    // Delete ALLE boodschappen functie 
    public function deleteAlleBoodschappen($user_id) {
        $sql = "DELETE FROM boodschappen WHERE user_id = $user_id";
        $result = mysqli_query($this->connection, $sql);
    }

    // Delete specifieke boodschappen functie 
    public function deleteSpecifiekeBoodschappen($user_id, $artikel_id) {
        $sql = "DELETE FROM boodschappen WHERE user_id = $user_id AND artikel_id = $artikel_id";
        $result = mysqli_query($this->connection, $sql);
    }
}





?>