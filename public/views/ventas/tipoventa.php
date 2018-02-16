<?php 
if (isset($_REQUEST["id"])) {
	$tipo_venta=$_REQUEST["id"];
	//echo "tipo venta -->".$_POST["id"];
}else{echo "Error: Tipo de venta no definida";}
if($tipo_venta=="manual"){
	echo '<h4>VENTA MANUAL</h4>
		  <div class="form-group">
            <label>Seleccione Producto </label>
            <select class="selectpicker">
                <option>Carne</option>
                <option>Ketchup</option>
                <option>Huevo</option>
            </select>
          </div>
          <div class="form-group">
             <label>Cantidad </label>
             <input type="text" name="plu">
          </div>';
}else{
	echo '<h4>VENTA CON CÓDIGO DE BARRAS</h4>
			<div class="form-group">
            	 <label>Ingrese Código de barras</label>
            	 <input type="text" name="cod_barra">
          	</div>';
}
?>