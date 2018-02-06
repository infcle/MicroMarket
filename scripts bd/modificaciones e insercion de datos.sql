#quitando llave foranea
ALTER TABLE producto_etiquetado
DROP FOREIGN KEY `FK_DERIV_DET`;
ALTER TABLE producto_etiquetado
DROP COLUMN id_deriv,
DROP INDEX `FK_DERIV_DET` ;
#eliminando la tabla
drop table productos_deriados;
#cambaindo la tabla producto al requerimiento
ALTER TABLE `marketbd`.`producto` 
DROP COLUMN `subproducto`,
CHANGE COLUMN `estado` `nroplu` TINYINT(1) NOT NULL COMMENT 'es el numero que esta registrado en la balanza' AFTER `id_prod`,
CHANGE COLUMN `limite` `tipo` INT(11) NOT NULL COMMENT 'si es pesable 2 y si es unidad 1' AFTER `descripcion`,
CHANGE COLUMN `precioxkilo` `precio` FLOAT NULL DEFAULT NULL AFTER `tipo`,
CHANGE COLUMN `nombre` `descripcion` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NULL DEFAULT '2' ;

#cargar datos a categoria

insert into categoria values('1','CARNES',0);
insert into categoria values('2','FRUTAS',0);
insert into categoria values('3','VERDURAS',0);
insert into categoria values('4','TUBERCULOS',0);

#CARGANDO LOS PRODUCTOS
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '1', 'filete', '2', '60', '2001', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '2', 'pulpa', '2', '48', '2002', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '3', 'cabeza de lomo', '2', '48', '2003', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '4', 'peseto', '2', '48', '2004', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '5', 'churrasco', '2', '38', '2005', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '6', 'aujilla', '2', '30', '2006', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '7', 'costilla', '2', '28', '2007', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '8', 'cadera', '2', '32', '2008', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '9', 'pecho', '2', '28', '2009', '1');
INSERT INTO `marketbd`.`producto` (`nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '10', 'lapin', '2', '32', '2010', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '11', 'molida', '2', '38', '2011', '1');
INSERT INTO `marketbd`.`producto` (`nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ('12', 'ozobuco', '2', '28', '2012', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '13', 'pollo', '2', '16', '2013', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '14', 'pescado_pacu', '2', '40', '2014', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '15', 'pescado_trucha', '2', '45', '2015', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '16', 'pesacado_pejerrey', '2', '50', '2016', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '17', 'huevo_setenta', '1', '0,73', '1017', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '18', 'huevo_ochenta', '1', '0,83', '1018', '1');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '19', 'papaya', '1', '8', '1019', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '20', 'platano', '1', '0,7', '1020', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '21', 'naranja', '1', '0,5', '1021', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '22', 'durazno', '2', '8', '2022', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '23', 'tuna', '1', '1', '1023', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '24', 'piña', '1', '10', '1024', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '25', 'mandarina', '1', '0,8', '1025', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '26', 'uva', '2', '10', '2026', '2');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '27', 'apio', '2', '3', '2027', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '28', 'zanahoria', '2', '6', '2028', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '29', 'vainitas', '2', '6', '2029', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '30', 'espinaca', '2', '8', '2030', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '31', 'arberja', '2', '10', '2031', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '32', 'postre', '1', '1,5', '1032', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '33', 'locoto', '2', '10', '2033', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '34', 'perejil', '2', '3', '2034', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '35', 'cebolla', '2', '8', '2035', '3');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '36', 'papa', '2', '6,5', '2036', '4');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '37', 'camote', '2', '6', '2037', '4');
INSERT INTO `marketbd`.`producto` ( `nroplu`, `descripcion`, `tipo`, `precio`, `cod_barras`, `id_cat`) VALUES ( '38', 'yuca', '2', '8', '2038', '4');



