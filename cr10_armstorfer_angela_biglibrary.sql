-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Feb 2018 um 13:00
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr10_armstorfer_angela_biglibrary`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_ID` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_ID`, `name`, `surname`) VALUES
(1, 'Satre', 'Jean-Paul'),
(2, 'Camus', 'Albert'),
(4, 'Sontag', 'Susan'),
(5, 'Davis', 'Miles'),
(6, 'Coltrane', 'John'),
(7, 'Jarmusch', 'Jim'),
(8, 'Bardem', 'Javier');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan_table`
--

CREATE TABLE `loan_table` (
  `loan_ID` int(10) UNSIGNED NOT NULL,
  `fk_user_ID` int(10) UNSIGNED NOT NULL,
  `fk_media_ID` int(10) UNSIGNED NOT NULL,
  `start_loan` date NOT NULL,
  `end_loan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `media_ID` int(10) UNSIGNED NOT NULL,
  `fk_author_ID` int(10) UNSIGNED NOT NULL,
  `fk_publisher_ID` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8_german2_ci NOT NULL,
  `ISBN` int(11) NOT NULL,
  `image` blob NOT NULL,
  `short_description` text COLLATE utf8_german2_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `media`
--

INSERT INTO `media` (`media_ID`, `fk_author_ID`, `fk_publisher_ID`, `title`, `ISBN`, `image`, `short_description`, `type`) VALUES
(1, 1, 1, 'Der Ekel', 349910581, 0x30, 'Für Antoine Roquentin, Einzelgänger und Außenseiter in einer Provinzstadt, verliert das Leben plötzlich seine Selbstverständlichkeit. Unnachsichtig um Selbsterforschung bemüht, versucht er seinem immer stärkeren Ekel vor Dingen und Menschen auf den Grund zu gehen. Die Erfahrungen, Empfindungen und Visionen des Helden dieses ersten und bedeutendsten Romans des Existentialismus gaben Anstöße zu einer neuen Lebensphilosophie, die bis heute nichts von ihrer Brisanz eingebüßt hat.', 'book'),
(2, 1, 1, 'Wahrheit und Existenz', 349922, 0x30, '\"Wahrheit und Existenz\" ist ein philosophischer Text aus dem Nachlaß Sartres. Das Werk, 1948 entstanden, blieb Fragment und wurde 1996 zum erstenmal auf deutsch veröffentlicht. Sartre setzt sich mit Heideggers Wahrheitsphilosophie auseinander. Ihm geht es nicht wie Heidegger um die Wahrheit des Seins, sondern um ihre Bedeutung in menschlichen Beziehungen.', 'book'),
(4, 2, 1, 'Der Fremde', 264599, 0x30, '«Mir wurde klar, dass ich das Gleichgewicht des Tages zerstört hatte, die außergewöhnliche Stille eines Strandes, an dem ich glücklich gewesen war. Da habe ich noch viermal auf einen leblosen Körper geschossen, in den die Kugeln eindrangen, ohne dass man es ihm ansah. Und es war wie vier kurze Schläge, mit denen ich an das Tor des Unglücks hämmerte.»\r\nDie Geschichte eines jungen Franzosen in Algerien, den ein lächerlicher Zufall zum Mörder macht, wurde 1942 im besetzten Frankreich zu einer literarischen Sensation. Der Roman bedeutete den schriftstellerischen Durchbruch für Albert Camus und gilt heute als einer der Haupttexte des Existenzialismus.', 'book'),
(5, 4, 2, 'Über Fotografie: Essays ', 132158, 0x30, 'Susan Sontag, 1933 in New York geboren, war Schriftstellerin, Film- und Theaterregisseurin. Weltbekannt wurde sie vor allem durch ihre Essays. Für ihren letzten Roman »In Amerika« wurde sie mit dem National Book Award ausgezeichnet. Sie erhielt den Jerusalem Book Prize und den Friedenspreis des Deutschen Buchhandels 2003. Susan Sonntag starb 2004 in New York.', 'book'),
(8, 5, 5, 'Kind of Blue', 125478, '', 'Kind of Blue ist ein Studioalbum des amerikanischen Trompeters Miles Davis. Es wurde am 2. März und am 22. April 1959 in New York aufgenommen und ist 1959 auf Columbia Records erschienen. Es gilt als Meilenstein in der Geschichte des Jazz. Die Musikzeitschrift Rolling Stone wählte das Album 2013 in seiner Liste Die 100 besten Jazz-Alben auf Platz 2.', 'cd'),
(9, 6, 5, 'A Love Supreme', 589743, '', 'A Love Supreme ist das berühmteste und erfolgreichste Studioalbum des Jazzsaxophonisten John Coltrane und wurde 1965 veröffentlicht. Das in Form einer Suite komponierte Album gilt bis heute als Coltranes Meisterwerk. Es will ein Loblied auf Gott sein und „stellte den – später sollte sich zeigen: vorläufigen – Schlusspunkt von Johns langer Forschungsreise in die Welten der Töne und des Geistes dar“ (Arrigo Polillo).', 'cd'),
(10, 8, 6, '21 Grams', 32587, '', 'Man sagt, dass 21 Gramm das Gewicht ist, das wir verlieren, wenn wir sterben. Das Gewicht von fünf Fünf-Cent-Stücken. Das Gewicht eines Kolibris. Das Gewicht eine Stücks Schokolade. Und vielleicht auch das Gewicht der Menschlichen Seele.\r\n\r\n21 Gramm zeigt das Leben dreier Personen, deren Schicksale sich durch einen dramatischen Unfall unwiderruflich verbinden. Der todkranke Paul hofft, dass ein Spenderherz sein Leben retten wird; die Ehefrau und Mutter Christina muss einen großen Verlust verkraften; und dem Ex-Strafgefangenen Jack wird erneut der Boden unter den Füßen weggerissen...', 'dvd'),
(11, 7, 6, 'Night on Earth', 134558, '', 'Night on Earth ist ein US-amerikanischer Episodenfilm von Jim Jarmusch, in dem fünf Geschichten erzählt werden. Die Geschichten geschehen an fünf Orten der Welt, alle in derselben Nacht, zur selben Zeit, jedoch in unterschiedlichen Zeitzonen. Die Städte sind Los Angeles, New York, Paris, Rom und Helsinki. In jeder der fünf Städte ist ein Taxifahrer bzw. eine Taxifahrerin unterwegs, der bzw. die in das Schicksal ihrer Fahrgäste eingreift oder deren Fahrgäste das Schicksal der Fahrer beeinflussen. ', 'dvd');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisher_ID` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `adress` varchar(100) COLLATE utf8_german2_ci NOT NULL,
  `size` varchar(10) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Daten für Tabelle `publisher`
--

INSERT INTO `publisher` (`publisher_ID`, `name`, `adress`, `size`) VALUES
(1, 'Rowohlt Taschenbuch Verlag', 'Hamburgerstraße 1', 'big'),
(2, 'Suhrkamp Verlag', 'Amselweg 7', 'big'),
(4, 'Fischer verlag', 'Großer Platz3', 'medium'),
(5, 'Sony Music', 'Broadway 10', 'big'),
(6, 'Prokino', 'Bavaria Studios', 'small');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_ID` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_german2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_german2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_german2_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_ID`),
  ADD UNIQUE KEY `author_ID` (`author_ID`);

