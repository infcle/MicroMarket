<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                categoria de subsidio
                <span class="tools pull-right">
                    <a href="#modal_Registrar" class="fa fa-plus" data-toggle="modal" data-placement="top" title="nueva categoria"></a>
                 </span>
                 <?php require_once 'modal_registrar.php'; ?>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table  class="display table table-bordered table-striped" id="dynamic-table">
                        <thead>
                            <tr>
                                <th>codigo</th>
                                <th>NOMBRE DE LA CATEGORIA</th>
                                <th>LIMITE DE COMPRA (BS)</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($categorias as $categoria): ?>
                                <tr class="gradeX">
                                    <td><?php echo $categoria['id_categoria']; ?></td>
                                    <td><?php echo $categoria['nombre']; ?></td>
                                    <td><?php echo $categoria['limite']; ?></td>
                                    <td ></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>codigo</th>
                                <th>NOMBRE DE LA CATEGORIA</th>
                                <th>LIMITE DE COMPRA (BS)</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    $(document).ready(function() {
         $('#frmEditar').validate({ 
            debug:true,
            rules:{
                name:{
                    required:true,
                    minlength: 5,
                    maxlength:60,
                },
                user:{
                    required:true,
                    minlength: 2,
                    maxlength:4,
                    range:[1,9999],
                },

              name:{
                    required:"Este es Campo Obligatorio.",
                },

                user:{
                    required:"Este es Campo Obligatorio.",
                },
            },
            submitHandler: function (form) {alert('exito');
                    $.ajax({
                        url: '../../models/user/editar_model.php',
                        type: 'post',
                        data: $("#frmEditar").serialize(),
                        beforeSend: function() {
                            transicion("Procesando Espere....");
                        },
                        success: function(response) {
                            if(response==1){
                                $('#modalEditar').modal('hide');
                                $('#btnEditar').attr({
                                    disabled: 'true'
                                });
                                transicionSalir();
                                mensajes_alerta('DATOS CREADOS EXITOSAMENTE !! ','success','EDITAR DATOS');
                                setTimeout(function(){
                                    window.location.href='<?php echo ROOT_CONTROLLER ?>user/index.php';
                                }, 3000);
                            }else{
                                transicionSalir();
                                mensajes_alerta('ERROR AL CREAR LA CATEGORIA verifique los datos!! '+response,'error','EDITAR DATOS');
                            }
                        }
                    });
            }
        });
    });
</script>