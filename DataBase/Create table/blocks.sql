CREATE TABLE IF NOT EXISTS `blocks` (
  `id` int(10) NOT NULL,
  `id_tracks` int(10) NOT NULL,
  `length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;