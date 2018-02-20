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
                                    <td >
                                         <a class="btn btn-success" href="#modalEditar" role="button" data-placement="top" title="Editar" data-toggle="modal" onclick="obtener_datos(<?php echo $seccion['id_seccion'] ?>)">
                                            <span class="fa fa-edit" ></span>
                                        </a>
                                        <a class="btn btn-danger" href="#modalEliminar" role="button" data-toggle="modal" data-placement="top" title="Eliminar" onclick="eliminar_datos(<?php echo $seccion['id_seccion'] ?>)">
                                            <span class="fa fa-trash-o"></span>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php require_once 'modal_registrar.php'; ?>
            <?php require_once 'modal_eliminar.php'; ?>
             <?php require_once 'modal_editar.php'; ?>

        </section>
    </div>
</div>
<script>
     function obtener_datos(id){
        $.ajax({
            url: '../../models/seccion/datos_seccion.php',
            type: 'POST',
            dataType: "json",
            data: {id_seccion: id},
            success: function(datos){
                $("#name").val(datos['seccion']['nombre']);
                $("#id_seccion_modificar").val(datos['seccion']['id_seccion']);
                
                
            }
        });
    }

       $(document).ready(function() {
            $('#frmEditar').validate({
            debug:true,
            rules:{
                name:{
                    required:true,
                    minlength: 4,
                },
              
            },
          
            submitHandler: function (form) {
                $.ajax({
                    url: '../../models/seccion/editar_model.php',
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
                            mensajes_alerta('DATOS EDITADOS EXITOSAMENTE !! ','success','EDITAR DATOS');
                            setTimeout(function(){
                                window.location.href='<?php echo ROOT_CONTROLLER ?>user/index.php';
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