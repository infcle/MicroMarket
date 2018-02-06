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
	$titulo="Ventas";
	$contenido="ventas/index.php";
	$subTitulo="Ventas";
	$sub_directory="";
	$menu_a= array(
					'inicio'=>'',
					'usuario'=>'',
					'lista_u'=>'',
					'registro_u'=>'',
					'ventas'=>'active',
					'seccion'=>'',
					'lista_s'=>'',
					'registro_s'=>'',
					'producto'=>'',
					'lista_p'=>'',
					'registro_p'=>'',
					'cliente'=>'',
				);
	if (!($usuarios = $con->query("SELECT * FROM usuario_login"))) {
    	echo "Falló consulta: (" . $con->errno . ") " . $con->error;
	}
	//var_dump($usuarios->fetch_assoc());
	$pie_class="si";//Variable donde se poneun pie de pagina estatico	
	require_once ('../../../public/views/plantilla.php');
?>