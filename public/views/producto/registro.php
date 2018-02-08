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
                           <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                               <div class="row">
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <label for="user">NRO de PLU de balanza </label>

                                   </div>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <label for="cname">Nombre del producto </label>
                                   </div>
                                   
                               </div>

                               <div class="row">
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                       <input class="form-control " id="nro_plu" type="number" name="nro_plu"/>
                                        

                                   </div>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <input class=" form-control" id="nombre" name="nombre" type="text"/>
                                   </div>
                                   
                               </div>
<br>
                                <div class="row">
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                       <label for="cname">tipo de venta </label>
                                   </div>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <label for="precio" id="mensaje"></label>
                                        
                                   </div>
                                   
                               </div>

                               <div class="row">
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <select  name="tipoVenta" id="tipoVenta" class="form-control">
                                        <option value="" selected="selected">peso o cantidad selecione una opcion</option>
                                    
                                        <option value="1" >1.CANTIDAD</option> 
                                        <option value="2" >2.PESO</option>

                                        </select>
                                   </div>
                                   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <input class=" form-control" id="precio" name="precio" type="number"/>
                                   </div>
                                   
                               </div>

                           </div>
                       </div>
<br>
                       
                                
                                    <button class="btn btn-primary" type="submit" id="btnRegistrar">Registrar</button>
                                
                        
                       
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>

<script language="JavaScript" type="text/JavaScript">
    $(document).ready(function(){
        $("#tipoVenta").change(function(event){ 
            var id = $("#precio").find(':selected').val();
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
                nro_plu:{
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
                precio: {
                        required:true,
                        minlength:1,
                        maxlength:4,
                        range:[0.1,999.000],
                       
                    },



            },
             messages:{
                nombre:{
                    required:"Este es Campo Obligatorio.",
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