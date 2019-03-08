-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 08. Mrz 2019 um 23:24
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_Vincenzo_Schiavone_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(11) NOT NULL,
  `bill_date` date DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL,
  `bill_status` char(10) DEFAULT NULL,
  `total_late_fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bill`
--

INSERT INTO `bill` (`bill_id`, `bill_date`, `total_amount`, `bill_status`, `total_late_fee`) VALUES
(1, '2019-03-02', 199, '0', 50),
(2, '0000-00-00', 299, '2', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `start_rent` date DEFAULT NULL,
  `end_rent` date DEFAULT NULL,
  `booking_status` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `booking`
--

INSERT INTO `booking` (`booking_id`, `start_rent`, `end_rent`, `booking_status`) VALUES
(1, '2019-03-01', '2019-03-06', '1'),
(2, '0000-00-00', '0000-00-00', '2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars`
--

CREATE TABLE `cars` (
  `cars_id` int(11) NOT NULL,
  `model` varchar(10) DEFAULT NULL,
  `mark` varchar(10) DEFAULT NULL,
  `availability` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cars`
--

INSERT INTO `cars` (`cars_id`, `model`, `mark`, `availability`) VALUES
(1, 'Mazda xl2', 'w-en 2010', 1),
(2, 'Toyota SUV', 'F-rt 2020', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_category`
--

CREATE TABLE `car_category` (
  `car_category_id` int(11) NOT NULL,
  `name` char(15) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `luggage` int(11) DEFAULT NULL,
  `costs_per_day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_category`
--

INSERT INTO `car_category` (`car_category_id`, `name`, `seats`, `luggage`, `costs_per_day`) VALUES
(1, 'Sport', 2, 2, 200),
(2, 'Family', 5, 8, 299);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` char(30) DEFAULT NULL,
  `last_Name` char(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `license_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_Name`, `address`, `email`, `phone`, `license_id`) VALUES
(1, 'Hans', 'Brinkamnn', 'Scheffelstr.29 1010 Wioen', 'hans@gmail.com', 1233445, '1'),
(2, 'Peter', 'Mustermann', 'Hieberstr.28 1011 Wien', 'peter@gmail.com', 123344556, '2');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `coverage_type` char(20) DEFAULT NULL,
  `cost_per_day` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `name`, `coverage_type`, `cost_per_day`) VALUES
(1, 'Allianz', 'VollKasko', 19),
(2, 'Carlianz', 'Teilkasko', 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `address` varchar(60) DEFAULT NULL,
  `name` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `address`, `name`) VALUES
(1, 'wiemannstr.67 1010 Wien', 'Airport Parking'),
(2, 'Pieperstr.20 1010 Wien', 'Bahnhof Parking');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indizes für die Tabelle `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`cars_id`);

--
-- Indizes für die Tabelle `car_category`
--
ALTER TABLE `car_category`
  ADD PRIMARY KEY (`car_category_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `insurance` (`insurance_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bill` (`bill_id`);

--
-- Constraints der Tabelle `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`cars_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`cars_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `car_category`
--
ALTER TABLE `car_category`
  ADD CONSTRAINT `car_category_ibfk_1` FOREIGN KEY (`car_category_id`) REFERENCES `cars` (`cars_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `cars` (`cars_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
