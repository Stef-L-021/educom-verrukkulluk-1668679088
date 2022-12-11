-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 11 dec 2022 om 20:05
-- Serverversie: 10.4.25-MariaDB
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verrukkulluk`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `naam` varchar(30) NOT NULL,
  `omschrijving` varchar(30) NOT NULL,
  `prijs` int(11) NOT NULL,
  `eenheid` varchar(10) NOT NULL,
  `verpakking` int(11) NOT NULL,
  `calorieen` int(11) NOT NULL,
  `afbeelding` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`, `calorieen`, `afbeelding`) VALUES
(1, 'Vegan Burger Bun', 'bun', 200, 'broodjes', 6, 100, 'https://i.imgur.com/u1odQeZ.jpg'),
(2, 'Vegan Burger', 'blije koe', 300, 'gram', 500, 318, 'https://i.imgur.com/cvrCqGT.png'),
(3, 'Vegan Burger sauce', 'beste sauce', 250, 'ml', 500, 470, 'https://i.imgur.com/JBZ4fQR.jpg'),
(4, 'snoep tomaatjes', 'Vers uit de tuin', 199, 'gram', 250, 78, 'https://i.imgur.com/ujlhMHz.jpg'),
(5, 'Eieren', 'Vers uit de kip', 225, 'stuk(s)', 6, 0, 'https://i.imgur.com/pPqFQ4i.jpg'),
(6, 'broccoli ', 'groene bloemkool', 159, 'gram', 500, 318, 'https://i.imgur.com/dUEv3KL.jpg'),
(7, 'bloemkool', '', 189, 'stuk', 1, 65, 'https://i.imgur.com/PUvI0Bw.jpg'),
(8, 'Komkommer', '', 159, 'stuk', 1, 33, 'https://i.imgur.com/jFeeSfV.jpg'),
(9, 'Geschrapte worteltjes', '', 100, 'gram', 300, 99, 'https://i.imgur.com/erwNwWL.jpg'),
(10, 'sushi rice', '', 339, 'gram', 500, 1770, 'https://i.imgur.com/RsmZzFv.jpg'),
(11, 'sushi nori', 'Om om de sushi heen te doen', 245, 'gram', 14, 51, 'https://i.imgur.com/bqWeqrj.jpg'),
(12, 'avocado', 'Voor o.a. in de sushi', 139, 'stuk', 1, 0, 'https://i.imgur.com/R6RtZpu.jpg'),
(13, 'Pizza deeg', '', 199, 'gram', 230, 649, 'https://i.imgur.com/asUBX6h.jpg'),
(14, 'kaas', '', 399, 'gram', 400, 1420, 'https://i.imgur.com/9Sv8h7p.jpg'),
(15, 'Italiaanse kruiden', '', 149, 'gram', 12, 1, 'https://i.imgur.com/s5mP6MK.jpg'),
(16, 'tomaten puree', '', 49, 'gram', 70, 79, 'https://i.imgur.com/4Z1oanZ.jpg'),
(17, 'ijsbergsla', '', 99, 'krop', 1, 38, 'https://i.imgur.com/GTBdB3a.jpg'),
(18, 'tomaten', '', 179, 'gram', 500, 105, 'https://i.imgur.com/wnju8GR.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `boodschappen`
--

CREATE TABLE `boodschappen` (
  `id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `aantal` int(11) NOT NULL,
  `precies_aantal` float(12,9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `boodschappen`
--

INSERT INTO `boodschappen` (`id`, `artikel_id`, `user_id`, `aantal`, `precies_aantal`) VALUES
(136, 4, 6, 1, 0.800000012),
(137, 5, 6, 1, 0.666666687),
(138, 6, 6, 1, 0.800000012),
(139, 7, 6, 4, 4.000000000),
(140, 8, 6, 5, 5.000000000),
(141, 9, 6, 1, 0.666666687),
(142, 4, 5, 1, 0.200000003),
(143, 5, 5, 1, 0.166666672),
(144, 6, 5, 1, 0.200000003),
(145, 7, 5, 1, 1.000000000),
(146, 8, 5, 1, 1.000000000),
(147, 9, 5, 1, 0.166666672),
(148, 1, 6, 1, 0.166666672),
(149, 2, 6, 1, 0.400000006),
(150, 3, 6, 1, 0.059999999),
(151, 17, 6, 1, 1.000000000),
(152, 18, 6, 1, 0.100000001);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht`
--

CREATE TABLE `gerecht` (
  `id` int(11) NOT NULL,
  `keuken_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datum_toegevoegd` date NOT NULL DEFAULT current_timestamp(),
  `titel` varchar(50) NOT NULL,
  `korte_omschrijving` text NOT NULL,
  `lange_omschrijving` text NOT NULL,
  `afbeelding` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gerecht`
--

INSERT INTO `gerecht` (`id`, `keuken_id`, `type_id`, `user_id`, `datum_toegevoegd`, `titel`, `korte_omschrijving`, `lange_omschrijving`, `afbeelding`) VALUES
(1, 6, 9, 2, '2022-11-17', 'Eggs & Veggies', 'Eggs & veggies korte beschrijving', 'Eggggss en veggggieessss lange beschrijving', 'eggs_and_veggies.jpg'),
(2, 1, 8, 3, '2022-11-17', 'Vegan Burger', 'Een mooie Vegan burger', '', 'Vegan_Burger.jpg'),
(3, 5, 7, 3, '2022-11-17', 'Sushi Rolls', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur', '', 'Sushi_Rolls.jpg'),
(4, 2, 9, 4, '2022-11-17', 'Pizza Green', 'Nee de pizza is niet groen', '', 'Pizza_Green.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht_info`
--

CREATE TABLE `gerecht_info` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `datum` date NOT NULL DEFAULT current_timestamp(),
  `nummeriekveld` int(11) DEFAULT NULL,
  `tekstveld` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gerecht_info`
--

INSERT INTO `gerecht_info` (`id`, `record_type`, `gerecht_id`, `user_id`, `datum`, `nummeriekveld`, `tekstveld`) VALUES
(1, 'B', 1, NULL, '2022-11-17', 1, 'Pan in vlam'),
(2, 'B', 1, NULL, '2022-11-17', 2, 'Biem'),
(3, 'B', 1, NULL, '2022-11-17', 3, 'Biem'),
(4, 'B', 1, NULL, '2022-11-17', 4, 'Biem'),
(5, 'B', 1, NULL, '2022-11-17', 5, 'Biem'),
(6, 'O', 1, 1, '2022-11-17', NULL, 'Geweldig Joh'),
(7, 'W', 1, NULL, '2022-11-17', 5, NULL),
(8, 'F', 1, 1, '2022-11-17', NULL, NULL),
(24, 'F', 1, 2, '2022-11-17', NULL, NULL),
(25, 'B', 2, NULL, '2022-11-17', 1, 'pak ingredienten op stap 1.'),
(26, 'B', 2, NULL, '2022-11-17', 2, 'maak Hamburger stap 2'),
(27, 'B', 2, NULL, '2022-11-17', 3, 'maak Hamburger stap 3'),
(28, 'B', 2, NULL, '2022-11-17', 4, 'maak Hamburger stap 4'),
(29, 'B', 3, NULL, '2022-11-17', 1, 'Pak ingredienten op'),
(30, 'B', 3, NULL, '2022-11-17', 2, 'Maak Sushi stap 2'),
(31, 'B', 3, NULL, '2022-11-17', 3, 'Maak Sushi stap 3'),
(32, 'B', 3, NULL, '2022-11-17', 4, 'Maak Sushi stap 4'),
(33, 'B', 3, NULL, '2022-11-17', 5, 'Maak Sushi stap 5'),
(34, 'B', 4, NULL, '2022-11-17', 1, 'Pak ingredienten op voor pizza green stap 1'),
(35, 'B', 4, NULL, '2022-11-17', 2, 'Maak Pizza Green stap 2'),
(36, 'B', 4, NULL, '2022-11-17', 3, 'Maak Pizza Green stap 3'),
(37, 'B', 4, NULL, '2022-11-17', 4, 'Maak Pizza Green stap 4'),
(38, 'F', 1, 3, '2022-11-17', NULL, NULL),
(39, 'F', 2, 11, '2022-11-17', NULL, NULL),
(40, 'F', 2, 8, '2022-11-17', NULL, NULL),
(41, 'F', 3, 6, '2022-11-17', NULL, NULL),
(42, 'F', 3, 9, '2022-11-17', NULL, NULL),
(43, 'F', 3, 12, '2022-11-17', NULL, NULL),
(45, 'F', 4, 7, '2022-11-17', NULL, NULL),
(46, 'O', 2, 8, '2022-11-17', NULL, 'WueWueWueWueWue'),
(47, 'O', 3, 12, '2022-11-17', NULL, 'Oishiiii'),
(48, 'O', 1, 2, '2022-11-17', NULL, 'Veschrikkelijk.'),
(49, 'O', 4, 10, '2022-11-17', NULL, 'Goed.'),
(50, 'W', 1, NULL, '2022-11-17', 3, NULL),
(51, 'W', 1, NULL, '2022-11-17', 4, NULL),
(52, 'W', 1, NULL, '2022-11-17', 1, NULL),
(53, 'W', 1, NULL, '2022-11-17', 5, NULL),
(54, 'W', 2, NULL, '2022-11-17', 5, NULL),
(55, 'W', 2, NULL, '2022-11-17', 5, NULL),
(56, 'W', 2, NULL, '2022-11-17', 4, NULL),
(57, 'W', 3, NULL, '2022-11-17', 3, NULL),
(58, 'W', 3, NULL, '2022-11-17', 4, NULL),
(59, 'W', 3, NULL, '2022-11-17', 4, NULL),
(60, 'W', 4, NULL, '2022-11-17', 4, NULL),
(61, 'W', 4, NULL, '2022-11-17', 4, NULL),
(62, 'W', 4, NULL, '2022-11-17', 5, NULL),
(63, 'W', 4, NULL, '2022-11-17', 5, NULL),
(64, 'W', 4, NULL, '2022-11-17', 2, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `aantal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `ingredient`
--

INSERT INTO `ingredient` (`id`, `gerecht_id`, `artikel_id`, `aantal`) VALUES
(1, 2, 1, '1'),
(2, 2, 2, '200'),
(3, 2, 3, '30'),
(4, 1, 4, '50'),
(5, 1, 5, '1'),
(6, 1, 6, '100'),
(7, 1, 7, '1'),
(8, 1, 8, '1'),
(9, 1, 9, '50'),
(10, 2, 8, '1'),
(11, 2, 17, '1'),
(12, 2, 18, '50'),
(13, 3, 10, '100'),
(14, 3, 11, '7'),
(15, 3, 12, '1'),
(16, 3, 8, '1'),
(17, 4, 13, '70'),
(18, 4, 14, '40'),
(19, 4, 15, '2'),
(20, 4, 16, '70'),
(21, 4, 18, '200');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `omschrijving` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `keuken_type`
--

INSERT INTO `keuken_type` (`id`, `record_type`, `omschrijving`) VALUES
(1, 'K', 'Amerikaans'),
(4, 'K', 'Belgisch'),
(6, 'K', 'Engels'),
(3, 'K', 'Frans'),
(2, 'K', 'Italiaans'),
(5, 'K', 'Japans'),
(8, 'T', 'Vegan'),
(9, 'T', 'Vegetarisch'),
(7, 'T', 'Vis');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `afbeelding` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `afbeelding`) VALUES
(1, 'Tommie Tuup', 'Tommie123', 'tommietuup@mail.com', 'https://i.imgur.com/0aDkKot.jpg'),
(2, 'Bennie Blind', 'slechtwachtwoord111', 'Bennie44@email.com', 'https://i.imgur.com/7S4Emsl.jpg'),
(3, 'Sammy Suf', '3355152', 'ssuf@email.com', 'https://i.imgur.com/LOHKh2o.jpg'),
(4, 'Katinka Cool', 'etensite@553', 'Katinka@email.com', 'https://i.imgur.com/wMGfHX1.jpg'),
(5, 'Barry Biemsma', 'Barryyyyyy1', 'barry@email.com', 'https://i.imgur.com/rJAyM7L.jpg'),
(6, 'Ali Versprille', 'pinguin4', 'pingu@email.com', 'https://i.imgur.com/JDAspUo.jpg'),
(7, 'Brigitte Eren', 'Aquarius777', 'iqoahd@email.com', 'https://i.imgur.com/IrL1qtm.jpg'),
(8, 'Gumi', 'wuewuewue', 'wuegumi@email.com', 'https://i.imgur.com/rKldB3Q.jpg'),
(9, 'Eren Yeager', 'LongLiveParadise', 'eren@email.com', 'https://i.imgur.com/AUrrt8A.jpg'),
(10, 'Guts', 'GRIFFITHH', 'guts@email.com', 'https://i.imgur.com/oxlKgIv.jpg'),
(11, 'Geralt', 'Ciri', 'witcher@email.com', 'https://i.imgur.com/7VrpgRK.jpg'),
(12, 'Rena Ryuugu', 'USODA', 'Rena@email.com', 'https://i.imgur.com/Ft0wYiv.jpg');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `boodschappen`
--
ALTER TABLE `boodschappen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`);

--
-- Indexen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuken_id` (`keuken_id`),
  ADD KEY `keuken_type type` (`type_id`),
  ADD KEY `user` (`user_id`);

--
-- Indexen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`),
  ADD KEY `gerecht` (`gerecht_id`);

--
-- Indexen voor tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_type` (`record_type`,`omschrijving`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT voor een tabel `boodschappen`
--
ALTER TABLE `boodschappen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT voor een tabel `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT voor een tabel `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT voor een tabel `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `boodschappen`
--
ALTER TABLE `boodschappen`
  ADD CONSTRAINT `boodschappen_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`);

--
-- Beperkingen voor tabel `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `keuken_id` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `keuken_type type` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Beperkingen voor tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_id` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Beperkingen voor tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `artikel_id` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `gerecht` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
