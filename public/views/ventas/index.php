<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <div class="panel-heading">
                VENTA DE PRODUCTOS
                <span class="pull-right">
                    <a href="#modal_ventas" class="btn btn-xs btn-success" data-toggle="modal">
                        <span class="fa  fa-pencil"></span> Nuevo Cliente
                    </a>
                </span>
            </div>
            <div class="panel-body">
                <form class="form-horizontal" role="form">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">C.I.</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="txt_ci" placeholder="Carnet de identidad">
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Cliente</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="txt_usuario" placeholder="Nombre del cliente">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        TIPO DE VENTA
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="manual" >
                                Manual
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios2" value="barras" checked>
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
        <div class="panel">
            <div class="panel-heading">
                DETALLE DE VENTA
            </div>
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
                            <td scope="row">1</td>
                            <td>Carne</td>
                            <td>12</td>
                            <td>1</td>
                            <td>123</td>
                        </tr>
                    </tbody>
                </table>
                <div class="row text-right">
                    <div class="col-md-12 panel-body">
                        <label>Total </label>
                        <input type="text" name="prec_total">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require_once 'modal_ventas.php'; ?>
<script type="text/javascript">
    $(document).ready(function(){
        $('#frmRegistrar').validate({
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 4,
                    maxlength:40,
                },
                ci:{
                    required:true,
                    minlength:5,
                    maxlength:20
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
                    success: function(response){
                        if(response==1){
                            var nom=$('#nombre').val();
                            var ci=$('#ci').val();
                            $('#nombre').val('');
                            $('#ci').val('');
                            $('#txt_usuario').val(nom);
                            $('#txt_ci').val(ci);
                            $('#modal_ventas').modal('hide');
                            $('#btnRegistrar').attr({disabled: 'true'});
                            transicionSalir();
                            mensajes_alerta('DATOS REGISTRADOS EXITOSAMENTE !! ','success','EDITAR DATOS');
                        }else{
                            transicionSalir();
                            mensajes_alerta('ERROR AL REGISTRAR AL CLIENTE verifique los datos!! '+response,'error','REGISTRAR DATOS');
                        }
                    }
                });
            }
        });
        $("input[name=optionsRadios]").click(function () {
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
        $('#resultado').load(<?php echo ROOT; ?>+"public/views/ventas/tipoventa.php?id=barras");
    });
</script>