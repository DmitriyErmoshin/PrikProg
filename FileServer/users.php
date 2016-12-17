<?php
header('Content-Type: text/html; charset=utf-8');
$mshost="localhost";	//Хостинг
$msuser="root";				//Логин
$mspass="";						//Пароль
$database='team';			//База данных

//Параметры вызова
$create = $_POST['create'];
$select = $_POST['select'];
$rewrite = $_POST['rewrite'];
//Параметры таблицы
$id = $_POST['id'];
$login = $_POST['login'];
$password = $_POST['password'];
$longname = $_POST['longname'];
$role_id = $_POST['role_id'];
$user_id = $_POST['user_id'];

$dbh = mysql_connect($mshost, $msuser, $mspass) or die("Не могу соединиться с MySQL.");
mysql_query('set character_set_results="utf8"');
mysql_select_db($database) or die("Не могу подключиться к базе.");

if ($create == '1'){
	$query="insert into `users` (`login`, `password`, `longname`, `role_id`) values ('$login', '$password', '$longname', '$role_id')";
	mysql_query($query) or die(mysql_error());
	$dscr = "Создание пользователя с логином:".$login;
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('1', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}
	
if ($select == '1'){
	if (is_numeric($role_id)){$role_id = '= '.$role_id;} else {$role_id = 'is not null';}
 	$query="select id, login, password, longname, role_id from `users` where role_id $role_id";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id']."<br>\n";
		echo "Логин: ".$row['login']."<br>\n";
		echo "Пароль: ".$row['password']."<br>\n";
		echo "Инициалы: ".$row['longname']."<br>\n";
		echo "Идентификатор роли: ".$row['role_id']."<br><hr>\n";
		}
	}

if ($rewrite == '1'){
	$query="
		update `team`.`users`
		set `login` = '$login' and `password` = '$password' and `longname` = '$longname' and `role_id` = '$role_id'
		where `team`.`id` = '$id'";
	mysql_query($query) or die(mysql_error());
	$dscr = "Редактирование данных пользователя с логином:".$login;
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('2', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}

mysql_close($dbh);
?>