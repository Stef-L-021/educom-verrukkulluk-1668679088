-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 31 dec 2022 om 18:49
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

DROP TABLE IF EXISTS artikel;
FLUSH TABLES artikel;
CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `naam` varchar(30) NOT NULL,
  `omschrijving` text NOT NULL,
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
(1, 'Vegan Burger Bun', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, do eiusmod tempor incidunt ut labore et dolore magna aliqua.', 200, 'broodje(s)', 6, 100, 'Vegan_Burger_Bun.jpg'),
(2, 'Vegan Burger', 'De vegan hamburger bun red is een echte eyecatcher. De groene kleur trekt meteen de aandacht. Het broodje bevat maar liefst meer dan 25% groente, is verlaagd in vet–, suiker- en zoutgehalte. Om het extra makkelijk te maken is het broodje voorgesneden en fully baked (klaar voor gebruik na ontdooien).', 300, 'gram', 500, 318, 'Vegan_Burger.png'),
(3, 'Vegan Burger Sauce', 'beste sauce', 250, 'ml', 500, 470, 'Vegan_Burger_Sauce.jpg'),
(4, 'Snoep Tomaatjes', 'Vers uit de tuin', 199, 'gram', 250, 78, 'Snoep_Tomaatjes.jpg'),
(5, 'Eieren', 'Vers uit de kip', 225, 'stuk(s)', 6, 0, 'Eieren.jpg'),
(6, 'Broccoli ', 'groene bloemkool', 159, 'gram', 500, 318, 'Broccoli.jpg'),
(7, 'Bloemkool', '', 189, 'stuk', 1, 65, 'Bloemkool.jpg'),
(8, 'Komkommer', '', 159, 'stuk', 1, 33, 'Komkommer.jpg'),
(9, 'Geschrapte Worteltjes', '', 100, 'gram', 300, 99, 'Geschrapte_Worteltjes.jpg'),
(10, 'Sushi Rice', '', 339, 'gram', 500, 1770, 'Sushi_Rice.jpg'),
(11, 'Sushi Nori', 'Om om de sushi heen te doen', 245, 'gram', 14, 51, 'Sushi _Nori.jpg'),
(12, 'Avocado', 'Voor o.a. in de sushi', 139, 'stuk', 1, 335, 'Avocado.jpg'),
(13, 'Pizza Deeg', '', 199, 'gram', 230, 649, 'Pizza_Deeg.jpg'),
(14, 'Kaas', '', 399, 'gram', 400, 1420, 'Kaas.jpg'),
(15, 'Italiaanse Kruiden', '', 149, 'gram', 12, 1, 'Italiaanse_Kruiden.jpg'),
(16, 'Tomaten Puree', '', 49, 'gram', 70, 79, 'Tomaten_Puree.jpg'),
(17, 'Ijsbergsla', '', 99, 'krop', 1, 38, 'Ijsbergsla.jpg'),
(18, 'Tomaten', '', 179, 'gram', 500, 105, 'Tomaten.jpg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `boodschappen`
--

DROP TABLE IF EXISTS boodschappen;
FLUSH TABLES boodschappen;
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
(455, 10, 6, 1, 0.600000024),
(456, 11, 6, 2, 1.500000000),
(457, 12, 6, 3, 3.000000000),
(458, 8, 6, 3, 3.000000000),
(516, 1, 5, 1, 0.666666687),
(517, 2, 5, 2, 1.600000024),
(518, 3, 5, 1, 0.239999995),
(519, 8, 5, 7, 7.000000000),
(520, 17, 5, 4, 4.000000000),
(521, 18, 5, 1, 0.400000006),
(522, 10, 5, 1, 0.600000024),
(523, 11, 5, 2, 1.500000000),
(524, 12, 5, 3, 3.000000000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht`
--

DROP TABLE IF EXISTS gerecht;
FLUSH TABLES gerecht;
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
(2, 1, 8, 3, '2022-11-17', 'Vegan Burger', 'Een mooie Vegan burger', 'veryyyy long beschrijving', 'Vegan_Burger.jpg'),
(3, 5, 7, 3, '2022-11-17', 'Sushi Rolls', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur', '  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam feugiat sem ac magna venenatis vehicula. Etiam sapien lorem, luctus sed efficitur non, euismod vel risus. Suspendisse finibus leo turpis, a egestas metus volutpat nec. In malesuada auctor lectus. Nunc id posuere orci. Nunc non arcu quis dolor lobortis dapibus a nec lorem. Integer congue arcu quis sodales mattis. Nunc euismod ex nisl, ac ultricies quam dignissim vel. Curabitur a porttitor erat. Nullam semper mattis est, quis egestas ex hendrerit sed.  Fusce varius a est id placerat. Nam sed augue vitae libero auctor dapibus. Maecenas ultrices non ipsum ut molestie. Nullam nulla diam, ultrices non dolor feugiat, ultrices pretium nulla. Vestibulum pharetra augue id est feugiat feugiat. Cras consequat leo velit, eget cursus elit pellentesque eget. Mauris aliquam maximus eros, ac tempus leo mollis nec. Aliquam erat volutpat. Suspendisse aliquet semper justo, eget maximus arcu dictum non. Aliquam congue nisi sem, sit amet fermentum nisi porttitor semper. Duis quam magna, cursus et sapien eu, tincidunt gravida lorem. In lobortis laoreet vehicula. Pellentesque quis laoreet quam, at viverra sapien. Quisque finibus gravida neque, ac fringilla mauris fermentum eget. Phasellus id leo consectetur, posuere dolor ut, viverra ex. Fusce a tortor dignissim, egestas sem sed, ultrices eros. ', 'Sushi_Rolls.jpg'),
(4, 2, 9, 4, '2022-11-17', 'Pizza Green', 'Nee de pizza is niet groen', '', 'Pizza_Green.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gerecht_info`
--

DROP TABLE IF EXISTS gerecht_info;
FLUSH TABLES gerecht_info;
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
(64, 'W', 4, NULL, '2022-11-17', 2, NULL),
(65, 'O', 2, 11, '2022-11-17', NULL, 'Hmmmmm.'),
(66, 'O', 2, 4, '2022-11-17', NULL, 'Yummi'),
(67, 'O', 3, 6, '2022-11-17', NULL, 'Echt Slecht...'),
(68, 'O', 3, 9, '2022-11-17', NULL, 'Heel lekker gerecht. Deed me denken aan mijn eerste trip naar de zee. Al mijn vrienden zijn dood :('),
(69, 'W', 3, NULL, '2022-12-21', 4, NULL),
(70, 'W', 4, NULL, '2022-12-21', 1, NULL),
(71, 'W', 4, NULL, '2022-12-21', 2, NULL),
(72, 'W', 4, NULL, '2022-12-21', 1, NULL),
(73, 'W', 4, NULL, '2022-12-21', 2, NULL),
(74, 'W', 4, NULL, '2022-12-21', 1, NULL),
(75, 'W', 3, NULL, '2022-12-21', 3, NULL),
(76, 'W', 3, NULL, '2022-12-21', 3, NULL),
(77, 'W', 3, NULL, '2022-12-21', 4, NULL),
(78, 'W', 3, NULL, '2022-12-21', 3, NULL),
(79, 'W', 4, NULL, '2022-12-21', 5, NULL),
(80, 'W', 4, NULL, '2022-12-21', 1, NULL),
(81, 'W', 4, NULL, '2022-12-21', 2, NULL),
(82, 'W', 3, NULL, '2022-12-21', 3, NULL),
(83, 'W', 1, NULL, '2022-12-21', 4, NULL),
(84, 'W', 3, NULL, '2022-12-21', 2, NULL),
(85, 'W', 2, NULL, '2022-12-21', 5, NULL),
(86, 'W', 2, NULL, '2022-12-21', 4, NULL),
(87, 'W', 2, NULL, '2022-12-22', 4, NULL),
(88, 'W', 2, NULL, '2022-12-22', 5, NULL),
(89, 'W', 1, NULL, '2022-12-23', 3, NULL),
(90, 'W', 1, NULL, '2022-12-23', 3, NULL),
(91, 'W', 1, NULL, '2022-12-23', 3, NULL),
(92, 'W', 1, NULL, '2022-12-23', 3, NULL),
(93, 'W', 1, NULL, '2022-12-23', 3, NULL),
(95, 'W', 2, NULL, '2022-12-23', 3, NULL),
(96, 'W', 2, NULL, '2022-12-23', 3, NULL),
(97, 'W', 2, NULL, '2022-12-27', 5, NULL),
(98, 'W', 4, NULL, '2022-12-27', 1, NULL),
(99, 'W', 4, NULL, '2022-12-27', 1, NULL),
(100, 'W', 2, NULL, '2022-12-27', 5, NULL),
(101, 'W', 2, NULL, '2022-12-27', 5, NULL),
(102, 'W', 2, NULL, '2022-12-27', 5, NULL),
(103, 'W', 2, NULL, '2022-12-27', 5, NULL),
(104, 'W', 1, NULL, '2022-12-27', 4, NULL),
(105, 'W', 1, NULL, '2022-12-27', 4, NULL),
(106, 'W', 1, NULL, '2022-12-27', 5, NULL),
(108, 'W', 2, NULL, '2022-12-28', 5, NULL),
(109, 'W', 2, NULL, '2022-12-28', 4, NULL),
(110, 'W', 3, NULL, '2022-12-28', 3, NULL),
(111, 'W', 3, NULL, '2022-12-28', 2, NULL),
(112, 'W', 2, NULL, '2022-12-29', 5, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredient`
--

DROP TABLE IF EXISTS ingredient;
FLUSH TABLES ingredient;
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

DROP TABLE IF EXISTS keuken_type;
FLUSH TABLES keuken_type;
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

DROP TABLE IF EXISTS user;
FLUSH TABLES user;
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
(1, 'Tommie Tuup', 'Tommie123', 'tommietuup@mail.com', 'Tommy_tuup.jpg'),
(2, 'Bennie Blind', 'slechtwachtwoord111', 'Bennie44@email.com', 'Benny_Blind.jpg'),
(3, 'Sammy Suf', '3355152', 'ssuf@email.com', 'Sammy_Suf.jpg'),
(4, 'Katinka Cool', 'etensite@553', 'Katinka@email.com', 'Katinka_Cool.jpg'),
(5, 'Barry Biemsma', 'Barryyyyyy1', 'barry@email.com', 'Barry_Biemsma.jpg'),
(6, 'Ali Versprille', 'pinguin4', 'pingu@email.com', 'Ali_Versprille.jpg'),
(7, 'Brigitte Eren', 'Aquarius777', 'iqoahd@email.com', 'Brigitte_Eren.jpg'),
(8, 'Gumi', 'wuewuewue', 'wuegumi@email.com', 'Gumi.jpg'),
(9, 'Eren Yeager', 'LongLiveParadise', 'eren@email.com', 'Eren_Yeager.jpg'),
(10, 'Guts', 'GRIFFITHH', 'guts@email.com', 'Guts.jpg'),
(11, 'Geralt', 'Ciri', 'witcher@email.com', 'Geralt.jpg'),
(12, 'Rena Ryuugu', 'USODA', 'Rena@email.com', 'Rena_Ryuugu.jpg');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=525;

--
-- AUTO_INCREMENT voor een tabel `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT voor een tabel `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

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
