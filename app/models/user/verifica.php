<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");

	$usuario=$_REQUEST['user'];
	if(isset($_REQUEST['tipo'])){

		$sql="SELECT * FROM usuario_login WHERE usuario = '{$usuario}' and id_usuario != {$_REQUEST['id_user']}";
		if($resultado=$con->query($sql)){
			$nrodefilas=$resultado->num_rows;
			if($nrodefilas == 0)
				echo "true";
			else
				echo "false";
		}
	}else{
		$sql="call existe_usuario('{$usuario}',@a);";
		//$sql="SELECT * FROM usuario_login WHERE usuario = '{$usuario}'";
		if ($resultado=$con->query($sql)) {
			$resultado2=$con->query("select @a;");
			$fila = $resultado2->fetch_row();
			if($fila[0] == 0)
				echo "true";
			else
				echo "false";
		}else
			echo "Falló la insercion: (" . $con->errno . ") " . $con->error;
	}
?>