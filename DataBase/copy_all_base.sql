-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 19 2016 г., 15:09
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `team`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(10) NOT NULL,
  `id_tracks` int(10) NOT NULL,
  `length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `blocks`
--

INSERT INTO `blocks` (`id`, `id_tracks`, `length`) VALUES
(1, 1, '00:03:35'),
(1, 2, '00:04:12'),
(1, 3, '00:02:17'),
(1, 4, '00:03:40'),
(1, 5, '00:03:26'),
(2, 12, '00:03:42'),
(2, 13, '00:05:39'),
(2, 14, '00:04:09'),
(3, 44, '00:03:17'),
(3, 45, '00:03:44'),
(3, 46, '00:03:50'),
(3, 47, '00:03:51'),
(3, 48, '00:03:30'),
(3, 49, '00:04:07'),
(3, 50, '00:03:24'),
(3, 51, '00:03:38');

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `event_type_id` int(2) NOT NULL,
  `dscr` varchar(100) NOT NULL,
  `user_id` int(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `event_type_id` (`event_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `event_type_id`, `dscr`, `user_id`, `time`) VALUES
(1, 1, 'Создание пользователя с логином: KIRILL', 2, '2016-12-17 12:00:00'),
(2, 1, 'Создание пользователя с логином: KONFETKA', 3, '2016-12-17 12:00:00'),
(3, 1, 'Создание пользователя с логином: ALEX', 4, '2016-12-17 12:00:00'),
(4, 1, 'Создание пользователя с логином: ARTEM', 5, '2016-12-17 12:00:00'),
(5, 1, 'Создание пользователя с логином: BARZENKA', 6, '2016-12-17 12:00:00'),
(6, 4, 'Радиостанции с id: 1 поставленна оценка', 30, '2016-11-12 14:00:00'),
(7, 4, 'Радиостанции с id: 2 поставленна оценка', 27, '2016-11-14 14:00:00'),
(8, 4, 'Радиостанции с id: 3 поставленна оценка', 40, '2016-11-11 14:00:00'),
(9, 4, 'Радиостанции с id: 6 поставленна оценка', 68, '2016-11-11 14:00:00'),
(10, 4, 'Радиостанции с id: 7 поставленна оценка', 28, '2016-11-16 14:00:00'),
(11, 8, 'Внесение записи в очередь.', 2, '2016-12-16 14:00:00'),
(12, 8, 'Внесение записи в очередь.', 2, '2016-12-16 14:00:00'),
(13, 8, 'Внесение записи в очередь.', 3, '2016-12-16 14:00:00'),
(14, 8, 'Внесение записи в очередь.', 6, '2016-12-16 14:00:00'),
(15, 8, 'Внесение записи в очередь.', 3, '2016-12-16 14:00:00'),
(16, 6, 'Созданна новая денежная операция', 2, '2016-12-16 13:00:00'),
(17, 6, 'Созданна новая денежная операция', 3, '2016-12-16 13:00:00'),
(18, 6, 'Созданна новая денежная операция', 27, '2016-12-13 14:00:00'),
(19, 6, 'Созданна новая денежная операция', 55, '2016-12-16 08:00:00'),
(20, 6, 'Созданна новая денежная операция', 72, '2016-12-16 13:15:00');

-- --------------------------------------------------------

--
-- Структура таблицы `events_type`
--

