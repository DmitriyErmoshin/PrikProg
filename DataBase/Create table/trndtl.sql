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