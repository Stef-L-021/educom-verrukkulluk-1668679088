-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2022 at 09:15 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `naam` varchar(30) NOT NULL,
  `omschrijving` varchar(30) NOT NULL,
  `prijs` decimal(10,2) NOT NULL,
  `eenheid` varchar(10) NOT NULL,
  `verpakking` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `naam`, `omschrijving`, `prijs`, `eenheid`, `verpakking`) VALUES
(1, 'Vegan Burger Bun', 'bun', '2.00', 'broodjes', 6),
(2, 'Vegan Burger', 'blije koe', '3.00', 'gram', 500),
(3, 'Vegan Burger sauce', 'beste sauce', '2.50', 'ml', 500),
(4, 'snoep tomaatjes', 'Vers uit de tuin', '1.99', 'gram', 250),
(5, 'Eieren', 'Vers uit de kip', '2.25', 'stuk(s)', 6),
(6, 'broccoli ', 'groene bloemkool', '1.59', 'gram', 500),
(7, 'bloemkool', '', '1.89', 'stuk', 1),
(8, 'Komkommer', '', '1.59', 'stuk', 1),
(9, 'Geschrapte worteltjes', '', '1.00', 'gram', 300),
(10, 'sushi rice', '', '3.39', 'gram', 500),
(11, 'sushi nori', 'Om om de sushi heen te doen', '2.45', 'gram', 14),
(12, 'Avocado', 'Voor o.a. in de sushi', '1.39', 'stuk', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gerecht`
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
  `afbeelding` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gerecht`
--

INSERT INTO `gerecht` (`id`, `keuken_id`, `type_id`, `user_id`, `datum_toegevoegd`, `titel`, `korte_omschrijving`, `lange_omschrijving`, `afbeelding`) VALUES
(1, 6, 9, 2, '2022-11-17', 'Eggs & Veggies', 'Eggs & veggies korte beschrijving', 'Eggggss en veggggieessss lange beschrijving', ''),
(2, 1, 8, 3, '2022-11-17', 'Vegan Burger', '', '', ''),
(3, 5, 7, 3, '2022-11-17', 'Sushi Rolls', '', '', ''),
(4, 2, 9, 4, '2022-11-17', 'Pizza Green', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gerecht_info`
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
-- Dumping data for table `gerecht_info`
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
(15, 'F', 2, NULL, '2022-11-22', NULL, NULL),
(24, 'F', 1, 2, '2022-11-17', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `gerecht_id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `aantal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `gerecht_id`, `artikel_id`, `aantal`) VALUES
(1, 2, 1, '1'),
(2, 2, 2, '200'),
(3, 2, 3, '30'),
(4, 1, 4, '50'),
(5, 1, 5, '1'),
(6, 1, 6, '100'),
(7, 1, 7, '100'),
(8, 1, 8, '50'),
(9, 1, 9, '50');

-- --------------------------------------------------------

--
-- Table structure for table `keuken_type`
--

CREATE TABLE `keuken_type` (
  `id` int(11) NOT NULL,
  `record_type` varchar(1) NOT NULL,
  `omschrijving` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `keuken_type`
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `afbeelding` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `password`, `email`, `afbeelding`) VALUES
(1, 'Tommie Tuup', 'Tommie123', 'tommietuup@mail.com', ''),
(2, 'Bennie Blind', 'slechtwachtwoord111', 'Bennie44@email.com', ''),
(3, 'Sammy Suf', '3355152', 'ssuf@email.com', ''),
(4, 'Katinka Cool', 'etensite@553', 'Katinka@email.com', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD PRIMARY KEY (`id`),
  ADD KEY `keuken_id` (`keuken_id`),
  ADD KEY `keuken_type type` (`type_id`),
  ADD KEY `user` (`user_id`);

--
-- Indexes for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerecht_id` (`gerecht_id`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`),
  ADD KEY `gerecht` (`gerecht_id`);

--
-- Indexes for table `keuken_type`
--
ALTER TABLE `keuken_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_type` (`record_type`,`omschrijving`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gerecht`
--
ALTER TABLE `gerecht`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `keuken_type`
--
ALTER TABLE `keuken_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gerecht`
--
ALTER TABLE `gerecht`
  ADD CONSTRAINT `keuken_id` FOREIGN KEY (`keuken_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `keuken_type type` FOREIGN KEY (`type_id`) REFERENCES `keuken_type` (`id`),
  ADD CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `gerecht_info`
--
ALTER TABLE `gerecht_info`
  ADD CONSTRAINT `gerecht_id` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);

--
-- Constraints for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD CONSTRAINT `artikel_id` FOREIGN KEY (`artikel_id`) REFERENCES `artikel` (`id`),
  ADD CONSTRAINT `gerecht` FOREIGN KEY (`gerecht_id`) REFERENCES `gerecht` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
