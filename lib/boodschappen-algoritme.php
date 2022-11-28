<?

class boodschappen {
    public function __construct($connection) {
        $this->connection = $connection;
        $this->gerecht = new gerecht($connection); 
        $this->ingredient = new ingredient($connection);
    }

    // ophalen gerechten
    private function selectGerecht() {
        $data = $this->gerecht->selecteerGerecht($gerecht_id=NULL);
        return($data);
    }




    public function boodschappenToevoegen($gerecht_id, $user_id) {
        $ingredienten = $this->ingredient->selecteerIngredient($gerecht_id);        // normaal zou die in een private functie staan
        ArtikelOpLijst($ingredient->artikel_id, $user_id);

        if($ingredienten == $ingredient->artikel_id, $user_id) {
            
        }

    $sql="INSERT INTO ingredient (artikel_id, user_id)
    VALUES()";     
    }


}



?>