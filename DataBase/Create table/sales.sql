CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `mark_avg` int(2) NOT NULL,
  `sale` int(2) NOT NULL,
  `dscr` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;