-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Creato il: Lug 22, 2022 alle 10:03
-- Versione del server: 5.7.34
-- Versione PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `nome` varchar(100) NOT NULL,
  `genere` varchar(50) NOT NULL,
  `trama` varchar(500) NOT NULL,
  `cast` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `film`
--

INSERT INTO `film` (`nome`, `genere`, `trama`, `cast`) VALUES
('lui è tornato', 'commedia', 'LUI è tornato.', '[]'),
('sono tornato', 'commedia', 'SONO tornato.', '[]');

-- --------------------------------------------------------

--
-- Struttura della tabella `posto`
--

CREATE TABLE `posto` (
  `codice` int(11) NOT NULL,
  `numero` varchar(3) NOT NULL,
  `codicesala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `posto`
--

INSERT INTO `posto` (`codice`, `numero`, `codicesala`) VALUES
(1, 'A1', 1),
(2, 'A2', 1),
(3, 'A3', 1),
(4, 'A4', 1),
(5, 'A5', 1),
(6, 'A6', 1),
(7, 'A7', 1),
(8, 'A8', 1),
(9, 'A9', 1),
(10, 'A10', 1),
(11, 'A1', 2),
(12, 'A2', 2),
(13, 'A3', 2),
(14, 'A4', 2),
(15, 'A5', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `prenotazione`
--

CREATE TABLE `prenotazione` (
  `codiceutente` int(11) NOT NULL,
  `codicespettacolo` int(11) NOT NULL,
  `codiceposto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prenotazione`
--

INSERT INTO `prenotazione` (`codiceutente`, `codicespettacolo`, `codiceposto`) VALUES
(3, 2, 11),
(2, 2, 12);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE `prodotto` (
  `nome` varchar(100) NOT NULL,
  `prezzo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `sala`
--

CREATE TABLE `sala` (
  `codice` int(11) NOT NULL,
  `piano` int(11) NOT NULL,
  `numeroposti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sala`
--

INSERT INTO `sala` (`codice`, `piano`, `numeroposti`) VALUES
(1, 1, 10),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `spettacolo`
--

CREATE TABLE `spettacolo` (
  `codice` int(11) NOT NULL,
  `nomefilm` varchar(100) NOT NULL,
  `iniziofilm` datetime NOT NULL,
  `finefilm` datetime NOT NULL,
  `codicesala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `spettacolo`
--

INSERT INTO `spettacolo` (`codice`, `nomefilm`, `iniziofilm`, `finefilm`, `codicesala`) VALUES
(1, 'sono tornato', '2022-07-23 16:00:00', '2022-07-23 18:00:00', 1),
(2, 'lui è tornato', '2022-07-23 16:00:00', '2022-07-23 18:00:00', 2),
(3, 'sono tornato', '2022-07-21 16:00:00', '2022-07-21 18:00:00', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE `utente` (
  `codice` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `datanascita` date NOT NULL,
  `permessi` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`codice`, `nome`, `cognome`, `email`, `password`, `datanascita`, `permessi`) VALUES
(1, 'giovanni', 'polizzi', 'giovanni@gmail.com', 'umama', '1990-07-11', 'u'),
(2, 'benito', 'mussolini', 'dux@gmail.com', 'boiachimolla', '1883-07-29', 'u'),
(3, 'adolfo', 'hilter', 'piccolofurher@gmail.com', 'alfurher', '1889-04-20', 'u');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `posto`
--
ALTER TABLE `posto`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `codicesala` (`codicesala`);

--
-- Indici per le tabelle `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD KEY `codiceutente` (`codiceutente`),
  ADD KEY `codicespettacolo` (`codicespettacolo`),
  ADD KEY `codiceposto` (`codiceposto`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`nome`);

--
-- Indici per le tabelle `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`codice`);

--
-- Indici per le tabelle `spettacolo`
--
ALTER TABLE `spettacolo`
  ADD PRIMARY KEY (`codice`),
  ADD KEY `nomefilm` (`nomefilm`),
  ADD KEY `codicesala` (`codicesala`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`codice`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `posto`
--
ALTER TABLE `posto`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la tabella `spettacolo`
--
ALTER TABLE `spettacolo`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `utente`
--
ALTER TABLE `utente`
  MODIFY `codice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `posto`
--
ALTER TABLE `posto`
  ADD CONSTRAINT `posto_ibfk_1` FOREIGN KEY (`codicesala`) REFERENCES `sala` (`codice`);

--
-- Limiti per la tabella `prenotazione`
--
ALTER TABLE `prenotazione`
  ADD CONSTRAINT `prenotazione_ibfk_2` FOREIGN KEY (`codiceutente`) REFERENCES `utente` (`codice`),
  ADD CONSTRAINT `prenotazione_ibfk_3` FOREIGN KEY (`codicespettacolo`) REFERENCES `spettacolo` (`codice`),
  ADD CONSTRAINT `prenotazione_ibfk_4` FOREIGN KEY (`codiceposto`) REFERENCES `posto` (`codice`);

--
-- Limiti per la tabella `spettacolo`
--
ALTER TABLE `spettacolo`
  ADD CONSTRAINT `spettacolo_ibfk_1` FOREIGN KEY (`nomefilm`) REFERENCES `film` (`nome`),
  ADD CONSTRAINT `spettacolo_ibfk_2` FOREIGN KEY (`codicesala`) REFERENCES `sala` (`codice`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
