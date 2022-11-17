<?php


class gerecht {


    public function selecteerGerecht() {

        $gerechten = [

            [   "id" => 1,
                "title" => "Spaghetti",
                "foto" => "https://www.inspiredtaste.net/wp-content/uploads/2019/03/Spaghetti-with-Meat-Sauce-Recipe-1-1200.jpg",
                "ingredienten" => [
                    ["id" => 1, "artikel_id" => 1, "gerecht_id" => 1, "naam" => "Pasta"],
                    ["id" => 2, "artikel_id" => 2, "gerecht_id" => 1, "naam" => "Saus"],
                    ["id" => 3, "artikel_id" => 3, "gerecht_id" => 1, "naam" => "Gehakt"],
                ]
            ],

            [   "id" => 2,
                "title" => "Bami",
                "foto" => "https://www.leukerecepten.nl/wp-content/uploads/2019/03/bami_v.jpg",
                "ingredienten" => [
                    ["id" => 4, "artikel_id" => 10, "gerecht_id" => 1, "naam" => "Mie nestjes"],
                    ["id" => 5, "artikel_id" => 12, "gerecht_id" => 1, "naam" => "Bami kruiden"],
                    ["id" => 6, "artikel_id" => 31, "gerecht_id" => 1, "naam" => "Hamblokjes"],
                ]
            ],
        ];


        return($gerechten);


    }



}
