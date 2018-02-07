<?php
	require_once '../../config/route.php';
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	require_once ("../../config/conexion.php");
	require_once ("../../config/db.php");
	//Variables para enviar a la plantilla
	$titulo="Usuarios";
	$contenido="producto/index.php";
	$subTitulo="Producto o PLU";
					'registro_c'=>'',
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
	//var_dump($usuarios->fetch_assoc());
	$pie_class="si";//Variable donde se poneun pie de pagina estatico	
	require_once ('../../../public/views/plantilla.php');
?>