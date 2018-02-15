<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Venta de Productos
               
                   <span class="pull-right">
                    <a href="#modal_ventas" class="btn btn-xs btn-success" data-toggle="modal"><span class="fa  fa-pencil"></span> Nuevo Cliente</a>
                 </span>
            </header>
                    <div class="panel-body">
                    <form class="form-horizontal" role="form">
                        <div class="row">
                            <div class="col-lg-6">
                                   DATOS DEL USUARIO                       
                                    <div class="form-group">
                                        <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Usuario</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="txt_usuario" placeholder="Nombre del usuario">
                                            
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword1" class="col-lg-2 col-sm-2 control-label">C.I.</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="txt_ci" placeholder="Carnet de identidad">
                                        </div>
                                    </div>
                            </div>     
                            <div class="col-lg-6">
                                    TIPO DE VENTA
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                                            Manual
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                                            Cod. Barras
                                        </label>
                                    </div>
                                    </div>
                            </div>
                            <div class=""></div>
                        </form>
                    </div>

            <!--div class="panel-body">
                <div class="adv-table">
                    <table  class="display table table-bordered table-striped" id="dynamic-table">
                        <thead>
                            <tr>
                                <th>Nombre completo</th>
                                <th>Usuario</th>
                                <th>Estado</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($usuarios as $user): ?>
                                <tr class="gradeX">
                                    <td><?php echo $user['nombre']; ?></td>
                                    <td><?php echo $user['usuario']; ?></td>
                                    <td><?php echo $user['estado']; ?></td>
                                    <td ></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Nombre completo</th>
                                <th>Usuario</th>
                                <th>Estado</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
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
                    minlength: 4,
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