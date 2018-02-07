<?php
	require_once '../../config/route.php';

	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");	
	//Variables para enviar a la plantilla
	$titulo="Cliente";
	$contenido="cliente/index.php";
	$sub_directory="";
	$menu_a= $menus['CLIENTE'];
	if (!($usuarios = $con->query("SELECT * FROM usuario_login"))) {
    	echo "Falló consulta: (" . $con->errno . ") " . $con->error;
	}

	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>