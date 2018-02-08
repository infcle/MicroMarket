<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                <div class="row panel-heading">
                    Lista de secciones
                  <span class="tools pull-right">
                    <a href="#modal_Registrar" class="fa fa-plus" data-toggle="modal" data-placement="top" title="nueva seccion"></a>
                 </span>
                </div>
            </header>
            <div class="panel-body">
                <div class="row">
                    <label class="control-label col-md-2" for="categoria">SELECCIONE CATEGORIA</label>
                    <div class="col-md-4">
                        <select name="categoria" id="inputCategoria" class="form-control" required="required">
                            <option value="">Seleccione categoria</option>
                            <?php foreach ($categorias as $categoria): ?>
                            <option value="<?php echo $categoria['id_cagtegoria']; ?>"><?php echo $categoria['nombre']; ?></option>}
                            option
                            <?php endforeach ?>
                        </select>
                    </div>
                </div>
                <div class="adv-table" >
                    <table  class="display table table-bordered table-striped" id="dynamic-table">
                        <thead>
                            <tr>
                                <th>codigo</th>
                                <th>Nombre de seccion</th>
                                <th>Limite</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="lista">
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>codigo</th>
                                <th>Nombre de seccion</th>
                                <th>Limite</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <?php require_once 'modal_registrar.php'; ?>
        </section>
    </div>
</div>
<script>

    $(document).ready(function() {
        $('#lista').load('<?php echo ROOT ?>app/models/seccion/lista_seccion.php');
        $("#tipoVenta").change(function(event){
            var mid = $("#tipoVenta").find(':selected').val();
            $('#lista').load('<?php echo ROOT ?>app/models/seccion/lista_seccion.php?id='+mid);
        });
         $('#frmRegistrar').validate({ 
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 3,
                    maxlength:15,
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
    });

</script>