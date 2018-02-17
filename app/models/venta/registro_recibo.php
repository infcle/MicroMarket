<?php 
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");
	session_start();
	//echo "<pre>";print_r($_REQUEST);echo "</pre>";die();

	if(isset($_REQUEST["txt_ci"]))
		$txt_ci=$_REQUEST["txt_ci"];
	else
		echo "Error: CI no definido";
	if(isset($_REQUEST["txt_usuario"]))
		$txt_usuario=$_REQUEST["txt_usuario"];
	else
		echo "Error: Cliente no definido";
	if(isset($_REQUEST["id_prod"]) && isset($_REQUEST["producto"]) && isset($_REQUEST["precio"]) && isset($_REQUEST["cantpeso"]) && isset($_REQUEST["subtotal"]) && isset($_REQUEST["codbarras"]) && isset($_REQUEST["prec_total"])){
		$id_prod=$_REQUEST["id_prod"];
		$producto=$_REQUEST["producto"];
		$precio=$_REQUEST["precio"];
		$cantpeso=$_REQUEST["cantpeso"];
		$subtotal=$_REQUEST["subtotal"];
		$codbarras=$_REQUEST["codbarras"];
	}else{
		echo "Error: Detalle no definido";exit();
	}
	if(isset($_REQUEST["prec_total"]))
		$prec_total=$_REQUEST["prec_total"];
	else{
		echo "Precio Total no definido";exit();
	}
	/*if(count($id_prod) && count($producto) && count($precio) && count($cantpeso) && count($subtotal) && count($codbarras)){
		$long=count($id_prod);
	else
		echo "Error";*/
	//obtiene el maximo id de compra
	$sql="SELECT ifnull(max(id_compra),0)+1 FROM compra_r";
	$nroCompra="";
	if($result = $con->query($sql)){
		if($result->num_rows > 0){
			while ($row = $result->fetch_array() ) {
				$nroCompra= $row[0];
			}
		}else
			echo "ningun registro";
	}else
		echo "Error consulta";
	$sql="SELECT id_cliente FROM cliente where ci='{$txt_ci}'";
	$id_cliente="";
	if($result = $con->query($sql)){
		if($result->num_rows > 0){
			while ($row = $result->fetch_array() ) {
				$id_cliente= $row[0];
			}
		}else
			echo "ningun registro";
	}else
		echo "Error consulta";

	$id_user=$_SESSION['id_user'];
	$long=count($id_prod);
	$fecha=date('Y-m-d H:i:s');
	$sqlrecibo="INSERT INTO compra_r(id_compra,nro_recibo, total, fecha, id_cliente, id_usuario) values({$nroCompra}, {$nroCompra}, {$prec_total},'{$fecha}',{$id_cliente},{$id_user})";
	if($con->query($sqlrecibo)){
		$cont=0;
		for ($i = 0; $i < $long; $i++) {
			$sqldetalle="INSERT INTO producto_etiquetado(cod_barras,preciototal, peso_cantidad, id_prod, id_compra) values({$codbarras[$i]},{$precio[$i]}, {$cantpeso[$i]}, {$id_prod[$i]}, {$nroCompra})";
			/*echo "<br>============================<br>";
		    echo "IdProducto-->".$id_prod[$i]."<br>";
		    echo "Producto-->".$producto[$i]."<br>";
		    echo "Precio-->".$precio[$i]."<br>";
		    echo "Cant o Peso-->".$cantpeso[$i]."<br>";
		    echo "Subtotal-->".$subtotal[$i]."<br>";
		    echo "Cod Barras-->".$codbarras[$i]."<br>";
		    echo "============================<br>";*/
		    if(!$con->query($sqldetalle)){
		    	echo "Falló la insercion detalle: (" . $con->errno . ") " . $con->error;exit();
		    }else{
		    	$cont++;
		    }
		}
		if($cont==$long)
			echo 1;
		else
			echo 0;
	}else {
		echo "Falló la insercion: Recibo (" . $con->errno . ") " . $con->error;exit();
	}
		
?>