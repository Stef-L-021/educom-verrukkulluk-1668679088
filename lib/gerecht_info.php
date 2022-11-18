<?php

class gerecht_info {
    private $connection;

    public function __construct($connection) {
        $this->connection = $connection;
    }

    public function selecteerGerecht_info($gerecht_info_id) {
        $sql = "select * from gerecht_info where id = $gerecht_info_id";

        $result = mysqli_query($this->connection, $sql);
        $gerecht_info = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($gerecht_info);
    }

    // functie voor het ophalen van de user bij O en F
    public function selecteerUserGerecht_info($gerecht_info_id) {
        // De main query zoekt de user_name in de user tabel met het user_id uit gerecht_info gevonden in de subquery
        $sql = "select user_name                                        
                from user
                where id =
                    (select user_id 
                    from gerecht_info 
                    where 
                        id = $gerecht_info_id
                        AND (record_type = 'O'
                        OR record_type = 'F')
                    )";

        $result = mysqli_query($this->connection, $sql);
        $gerecht_user_info = mysqli_fetch_array($result, MYSQLI_ASSOC);

        return($gerecht_user_info);

    }

    public function maxid() {
        
    }

    // methode addFavorite
    // Hier geven we de user op waarvoor het een favoriet wordt en het gerecht waarvoor
    public function addFavorite($gerecht_id, $user_id) { 

        $sql = "insert into gerecht_info (id, record_type, gerecht_id, user_id, datum)
        select MAX(id)+1, 'F', $gerecht_id, $user_id, CURDATE() from gerecht_info";
        
        // test of het werkt
        if ($this->connection->query($sql) === TRUE) {
            $last_id= $this->connection ->insert_id;                                        // zoekt wat de laatst toevoegde ID is
            echo "New record created successfully. Last inserted ID is: " . $last_id;       // geeft een success message samen met het laatst toegevoegde ID van de line erboven
          } else {
            echo "Error: " . $sql . "<br>" . $this->connection->error;                      // Geeft een error als er een fout plaatsvind tijdens het toevoegen van een favoriet
          }

    }

    // methode deleteFavorite 
    public function deleteFavorite($gerecht_id, $user_id) {
        $sql = "delete from gerecht_info 
        where gerecht_id= $gerecht_id AND user_id = $user_id";

        // test of het werkt
        if ($this->connection->query($sql) === TRUE) {
            echo "Record deleted successfully";
        } else {
            echo "Error: " . $sql . "<br>" . $this->connection->error;
        }
    }

} // Einde gerecht_info class

?>