<div class="row">
    <div class="col-sm-12">
        <section class="panel">
            <header class="panel-heading">
                Reporte por fecha
            </header>
            <div class="panel-body">
                
            </div>
        </section>
    </div>
</div>
<script>
    function verRep(){
        $('#cuerpo').html('<embed src="<?php echo ROOT_CONTROLLER?>reporte/productosrep.php" width="100%" height="600"></embed>');
    }
</script>