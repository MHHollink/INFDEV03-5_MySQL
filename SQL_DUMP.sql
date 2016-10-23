-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 23 okt 2016 om 23:16
-- Serverversie: 10.1.13-MariaDB
-- PHP-versie: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `assignment`
--
CREATE DATABASE IF NOT EXISTS `assignment` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `assignment`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `postal_code` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `addresses`
--

INSERT INTO `addresses` (`postal_code`, `country`, `city`, `number`, `street`) VALUES
('3011WN', 'The Netherlands', 'Rotterdam', '107\r\n', 'Wijnhaven'),
('3207DB', 'The Netherlands', 'Spijkenisse', '32', 'Suze Groenewegstraat');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `degrees`
--

DROP TABLE IF EXISTS `degrees`;
CREATE TABLE `degrees` (
  `course` varchar(255) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `degrees`
--

INSERT INTO `degrees` (`course`, `level`, `school`) VALUES
('Informatica', 'Bachalor', 'Hogeschool Rotterdam');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `bsn` int(11) NOT NULL,
  `Headquarters_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `employees`
--

INSERT INTO `employees` (`bsn`, `Headquarters_name`, `name`, `surname`) VALUES
(215512455, NULL, 'Marcel', 'Hollink');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employee_has_degrees`
--

DROP TABLE IF EXISTS `employee_has_degrees`;
CREATE TABLE `employee_has_degrees` (
  `Employee_bsn` int(11) NOT NULL,
  `Degrees_course` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `employee_has_degrees`
--

INSERT INTO `employee_has_degrees` (`Employee_bsn`, `Degrees_course`) VALUES
(215512455, 'Informatica');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employee_has_position_in_project`
--

DROP TABLE IF EXISTS `employee_has_position_in_project`;
CREATE TABLE `employee_has_position_in_project` (
  `Project_id` int(11) NOT NULL,
  `Position_name` varchar(255) NOT NULL,
  `Employee_bsn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `employee_has_position_in_project`
--

INSERT INTO `employee_has_position_in_project` (`Project_id`, `Position_name`, `Employee_bsn`) VALUES
(2, 'Developer', 215512455),
(3, 'Lead Developer', 215512455);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `employee_lives_at_address`
--

DROP TABLE IF EXISTS `employee_lives_at_address`;
CREATE TABLE `employee_lives_at_address` (
  `isMain` bit(1) NOT NULL,
  `Employee_bsn` int(11) NOT NULL,
  `Address_postal_code` varchar(255) NOT NULL,
  `Address_country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `employee_lives_at_address`
--

INSERT INTO `employee_lives_at_address` (`isMain`, `Employee_bsn`, `Address_postal_code`, `Address_country`) VALUES
(b'1', 215512455, '3207DB', 'The Netherlands');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `headquarters`
--

DROP TABLE IF EXISTS `headquarters`;
CREATE TABLE `headquarters` (
  `name` varchar(255) NOT NULL,
  `rent` double DEFAULT NULL,
  `rooms` int(11) DEFAULT NULL,
  `Address_postal_code` varchar(255) DEFAULT NULL,
  `Address_country` varchar(255) DEFAULT NULL,
  `Project_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `headquarters`
--

INSERT INTO `headquarters` (`name`, `rent`, `rooms`, `Address_postal_code`, `Address_country`, `Project_id`) VALUES
('Hogeschool Rotterdam', 0, 2, '3011WN', 'The Netherlands', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `positions`
--

DROP TABLE IF EXISTS `positions`;
CREATE TABLE `positions` (
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fee_per_hour` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `positions`
--

INSERT INTO `positions` (`name`, `description`, `fee_per_hour`) VALUES
('Artist', 'Creator of graphical assets', 29),
('Designer', 'Creator of the UI''s', 17),
('Developer', 'team member of development team', 21),
('Lead Developer', 'Head of the development', 34);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `allocated_hours` int(11) DEFAULT NULL,
  `budget` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `projects`
--

INSERT INTO `projects` (`id`, `allocated_hours`, `budget`) VALUES
(1, 325, 152000),
(2, 420, 245000),
(3, 622, 488000);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`postal_code`,`country`);

--
-- Indexen voor tabel `degrees`
--
ALTER TABLE `degrees`
  ADD PRIMARY KEY (`course`);

--
-- Indexen voor tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`bsn`);

--
-- Indexen voor tabel `employee_has_degrees`
--
ALTER TABLE `employee_has_degrees`
  ADD PRIMARY KEY (`Employee_bsn`,`Degrees_course`),
  ADD UNIQUE KEY `UK_l0nq0bd2flyacy19gasytn7cd` (`Degrees_course`);

--
-- Indexen voor tabel `employee_has_position_in_project`
--
ALTER TABLE `employee_has_position_in_project`
  ADD PRIMARY KEY (`Project_id`,`Position_name`,`Employee_bsn`),
  ADD KEY `FKasytm5asap6xf0t3y92gkb7sy` (`Position_name`),
  ADD KEY `FK57unkwjp0tf9xi4kt4a08etc2` (`Employee_bsn`);

--
-- Indexen voor tabel `employee_lives_at_address`
--
ALTER TABLE `employee_lives_at_address`
  ADD PRIMARY KEY (`Employee_bsn`,`Address_postal_code`,`Address_country`),
  ADD KEY `FK9gw8b7texdpp5nruwg823si7w` (`Address_postal_code`,`Address_country`);

--
-- Indexen voor tabel `headquarters`
--
ALTER TABLE `headquarters`
  ADD PRIMARY KEY (`name`),
  ADD KEY `FKk1mwkrma3n3pb4tc0848wh4bn` (`Address_postal_code`,`Address_country`),
  ADD KEY `FK80v70efno5tr4nj30o8w6ns3h` (`Project_id`);

--
-- Indexen voor tabel `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`name`);

--
-- Indexen voor tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `employee_has_degrees`
--
ALTER TABLE `employee_has_degrees`
  ADD CONSTRAINT `FK1vtgl96unpn2oroeh9mgg9lkn` FOREIGN KEY (`Degrees_course`) REFERENCES `degrees` (`course`),
  ADD CONSTRAINT `FK1wyjs2w4p0yhi4xu2o5qaexlw` FOREIGN KEY (`Employee_bsn`) REFERENCES `employees` (`bsn`);

--
-- Beperkingen voor tabel `employee_has_position_in_project`
--
ALTER TABLE `employee_has_position_in_project`
  ADD CONSTRAINT `FK3e3yqd3xgx2008pbsa22buabt` FOREIGN KEY (`Project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `FK57unkwjp0tf9xi4kt4a08etc2` FOREIGN KEY (`Employee_bsn`) REFERENCES `employees` (`bsn`),
  ADD CONSTRAINT `FKasytm5asap6xf0t3y92gkb7sy` FOREIGN KEY (`Position_name`) REFERENCES `positions` (`name`);

--
-- Beperkingen voor tabel `employee_lives_at_address`
--
ALTER TABLE `employee_lives_at_address`
  ADD CONSTRAINT `FK4f5a6ah3gvaieh2mb8ll0q11n` FOREIGN KEY (`Employee_bsn`) REFERENCES `employees` (`bsn`),
  ADD CONSTRAINT `FK9gw8b7texdpp5nruwg823si7w` FOREIGN KEY (`Address_postal_code`,`Address_country`) REFERENCES `addresses` (`postal_code`, `country`);

--
-- Beperkingen voor tabel `headquarters`
--
ALTER TABLE `headquarters`
  ADD CONSTRAINT `FK80v70efno5tr4nj30o8w6ns3h` FOREIGN KEY (`Project_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `FKk1mwkrma3n3pb4tc0848wh4bn` FOREIGN KEY (`Address_postal_code`,`Address_country`) REFERENCES `addresses` (`postal_code`, `country`);
