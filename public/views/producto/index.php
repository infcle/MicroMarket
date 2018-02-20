<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Lista de productos
                <span class="tools pull-right">
                    <a href="javascript:;" class="fa fa-chevron-down"></a>
                    <a href="<?php echo ROOT_CONTROLLER; ?>producto/registro.php" class="fa fa-plus"></a>
                 </span>
            </header>
            <div class="panel-body">
                <div class="adv-table">
                    <table  class="display table table-bordered table-striped" id="tbProductos">
                        <thead>
                            <tr>
                                <th>Nro PLU</th>
                                <th>Nombre producto</th>
                                <th>tipo venta</th>
                                <th>Precio</th>
                                <th>Codigo PLU</th>
                                <th>Seccion</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($productos as $producto): ?>
                                <tr class="gradeX">
                                    <td class="text-right"><?php echo $producto['nro_plu']; ?></td>
                                    <td><?php echo $producto['nomProducto']; ?></td>
                                    <td><?php echo $producto['tipo']; ?></td>
                                    <td class="text-right"><?php echo $producto['precio']; ?></td>
                                    <td class="text-right"><?php echo $producto['cod_plu']; ?></td>
                                    <td><?php echo $producto['nomSeccion']; ?></td>
                                    <td>
                                        <a class="btn btn-success" href="#modalEditar" role="button" data-placement="top" title="Editar" data-toggle="modal" onclick="obtener_datos(<?php echo $producto['id_prod'] ?>)"><span class="fa fa-edit" ></span>
                                        </a>
                                        <a class="btn btn-danger" href="#" role="button" data-toggle="tooltip" data-placement="top" title="Eliminar"><span class="fa fa-trash-o"></span>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Nro PLU</th>
                                <th>Nombre producto</th>
                                <th>tipo venta</th>
                                <th>Precio</th>
                                <th>Codigo PLU</th>
                                <th>Seccion</th>
                                <th class="hidden-phone">Acciones</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </section>
    </div>
</div>
<?php require_once 'modal_editar.php'; ?>
<?php require_once 'modal_eliminar.php'; ?>
<script>
    
    function obtener_datos(id){
        $.ajax({
            url: '../../models/producto/datos_producto.php',
            type: 'POST',
            dataType: "json",
            data: {id_producto: id},
            success: function(datos){
                console.log(datos);
                $("#id_producto").val(datos['producto']['id_prod']);
                $("#plu").val(datos['producto']['nro_plu']);
                $("#nombre").val(datos['producto']['nombre']);
                $("#precio").val(datos['producto']['precio']);
                if(datos['producto']['tipo']==1){
                    $("#tipoVenta").html('<option value=1 selected>Cantidad</option><option value=2>Peso</option>');
                }else{
                    $("#tipoVenta").html('<option value=1>Cantidad</option><option value=2 selected>Peso</option>');
                }
                $("#seccion option").each(function() {
                    if($(this).attr('value') == datos['producto']['idseccion']){
                        //alert('value: '+$(this).attr('value'));
                        $(this).attr('selected', 'true');
                    }
                });
            }
        });
    }

    $(document).ready(function() {
        $('#tbProductos').dataTable({
           oSearching: false,
        });
    });


</script>