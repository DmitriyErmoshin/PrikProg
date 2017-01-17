INSERT INTO `roles` (`id`, `longname`, `code`, `create_users`, `rewrite_users`, `del_users`, `create_schedule`, `rewrite_schedule`, `del_schedule`) VALUES
(1, 'Администратор', 'admin', 1, 1, 1, 1, 1, 1),
(2, 'Владелец Радио', 'owner', 0, 0, 0, 1, 1, 1),
(3, 'Слушатель', 'listener', 0, 0, 0, 0, 0, 0);