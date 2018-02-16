<?php 
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");

	/*echo "<pre>";print_r($_REQUEST);echo "</pre>";*/

if(isset($_REQUEST["txt_ci"])){$txt_ci=$_REQUEST["txt_ci"];}else{echo "Error: CI no definido";}
if(isset($_REQUEST["txt_usuario"])){$txt_usuario=$_REQUEST["txt_usuario"];}else{echo "Error: Cliente no definido";}
if(isset($_REQUEST["id_prod"]) && isset($_REQUEST["producto"]) && isset($_REQUEST["precio"]) && isset($_REQUEST["cantpeso"]) && isset($_REQUEST["subtotal"]) && isset($_REQUEST["codbarras"]) && isset($_REQUEST["prec_total"]))
	{	$id_prod=$_REQUEST["id_prod"];
		$producto=$_REQUEST["producto"];
		$precio=$_REQUEST["precio"];
		$cantpeso=$_REQUEST["cantpeso"];
		$subtotal=$_REQUEST["subtotal"];
		$codbarras=$_REQUEST["codbarras"];		
	}else{echo "Error: Detalle no definido";}
if(isset($_REQUEST["prec_total"])){$prec_total=$_REQUEST["prec_total"];}else{echo "Precio Total no definido";}
/*foreach ($id_prod as $fila) {
	echo "<pre>";
	print_r($fila);
	echo "</pre>";
}*/
if(count($id_prod) && count($producto) && count($precio) && count($cantpeso) && count($subtotal) && count($codbarras)){$long=count($id_prod);}else{echo "Error";}

for ($i = 0; $i < $long; $i++) {
	/*echo "<br>============================<br>";
    echo "IdProducto-->".$id_prod[$i]."<br>";
    echo "Producto-->".$producto[$i]."<br>";
    echo "Precio-->".$precio[$i]."<br>";
    echo "Cant o Peso-->".$cantpeso[$i]."<br>";
    echo "Subtotal-->".$subtotal[$i]."<br>";
    echo "Cod Barras-->".$codbarras[$i]."<br>";
    echo "============================<br>";*/
}
//obtiene el maximo id de compra
$sql="SELECT ifnull(max(id_compra),0)+1 FROM compra_r";
	if($result = $con->query($sql)){
		if($result->num_rows > 0){
			while ($row = $result->fetch_array() ) {
				echo $row[0];			
			}
		}else{echo "ningun registro";}
	}else{echo "Error consulta";}

	
?>