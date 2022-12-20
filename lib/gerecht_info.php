<?php

class gerecht_info {
    private $connection;
    private $usr;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->usr = new user ($connection);
    }

    // functie voor user_name
    private function selectUser($usr_id) {
        $data = $this->usr->selecteerUser($usr_id);       // Pak de functie selecteerUser uit user.php
        return($data);
    }


    // select 
    public function selecteerInfo($gerecht_id, $record_type) {
        $sql = "SELECT * FROM gerecht_info WHERE gerecht_id = $gerecht_id AND record_type = '$record_type'";
        $return = [];                                                      // returnt een array
        
        $result = mysqli_query($this->connection, $sql);

            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                $general_array = [];
                $user_array = [];

                $general_array = [
                    "id" => $row["id"],              // Gerecht_info id
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "datum" => $row["datum"],
                    "nummeriekveld" => $row["nummeriekveld"],
                    "tekstveld" => $row["tekstveld"],
                ];
                
                if ($record_type == 'O' || $record_type == 'F') {                   // If statement voor opmerkingen en favorieten
                    $usr_id = $row["user_id"];                                      // 
                    $user_array = $this->selectUser($usr_id);                       
                    // Hier zetten we de functie die we eerder hebben gemaakt en waarvan de data in user.php staat in de $user_array variable.
                    // Omdat in user.php SELECT * SQL wordt gebruikt krijgen we hier ook alles te zien uit de user tabel.

                } // Einde if statement 

                $return[] = $general_array + $user_array;

            } // einde Fetch array
    return($return);
    }

    // methode addFavorite
    // Hier geven we de user op waarvoor het een favoriet wordt en het gerecht waarvoor
    public function addFavorite($gerecht_id) { 

        if(!isset($gerecht_id)) return false;                               // Deze stopt de functie meteen als er geen correcte input is voordat het door de sql zou moeten.

        $sql = "insert into gerecht_info (record_type, gerecht_id)
        VALUES ('F', $gerecht_id)";    
        
        // test of het werkt
        return ($this->connection->query($sql));

    }

    // methode deleteFavorite 
    public function deleteFavorite($gerecht_id) {
        $sql = "delete from gerecht_info where gerecht_id= $gerecht_id";

        // test of het werkt
        return ($this->connection->query($sql));

    } 



    public function addWaardering($gerecht_id) {
        $waarde = 5;

        //// TOEVOEGEN WAARDE 
        $sql = "INSERT INTO gerecht_info (gerecht_id, record_type, nummeriekveld)
        VALUES ($gerecht_id, 'W', $waarde)";
        return ($this->connection->query($sql));
    }

    public function berekenGemiddelde($gerecht_id) {
        /// OPHALEN RATING
        

        $sql="SELECT nummeriekveld FROM gerecht_info WHERE record_type='W' AND gerecht_id=$gerecht_id";
        $result = mysqli_query($this->connection, $sql);

        while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $waarderingen[] = 
                $row["nummeriekveld"]
            ;
        }
        //echo "<pre>";
        //var_dump($waarderingen);

        //// BEREKEN GEMIDDELDE 
        $count= count($waarderingen);
        $sum = array_sum($waarderingen);
        $berekening=$sum/$count;
        return $berekening;
        }

    
} // Einde gerecht_info class

?>