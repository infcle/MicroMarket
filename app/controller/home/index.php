<?php
	require_once '../../config/route.php';
	session_start();
	if (!isset($_SESSION['user_login_status']) AND $_SESSION['user_login_status'] != 1) {
        header("location: ".ROOT_CONTROLLER.'login/');
		exit;
	}
	//Variables para enviar a la plantilla
	$titulo="Bienvenido";
	$contenido="inicio.php";
	$sub_directory="";
	$menu_a= array(
					'inicio'=>'active',
					'usuario'=>'',
					'lista_u'=>'',
					'registro_u'=>'',
					'ventas'=>'',
					'seccion'=>'',
					'lista_s'=>'',
					'registro_s'=>'',
					'producto'=>'',
					'lista_p'=>'',
					'registro_p'=>'',
					'cliente'=>'',
				);
	$subTitulo="Inicio";
	require_once ('../../../public/views/plantilla.php');
?>