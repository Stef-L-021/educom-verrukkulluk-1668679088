<?php

class ingredient {

    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    /*
    // selectie gerecht
    public function selecteerArtikel_id($gerecht_id){
        $sql = "select artikel_id from gerecht where id= $gerecht_id";
        return($sql);

        $result = mysqli_query($this->connection, $sql);
        $gerecht = mysqli_fetch_array($result, MYSQLI_ASSOC);

    }


    // Selectie methode met SQL van ingredient:
    private function selecteerIngredient($gerecht_id) {                 
        $sql = "select * from ingredient where id = $ingredient_id";

        $restult = mysqli_query($this->connection, $sql);
        $ingredient = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($ingredient);
    }
*/

    // selectie ingredient
    public function selecteerIngredient($gerecht_id){
        $sql = "select * from ingredient where id= $gerecht_id";

        $result = mysqli_query($this->connection, $sql);

            while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){

                
            }
            return($result);

        //$ingredient = mysqli_fetch_array($result, MYSQLI_ASSOC);
    }

    // select article 

/*
    private function selecteerIngredient($gerecht_id) {   
        $ingr = new ingredient($this->connection);
        $ingredient = $
    }
*/
}


?>