<?php

class boodschappen {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
        $this->ingredient = new ingredient($connection);
    }

    // ophalen ingredienten
    private function selectIngredienten($gerecht_id) {
        $data = $this->ingredient->selecteerIngredient($gerecht_id);
        return($data);
        }

    public function boodschappenToevoegen($gerecht_id = NULL, $user_id) {
        $ingredienten = $this->selectIngredienten($gerecht_id);       
        //ArtikelOpLijst($ingredient->artikel_id, $user_id);
        // array maken  met alle ingredienten die niet is opgesplits in verschillende arrays

        $sql = "SELECT * FROM ingredient";
        if(!is_null($gerecht_id)) {
            $sql .=" WHERE gerecht_id= $gerecht_id";  
        }
        $ArtikelOpLijst = [];                                                    

        $result = mysqli_query($this->connection, $sql);                   

            while ($gerecht_id = mysqli_fetch_array($result, MYSQLI_ASSOC)) {     

                $ArtikelOpLijst = [
                    "ingredienten" => $ingredienten
                ];
            }
        //if($ingredienten == $ingredient->artikel_id, $user_id) {}
        return($ArtikelOpLijst);
    }


} // EInde class




?>