CREATE TABLE IF NOT EXISTS `events_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `events_type`
--

INSERT INTO `events_type` (`id`, `name`) VALUES
(1, 'Создание пользователя'),
(2, 'Изменение данных пользователя'),
(3, 'Вход в систему'),
(4, 'Проставление оценки радиостанции'),
(5, 'Изменение оценки радиостанции'),
(6, 'Создание денежной операции'),
(7, 'Изменение денежной операции'),
(8, 'Создание записи в очереди'),
(9, 'Изменение записи в очереди');

-- --------------------------------------------------------

--
-- Структура таблицы `marks`
--

CREATE TABLE IF NOT EXISTS `marks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `number` int(2) NOT NULL,
  `radiost_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `marks`
--

INSERT INTO `marks` (`id`, `date`, `number`, `radiost_id`, `user_id`) VALUES
(1, '2016-11-11 14:00:00', 4, 1, 27),
(2, '2016-11-12 14:00:00', 5, 1, 30),
(3, '2016-11-15 14:00:00', 9, 1, 41),
(4, '2016-11-16 14:00:00', 6, 1, 74),
(5, '2016-11-11 14:00:00', 5, 2, 70),
(6, '2016-11-14 14:00:00', 4, 2, 27),
(7, '2016-11-13 14:00:00', 8, 2, 35),
(8, '2016-11-14 14:00:00', 3, 3, 55),
(9, '2016-11-11 14:00:00', 4, 3, 52),
(10, '2016-11-14 14:00:00', 7, 6, 51),
(11, '2016-11-11 14:00:00', 4, 6, 68),
(12, '2016-11-12 14:00:00', 5, 6, 63),
(13, '2016-11-15 14:00:00', 9, 6, 33),
(14, '2016-11-16 14:00:00', 6, 7, 28),
(15, '2016-11-11 14:00:00', 5, 8, 30),
(16, '2016-11-14 14:00:00', 4, 9, 37),
(17, '2016-11-13 14:00:00', 8, 10, 45),
(18, '2016-11-14 14:00:00', 3, 1, 50),
(19, '2016-11-11 14:00:00', 4, 3, 40),
(20, '2016-11-14 14:00:00', 7, 2, 29);

-- --------------------------------------------------------

--
-- Структура таблицы `radiost`
--

CREATE TABLE IF NOT EXISTS `radiost` (
  `id` int(10) NOT NULL,
  `longname` varchar(100) NOT NULL,
  `radiost_type` int(2) NOT NULL,
  `available_song` int(10) NOT NULL,
  `available_months` int(10) NOT NULL,
  `fromdate` date DEFAULT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `radiost`
--

INSERT INTO `radiost` (`id`, `longname`, `radiost_type`, `available_song`, `available_months`, `fromdate`, `user_id`) VALUES
(1, 'ROCK FM', 1, 10, 0, NULL, 2),
(2, 'Радио Hip Hop', 1, 10, 0, NULL, 2),
(3, 'Радио Попса', 1, 5, 0, NULL, 3),
(4, 'Русское FM', 1, 2, 0, NULL, 5),
(5, 'Хорошее.FM', 1, 3, 0, NULL, 2),
(6, 'Русский хит', 1, 15, 0, NULL, 6),
(7, 'Радио Прибой', 1, 7, 0, NULL, 15),
(8, 'Black Star Radio', 1, 3, 0, NULL, 5),
(9, 'Радио Лучшие Песни', 1, 5, 0, NULL, 3),
(10, 'HR Radio', 1, 5, 0, NULL, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `radiost_type`
--

CREATE TABLE IF NOT EXISTS `radiost_type` (
  `id` int(10) NOT NULL,
  `longname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `radiost_type`
--

INSERT INTO `radiost_type` (`id`, `longname`) VALUES
(1, 'Полный доступ'),
(2, 'Ограничение по песням'),
(3, 'Ограничение по времени');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `longname` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `create_users` int(1) NOT NULL DEFAULT '0',
  `rewrite_users` int(1) NOT NULL DEFAULT '0',
  `del_users` int(1) NOT NULL DEFAULT '0',
  `create_schedule` int(1) NOT NULL DEFAULT '0',
  `rewrite_schedule` int(1) NOT NULL DEFAULT '0',
  `del_schedule` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `longname`, `code`, `create_users`, `rewrite_users`, `del_users`, `create_schedule`, `rewrite_schedule`, `del_schedule`) VALUES
(1, 'Администратор', 'admin', 1, 1, 1, 1, 1, 1),
(2, 'Владелец Радио', 'owner', 0, 0, 0, 1, 1, 1),
(3, 'Слушатель', 'listener', 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `mark_avg` int(2) NOT NULL,
  `sale` int(2) NOT NULL,
  `dscr` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `mark_avg`, `sale`, `dscr`) VALUES
(1, 5, 3, 'Базовая скидка'),
(2, 6, 5, 'Продвинутая скидка'),
(3, 7, 10, 'Расширенная скидка'),
(4, 9, 20, 'Отличнику радиовыпуска');

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_schedule_type` int(2) NOT NULL,
  `radiost_id` int(2) NOT NULL,
  `fromdate` datetime NOT NULL,
  `todate` datetime NOT NULL,
  `id_song` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id`, `id_schedule_type`, `radiost_id`, `fromdate`, `todate`, `id_song`) VALUES
