<?php 
  require_once ("../../config/db.php");
  require_once ("../../config/conexion.php");
  $sql="SELECT * from producto where estado =1";
  if(!($productos=$con->query($sql))){
    echo "Falló consulta: (" . $con->errno . ") " . $con->error;
  }
  if (isset($_REQUEST["id"])) {
  	$tipo_venta=$_REQUEST["id"];
  	//echo "tipo venta -->".$_POST["id"];
  }else{echo "Error: Tipo de venta no definida";}
  if($tipo_venta=="manual"){?>
  	 <h4>VENTA MANUAL</h4>
  	  <div class="form-group">
        <label>Seleccione Producto </label>
        <select class="chosen-select" id="producto" name="producto" data-placeholder="Seleccione un producto" tabindex="4">
          <option value=""></option>
          <?php foreach ($productos as $producto): ?>
            <option value="<?php echo $producto['id_prod'] ?>"><?php echo $producto['nombre'] ?></option>
          <?php endforeach ?>
        </select>
      </div>
      <div class="form-group">
        <input type="tel" name="pesoCantidad" id="pesoCantidad" class="form-control" value="" required="required" title="">
      </div>
      <button type="button" class="btn btn-success">registrar</button>
  <?php }else{ ?>
  	<h4>VENTA CON CÓDIGO DE BARRAS</h4>
  		<div class="form-group">
        <label>Ingrese Código de barras</label>
        <input type="text" name="cod_barra" id="cod_barra" autofocus maxlength="13" autocomplete="false" onkeypress="leer()">
    	</div>
  <?php } ?>
  <script>
    $(document).ready(function() {
      $("#producto").chosen({
        disable_search_threshold: 10,
        no_results_text: "No se encontro resultados!",
        width: "95%"
      });
    });
  </script>