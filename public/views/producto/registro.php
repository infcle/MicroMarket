<div class="row">
    <div class="col-md-12">
        <section class="panel">
            <header class="panel-heading">
                REGISTRO DE PRODUCTO
            </header>
            <div class="panel-body">
                <div class=" form">
                    <form class="cmxform form-horizontal adminex-form" id="frmProducto" name="frmProducto" method="post">

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                     
                            <div class="form-group ">
                                <label for="cname" class="control-label col-lg-4">Nombre del producto </label>
                                <div class="col-lg-6">
                                    <input class=" form-control" id="nombre" name="nombre" type="text"/>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="user" class="control-label col-lg-4">NRO de PLU de balanza </label>
                                <div class="col-lg-8">
                                <input class="form-control " id="nro" type="number" name="nro"/>
                                </div>
                            </div>

                           

                            <div class="form-group ">
                                <label for="user" class="control-label col-lg-4" id="mensaje"></label>
                                <div class="col-lg-8">
                                <input class="form-control " id="precio" type="number" name="precio" disabled="true" />
                                </div>
                            </div>

                         

                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button class="btn btn-primary" type="submit" id="btnRegistrar">Registrar</button>
                                </div>
                            </div>
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                             
                               <div class="form-group ">
                                
                                <div class="col-lg-6">
                                        <select  name="tipoVenta" id="tipoVenta" class="form-control">
                                        <option value="" selected="selected">peso o cantidad selecione una opcion</option>
                                    
                                        <option value="1" >1.CANTIDAD</option> 
                                        <option value="2" >2.PESO</option>

                                        </select>
                                </div>
                            </div>
                              
                             <div class="form-group ">
                                
                                <div class="col-lg-6">
                                        <select   name="seccion" id="seccion" class="form-control"  >
                                        <option value="" selected="selected">selecione una seccion</option> 
                                        <option value="1" >1. CARNES</option> 
                                        <option value="2" >2. VERDURAS</option>
                                        <option value="3">3. FRUTAS</option> 
                                        <option value="4" >4. TUBERCULOS</option>
                                        </select>
                                </div>
                            </div>
                        </div>
                        
                        </div>


                        
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<script language="JavaScript" type="text/JavaScript">
    $(document).ready(function(){
        $("#tipoVenta").change(function(event){ 
            var id = $("#tipoVenta").find(':selected').val();
            if(id==1)
            {
              $("#mensaje").html("precio por cantidad ");  
              
            }
            if(id==2)
            {
              $("#mensaje").html("precio por kilo ");  
              
            }
            $("#precio").removeAttr('disabled');
     
        });
    });
</script>


<script>
    $(document).ready(function() {
        $("#frmProducto").validate({
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 3,
                    maxlength:25,
                },
                nro:{
                    required:true,
                    minlength:1,
                    maxlength:4,
                    range:[1,999],
                },

                precio:{
                    required:true,
                    range:[0.1,999.99],
                },
                tipoVenta: {
                        required: true,
                        
                    },
                seccion: {
                        required: true,
                       
                    },



            },
             messages:{
                nombre:{
                    required:"Este es Campo Obligatorio.",
                },
                nro:{
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