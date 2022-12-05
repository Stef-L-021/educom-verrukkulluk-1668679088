<?php
class zoekfunctie {
    private $connection;
    //private $gerecht;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function zoekfunctie($query) {
        $sql = "SELECT * FROM gerecht WHERE titel like '%$query%'";
        echo $sql;
        $gevonden = [];
        $result = mysqli_query($this->connection, $sql);
        while($zoek = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
            $gevonden[] =$zoek;
        }
        return $gevonden;
    } // Einde Class

} // Einde class
?> 