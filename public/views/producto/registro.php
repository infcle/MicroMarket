<div class="row">
  <div class="col-md-12">
    <section class="panel">
      <header class="panel-heading">
        REGISTRO DE PRODUCTO
      </header>
      <div class="panel-body">
        <div class="form">
          <form class="form-horizontal adminex-form" id="frmProducto" name="frmProducto">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
                <div class="form-group">
                  <label for="user" class="col-sm-4 control-label">NRO de PLU de balanza </label>
                  <div class="col-sm-8">
                    <div class="col-sm-6">
                      <input class="form-control text-right" autofocus="true" id="nro_plu" type="text" name="nro_plu" value="<?php echo $fila[0]; ?>"/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="cname" class="col-sm-4 control-label">Nombre del producto </label>
                  <div class="col-sm-8">
                    <div class="col-sm-12">
                      <input class=" form-control" id="nombre" name="nombre" type="text"/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="tipo" class=" col-sm-4 control-label">Tipo de venta </label>
                  <div class="col-sm-8">
                    <div class="col-sm-8">
                      <select  name="tipoVenta" id="tipoVenta" class="form-control">
                        <option value="" selected="selected">selecione una opcion</option>
                        <option value="1" >1.CANTIDAD</option>
                        <option value="2" >2.PESO</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="precio" id="mensaje" class="col-sm-4 control-label">Precio</label>
                  <div class="col-md-8">
                    <div class="col-md-7">
                      <input class="form-control tooltips" id="precio" name="precio" type="number" disabled="true" placeholder="precio por kilo/unidad" data-toggle="tooltip" data-original-title="Debe seleccionar el tipo de venta"/>
                    </div>
                  </div>
                </div>
                <div class="alert alert-info fade in">
                  <strong>¡Aviso!</strong> Debe asignar en que categoria se encontrarra el producto y en que seccion de la categoria.
                </div>
              </div>
              <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                <div class="form-group">
                  <label class="col-sm-2 control-label col-lg-2" for="Categorias">CATEGORÍA</label>
                  <div class="col-lg-10 icheck">
                    <div class="square-blue single-row">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" value="1">
                          Subsidio universal
                        </label>
                      </div>
                    </div>
                    <div class="single-row">
                      <div class="col-md-12">
                        <div class="col-md-12 well">
                          <select name="seccion" id="inputSeccion" class="form-control" required="required">
                            <option value="">seleccione una seccion</option>
                            <option value="">Carne</option>
                            <option value="">Pollo</option>
                            <option value="">Huevo</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="square-blue single-row">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox" value="2">
                          Subsidio Prenatal
                        </label>
                      </div>
                    </div>
                    <div class="single-row">
                      <div class="col-md-12">
                        <div class="col-md-12 well">
                          <select name="seccion" id="inputSeccion" class="form-control" required="required">
                            <option value="">seleccione una seccion</option>
                            <option value="">Carnes y derivados</option>
                            <option value="">Frutas</option>
                            <option value="">Verduras</option>
                            <option value="">Tuberculos</option>
                          </select><br>                          
                          <div class="col-md-12 form-group">
                            <label>Selecione un limite para el derivado de la carne</label>
                            <select name="limite" id="inputLimite" class="form-control" required="required">
                              <option value="">Seleccione limite</option>
                              <option value="">Carne de vaca 350</option>
                              <option value="">Pollo y/o pescado 170</option>
                              <option value="">Huevo 25</option>
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row form-group text-center">
              <div class="form-group">
                <button class="btn btn-primary" type="submit" id="btnRegistrar">Registrar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </section>
  </div>
</div>
<script>
  $(document).ready(function() {
    $("#nro_plu").focus(function(){
      this.select();
    });
    $("#tipoVenta").change(function(event){
      var id = $("#tipoVenta").find(':selected').val();
      if(id==1){
        $("#mensaje").html("precio por cantidad ");

      }else if(id==2){
        $("#mensaje").html("precio por kilo ");
      }
      $("#precio").removeAttr('disabled');
      $("#precio").focus();
      $("#precio").removeAttr('data-toggle');
      $("#precio").removeAttr('data-original-title');
    });
    $("#frmProducto").validate({
      debug:true,
      rules:{
        nombre:{
          required:true,
          minlength: 3,
          maxlength:25
        },
        nro_plu:{
          required:true,
          minlength:1,
          maxlength:4,
          range:[1,999]
        },
        precio:{
          required:true,
          range:[0.1,999.99]
        },
        tipoVenta: {
          required: true
        },
        precio: {
          required:true,
          minlength:1,
          maxlength:4,
          range:[0.1,999.000]
        }
      },
      messages:{
        nombre:{
          required:"Este es Campo Obligatorio."
        },
        nro_plu:{
          required:"Este es Campo Obligatorio."
        },
        precio:{
          required:"Este es Campo Obligatorio."
        },
      },
      submitHandler: function (form) {
        $.ajax({
          url: '../../models/producto/registro_model.php',
          type: 'post',
          data: $("#frmProducto").serialize(),
          beforeSend: function() {
            transicion("Procesando Espere....");
          },
          success: function(response) {
            if(response==1){
              $('#btnRegistrar').attr({
                disabled: 'true'
              });
              transicionSalir();
              mensajes_alerta('DATOS GUARDADOS EXITOSAMENTE !! ','success','GUARDAR DATOS');
              setTimeout(function(){
                window.location.href='<?php echo ROOT_CONTROLLER ?>producto/index.php';
              }, 3000);
            }else{
              transicionSalir();
              mensajes_alerta('ERROR AL REGISTRAR EL PRODUCTO verifique los datos!! '+response,'error','GUARDAR DATOS');
            }
          }
        });
      }
    });
  });
</script>