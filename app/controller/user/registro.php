<?php
	require_once '../../config/route.php';
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	//Variables para enviar a la plantilla
	$titulo="Nuevo usuario";
	$contenido="user/registro.php";
	$subTitulo="Usuario";
	$menu_a= array(
					'inicio'=>'',
					'usuario'=>'nav-active',
					'lista_u'=>'',
					'registro_u'=>'active',
					'ventas'=>'',
					'seccion'=>'',
					'lista_s'=>'',
					'registro_s'=>'',
					'producto'=>'',
					'lista_p'=>'',
					'registro_p'=>'',
					'cliente'=>'',
				);
	require_once ('../../../public/views/plantilla.php');
?>