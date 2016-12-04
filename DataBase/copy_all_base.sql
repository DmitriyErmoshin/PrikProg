-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- ����: 127.0.0.1
-- ����� ��������: ��� 04 2016 �., 16:13
-- ������ �������: 5.5.25
-- ������ PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1251 */;

--
-- ���� ������: `team`
--

-- --------------------------------------------------------

--
-- ��������� ������� `blocks`
--

CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(10) NOT NULL,
  `id_tracks` int(10) NOT NULL,
  `length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `blocks`
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
-- ��������� ������� `events`
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
-- ���� ������ ������� `events`
--

INSERT INTO `events` (`id`, `event_type_id`, `dscr`, `user_id`, `time`) VALUES
(1, 1, '�������� ������������ � id:1. ������� ��������� �� �������.', 1, '0000-00-00 00:00:00'),
(2, 1, '�������� ������������ � id:2', 1, '0000-00-00 00:00:00'),
(3, 2, '�������� ������. �������� ����� . ���� ������ ���������.', 1, '0000-00-00 00:00:00'),
(4, 3, '���� �������� � IP:127.0.0.1', 1, '0000-00-00 00:00:00'),
(5, 4, '���� ��� �������. ����� ������ �� ������!!!', 1, '0000-00-00 00:00:00'),
(6, 5, '��... �������� 5, � ����� 7.', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- ��������� ������� `events_type`
--

CREATE TABLE IF NOT EXISTS `events_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- ���� ������ ������� `events_type`
--

INSERT INTO `events_type` (`id`, `name`) VALUES
(1, '�������� ������������'),
(2, '��������� ������ ������������'),
(3, '���� � �������'),
(4, '������������ ������ ������������'),
(5, '��������� ������ ������������'),
(6, '�������� �������� ��������'),
(7, '��������� �������� ��������'),
(8, '�������� ������ � �������'),
(9, '��������� ������ � �������');

-- --------------------------------------------------------

--
-- ��������� ������� `marks`
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
-- ���� ������ ������� `marks`
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
-- ��������� ������� `radiost`
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
-- ���� ������ ������� `radiost`
--

INSERT INTO `radiost` (`id`, `longname`, `radiost_type`, `available_song`, `available_months`, `fromdate`, `user_id`) VALUES
(1, '����� ������', 1, 0, 0, NULL, 1),
(2, '����� RECORD', 2, 120, 0, NULL, 7);

-- --------------------------------------------------------

--
-- ��������� ������� `radiost_type`
--

CREATE TABLE IF NOT EXISTS `radiost_type` (
  `id` int(10) NOT NULL,
  `longname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `radiost_type`
--

INSERT INTO `radiost_type` (`id`, `longname`) VALUES
(1, '������ ������'),
(2, '����������� �� ������'),
(3, '����������� �� �������');

-- --------------------------------------------------------

--
-- ��������� ������� `roles`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `roles`
--

INSERT INTO `roles` (`id`, `longname`, `code`, `create_users`, `rewrite_users`, `del_users`, `create_schedule`, `rewrite_schedule`, `del_schedule`) VALUES
(1, '�������������', 'admin', 1, 1, 1, 1, 1, 1),
(2, '����������', 'customer', 0, 0, 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- ��������� ������� `sales`
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
-- ���� ������ ������� `sales`
--

INSERT INTO `sales` (`id`, `mark_avg`, `sale`, `dscr`) VALUES
(1, 5, 3, '������� ������'),
(2, 6, 5, '����������� ������'),
(3, 7, 10, '����������� ������'),
(4, 9, 20, '��������� ������������');

-- --------------------------------------------------------

--
-- ��������� ������� `schedule`
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
-- ���� ������ ������� `schedule`
--

INSERT INTO `schedule` (`id`, `id_schedule_type`, `radiost_id`, `fromdate`, `todate`, `id_song`) VALUES
(1, 1, 1, '2016-11-19 14:43:11', '2016-11-19 14:49:44', 1),
(2, 2, 1, '2016-11-19 14:43:50', '2016-11-19 14:46:24', 3);

-- --------------------------------------------------------

--
-- ��������� ������� `schedule_type`
--

CREATE TABLE IF NOT EXISTS `schedule_type` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `schedule_type`
--

INSERT INTO `schedule_type` (`id`, `name`) VALUES
(1, '����'),
(2, '����');

-- --------------------------------------------------------

--
-- ��������� ������� `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `length` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- ���� ������ ������� `tracks`
--

INSERT INTO `tracks` (`id`, `name`, `length`) VALUES
(1, 'RnB-������', '00:01:42'),
(2, '����-� ������ ����', '00:01:15'),
(3, '����-������', '00:03:03'),
(4, '��������-������', '00:03:25'),
(5, 'Linkin Park-Numb', '00:02:34');

-- --------------------------------------------------------

--
-- ��������� ������� `trndtl`
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
-- ���� ������ ������� `trndtl`
--

INSERT INTO `trndtl` (`id`, `amount`, `user_id`, `time`, `incomfl`, `dscr`) VALUES
(1, 100, 1, '2016-11-11 16:09:22', 1, '�������� �������� ����� ��������(BANKOMAT URFU �������������� ����������)'),
(2, 50, 1, '2016-11-12 19:44:18', 0, '������ �����'),
(3, 150, 3, '2016-11-14 18:30:23', 1, '�������� �������� � �����(Visa **** **** **** 7841)'),
(4, 250, 3, '2016-11-17 00:38:46', 1, '�������� �������� ����� ��������(BANKOMAT SBERBANK �������� ����������� �������)'),
(5, 260, 6, '2016-11-23 02:42:49', 1, '�������� �������� � �����(MasterCard **** **** **** 4317)'),
(6, 100, 6, '2016-11-19 04:35:47', 0, '������ �����'),
(7, 600, 8, '2016-11-15 03:13:50', 1, '���������� �������� � ���������(TERMINAL MAGNIT U DOMA)'),
(8, 300, 7, '2016-11-15 02:22:46', 1, '�������� �������� � �����(Visa **** **** **** 4731)'),
(9, 250, 9, '2016-11-16 03:18:44', 1, '���������� �������� � ���������(TERMINAL QIWI PAYS)'),
(10, 250, 8, '2016-11-19 09:53:43', 0, '������ �����');

-- --------------------------------------------------------

--
-- ��������� ������� `trndtl_attr`
--

CREATE TABLE IF NOT EXISTS `trndtl_attr` (
  `id` int(10) NOT NULL,
  `code` varchar(10) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `trndtl_attr`
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
-- ��������� ������� `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `longname` varchar(200) NOT NULL,
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- ���� ������ ������� `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `longname`, `role_id`) VALUES
(1, 'KIRILL', '345rty', '���������� ������ �������������', 1),
(2, 'DIMON', 'd3gs4a', '������� ������� �������������', 1),
(3, 'KONFETKA', 'i_am_best', '����������� ������ ��������', 1),
(4, 'ALEX', '228228', '����� ������� ����������', 2),
(5, 'ARTEM', 'kurgan', '�������� ����� ����������', 3),
(6, 'PLYAZHNIK', 'girl_like_me', '������� ������ ����������', 1),
(7, 'USR666', 'prettygirl', '����� ��������� ����������', 3),
(8, 'USR4259', 's3jf6shf3', '����������� ������ ��������', 5),
(9, 'INVOKER', 'eeer', '������ ������ ������������', 4),
(10, 'BARZENKA', 'chtozh_ty_frayer', '���������� ����� ���������', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
