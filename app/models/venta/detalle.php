<?php 
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");

	$cod_barras=$_REQUEST['codigo'];
	$peso=substr($cod_barras,6, 5)/1000;
	$codPlu=substr($cod_barras,2, 4);
	$sqlPrecio="select * from producto where cod_plu='{$codPlu}'";
	if($resultado=$con->query($sqlPrecio)){
		if($resultado->num_rows>0){
			$jsondata['estado']='correcto';
		}else {
			$jsondata['estado']='No existen datos';
		}
		//echo "<pre>";print_r ($resultado);echo "</pre>";
		$precio=1;
		while ($fila = $resultado->fetch_array()) {
			$jsondata['detalle'] = $fila;
			$precio=$fila['precio'];
		}
		$precioT = $precio*$peso;
		$jsondata['precioTotal']=$precioT;
		$jsondata['peso']=$peso;
	}else{
		$jsondata['estado']="Falló consulta: (" . $con->errno . ") " . $con->error;
	}
	echo json_encode($jsondata);
?>