<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");
	$nombre = trim($_POST["nombre"]);
	$nroPlu = trim($_POST["nro"]);
	$precio = trim($_POST["precio"]);
	$tipo = trim($_POST["tipoVenta"]);
	$seccion = trim($_POST["seccion"]);

	$codPlu=($tipo*1000)+$nroPlu;

	$sql="INSERT INTO producto(nroplu, desccripcion, tipo, precio, cod_barras, id_cat)";
	if (!$con->query($sql)) {
		echo "Falló la insercion: (" . $con->errno . ") " . $con->error;
	}
	else
		echo 1;
?>