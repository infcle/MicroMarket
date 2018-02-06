<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Lista de usuarios
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="<?php echo ROOT_CONTROLLER; ?>user/registro.php" class="fa fa-plus"></a>
                 </span>
            </header>
            <div class="panel-body">
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
                                    <td>
                                        <a class="btn btn-success" href="#" role="button" data-toggle="tooltip" data-placement="top" title="Editar">
                                            <span class="fa fa-edit"></span>
                                        </a>
                                        <a class="btn btn-danger" href="#" role="button" data-toggle="tooltip" data-placement="top" title="Eliminar">
                                            <span class="fa fa-trash-o"></span>
                                        </a>
                                    </td>
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
            </div>
        </section>
    </div>
</div>
<script>
    
</script>