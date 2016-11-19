CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_schedule_type` int(2) NOT NULL,
  `radiost_id` int(2) NOT NULL,
  `fromdate` datetime NOT NULL,
  `todate` datetime NOT NULL,
  `id_song` int(10) NOT NULL,
	PRIMARY KEY (`id`),
	KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;