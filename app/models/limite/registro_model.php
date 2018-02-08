<?php 
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");

	//echo "<pre>";print_r ($_REQUEST);echo "</pre>";
	$nombre = trim($_POST["nombre"]);
	$limite = trim($_POST["limite"]);
	$subsidio=trim($_POST["subsidio"]);
	$fechaRegistro = date('Y-m-d H:i:s');

	$sql = "INSERT INTO limite(nombre, limite,fecha_registro) VALUES('{$nombre}', {$limite},'{$fechaRegistro}')";

	if (!$con->query($sql)) {
		echo "Falló la insercion: (" . $con->errno . ") " . $con->error;
	}
	else
		echo 1;
?>