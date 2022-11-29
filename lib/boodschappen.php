<?

class boodschappen {
    public function __construct($connection) {
        $this->connection = $connection;
        $this->ingredient = new ingredient($connection);
    }

    // ophalen ingredienten
    private function selectIngredienten($gerecht_id) {
        $data = $this->ingredient->selecteerIngredient($gerecht_id);
        return($data);
        }

    public function boodschappenToevoegen($gerecht_id, $user_id) {
        $ingredienten = $this->ingredient->selecteerIngredient($gerecht_id);       
        //ArtikelOpLijst($ingredient->artikel_id, $user_id);
        // array maken  met alle ingredienten die niet is opgesplits in verschillende arrays


        //if($ingredienten == $ingredient->artikel_id, $user_id) {}
        return($ingredienten);
    }


} // EInde class



?>