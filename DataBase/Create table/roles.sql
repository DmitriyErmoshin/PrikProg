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