<?php
	require_once '../../config/route.php';
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	//Variables para enviar a la plantilla
	$titulo="Nuevo usuario";
	$contenido="producto/registro.php";
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
					'lista_p'=>'',
					'registro_p'=>'active',
					'cliente'=>'',
				);
	$subTitulo="Producto o PLU";
	$pie_class="si";
	require_once ('../../../public/views/plantilla.php');
?>