(1, 1, 2, '2016-12-20 16:00:00', '2016-12-20 16:17:10', 1),
(2, 2, 2, '2016-12-20 16:17:10', '2016-12-20 16:23:13', 9),
(3, 2, 2, '2016-12-20 16:23:13', '2016-12-20 16:27:41', 10),
(4, 2, 2, '2016-12-20 16:27:41', '2016-12-20 16:31:49', 11),
(5, 1, 5, '2016-12-20 19:00:00', '2016-12-20 19:13:30', 2),
(6, 2, 9, '2016-12-20 19:13:30', '2016-12-20 19:16:49', 22),
(7, 2, 9, '2016-12-20 19:16:49', '2016-12-20 19:21:42', 23),
(8, 2, 9, '2016-12-20 19:21:42', '2016-12-20 19:26:26', 24),
(9, 1, 6, '2016-12-20 08:00:00', '2016-12-20 08:29:21', 3),
(10, 2, 6, '2016-12-20 08:29:21', '2016-12-20 08:32:22', 59),
(11, 2, 6, '2016-12-20 08:32:22', '2016-12-20 08:35:41', 60),
(12, 2, 6, '2016-12-20 08:35:41', '2016-12-20 08:39:08', 61),
(13, 2, 6, '2016-12-20 08:39:08', '2016-12-20 08:42:36', 62),
(14, 2, 6, '2016-12-20 08:42:36', '2016-12-20 08:47:05', 63),
(15, 2, 6, '2016-12-20 08:47:05', '2016-12-20 08:51:03', 52),
(16, 2, 6, '2016-12-20 08:51:03', '2016-12-20 08:54:38', 53),
(17, 2, 10, '2016-12-20 08:54:38', '2016-12-20 08:58:20', 26),
(18, 2, 10, '2016-12-20 08:58:20', '2016-12-20 09:01:51', 27),
(19, 2, 10, '2016-12-20 09:01:51', '2016-12-20 09:04:23', 28),
(20, 2, 10, '2016-12-20 09:04:23', '2016-12-20 09:07:35', 29);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule_type`
--

CREATE TABLE IF NOT EXISTS `schedule_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `schedule_type`
--

INSERT INTO `schedule_type` (`id`, `name`) VALUES
(1, 'Блок'),
(2, 'Трек');

-- --------------------------------------------------------

--
-- Структура таблицы `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `length` time NOT NULL,
  `radiost_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `tracks`
--

