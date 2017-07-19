<?php

//bangun koneksi ke database
$con = mysql_connect("localhost","root","");

if (!$con)  {
  	die('Koneksi ke database gagal: ' . mysql_error());
}

mysql_select_db("dbstbi", $con);	

?>