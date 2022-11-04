-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Lis 2022, 09:38
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `car_config`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `model_name` varchar(50) DEFAULT NULL,
  `base_price` decimal(20,2) DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `cars`
--

INSERT INTO `cars` (`id`, `model_name`, `base_price`, `img_src`) VALUES
(1, 'Golf', '65000.00', 'https://cutt.ly/7BHYePU'),
(2, 'ID.5', '228218.00', 'https://cutt.ly/yBHYdxZ');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `hex` char(7) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `colors`
--

INSERT INTO `colors` (`id`, `name`, `hex`, `price`) VALUES
(1, 'Srebrny \"Reflex\" Metalik', '#c2c5c9', '2300.00'),
(2, 'Żółty \"Lime yellow\" metalik', '#ddd544', '2300.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `colors_cars`
--

CREATE TABLE `colors_cars` (
  `id` int(11) NOT NULL,
  `id_car` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `colors_cars`
--

INSERT INTO `colors_cars` (`id`, `id_car`, `id_color`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `default_car`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `default_car` (
`id_car` int(11)
,`base_price` decimal(11,2)
,`model_name` varchar(50)
,`img_src` varchar(255)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `default_car_config`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `default_car_config` (
`id_car` int(11)
,`id_drive` int(11)
,`base_price` decimal(10,2)
,`id_color` int(11)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `drive`
--

CREATE TABLE `drive` (
  `id` int(11) NOT NULL,
  `emission` int(11) DEFAULT NULL,
  `fuel_consumption` decimal(5,2) DEFAULT NULL,
  `fuel_range` int(11) DEFAULT NULL,
  `fuel_comp_units` enum('l/100km','kWh/100km') DEFAULT NULL,
  `base_price` decimal(10,2) DEFAULT NULL,
  `id_engine` int(11) DEFAULT NULL,
  `id_gearbox` int(11) DEFAULT NULL,
  `id_car` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `drive`
--

INSERT INTO `drive` (`id`, `emission`, `fuel_consumption`, `fuel_range`, `fuel_comp_units`, `base_price`, `id_engine`, `id_gearbox`, `id_car`) VALUES
(1, 127, '5.58', 1000, 'l/100km', '111090.00', 1, 1, 1),
(2, 110, '4.21', 1200, 'l/100km', '118190.00', 2, 1, 1);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `drive_select_list`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `drive_select_list` (
`id` int(11)
,`emission` int(11)
,`fuel_consumption` decimal(5,2)
,`fuel_range` int(11)
,`fuel_comp_units` enum('l/100km','kWh/100km')
,`base_price` decimal(10,2)
,`fuelType` enum('petrol','diesel','electric','hybrid')
,`d_name` varchar(71)
,`power_kW` int(11)
,`power_KM` int(11)
,`hybrid_power` varchar(11)
,`id_car` int(11)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `engine`
--

CREATE TABLE `engine` (
  `id` int(11) NOT NULL,
  `fuelType` enum('petrol','diesel','electric','hybrid') DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `shortName` varchar(25) DEFAULT NULL,
  `power_kW` int(11) DEFAULT NULL,
  `power_KM` int(11) DEFAULT NULL,
  `torque_max` int(11) DEFAULT NULL,
  `torque_range_low` int(11) DEFAULT NULL,
  `torque_range_high` int(11) DEFAULT NULL,
  `hybrid_power` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `engine`
--

INSERT INTO `engine` (`id`, `fuelType`, `capacity`, `shortName`, `power_kW`, `power_KM`, `torque_max`, `torque_range_low`, `torque_range_high`, `hybrid_power`) VALUES
(1, 'petrol', 1498, '1.5 TSI EVO', 110, 150, 250, 1500, 3500, NULL),
(2, 'diesel', 1968, '2.0 TDI', 85, 116, 300, 1600, 2500, NULL),
(3, 'diesel', 1968, '2.0 TDI', 110, 150, 340, 1600, 3000, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gearbox`
--

CREATE TABLE `gearbox` (
  `id` int(11) NOT NULL,
  `speedNumber` int(11) DEFAULT NULL,
  `shortName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `gearbox`
--

INSERT INTO `gearbox` (`id`, `speedNumber`, `shortName`) VALUES
(1, 6, 'manual');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rims`
--

CREATE TABLE `rims` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `img_src` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura widoku `default_car`
--
DROP TABLE IF EXISTS `default_car`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `default_car`  AS SELECT `dcc`.`id_car` AS `id_car`, min(`dcc`.`base_price`) + (select ifnull(`colors`.`price`,0) from `colors` where `colors`.`id` = `dcc`.`id_color`) AS `base_price`, `c`.`model_name` AS `model_name`, `c`.`img_src` AS `img_src` FROM (`default_car_config` `dcc` join `cars` `c`) WHERE `dcc`.`id_car` = `c`.`id` GROUP BY `dcc`.`id_car``id_car`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `default_car_config`
--
DROP TABLE IF EXISTS `default_car_config`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `default_car_config`  AS SELECT `d`.`id_car` AS `id_car`, `d`.`id` AS `id_drive`, min(`d`.`base_price`) AS `base_price`, min(`cc`.`id_color`) AS `id_color` FROM (`drive` `d` left join `colors_cars` `cc` on(`d`.`id_car` = `cc`.`id_car`)) GROUP BY `d`.`id_car`, `d`.`id``id`  ;

-- --------------------------------------------------------

--
-- Struktura widoku `drive_select_list`
--
DROP TABLE IF EXISTS `drive_select_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `drive_select_list`  AS SELECT `d`.`id` AS `id`, `d`.`emission` AS `emission`, `d`.`fuel_consumption` AS `fuel_consumption`, `d`.`fuel_range` AS `fuel_range`, `d`.`fuel_comp_units` AS `fuel_comp_units`, `d`.`base_price` AS `base_price`, `e`.`fuelType` AS `fuelType`, concat(`e`.`shortName`,' - ',`g`.`speedNumber`,'-Speed ',`g`.`shortName`) AS `d_name`, `e`.`power_kW` AS `power_kW`, `e`.`power_KM` AS `power_KM`, ifnull(`e`.`hybrid_power`,'/()') AS `hybrid_power`, `d`.`id_car` AS `id_car` FROM ((`drive` `d` join `engine` `e`) join `gearbox` `g`) WHERE `d`.`id_engine` = `e`.`id` AND `d`.`id_gearbox` = `g`.`id``id`  ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `colors_cars`
--
ALTER TABLE `colors_cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_cc_car` (`id_car`),
  ADD KEY `FK_cc_color` (`id_color`);

--
-- Indeksy dla tabeli `drive`
--
ALTER TABLE `drive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_drive_engine` (`id_engine`),
  ADD KEY `fk_drive_gearbox` (`id_gearbox`),
  ADD KEY `fk_drive_car` (`id_car`);

--
-- Indeksy dla tabeli `engine`
--
ALTER TABLE `engine`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `gearbox`
--
ALTER TABLE `gearbox`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `rims`
--
ALTER TABLE `rims`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `colors_cars`
--
ALTER TABLE `colors_cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `drive`
--
ALTER TABLE `drive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `engine`
--
ALTER TABLE `engine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `gearbox`
--
ALTER TABLE `gearbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `rims`
--
ALTER TABLE `rims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `colors_cars`
--
ALTER TABLE `colors_cars`
  ADD CONSTRAINT `FK_cc_car` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `FK_cc_color` FOREIGN KEY (`id_color`) REFERENCES `colors` (`id`);

--
-- Ograniczenia dla tabeli `drive`
--
ALTER TABLE `drive`
  ADD CONSTRAINT `fk_drive_car` FOREIGN KEY (`id_car`) REFERENCES `cars` (`id`),
  ADD CONSTRAINT `fk_drive_engine` FOREIGN KEY (`id_engine`) REFERENCES `engine` (`id`),
  ADD CONSTRAINT `fk_drive_gearbox` FOREIGN KEY (`id_gearbox`) REFERENCES `gearbox` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
