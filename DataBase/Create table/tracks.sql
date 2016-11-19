CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `length` time NOT NULL,
	PRIMARY KEY (`id`),
	KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;