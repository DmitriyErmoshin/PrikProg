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
$amount = $_POST['amount'];
$user_id = $_POST['user_id'];
$incomfl = $_POST['incomfl'];
$dscr = $_POST['dscr'];
//$time = $_POST['time'];

$dbh = mysql_connect($mshost, $msuser, $mspass) or die("Не могу соединиться с MySQL.");
mysql_query('set character_set_results="utf8"');
mysql_select_db($database) or die("Не могу подключиться к базе.");

if ($create == '1'){
	$query="insert into `trndtl` (`amount`, `user_id`, `incomfl`, `dscr`) values ('$amount', '$user_id', '$incomfl', '$dscr')";
	mysql_query($query) or die(mysql_error());
	$dscr = "Созданна новая денежная операция";
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('6', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}
	
if ($select == '1'){
	$query="select id, amount, user_id, time, incomfl, dscr from `trndtl`";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id']."<br>\n";
		echo "Сумма: ".$row['amount']."<br>\n";
		echo "Идентификатор пользователя: ".$row['user_id']."<br>\n";
		echo "Время: ".$row['time']."<br>\n";
		echo "Признак входящей проводки: ".$row['incomfl']."<br>\n";
		echo "Описание: ".$row['dscr']."<br>\n<hr>\n";
		}
	}

if ($rewrite == '1'){
	$query="
		update `team`.`trndtl`
		set `amount` = '$amount' and `user_id` = '$user_id' and `time` = '$time' and `incomfl` = '$incomfl' and `dscr` = '$dscr'
		where `team`.`id` = '$id'";
	mysql_query($query) or die(mysql_error());
	$dscr = "Изменены детали транзакции с id:".$id;
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('7', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}

mysql_close($dbh);
?>