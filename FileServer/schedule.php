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
$id_schedule_type = $_POST['id_schedule_type'];
$radiost_id = $_POST['radiost_id'];
$fromdate = $_POST['fromdate'];
$todate = $_POST['todate'];
$id_song = $_POST['id_song'];
$id = $_POST['id'];
$user_id = $_POST['user_id'];

$dbh = mysql_connect($mshost, $msuser, $mspass) or die("Не могу соединиться с MySQL.");
mysql_query('set character_set_results="utf8"');
mysql_select_db($database) or die("Не могу подключиться к базе.");

if ($create == '1'){
	$query="insert into `schedule` (`id_schedule_type`, `radiost_id`, `fromdate`, `todate`, `id_song`) values ('$id_schedule_type', '$radiost_id', '$fromdate', '$todate', '$id_song')";
	mysql_query($query) or die(mysql_error());
	$dscr = "Внесение записи в очередь.";
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('8', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}
	
if ($select == '1'){
	$query="
	SELECT
		s.id id_schedule
		, st.id type_schedule
		, st.name
		, s.radiost_id
		, r.longname
		, s.fromdate
		, s.todate
		, case
				when s.id_schedule_type = 1 then tt.id
				else s.id_song
		end as id_song
		, ifnull(t.name, tt.name) song_name
		, ifnull(t.length, tt.length) length
	FROM
		((((schedule as s INNER JOIN schedule_type as st ON s.id_schedule_type = st.id)
		LEFT JOIN tracks as t ON s.id_song = t.id and s.id_schedule_type = 2)
		LEFT JOIN blocks bb ON s.id_song = bb.id and s.id_schedule_type = 1)
		LEFT JOIN tracks tt ON bb.	id_tracks = tt.id and s.id_schedule_type = 1)
		INNER JOIN radiost as r ON s.radiost_id = r.id";
	$res = mysql_query($query);
	while($row = mysql_fetch_array($res)){
		echo "Идентификатор: ".$row['id_schedule']."<br>\n";
		echo "Тип очереди: ".$row['type_schedule']."<br>\n";
		echo "Имя типа очереди: ".$row['name']."<br>\n";
		echo "Идентификатор радио: ".$row['radiost_id']."<br>\n";
		echo "Название радио: ".$row['longname']."<br>\n";
		echo "Начало песни: ".$row['fromdate']."<br>\n";
		echo "Ее конец: ".$row['todate']."<br>\n";
		echo "Инициалы: ".$row['id_song']."<br>\n";
		echo "Идентификатор песни: ".$row['song_name']."<br>\n";
		echo "Длина песни: ".$row['length']."<br><hr>\n";
		}
	}

if ($rewrite == '1'){
	$query="
		update `team`.`schedule`
		set `id_schedule_type` = '$id_schedule_type' and `radiost_id` = '$radiost_id' and `fromdate` = '$fromdate' and `todate` = '$todate' and `id_song` = '$id_song'
		where `team`.`id` = '$id'";
	mysql_query($query) or die(mysql_error());
	$dscr = "Редактирование очереди с идентификатором:".$id;
	$query="insert into `events` (`event_type_id`, `dscr`, `user_id`) values ('9', '$dscr', '$user_id')";
	mysql_query($query) or die(mysql_error());
	}

mysql_close($dbh);
?>