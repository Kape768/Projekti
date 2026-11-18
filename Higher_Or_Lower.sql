-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Isäntä: db
-- Luontiaika: 18.11.2026 klo 09:51
-- Palvelimen versio: 8.0.46
-- PHP-versio 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Tietokanta: `Higher_Or_Lower`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `kategoria`
--

CREATE TABLE `kategoria` (
  `kategoria_id` int NOT NULL,
  `nimi` varchar(100) NOT NULL,
  `mittayksikkö` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Kohde`
--

CREATE TABLE `Kohde` (
  `kohde_id` int NOT NULL,
  `kategoria_id` int NOT NULL,
  `nimi` varchar(100) NOT NULL,
  `arvo` varchar(100) DEFAULT NULL,
  `kuva_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeksit taulukolle `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategoria_id`);

--
-- Indeksit taulukolle `Kohde`
--
ALTER TABLE `Kohde`
  ADD PRIMARY KEY (`kohde_id`),
  ADD KEY `fk_kohde_kategoria` (`kategoria_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `kategoria_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Kohde`
--
ALTER TABLE `Kohde`
  MODIFY `kohde_id` int NOT NULL AUTO_INCREMENT;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `Kohde`
--
ALTER TABLE `Kohde`
  ADD CONSTRAINT `fk_kohde_kategoria` FOREIGN KEY (`kategoria_id`) REFERENCES `kategoria` (`kategoria_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
