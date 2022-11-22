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
                
                if ($record_type == 'O' || $record_type == 'F') {
                    $usr_id = $row["user_id"]; 
                    $user = $this->selectUser($usr_id);

                    $return[] = [
                        "id" => $row["id"],              // Gerecht_info id
                        "gerecht_id" => $row["gerecht_id"],
                        "record_type" => $row["record_type"],
                        "datum" => $row["datum"],
                        "nummeriekveld" => $row["nummeriekveld"],
                        "tekstveld" => $row["tekstveld"],
                        "user" => $user
                    ];

                } else {
                    $return[] = [
                        "id" => $row["id"],              // Gerecht_info id
                        "gerecht_id" => $row["gerecht_id"],
                        "record_type" => $row["record_type"],
                        "datum" => $row["datum"],
                        "nummeriekveld" => $row["nummeriekveld"],
                        "tekstveld" => $row["tekstveld"]
                    ];
                }
               
            } // einde Fetch array
    return($return);
    }

    /*

    // selectie user id met in gerecht_info tabel met invoer gerecht_id
    public function selecteerUsersId($gerecht_id, $record_type){
        $sql ="SELECT * FROM gerecht_info WHERE gerecht_id = $gerecht_id";
        $return = [];                                                      // returnt een array
        
        $result = mysqli_query($this->connection, $sql);

            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {

                $usr_id = $row["user_id"];
                
                echo "<pre>";
                // var_dump($row);     // in row zitten alle arrays van dat gerecht
                // tussen hier en return zit dus de fout
                
                $user = $this->selectUser($usr_id);

                $return[] = [

                    "id" => $row["id"],              // Gerecht_info id
                    "gerecht_id" => $row["gerecht_id"],
                    "record_type" => $row["record_type"],
                    "user_name" => $user["user_name"]
                ];
            } // einde Fetch array
    return($return);



    } // einde selecteerUsersId

    */




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

    } // Einde gerecht_info class
}

?>