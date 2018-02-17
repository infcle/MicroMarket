<?php 
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php"); 
	  $b=$_REQUEST['b'];
		$sql = $con->query("SELECT * FROM producto WHERE nombre LIKE '%".$b."%' LIMIT 10");
              
            $contar =$sql->num_rows;
              
            if($contar == 0){
                  echo "No se han encontrado resultados para '<b>".$b."</b>'.";
            }else{
		              foreach ($sql as $row ) {
		              $nombre = $row['nombre'];
		                $plu = $row['nro_plu'];
		                echo $plu." - ".$nombre."<br />";
		            
		              }
		                
		        }
			?>