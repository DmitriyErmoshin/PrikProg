<?php
$mshost="mysql.hostinger.com"; //host
$msuser="u535813775_1"; //user
$mspass="kZZ76M5AeU"; //password
//$user= isset ($_POST['user']) ? trim($_POST['user']) : '';
//$pass= isset ($_POST['pass']) ? trim($_POST['pass']) : '';

$surname = $_POST['surname'];
$name = $_POST['name'];
$patronymic = $_POST['patronymic'];
$birthday = $_POST['birthday'];
$series_and_number = $_POST['series_and_number'];
$date_of_issue = $_POST['date_of_issue'];
$issued_by = $_POST['issued_by'];
$home_number = $_POST['home_number'];
$mobile_number = $_POST['mobile_number'];
$email = $_POST['email'];
$counts_of_childrens = $_POST['counts_of_childrens'];
$advertisement = $_POST['advertisement'];
$comment = $_POST['comment'];
$advice = $_POST['advice'];
$error = '0';
 
//if ($user) {echo 'User: ', $user;} else { echo 'Login Incorrect<br>';};
//if ($pass) {echo '<br>Password: ', $pass, '<br>';} else { echo '<br>Password Incorrect<br>';};
if ($error <> '1')
{ $mscon=mysql_connect($mshost, $msuser, $mspass) or die(mysql_error()); //soedinenie s mysql
mysql_query('set character_set_results="utf8"');  
mysql_select_db('u535813775_1') or die(mysql_error()); //выбор БД
 
$vvod="insert into `customers` (`surname`, `name`, `patronymic`, `birthday`, `series_and_number`, `date_of_issue`, `issued_by`, `home_number`, `mobile_number`, `email`, `counts_of_childrens`, `advertisement`, `comment`, `advice`) values('$surname', '$name', '$patronymic', '$birthday', '$series_and_number', '$date_of_issue', '$issued_by', '$home_number', '$mobile_number', '$email', '$counts_of_childrens', '$advertisement', '$comment', '$advice')";      
mysql_query($vvod) or die(mysql_error()); //Запись в таблицу
       
mysql_close($mscon);
} 
else {
echo 'Error = 1';
}
?>