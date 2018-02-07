<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                <div class="row panel-heading">
                    Lista de secciones
                    <span class="tools pull-right">
                        <a href="#modalRegistro" data-placement="top" title="Nueva Seccion" data-toggle="modal" class="fa fa-plus"></a>
                    </span>
                </div>
            </header>
            <div class="panel-body">
                <div class="row">
                    <label class="control-label col-md-2" for="categoria">SELECCIONE CATEGORIA</label>
                    <div class="col-md-4">
                        <select name="categoria" id="inputCategoria" class="form-control" required="required">
                            <option value="">Seleccione categoria</option>
                        </select>
                    </div>
                </div>
                <div class="adv-table">
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
                            <?php require_once '../../models/seccion/lista_seccion.php'; ?>
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
        </section>
    </div>
</div>