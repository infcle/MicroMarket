<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Lista de limites derivados
                <span class="tools pull-right">
                    <a href="#modal_Registrar" class="fa fa-plus" data-toggle="modal" data-placement="top" title="nueva categoria"></a>
                 </span>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table  class="display table table-bordered table-striped" id="dynamic-table">
                        <thead>
                            <tr>
                                <th>codigo</th>
                                <th>NOMBRE DEL LIMITE</th>
                                <th>LIMITE DE COMPRA (BS)</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($limites as $limite): ?>
                                <tr class="gradeX">
                                    <td><?php echo $limite['id_limite']; ?></td>
                                    <td><?php echo $limite['nombre']; ?></td>
                                    <td><?php echo $limite['limite']; ?></td>
                                    <td ></td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>codigo</th>
                                <th>NOMBRE DEL LIMITE</th>
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
        
         $('#frmRegistrar').validate({ 
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 5,
                    maxlength:60,
                },
                limite:{
                    required:true,
                    minlength: 2,
                    maxlength:4,
                    range:[1,9999],
                },

              
            },
          
           submitHandler: function (form) {
                    $.ajax({
                        url: '../../models/categoria/registro_model.php',
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
                                    window.location.href='<?php echo ROOT_CONTROLLER ?>categoria/index.php';
                                }, 3000);
                            }else{
                                transicionSalir();
                                mensajes_alerta('ERROR AL EDITAR EL USUARIO verifique los datos!! '+response,'error','EDITAR DATOS');
                            }
                        }
                    });
            }
           
            
        });
    });
</script>