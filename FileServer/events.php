<?php
header('Content-Type: text/html; charset=utf-8');
$mshost="localhost";	//Хостинг
$msuser="root";				//Логин
$mspass="";						//Пароль
$database='team';			//База данных

//Параметры вызова
$select = $_POST['select'];

$dbh = mysql_connect($mshost, $msuser, $mspass) or die("Не могу соединиться с MySQL.");
mysql_query('set character_set_results="utf8"');
mysql_select_db($database) or die("Не могу подключиться к базе.");
	
if ($select == '1'){
	$query="select e.*, et.name from events e, events_type et where e.event_type_id = et.id";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id']."<br>\n";
		echo "Тип события: ".$row['event_type_id']."<br>\n";
		echo "Имя события: ".$row['name']."<br>\n";
		echo "Идентификатор пользователя: ".$row['user_id']."<br>\n";
		echo "Время: ".$row['time']."<br>\n";
		echo "Описание: ".$row['dscr']."<br><hr>\n";
		}
	}

mysql_close($dbh);
?>