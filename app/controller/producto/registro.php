<?php
	require_once '../../config/route.php';
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	$sql="SELECT MAX(nro_plu)+1 FROM producto";
	if (!($resultado = $con->query($sql))) {
    	echo "Falló SELECT: (" . $con->errno . ") " . $con->error;
	}
	$fila = $resultado->fetch_row();
	$titulo="Nuevo Producto";
	$contenido="producto/registro.php";
	$menu_a= $menus['P_REGISTRO'];
	$subTitulo="Producto o PLU";
	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>