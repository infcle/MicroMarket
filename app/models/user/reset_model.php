<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");
	$user_password = 123123;
	$user_password_hash = password_hash($user_password, PASSWORD_DEFAULT);
	$sql = "UPDATE usuario_login SET contrasenia='{$user_password_hash}'";
	if (!$con->query($sql)) {
		echo 'Falló : (' . $con->errno . ') ' . $con->error;
	}
	else
		echo 1;
?>