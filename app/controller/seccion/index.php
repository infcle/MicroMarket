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
	$titulo="Secciones";
	$contenido="seccion/index.php";
	$sub_directory="";
	$menu_a= array();
	if (!($categorias = $con->query("SELECT * FROM categoria"))) {
    	echo "Falló SELECT: (" . $con->errno . ") " . $con->error;
	}

	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>