INSERT INTO `tracks` (`id`, `name`, `length`, `radiost_id`) VALUES
(1, '25/17 - Голова, чтобы думать', '00:03:35', 2),
(2, '25/17 - Пар', '00:04:12', 2),
(3, '25/17 - Свет', '00:02:17', 2),
(4, '25/17 - Новый вирус', '00:03:40', 2),
(5, '25/17 - Под цыганским солнцем', '00:03:26', 2),
(6, 'AC/DC - Cherry Pie', '00:03:23', 1),
(7, 'AC/DC - Highway to Hell', '00:03:33', 1),
(8, 'AC/DC - Shake it', '00:05:24', 1),
(9, 'Eminem - Rap God', '00:06:03', 2),
(10, 'Eminem - My Name Is', '00:04:28', 2),
(11, 'Eminem - Just lose it', '00:04:08', 2),
(12, 'Gorillaz - Feel Good', '00:03:42', 5),
(13, 'Gorillaz - Clint Eastwood', '00:05:39', 5),
(14, 'Gorillaz - Rock the house', '00:04:09', 5),
(15, 'James Brown -I Feel Good', '00:04:47', 7),
(16, 'Kanye West - Monster', '00:06:18', 7),
(17, 'Kanye West - Tell Me Nothing', '00:04:07', 7),
(18, 'Lil Wayne - Sucker for pain', '00:04:20', 2),
(19, 'Linkin Park - Numb', '00:03:07', 1),
(20, 'Ludacris - Act a fool', '00:04:30', 7),
(21, 'Madcon - Beggin', '00:03:39', 3),
(22, 'Michael Jackson - Black Or White', '00:03:19', 9),
(23, 'Michael Jackson - Billie Jean', '00:04:53', 9),
(24, 'Michael Jackson - They do not care about us', '00:04:44', 9),
(25, 'Nirvana - Smels Like Teen Spirit', '00:05:27', 1),
(26, 'Noize MC - Нету паспорта', '00:03:42', 10),
(27, 'Noize MC - ТыщаТыщ', '00:03:31', 10),
(28, 'Noize MC - Мое море', '00:02:32', 10),
(29, 'Noize MC - Выдыхай', '00:03:12', 10),
(30, 'Pitbull - I know you want me', '00:03:48', 8),
(31, 'Pitbull - Rain over me', '00:03:38', 8),
(32, 'Pitbull - Tonight', '00:04:06', 8),
(33, 'Queen - We Will Rock You', '00:02:02', 1),
(34, 'Quest Pistols - Жаркие танцы', '00:03:00', 3),
(35, 'Ricky Martin - Living la vida loca', '00:04:03', 3),
(36, 'Salt-N-Pepa - Shoop', '00:04:01', 7),
(37, 'Ray Charles - Hit The Road Jack', '00:01:53', 7),
(38, 'Skillet - Awake And Alive', '00:03:31', 1),
(39, 'Skillet - Monster', '00:02:59', 1),
(40, 'Sugababes - In the middle', '00:03:52', 7),
(41, 'The Black Strobe - I am a Man', '00:04:34', 1),
(42, 'The Offspring - Pretty Fly', '00:03:06', 1),
(43, 'Twenty One Pilots - Heathens', '00:03:15', 2),
(44, 'Бандэрос - Бум Сеньорита', '00:03:17', 6),
(45, 'БандЭрос - Адьос', '00:03:44', 6),
(46, 'БандЭрос - Наоми я бы кэмпбел', '00:03:50', 6),
(47, 'БандЭрос - Не зарекайся', '00:03:51', 6),
(48, 'БандЭрос - Коламбия пикчерс не представляет', '00:03:30', 6),
(49, 'Градусы - Голая', '00:04:07', 6),
(50, 'Градусы - Кто Ты', '00:03:24', 6),
(51, 'Градусы - Режиссер', '00:03:38', 6),
(52, 'Каста - Россиянце и Американе', '00:03:58', 6),
(53, 'Каста - Вокруг Шум', '00:03:35', 6),
(54, 'Король И Шут - Мертвый Анархист', '00:04:07', 2),
(55, 'Король и Шут - Некромант', '00:02:43', 2),
(56, 'Красная Плесень - Если Хочешь Нажраться', '00:02:31', 10),
(57, 'Ляпис Трубецкой - Железный', '00:03:16', 3),
(58, 'Ляпис Трубецкой - Манифест', '00:03:47', 3),
(59, 'Макс Корж - Белый туман', '00:03:01', 6),
(60, 'Макс Корж - Мотылек', '00:03:19', 6),
(61, 'Макс Корж - Небо поможет нам', '00:03:27', 6),
(62, 'Макс Корж - Тает дым', '00:03:28', 6),
(63, 'Макс Корж - Эндорфин', '00:04:29', 6),
(64, 'Наутилус Помпилиус - Крылья', '00:03:45', 9),
(65, 'Наутилус Помпилиус - Падший ангел', '00:03:41', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `trndtl`
--

CREATE TABLE IF NOT EXISTS `trndtl` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `incomfl` int(1) NOT NULL,
  `dscr` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`),
  KEY `users_id` (`user_id`,`time`,`incomfl`),
  KEY `id_3` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `trndtl`
--

INSERT INTO `trndtl` (`id`, `amount`, `user_id`, `time`, `incomfl`, `dscr`) VALUES
(1, 100, 2, '2016-12-16 13:00:00', 1, 'Внесение наличных'),
(2, 50, 2, '2016-12-16 13:30:00', 0, 'Оплата радио'),
(3, 200, 3, '2016-12-16 13:00:00', 1, 'Внесение наличных'),
(4, 400, 3, '2016-12-16 14:00:00', 1, 'Внесение наличных'),
(5, 200, 3, '2016-12-16 16:30:00', 0, 'Оплата радио'),
(6, 26, 27, '2016-12-13 14:00:00', 1, 'Внесение наличных'),
(7, 100, 32, '2016-12-16 12:00:00', 1, 'Внесение наличных'),
(8, 183, 55, '2016-12-16 08:00:00', 1, 'Внесение наличных'),
(9, 84, 68, '2016-12-17 10:30:00', 1, 'Внесение наличных'),
(10, 81, 72, '2016-12-16 13:15:00', 1, 'Внесение наличных');

-- --------------------------------------------------------

--
-- Структура таблицы `trndtl_attr`
--

CREATE TABLE IF NOT EXISTS `trndtl_attr` (
  `id` int(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `trndtl_attr`
--

INSERT INTO `trndtl_attr` (`id`, `code`, `value`) VALUES
(2, 'reason', 'payment'),
(2, 'radio', '2'),
(5, 'reason', 'payment'),
(5, 'radio', '9');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `longname` varchar(200) NOT NULL,
  `role_id` int(10) NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `longname`, `role_id`, `balance`) VALUES
(1, 'DIMON', 'd3gs4a', 'Ермошин Дмитрий Ильич', 1, 0),
(2, 'KIRILL', '345rty', 'Колесников Кирилл Александрович', 2, 50),
(3, 'KONFETKA', 'i_am_best', 'Каталевская Ксения Андреевна', 2, 400),
(4, 'ALEX', '228228', 'Гуцев Алексей Сергеевич', 2, 200),
(5, 'ARTEM', 'kurgan', 'Зиновьев Артем Валерьевич', 2, 10),
(6, 'BARZENKA', 'chtozh_ty_frayer', 'Мартиросян Арсен Исаакович', 2, 100),
(7, 'ShultsKim298', 'kNzFZcD2AP3l', 'Шульц Ким Валерьевич', 2, 130),
(8, 'IzofatovLukyan163', 'lvXTVfG9n6CK', 'Изофатов Лукьян Артемович', 2, 330),
(9, 'ShultsYaroslav391', 'XANe7w923QbA', 'Шульц Ярослав Геннадьевич', 2, 270),
(10, 'SmirnovaPelageya19', 'JpjWXfBbnd4m', 'Смирнова Пелагея Валентиновна ', 2, 67),
(11, 'BelovMitofan50', 'CNcsc62rLDFg', 'Белов Митофан Давидович', 2, 62),
(12, 'BajenovaViktorina304', 'lB1KFZ1a67I3', 'Баженова Викторина Олеговна ', 2, 99),
(13, 'JuravlevApollinariy1', 'bxJzhh6kFSne', 'Журавлёв Аполлинарий Сергеевич', 2, 4),
(14, 'MarkovaLiana76', '69QPTNcVSrP8', 'Маркова Лиана Львовна', 2, 461),
(15, 'VinogradovaInessa375', 't0jwxGugIClq', 'Виноградова Инесса Кирилловна ', 2, 807),
(16, 'SekunovEvgraf149', 'B1peYzsaQRv8', 'Секунов Евграф Валентинович', 2, 709),
(17, 'DmitrievaAriadna230', 'Xydmvemxoxrc', 'Дмитриева Ариадна Иосифовна ', 2, 553),
(18, 'VasyutinaIzabella319', 'uWrAFoP0yU7u', 'Васютина Изабелла Валентиновна ', 2, 753),
(19, 'SokolovFedosiy350', 'kpuzOeUbXkLa', 'Соколов Федосий Давидович', 2, 159),
(20, 'IlinZahar357', '0GWdCEZr1FKp', 'Ильин Захар Вячеславович', 2, 157),
(21, 'KukolevskayaPraskovy', 'BOB0BSVGRZFp', 'Куколевская Прасковья Геннадиевна ', 2, 759),
(22, 'FedotovEgor97', '6jWaXNBo1A4U', 'Федотов Егор Эдуардович', 2, 268),
(23, 'IlinNikifor150', 'l1EMxZHLyeBq', 'Ильин Никифор Святославович', 2, 284),
(24, 'SekunovGordey174', '553vEXJAIC9i', 'Секунов Гордей Денисович', 2, 648),
(25, 'MironovZahar46', 'o61ixgfDM25c', 'Миронов Захар Эльдарович', 2, 248),
(26, 'BajenovSavvatiy28', 'sFDATVW0ddAp', 'Баженов Савватий Денисович', 2, 164),
(27, 'PLYAZHNIK', 'girl_like_me', 'Макаров Никита Васильевич', 3, 26),
(28, 'USR666', 'prettygirl', 'Адова Екатерина Михайловна', 3, 94),
(29, 'USR4259', 's3jf6shf3', 'Забейворота Михаил Петрович', 3, 13),
(30, 'INVOKER', 'eeer', 'Шпаров Михаил Владимирович', 3, 7),
(31, 'gorodnova', 'batman', 'Городнова Валерия Антоновна', 3, 65),
(32, 'Ksu', '36501', 'Иванова Ксения Александровна', 3, 100),
(33, 'Artovs', 'DEFAULT', 'Охота Кузьма Тарасович', 3, 150),
(34, 'BIGCITY', 'abc123', 'Чистякова Регина Борисовна', 3, 200),
(35, 'Dramaqueen', 'tigger39@', 'Егорова Ангелина Романовна', 3, 250),
(36, 'kosmos', '19111993', 'Васильев Ярослав Сергеевич', 3, 300),
(37, 'svoboduvoram', 'password', 'Сморчкова Млада Платоновна', 3, 350),
(38, 'FROL', 'passpasspass', 'Фролова Леокадия Богдановна', 3, 400),
(39, 'Lobanova15', 'sW57ZnGeqsis', 'Лобанова Серафима Богдановна ', 3, 450),
(40, 'RustamovaAlina342', 'gDKful1ZYX9q', 'Рустамова Алина Геннадиевна ', 3, 500),
(41, 'JuravelStela18', 'QLd2TGuEZvN2', 'Журавель Стела Евгеньевна ', 3, 550),
(42, 'KukolevskiyAvtonom33', 'x2SBgCLtOtSN', 'Куколевский Автоном Евгеньевич', 3, 600),
(43, 'SavelevSerafim393', '53FbzJ60jZTu', 'Савельев Серафим Вениаминович', 3, 650),
(44, 'GolubevVseslav387', 'ZZqXdEorvOwR', 'Голубев Всеслав Валерьевич', 3, 700),
(45, 'KiselevLev116', 'ujyhtg', 'Макаров Федор Денисович', 3, 750),
(46, 'KochetkovProv173', 'rPjjFpxDiuBp', 'Кочетков Пров Степанович', 3, 800),
(47, 'PopovaAlbina385', 'hY3wAPlaW4gA', 'Попова Альбина Виталиевна ', 3, 850),
(48, 'KozlovaPraskovya365', 'AmaHPXajGu9t', 'Козлова Прасковья Ефимовна ', 3, 900),
(49, 'VasyutinFedosiy346', 'ukyarrlCVzLa', 'Васютин Федосий Богданович', 3, 950),
(50, 'Tanechka', '1234E', 'Шемякина Таня Сергеевна', 3, 1000),
(51, 'DenisovEmil102', 'jekdMsVD539n', 'Денисов Эмиль Петрович', 3, 480),
(52, 'Anna_A', 'andreeva654', 'Андреевна Анна Витальевна', 3, 352),
(53, 'VLADA333', 'qwerty123', 'Рощина Влада Юрьевна', 3, 167),
(54, '4Head', 'computer', 'Тимофеева Эльвира Семеновна', 3, 349),
(55, 'MironovAskold396', 'Ton3og0EaZGj', 'Миронов Аскольд Семенович', 3, 183),
(56, 'Dimon123', '1234q', 'Соболев Дмитрий Андреевчич', 3, 138),
(57, 'Sasha_S', '66847qw', 'Смирнов Александр Александрович', 3, 719),
(58, 'Vitas', '1234w', 'Димонов Виталий Максимович', 3, 146),
(59, 'Devochka13', '1308999', 'Сманцер Анастасия Андреевна', 3, 364),
(60, 'Putya', '67386nn', 'Путилов Сергей Дмитриевич', 3, 821),
(61, 'Hara', '9654ya', 'Харахорин Владимир Алексеевич', 3, 351),
(62, 'djSerg', 'djSerg2008', 'Пескин Сергей Дмитриевич', 3, 55),
(63, 'Kazak', 'ahaha02', 'Казакова Женя Витальевна', 3, 102),
(64, 'Avtomobilist', 'Avtomobilist999', 'Петелько Александр Иванович', 3, 94),
(65, 'ILosha', 'iekug11', 'Шишкина Илона Алексеевна', 3, 46),
(66, 'KruG', 'shanson', 'Круг Михаил Владимирович', 3, 80),
(67, 'Elena_K', '0987iop', 'Киркорова Елена Зинаидовна', 3, 34),
(68, 'Shavka', '112233ee', 'Иванов Иван Иванович', 3, 84),
(69, 'Lena_S', 'nbv987', 'Сидорова Лена Тимофеевна', 3, 62),
(70, 'Katya_E', 'qwerty123', 'Ермошина Катя Юрьевна', 3,0),
(71, 'Larisa_K', 'Kirill_is_ma_love', 'Колесникова Лариса Сергеевна', 3, 0),
(72, 'Yoga', 'DNB666', 'Гостюхин Егор Юрьевич', 3, 81),
(73, 'Shashka13', 'Shashka13_13', 'Циома Александр Андеевич', 3, 67),
(74, 'BORYA', 'admin123', 'Фомин Борис Леонидович', 3, 29);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
