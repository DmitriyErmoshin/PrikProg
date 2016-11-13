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
$number = $_POST['number'];
$radiost_id = $_POST['radiost_id'];
$user_id = $_POST['user_id'];
//$time = $_POST['time'];

$dbh = mysql_connect($mshost, $msuser, $mspass) or die("Не могу соединиться с MySQL.");
mysql_query('set character_set_results="utf8"');
mysql_select_db($database) or die("Не могу подключиться к базе.");

if ($create == '1'){
	$query="insert into `marks` (`number`, `radiost_id`, `user_id`) values ('$number', '$radiost_id', '$user_id')";
	mysql_query($query) or die(mysql_error());
	$dscr = "Радиостанции с id:".$radiost_id." поставленна оценка";
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('4', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}
	
if ($select == '1'){
	$query="select id, date, number, radiost_id, user_id from `marks`";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id']."<br>\n";
		echo "Время: ".$row['date']."<br>\n";
		echo "Оценка: ".$row['number']."<br>\n";
		echo "Идентификатор радиостанции: ".$row['radiost_id']."<br>\n";
		echo "Идентификатор пользователя: ".$row['user_id']."<br><hr>\n";
		}
	}

if ($rewrite == '1'){
	$query="
		update `team`.`marks`
		set `date` = '$date' and `number` = '$number' and `radiost_id` = '$radiost_id' and `user_id` = '$user_id'
		where `team`.`id` = '$id'";
	mysql_query($query) or die(mysql_error());
	$dscr = "Изменение оценки у радиостанции с id:".$radiost_id;
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('2', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}

mysql_close($dbh);
?>