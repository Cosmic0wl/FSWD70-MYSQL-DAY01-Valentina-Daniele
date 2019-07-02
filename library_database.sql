-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 02, 2019 alle 13:10
-- Versione del server: 10.1.38-MariaDB
-- Versione PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_database`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(35) DEFAULT NULL,
  `author` varchar(35) DEFAULT NULL,
  `genre` varchar(35) DEFAULT NULL,
  `publischer` varchar(35) DEFAULT NULL,
  `book_language` varchar(35) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `FK_store` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book`
--

INSERT INTO `book` (`book_id`, `title`, `author`, `genre`, `publischer`, `book_language`, `price`, `FK_store`) VALUES
(1, 'Dracula', 'Bram Stoker', 'Horror', 'DeAgostini', 'English', 20.45, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `book_store`
--

CREATE TABLE `book_store` (
  `store_id` int(11) NOT NULL,
  `employees` varchar(35) DEFAULT NULL,
  `name` varchar(35) DEFAULT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book_store`
--

INSERT INTO `book_store` (`store_id`, `employees`, `name`, `opening_time`, `closing_time`) VALUES
(1, '3', 'BooKSuperShop', '08:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(35) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `FK_bookstore_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id_customer`, `name`, `address`, `FK_bookstore_id`) VALUES
(1, 'Valentina', 'Vienna', NULL);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `FK_store` (`FK_store`);

--
-- Indici per le tabelle `book_store`
--
ALTER TABLE `book_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `FK_bookstore_id` (`FK_bookstore_id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`FK_store`) REFERENCES `book_store` (`store_id`);

--
-- Limiti per la tabella `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`FK_bookstore_id`) REFERENCES `book_store` (`store_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
