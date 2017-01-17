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