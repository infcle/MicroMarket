<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");

	$usuario=$_REQUEST['user'];
	$sql="SELECT * FROM usuario_login WHERE usuario = '{$usuario}'";
	if ($resultado=$con->query($sql)) {
		$nrodefilas=$resultado->num_rows;
		if($nrodefilas == 0)
			echo "true";
		else
			echo "false";
	}
?>