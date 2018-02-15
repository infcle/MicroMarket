<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
<<<<<<< HEAD
                Venta de Productos
               
                   <span class="pull-right">
                    <a href="#modal_ventas" class="btn btn-xs btn-success" data-toggle="modal"><span class="fa  fa-pencil"></span> Nuevo Cliente</a>
=======
                VENTA DE PRODUCTOS
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="<?php echo ROOT_CONTROLLER; ?>user/registro.php" class="fa fa-plus"></a>
>>>>>>> ventas
                 </span>
            </header>
                    <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="row">
                            <div class="col-lg-4">
                                   DATOS DEL USUARIO                       
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">C.I.</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="txt_ci" placeholder="Carnet de identidad">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Cliente</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="txt_usuario" placeholder="Nombre del usuario">
                                            
                                        </div>
                                    </div>
                            </div>     
                            <div class="col-lg-3">
                                    TIPO DE VENTA
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="manual" checked>
                                            Manual
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="barras">
                                            Cod. Barras
                                        </label>
                                    </div>
                            </div>
                            <div class="col-lg-5">
                                <div id="resultado" class="jumbotron">
                                    
                                </div>
                            </div>
                        </form>
                    </div>
        </section>
        <section class="panel">
            <header class="panel-heading">
                DETALLE DE VENTA
            </header>
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Producto</th>
                          <th>Precio Unitario</th>
                          <th>Cantidad/Peso</th>
                          <th>Subtotal</th>
                        </tr>
                      </thead>
                      <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Carne</td>
                              <td>12</td>
                              <td>1</td>
                              <td>123</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>huevo</td>
                              <td>0.50</td>
                              <td>5</td>
                              <td>30</td>
                            </tr>
<<<<<<< HEAD
                        </tfoot>
                    </table>
                </div>
            </div-->
             <?php require_once 'modal_ventas.php'; ?>
        </section>
    </div>
</div>

<script>
    $(document).ready(function() {
         $('#frmRegistrar').validate({ 
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 8,
                    maxlength:40,
                },
                ci:{
                   required:true,
                    minlength:5,
                    maxlength:20,
                    
                },
            },
            submitHandler: function (form) {
                $.ajax({
                    url: '../../models/cliente/registro_model.php',
                    type: 'post',
                    data: $("#frmRegistrar").serialize(),
                    beforeSend: function() {
                        transicion("Procesando Espere....");
                    },
                    success: function(response) 
                    {
                        if(response==1)
                        {
                            var nom=$('#nombre').val();
                            var ci=$('#ci').val();
                           
                            $('#nombre').val('');
                            $('#ci').val('');
                           
                            $('#txt_usuario').val(nom);
                            $('#txt_ci').val(ci);

                            $('#modal_ventas').modal('hide');
                            $('#btnRegistrar').attr({
                                disabled: 'true'
                            });
                            transicionSalir();
                            mensajes_alerta('DATOS REGISTRADOS EXITOSAMENTE !! ','success','EDITAR DATOS');
                            
                        }
                        else
                        {
                            transicionSalir();
                            mensajes_alerta('ERROR AL REGISTRAR AL CLIENTE verifique los datos!! '+response,'error','REGISTRAR DATOS');
                        }
                    }
                });
            }
        });
    });
</script>
=======
                      </tbody>
                </table>
                <label>Total </label>
                 <input type="text" name="prec_total">
            </div>
        </section>
    </div>
</div>
    <script type="text/javascript">
    $(document).ready(function()
    {
        $("input[name=optionsRadios]").click(function () {    
            //alert("tipo de venta seleccionada es: " + $('input:radio[name=optionsRadios]:checked').val());
            var valor=$(this).val();
            $.ajax({
              url: '../../../public/views/ventas/tipoventa.php',
              type: 'post',
              data: {id: valor},
              success: function(response) {
                $('#resultado').html(response);
              }
            });
        });
    });
    </script>
>>>>>>> ventas
