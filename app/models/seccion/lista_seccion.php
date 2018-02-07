<?php foreach ($secciones as $seccion): ?>
    <tr class="gradeX">
        <td><?php echo $seccion['id_seccion']; ?></td>
        <td><?php echo $seccion['nombre']; ?></td>
        <td><?php echo $seccion['limite']; ?></td>
        <td ></td>
    </tr>
<?php endforeach ?>