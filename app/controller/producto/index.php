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
	$titulo="Usuarios";
	$contenido="producto/index.php";
	$subTitulo="Producto o PLU";
	$menu_a= array(
					'inicio'=>'',
					'usuario'=>'',
					'lista_u'=>'',
					'registro_u'=>'',
					'ventas'=>'',
					'seccion'=>'',
					'lista_s'=>'',
					'registro_s'=>'',
					'producto'=>'nav-active',
					'lista_p'=>'active',
					'registro_p'=>'',
					'cliente'=>'',
				);
	if (!($productos = $con->query("SELECT * FROM producto"))) {
    	echo "Falló consulta: (" . $con->errno . ") " . $con->error;
	}

	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>