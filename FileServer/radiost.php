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
	$query="select r.*, rt.longname from radiost r, radiost_type rt where r.radiost_type = rt.id";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id']."<br>\n";
		echo "Название радио: ".$row['longname']."<br>\n";
		echo "Тип радио: ".$row['radiost_type']."<br>\n";
		echo "Название типа: ".$row['longname']."<br>\n";
		echo "Доступно песен: ".$row['available_song']."<br>\n";
		echo "Доступно месяцев: ".$row['available_months']."<br>\n";
		echo "Дата начала: ".$row['fromdate']."<br>\n";
		echo "Администратор радио: ".$row['user_id']."<br><hr>\n";
		}
	}

mysql_close($dbh);
?>