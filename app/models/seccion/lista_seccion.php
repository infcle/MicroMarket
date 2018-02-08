<?php
	require_once ("../../config/db.php");
	require_once ("../../config/conexion.php");
	require_once ("../../config/route.php");
	if (!($secciones = $con->query("SELECT * FROM seccion"))) {
    	echo "Falló SELECT: (" . $con->errno . ") " . $con->error;
	}
	if ($secciones->num_rows >0) {
		foreach ($secciones as $seccion): ?>
		    <tr class="gradeX">
		        <td><?php $seccion['id_seccion']; ?></td>
		        <td><?php $seccion['nombre']; ?></td>
		        <td><?php $seccion['limite']; ?></td>
		        <td ></td>
		    </tr>
		<?php endforeach;
	}else{
		echo '<tr> <td valign="top" colspan="4" class="dataTables_empty">no existen datos</td>
		</tr>';
	}
?>
