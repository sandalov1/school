-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Апр 01 2020 г., 15:33
-- Версия сервера: 5.7.29-0ubuntu0.16.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `school`
--
CREATE DATABASE IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `school`;

-- --------------------------------------------------------

--
-- Структура таблицы `denb_nedeli`
--

DROP TABLE IF EXISTS `denb_nedeli`;
CREATE TABLE IF NOT EXISTS `denb_nedeli` (
  `id_Denb_Nedeli` int(11) NOT NULL AUTO_INCREMENT,
  `Denb_Nedeli` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Denb_Nedeli`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `denb_nedeli`
--

INSERT INTO `denb_nedeli` (`id_Denb_Nedeli`, `Denb_Nedeli`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота');

-- --------------------------------------------------------

--
-- Структура таблицы `kabinet`
--

DROP TABLE IF EXISTS `kabinet`;
CREATE TABLE IF NOT EXISTS `kabinet` (
  `id_Kabinet` int(11) NOT NULL,
  `Kabinet` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Kabinet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `kabinet`
--

INSERT INTO `kabinet` (`id_Kabinet`, `Kabinet`) VALUES
(1, '1'),
(2, '2'),
(5, '5'),
(6, '6'),
(8, '8'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27'),
(28, '28'),
(36, '36');

-- --------------------------------------------------------

--
-- Структура таблицы `klass`
--

DROP TABLE IF EXISTS `klass`;
CREATE TABLE IF NOT EXISTS `klass` (
  `id_Klass` int(11) NOT NULL AUTO_INCREMENT,
  `Nomer` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Klass`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `klass`
--

INSERT INTO `klass` (`id_Klass`, `Nomer`) VALUES
(1, '5А'),
(2, '5Б'),
(3, '6А'),
(4, '6Б'),
(5, '7А'),
(6, '7Б'),
(7, '8А'),
(8, '8Б'),
(9, '9А'),
(10, '9Б'),
(11, '10'),
(12, '11');

-- --------------------------------------------------------

--
-- Структура таблицы `predmet`
--

DROP TABLE IF EXISTS `predmet`;
CREATE TABLE IF NOT EXISTS `predmet` (
  `id_Predmet` int(11) NOT NULL AUTO_INCREMENT,
  `Predmet` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Predmet`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `predmet`
--

INSERT INTO `predmet` (`id_Predmet`, `Predmet`) VALUES
(1, 'Русский язык'),
(2, 'Математика'),
(3, 'Алгебра'),
(4, 'Геометрия'),
(5, 'Физика'),
(6, 'Химия'),
(7, 'Биология'),
(8, 'Английский язык'),
(9, 'Немецкий язык'),
(10, 'Технология'),
(11, 'Физическая культура'),
(12, 'Литература'),
(13, 'География'),
(14, 'ОБЖ'),
(15, 'Музыка'),
(16, 'История'),
(17, 'Обществознание'),
(18, 'Информатика');

-- --------------------------------------------------------

--
-- Структура таблицы `prepodavateli`
--

DROP TABLE IF EXISTS `prepodavateli`;
CREATE TABLE IF NOT EXISTS `prepodavateli` (
  `id_Prepodavatelya` int(11) NOT NULL AUTO_INCREMENT,
  `FIO` varchar(60) NOT NULL,
  `Predmet_1` int(11) NOT NULL,
  `Predmet_2` int(11) DEFAULT NULL,
  `Predmet_3` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Prepodavatelya`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prepodavateli`
--

INSERT INTO `prepodavateli` (`id_Prepodavatelya`, `FIO`, `Predmet_1`, `Predmet_2`, `Predmet_3`) VALUES
(1, 'Бычковская Елена Александровна', 11, NULL, NULL),
(2, 'Воронова Наталья Михайловна', 8, NULL, NULL),
(3, 'Губочкин Андрей Владимирович', 11, NULL, NULL),
(4, 'Свирина Вероника Олеговна', 8, 9, NULL),
(5, 'Забавнова Татьяна Юрьевна', 13, NULL, NULL),
(6, 'Заркова Наталья Петровна', 1, 12, NULL),
(7, 'Кабанова Лидия Васильевна', 10, NULL, NULL),
(8, 'Кремешкова Наталья Валерьевна', 2, 3, 4),
(9, 'Кукушкина Ольга Валентиновна', 1, 12, NULL),
(10, 'Ковалева Танзиля Наильевна', 14, NULL, NULL),
(11, 'Курхина Инесса Евгеньевна', 8, NULL, NULL),
(12, 'Кузьмина Людмила Вячеславовна', 18, NULL, NULL),
(13, 'Мовенко Сергей Иванович', 10, NULL, NULL),
(14, 'Малахова Надежда Николаевна', 5, NULL, NULL),
(15, 'Морозова Светлана Николаевна', 8, 9, NULL),
(16, 'Морозова Нина Викторовна', 16, 17, NULL),
(17, 'Низяева Наталья Владимировна', 16, NULL, NULL),
(18, 'Нехорошева Наталья Юрьевна', 1, 12, NULL),
(19, 'Пенкина Галина Евгеньевна', 2, 3, 4),
(20, 'Полякова  Юлия Дмитриевна', 8, NULL, NULL),
(21, 'Просандеева Елена Александровна', 15, NULL, NULL),
(22, 'Самосюк Лариса Николаевна', 1, 12, NULL),
(23, 'Случевская Елена Ивановна', 2, 3, 4),
(24, 'Галашан  Елизавета Николаевна', 6, NULL, NULL),
(25, 'Борунова Наталья Валентиновна', 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `raspisanie`
--

DROP TABLE IF EXISTS `raspisanie`;
CREATE TABLE IF NOT EXISTS `raspisanie` (
  `id_Raspisanie` int(11) NOT NULL AUTO_INCREMENT,
  `Day_Nedeli` int(11) NOT NULL,
  `Urok` int(11) NOT NULL,
  `Klass` int(11) NOT NULL,
  `R_Predmet` int(11) NOT NULL,
  `Kabinet` int(11) NOT NULL,
  `Prepodavatel` int(11) NOT NULL,
  PRIMARY KEY (`id_Raspisanie`),
  KEY `fk_Raspisanie_Den'_Nedeli_idx` (`Day_Nedeli`),
  KEY `fk_Raspisanie_Uroki1_idx` (`Urok`),
  KEY `fk_Raspisanie_Klass1_idx` (`Klass`),
  KEY `fk_Raspisanie_Kabinet1_idx` (`Kabinet`),
  KEY `fk_Raspisanie_Prepodavateli1_idx` (`Prepodavatel`),
  KEY `fk_Raspisanie_Predmet1_idx` (`R_Predmet`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `raspisanie`
--

INSERT INTO `raspisanie` (`id_Raspisanie`, `Day_Nedeli`, `Urok`, `Klass`, `R_Predmet`, `Kabinet`, `Prepodavatel`) VALUES
(11, 2, 2, 3, 7, 24, 25),
(12, 1, 1, 1, 8, 24, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `uroki`
--

DROP TABLE IF EXISTS `uroki`;
CREATE TABLE IF NOT EXISTS `uroki` (
  `id_Uroka` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Uroka` int(11) NOT NULL,
  PRIMARY KEY (`id_Uroka`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `uroki`
--

INSERT INTO `uroki` (`id_Uroka`, `Nom_Uroka`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
