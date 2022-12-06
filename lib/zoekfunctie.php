<?php
class zoekfunctie {
    private $connection;
    //private $gerecht;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function zoekfunctie($query) {
        $sql = "SELECT * FROM gerecht WHERE id IN (
            SELECT id FROM gerecht WHERE titel like '%$query%' 
            UNION
            SELECT gerecht_id FROM ingredient WHERE artikel_id IN (
                SELECT id from artikel WHERE naam LIKE '%$query%'
            )
        )";
        //echo $sql;
        $gevonden = [];
        $result = mysqli_query($this->connection, $sql);
        while($zoek = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $gevonden[] =$zoek;
        }
        return $gevonden;
    } // Einde Class

} // Einde class
?> 