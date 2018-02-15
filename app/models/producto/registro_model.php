<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");
	$nombre = trim($_POST["nombre"]);
	$nroPlu = trim($_POST["nro_plu"]);
	$precio = trim($_POST["precio"]);
	$tipo = trim($_POST["tipoVenta"]);
	$codPlu=($tipo*1000)+$nroPlu;
	$micategoria=$_REQUEST['categoria'];
	if(isset($_REQUEST['limite']))
		$limite=$_REQUEST['limite'];
	else
		$limite=-1;
	$sqlProducto="CALL insertarProducto({$nroPlu},'{$nombre}',{$tipo}, {$precio}, '{$codPlu}',{$limite})";
	if (!$con->query($sqlProducto)) {
		echo "Falló la insercion producto: (" . $con->errno . ") " . $con->error;
	}
	else{
		$sqlId="CALL obtener_id_producto({$nroPlu});";
		if ($resultado=$con->query($sqlId)) {
			$idProd=$resultado->fetch_row();
			$tamanio=count($micategoria);
			$nroInsercion=0;
			foreach ($micategoria as $categoria) {
				$idp=$idProd[0];
				$ids=$_REQUEST['seccion'.$categoria];
				$sqlTiene="CALL insertarTiene({$idp},{$ids});";
				if ($resultadoSeccion=$con->query($sqlTiene)){
					$nroInsercion++;
				}else{
					echo "Falló la insercion tiene: (" . $con->errno . ") " . $con->error;
				}
			}
			if($nroInsercion==$tamanio)
				echo 1;
			else
				echo 0;
		}else{
			echo "Falló la obtencion del id: (" . $con->errno . ") " . $con->error;
		}
	}

	// $sql="INSERT INTO producto(nroplu, descripcion, tipo, precio, cod_barras, id_cat) values({$nroPlu},'{$nombre}',{$tipo},{$precio},'{$codPlu}', {$seccion})";
	// if (!$con->query($sql)) {
	// 	echo "Falló la insercion: (" . $con->errno . ") " . $con->error;
	// }
	// else
	// 	echo 1;
?>