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
	$menu_a= array(
					'inicio'=>'',
					'usuario'=>'',
					'lista_u'=>'',
					'registro_u'=>'',
					'ventas'=>'',
					'seccion'=>'nav-active',
					'lista_s'=>'active',
					'registro_s'=>'',
					'producto'=>'',
					'lista_p'=>'',
					'registro_p'=>'',
					'cliente'=>'',
				);
	$subTitulo="Seccion";
	if (!($secciones = $con->query("SELECT * FROM seccion"))) {
    	echo "Falló SELECT: (" . $con->errno . ") " . $con->error;
	}

	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>