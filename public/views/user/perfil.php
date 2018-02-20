<div class="row">
    <div class="col-md-4">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="profile-pic text-center">
                            <img alt="" src="<?php echo ROOT ?>resources/assets/images/photos/user-avatar.png">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        <ul class="p-info">
                            <li>
                                <div class="title">Nombre</div>
                                <div class="desk"><?php echo $_SESSION['nombre']; ?></div>
                            </li>
                            <li>
                                <div class="title">Usuario</div>
                                <div class="desk"><?php echo $_SESSION['user_name']; ?></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-8">
        <div class="row">
            <div class="col-md-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="profile-desk">
                            <h1> Configuracion general de la cuenta</h1>
                            <span class="designation">instruciones</span>
                            <p>
                                Usted solo puede configurar el nombre de usuario y su contraseña
                            </p>
                            <div class="text-right">
                                <a class="btn btn-info" href="#modalEditarPassword" role="button" data-toggle="modal">modificar contraseña</a>
                                <a class="btn btn-success" href="#modalEditar" role="button" data-toggle="modal">modificar nombre de usuario</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once 'modal_edit_perfil.php'; ?>
<?php require_once 'modal_edit_password.php'; ?>
<script>
    $(document).ready(function() {
        $('#frmEditarUser').validate({
            debug:true,
            rules:{
                user:{
                    required:true,
                    minlength: 3,
                    remote: {
                        url: "../../models/user/verifica.php",
                        type: 'post',
                        data: {
                            user: function() {
                                return $("#user").val();
                            },
                            tipo: 'si',
                            id_user: function() {
                                return <?php echo $_SESSION['id_user'] ?>
                            },
                        }
                    }
                }
            },
            messages:{
                user:{
                    remote:"el nombre de usuario ya existe, seleccione otro."
                }
            },
            submitHandler: function (form) {
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
        $('#frmEditarPassword').validate({
            debug:true,
            rules:{
                password:{
                    required:true,
                    minlength:6,
                },
                repeatPaswword:{
                    required:true,
                    minlength: 6,
                    equalTo: "#password",
                },
            },
            messages:{
                repeatPaswword:{
                    equalTo :"Las contraseñas no coinciden."
                }
            },
            submitHandler: function (form) {
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