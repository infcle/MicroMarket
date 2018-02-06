<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                Nueva seccion
            </header>
            <div class="panel-body">
                <div class=" form">
                    <form class="cmxform form-horizontal adminex-form" id="frmCategoria" name="frmCategoria" method="post">
                        <div class="form-group ">
                            <label for="cname" class="control-label col-lg-2">Nombre de la Seccion (obligatorio)</label>
                            <div class="col-lg-6">
                                <input class=" form-control" id="nombre" name="nombre" type="text"  />

                            </div>
                        </div>
                        <div class="form-group ">
                            <label for="user" class="control-label col-lg-2">Limite de Credito(Obligatorio)</label>
                            <div class="col-lg-6">
                                <input class="form-control " id="limite" type="text" name="limite" /> <br><br>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button class="btn btn-primary" type="submit">Registrar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#frmCategoria").validate({
            debug:true,
            rules:{
                nombre:{
                    required:true,
                    minlength: 3,
                    maxlength:30,
                },
                limite:{
                    required:true,
                    minlength: 1,
                    maxlength:4,
                },
            },
             messages:{
                nombre:{
                    required:"Este es Campo Obligatorio.",
                },
                limite:{
                    required:"Este es Campo Obligatorio."
                },
            },
        });
    });
</script>