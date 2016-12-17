-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Дек 17 2016 г., 13:54
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
(1, 1, '00:06:33'),
(1, 3, '00:06:33'),
(1, 5, '00:06:33'),
(2, 1, '00:03:01'),
(2, 2, '00:03:01'),
(3, 5, '00:02:34');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `event_type_id`, `dscr`, `user_id`, `time`) VALUES
(1, 1, 'Создание пользователя с id:1. Команда выполнена из консоли.', 1, '0000-00-00 00:00:00'),
(2, 1, 'Создание пользователя с id:2', 1, '0000-00-00 00:00:00'),
(3, 2, 'Исправил отчество. Залипает буква . Надо поисиь клавиауру.', 1, '2016-12-17 06:43:10'),
(4, 3, 'Вход выполнен с IP:127.0.0.1', 1, '0000-00-00 00:00:00'),
(5, 4, 'Ниче так станция. РАДИО ШАНСОН вы лучшие!!!', 1, '0000-00-00 00:00:00'),
(6, 5, 'Ой... Поставил 5, а хотел 7.', 1, '0000-00-00 00:00:00');

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
(1, '2016-11-11 14:00:00', 4, 1, 1),
(2, '2016-11-12 14:00:00', 5, 2, 1),
(3, '2016-11-15 14:00:00', 9, 3, 1),
(4, '2016-11-16 14:00:00', 6, 1, 8),
(5, '2016-11-11 14:00:00', 5, 2, 6),
(6, '2016-11-14 14:00:00', 4, 3, 3),
(7, '2016-11-13 14:00:00', 8, 3, 6),
(8, '2016-11-14 14:00:00', 3, 1, 7),
(9, '2016-11-11 14:00:00', 4, 3, 9),
(10, '2016-11-14 14:00:00', 7, 2, 7);

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
(1, 'Радио ШАНСОН', 1, 0, 0, NULL, 1),
(2, 'Радио RECORD', 2, 120, 0, NULL, 7);

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
(2, 'ВладелецРадио', 'owner', 0, 0, 0, 1, 1, 1),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id`, `id_schedule_type`, `radiost_id`, `fromdate`, `todate`, `id_song`) VALUES
(1, 1, 1, '2016-11-19 14:43:11', '2016-11-19 14:49:44', 1),
(2, 2, 1, '2016-11-19 14:43:50', '2016-11-19 14:46:24', 3);

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
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `tracks`
--

INSERT INTO `tracks` (`id`, `name`, `length`) VALUES
(1, 'RnB-Пушкин', '00:01:42'),
(2, 'Тату-Я искала тебя', '00:01:15'),
(3, 'Маша-Пастух', '00:03:03'),
(4, 'Кристина-Солнце', '00:03:25'),
(5, 'Linkin Park-Numb', '00:02:34');

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
(1, 100, 1, '2016-11-11 16:09:22', 1, 'Внесение наличных через банкомат(BANKOMAT URFU авторизованная транзакция)'),
(2, 50, 1, '2016-11-12 19:44:18', 0, 'Оплата радио'),
(3, 150, 3, '2016-11-14 18:30:23', 1, 'Внесение наличных с карты(Visa **** **** **** 7841)'),
(4, 250, 3, '2016-11-17 00:38:46', 1, 'Внесение наличных через банкомат(BANKOMAT SBERBANK операция завершилась успешно)'),
(5, 260, 6, '2016-11-23 02:42:49', 1, 'Внесение наличных с карты(MasterCard **** **** **** 4317)'),
(6, 100, 6, '2016-11-19 04:35:47', 0, 'Оплата радио'),
(7, 600, 8, '2016-11-15 03:13:50', 1, 'Пополнение наличных с терминала(TERMINAL MAGNIT U DOMA)'),
(8, 300, 7, '2016-11-15 02:22:46', 1, 'Внесение наличных с карты(Visa **** **** **** 4731)'),
(9, 250, 9, '2016-11-16 03:18:44', 1, 'Пополнение наличных с терминала(TERMINAL QIWI PAYS)'),
(10, 250, 8, '2016-11-19 09:53:43', 0, 'Оплата радио');

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
(2, 'radio', '1'),
(6, 'reason', 'payment'),
(6, 'radio', '2'),
(10, 'reason', 'payment'),
(10, 'radio', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `longname`, `role_id`) VALUES
(1, 'KIRILL', '345rty', 'Колесников Кирилл Александрович', 2),
(2, 'DIMON', 'd3gs4a', 'Ермошин Дмитрий Александрович', 1),
(3, 'KONFETKA', 'i_am_best', 'Каталевская Ксения Андреевна', 2),
(4, 'ALEX', '228228', 'Гуцев Алексей Сергеевич', 2),
(5, 'ARTEM', 'kurgan', 'Зиновьев Артем Валерьевич', 2),
(6, 'PLYAZHNIK', 'girl_like_me', 'Макаров Никита Васильевич', 3),
(7, 'USR666', 'prettygirl', 'Адова Екатерина Михайловна', 3),
(8, 'USR4259', 's3jf6shf3', 'Забейворота Михаил Петрович', 3),
(9, 'INVOKER', 'eeer', 'Шпаров Михаил Владимирович', 3),
(10, 'BARZENKA', 'chtozh_ty_frayer', 'Мартиросян Арсен Исаакович', 2),
(11, 'Ksu', '36501', 'Иванова Ксения Александровна', 3),
(12, 'Dimon123', '1234q', 'Соболев Дмитрий Андреевчич', 3),
(13, 'Sasha_S', '66847qw', 'Смирнов Александр Александрович', 3),
(14, 'Vitas', '1234w', 'Димонов Виталий Максимович', 3),
(15, 'Devochka13', '1308999', 'Сманцер Анастасия Андреевна', 3),
(16, 'Putya', '67386nn', 'Путилов Сергей Дмитриевич', 3),
(17, 'Hara', '9654ya', 'Харахорин Владимир Алексеевич', 3),
(18, 'djSerg', 'djSerg2008', 'Пескин Сергей Дмитриевич', 3),
(19, 'Kazak', 'ahaha02', 'Казакова Женя Витальевна', 3),
(20, 'Avtomobilist', 'Avtomobilist999', 'Петелько Александр Иванович', 3),
(21, 'ILosha', 'iekug11', 'Шишкина Илона Алексеевна', 3),
(22, 'KruG', 'shanson', 'Круг Михаил Владимирович', 3),
(23, 'Elena_K', '0987iop', 'Киркорова Елена Зинаидовна', 3),
(24, 'Shavka', '112233ee', 'Иванов Иван Иванович', 3),
(25, 'Lena_S', 'nbv987', 'Сидорова Лена Тимофеевна', 3),
(26, 'Katya_E', 'qwerty123', 'Ермошина Катя Юрьевна', 3),
(27, 'Larisa_K', 'Kirill_is_ma_love', 'Колесникова Лариса Сергеевна', 3),
(28, 'Yoga', 'DNB666', 'Гостюхин Егор Юрьевич', 3),
(29, 'Shashka13', 'Shashka13_13', 'Циома Александр Андеевич', 3),
(30, 'BORYA', 'admin123', 'Фомин Борис Леонидович', 3),
(31, 'gorodnova', 'batman', 'Городнова Валерия Антоновна', 3),
(33, 'Artovs', 'DEFAULT', 'Охота Кузьма Тарасович', 3),
(34, 'BIGCITY', 'abc123', 'Чистякова Регина Борисовна', 3),
(35, 'Dramaqueen', 'tigger39@', 'Егорова Ангелина Романовна', 3),
(36, 'kosmos', '19111993', 'Васильев Ярослав Сергеевич', 3),
(37, 'svoboduvoram', 'password', 'Сморчкова Млада Платоновна', 3),
(38, 'FROL', 'passpasspass', 'Фролова Леокадия Богдановна', 3),
(39, 'Lobanova15', 'sW57ZnGeqsis', 'Лобанова Серафима Богдановна ', 3),
(40, 'RustamovaAlina342', 'gDKful1ZYX9q', 'Рустамова Алина Геннадиевна ', 3),
(41, 'JuravelStela18', 'QLd2TGuEZvN2', 'Журавель Стела Евгеньевна ', 3),
(42, 'KukolevskiyAvtonom33', 'x2SBgCLtOtSN', 'Куколевский Автоном Евгеньевич', 3),
(43, 'SavelevSerafim393', '53FbzJ60jZTu', 'Савельев Серафим Вениаминович', 3),
(44, 'GolubevVseslav387', 'ZZqXdEorvOwR', 'Голубев Всеслав Валерьевич', 3),
(45, 'KiselevLev116', 'ujyhtg', 'Макаров Федор Денисович', 3),
(46, 'KochetkovProv173', 'rPjjFpxDiuBp', 'Кочетков Пров Степанович', 3),
(47, 'PopovaAlbina385', 'hY3wAPlaW4gA', 'Попова Альбина Виталиевна ', 3),
(48, 'KozlovaPraskovya365', 'AmaHPXajGu9t', 'Козлова Прасковья Ефимовна ', 3),
(49, 'VasyutinFedosiy346', 'ukyarrlCVzLa', 'Васютин Федосий Богданович', 3),
(50, 'Tanechka', '1234E', 'Шемякина Таня Сергеевна', 3),
(51, 'DenisovEmil102', 'jekdMsVD539n', 'Денисов Эмиль Петрович', 3),
(52, 'Anna_A', 'andreeva654', 'Андреевна Анна Витальевна', 3),
(53, 'VLADA333', 'qwerty123', 'Рощина Влада Юрьевна', 3),
(54, '4Head', 'computer', 'Тимофеева Эльвира Семеновна', 3),
(55, 'MironovAskold396', 'Ton3og0EaZGj', 'Миронов Аскольд Семенович', 3),
(56, 'ShultsKim298', 'kNzFZcD2AP3l', 'Шульц Ким Валерьевич', 2),
(57, 'IzofatovLukyan163', 'lvXTVfG9n6CK', 'Изофатов Лукьян Артемович', 2),
(58, 'ShultsYaroslav391', 'XANe7w923QbA', 'Шульц Ярослав Геннадьевич', 2),
(59, 'SmirnovaPelageya19', 'JpjWXfBbnd4m', 'Смирнова Пелагея Валентиновна ', 2),
(60, 'BelovMitofan50', 'CNcsc62rLDFg', 'Белов Митофан Давидович', 2),
(61, 'BajenovaViktorina304', 'lB1KFZ1a67I3', 'Баженова Викторина Олеговна ', 2),
(62, 'JuravlevApollinariy1', 'bxJzhh6kFSne', 'Журавлёв Аполлинарий Сергеевич', 2),
(63, 'MarkovaLiana76', '69QPTNcVSrP8', 'Маркова Лиана Львовна', 2),
(64, 'VinogradovaInessa375', 't0jwxGugIClq', 'Виноградова Инесса Кирилловна ', 2),
(65, 'SekunovEvgraf149', 'B1peYzsaQRv8', 'Секунов Евграф Валентинович', 2),
(66, 'DmitrievaAriadna230', 'Xydmvemxoxrc', 'Дмитриева Ариадна Иосифовна ', 2),
(67, 'VasyutinaIzabella319', 'uWrAFoP0yU7u', 'Васютина Изабелла Валентиновна ', 2),
(68, 'SokolovFedosiy350', 'kpuzOeUbXkLa', 'Соколов Федосий Давидович', 2),
(69, 'IlinZahar357', '0GWdCEZr1FKp', 'Ильин Захар Вячеславович', 2),
(70, 'KukolevskayaPraskovy', 'BOB0BSVGRZFp', 'Куколевская Прасковья Геннадиевна ', 2),
(71, 'FedotovEgor97', '6jWaXNBo1A4U', 'Федотов Егор Эдуардович', 2),
(72, 'IlinNikifor150', 'l1EMxZHLyeBq', 'Ильин Никифор Святославович', 2),
(73, 'SekunovGordey174', '553vEXJAIC9i', 'Секунов Гордей Денисович', 2),
(74, 'MironovZahar46', 'o61ixgfDM25c', 'Миронов Захар Эльдарович', 2),
(114, 'BajenovSavvatiy28', 'sFDATVW0ddAp', 'Баженов Савватий Денисович', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
