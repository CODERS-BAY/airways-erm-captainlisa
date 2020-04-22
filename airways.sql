-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Apr 2020 um 14:26
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `airways`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aircraft`
--

CREATE TABLE `aircraft` (
  `registration_nr` int(11) NOT NULL,
  `airline_id` varchar(3) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `aircraft_nr` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `entry_into_service` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aircraft_type`
--

CREATE TABLE `aircraft_type` (
  `type_id` int(11) NOT NULL,
  `manufacturer` varchar(32) DEFAULT NULL,
  `aircraft_range` double DEFAULT NULL,
  `max_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airline`
--

CREATE TABLE `airline` (
  `airline_id` varchar(3) NOT NULL,
  `flight_plan_id` int(11) DEFAULT NULL,
  `company_name` varchar(32) DEFAULT NULL,
  `headquarters` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport`
--

CREATE TABLE `airport` (
  `airport_id` char(3) NOT NULL,
  `records_id` int(11) DEFAULT NULL,
  `flight_plan_id` int(11) DEFAULT NULL,
  `airport_name` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `aircraft_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `boarding_card`
--

CREATE TABLE `boarding_card` (
  `boarding_card_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `ticket_nr` int(11) DEFAULT NULL,
  `flight_id` varchar(10) DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `departure_airport` char(3) DEFAULT NULL,
  `destination_airport` char(3) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `seating_row` int(11) DEFAULT NULL,
  `seat` char(1) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `departure_airport` char(3) DEFAULT NULL,
  `destination_airport` char(3) DEFAULT NULL,
  `flight_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `distance_records`
--

CREATE TABLE `distance_records` (
  `records_id` int(11) NOT NULL,
  `departure_airport` char(3) DEFAULT NULL,
  `destination_airport` char(3) DEFAULT NULL,
  `distance` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight`
--

CREATE TABLE `flight` (
  `flight_id` varchar(10) NOT NULL,
  `flight_plan_id` int(11) DEFAULT NULL,
  `departure_airport` char(3) DEFAULT NULL,
  `arrival_airport` char(3) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `seats_available_first` int(11) DEFAULT NULL,
  `seats_avaiable_business` int(11) DEFAULT NULL,
  `seats_available_economy` int(11) DEFAULT NULL,
  `actual_departure` time DEFAULT NULL,
  `actual_arrival` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight_plan`
--

CREATE TABLE `flight_plan` (
  `flight_plan_id` int(11) NOT NULL,
  `flight_date` date DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `is_weekly` tinyint(1) DEFAULT NULL,
  `is_daily` tinyint(1) DEFAULT NULL,
  `on_weekdays` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passenger`
--

CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `salutation` varchar(5) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `ticket_nr` int(11) NOT NULL,
  `date_of_issue` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `sales_office` varchar(32) DEFAULT NULL,
  `num_of_flights` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`registration_nr`),
  ADD KEY `airline_id` (`airline_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indizes für die Tabelle `aircraft_type`
--
ALTER TABLE `aircraft_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indizes für die Tabelle `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`airline_id`),
  ADD KEY `flight_plan_id` (`flight_plan_id`);

--
-- Indizes für die Tabelle `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_id`),
  ADD KEY `records_id` (`records_id`),
  ADD KEY `flight_plan_id` (`flight_plan_id`);

--
-- Indizes für die Tabelle `boarding_card`
--
ALTER TABLE `boarding_card`
  ADD PRIMARY KEY (`boarding_card_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `ticket_nr` (`ticket_nr`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indizes für die Tabelle `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indizes für die Tabelle `distance_records`
--
ALTER TABLE `distance_records`
  ADD PRIMARY KEY (`records_id`);

--
-- Indizes für die Tabelle `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `flight_plan_id` (`flight_plan_id`);

--
-- Indizes für die Tabelle `flight_plan`
--
ALTER TABLE `flight_plan`
  ADD PRIMARY KEY (`flight_plan_id`);

--
-- Indizes für die Tabelle `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_nr`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `airline` (`airline_id`),
  ADD CONSTRAINT `aircraft_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `aircraft_type` (`type_id`);

--
-- Constraints der Tabelle `airline`
--
ALTER TABLE `airline`
  ADD CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`flight_plan_id`) REFERENCES `flight_plan` (`flight_plan_id`);

--
-- Constraints der Tabelle `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`records_id`) REFERENCES `distance_records` (`records_id`),
  ADD CONSTRAINT `airport_ibfk_2` FOREIGN KEY (`flight_plan_id`) REFERENCES `flight_plan` (`flight_plan_id`);

--
-- Constraints der Tabelle `boarding_card`
--
ALTER TABLE `boarding_card`
  ADD CONSTRAINT `boarding_card_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  ADD CONSTRAINT `boarding_card_ibfk_2` FOREIGN KEY (`ticket_nr`) REFERENCES `ticket` (`ticket_nr`),
  ADD CONSTRAINT `boarding_card_ibfk_3` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints der Tabelle `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`);

--
-- Constraints der Tabelle `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`flight_plan_id`) REFERENCES `flight_plan` (`flight_plan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
