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
	$titulo="Productos PLU";
	$contenido="producto/index.php";
	$subTitulo="Producto o PLU";
	$menu_a= $menus['P_LISTA'];
	#procedimiento cantidad peso
	$sql="call cantidad_peso";
	if (!($productos = $con->query($sql))) {
    	echo "Falló consulta: (" . $con->errno . ") " . $con->error;
	}
	$con->close();
	$con=conectar();
	if (!($secciones = $con->query("SELECT * FROM seccion where estado=1"))) {
    	echo "Falló SELECT: (" . $con->errno . ") " . $con->error;
	}
	//$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>