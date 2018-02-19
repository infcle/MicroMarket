<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                <div class="row panel-heading">
                    Lista de secciones
                  <span class="pull-right">
                    <a href="#modal_Registrar" class="btn btn-xs btn-success" data-toggle="modal">
                        <span class="fa fa-pencil"></span> Nueva seccion
                    </a>
                 </span>
                </div>
            </header>
            <div class="panel-body">
                <div class="adv-table" >
                    <table  class="display table table-bordered table-striped" id="tdSeccione">
                        <thead>
                            <tr>
                                <th>codigo</th>
                                <th>Nombre de seccion</th>
                                <th class="text-center">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($secciones as $seccion): ?>
                                <tr class="gradeX">
                                    <td><?php echo $seccion['id_seccion']; ?></td>
                                    <td><?php echo $seccion['nombre']; ?></td>
                                    <td ></td>
                                </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php require_once 'modal_registrar.php'; ?>
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
                    minlength: 3,
                    maxlength:30,
                },
                limite:{
                    required:true,
                    minlength: 2,
                    maxlength:4,
                    range:[1,9999],
                },
                subsidio:{
                    required:true
                }
            },
            submitHandler: function (form) {
                $.ajax({
                    url: '../../models/seccion/registro_model.php',
                    type: 'post',
                    data: $("#frmRegistrar").serialize(),
                    beforeSend: function() {
                        transicion("Procesando Espere....");
                    },
                    success: function(response) {
                        if(response==1){
                            $('#modal_Registrar').modal('hide');
                            $('#btnRegistrar').attr({
                                disabled: 'true'
                            });
                            transicionSalir();
                            mensajes_alerta('DATOS EDITADOS EXITOSAMENTE !! ','success','EDITAR DATOS');
                            setTimeout(function(){
                                window.location.href='<?php echo ROOT_CONTROLLER ?>seccion/index.php';
                            }, 3000);
                        }else{
                            transicionSalir();
                            mensajes_alerta('ERROR AL EDITAR LA SECCION verifique los datos!! '+response,'error','EDITAR DATOS');
                        }
                    }
                });
            }
        });
        $('#tdSeccione').dataTable();
    });
</script>