--
-- Indizes für die Tabelle `loan_table`
--
ALTER TABLE `loan_table`
  ADD PRIMARY KEY (`loan_ID`),
  ADD UNIQUE KEY `loan_ID` (`loan_ID`),
  ADD KEY `fk_user_ID` (`fk_user_ID`),
  ADD KEY `fk_media_ID` (`fk_media_ID`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_ID`),
  ADD UNIQUE KEY `media_ID` (`media_ID`),
  ADD KEY `fk_author_ID` (`fk_author_ID`),
  ADD KEY `fk_publisher_ID` (`fk_publisher_ID`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_ID`),
  ADD UNIQUE KEY `publisher_ID` (`publisher_ID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_ID`),
  ADD UNIQUE KEY `user_ID` (`user_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `loan_table`
--
ALTER TABLE `loan_table`
  MODIFY `loan_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `media`
--
ALTER TABLE `media`
  MODIFY `media_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `loan_table`
--
ALTER TABLE `loan_table`
  ADD CONSTRAINT `loan_table_ibfk_1` FOREIGN KEY (`fk_user_ID`) REFERENCES `user` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loan_table_ibfk_2` FOREIGN KEY (`fk_media_ID`) REFERENCES `media` (`media_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`fk_author_ID`) REFERENCES `author` (`author_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `media_ibfk_2` FOREIGN KEY (`fk_publisher_ID`) REFERENCES `publisher` (`publisher_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
