/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.8-MariaDB : Database - marketbd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`marketbd` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;

USE `marketbd`;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idcategoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `categoria` */

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `ci` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `cliente` */

/*Table structure for table `compra_r` */

DROP TABLE IF EXISTS `compra_r`;

CREATE TABLE `compra_r` (
  `id_compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `nro_recibo` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `total` float NOT NULL,
  `fecha` datetime NOT NULL,
  `id_cliente` bigint(20) NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_compra`),
  KEY `FK_CLI_DET` (`id_cliente`),
  KEY `FK_USER_DET` (`id_usuario`),
  CONSTRAINT `FK_CLI_DET` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_DET` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_login` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `compra_r` */

/*Table structure for table `limite` */

DROP TABLE IF EXISTS `limite`;

CREATE TABLE `limite` (
  `idlimite` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `limite` int(11) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idlimite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `limite` */

/*Table structure for table `pertenece` */

DROP TABLE IF EXISTS `pertenece`;

CREATE TABLE `pertenece` (
  `cliente_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cliente_id`,`categoria_id`),
  KEY `fk_categoria_idx` (`categoria_id`),
  CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`idcategoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `pertenece` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `id_prod` bigint(20) NOT NULL AUTO_INCREMENT,
  `nroplu` tinyint(1) NOT NULL COMMENT 'es el numero que esta registrado en la balanza',
  `descripcion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT '2',
  `tipo` int(11) NOT NULL COMMENT 'si es pesable 2 y si es unidad 1',
  `precio` float DEFAULT NULL,
  `cod_barras` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `id_cat` bigint(11) NOT NULL,
  `id_limite` bigint(11) NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_prod`),
  KEY `id_cat` (`id_cat`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `seccion` (`id_cat`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `producto` */

insert  into `producto`(`id_prod`,`nroplu`,`descripcion`,`tipo`,`precio`,`cod_barras`,`id_cat`,`id_limite`,`fecha_actualizacion`,`fecha_modificacion`) values (1,1,'filete',2,60,'2001',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(2,2,'pulpa',2,48,'2002',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(3,3,'cabeza de lomo',2,48,'2003',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(4,4,'peseto',2,48,'2004',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(5,5,'churrasco',2,38,'2005',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(6,6,'aujilla',2,30,'2006',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(7,7,'costilla',2,28,'2007',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(8,8,'cadera',2,32,'2008',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(9,9,'pecho',2,28,'2009',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(10,10,'lapin',2,32,'2010',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(11,11,'molida',2,38,'2011',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(12,12,'ozobuco',2,28,'2012',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(13,13,'pollo',2,16,'2013',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(14,14,'pescado_pacu',2,40,'2014',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(15,15,'pescado_trucha',2,45,'2015',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(16,16,'pesacado_pejerrey',2,50,'2016',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(17,17,'huevo_setenta',1,0,'1017',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(18,18,'huevo_ochenta',1,0,'1018',1,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(19,19,'papaya',1,8,'1019',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(20,20,'platano',1,0,'1020',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(21,21,'naranja',1,0,'1021',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(22,22,'durazno',2,8,'2022',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(23,23,'tuna',1,1,'1023',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(24,24,'piña',1,10,'1024',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(25,25,'mandarina',1,0,'1025',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(26,26,'uva',2,10,'2026',2,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(27,27,'apio',2,3,'2027',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(28,28,'zanahoria',2,6,'2028',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(29,29,'vainitas',2,6,'2029',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(30,30,'espinaca',2,8,'2030',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(31,31,'arberja',2,10,'2031',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(32,32,'postre',1,1,'1032',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(33,33,'locoto',2,10,'2033',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(34,34,'perejil',2,3,'2034',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(35,35,'cebolla',2,8,'2035',3,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(36,36,'papa',2,6,'2036',4,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(37,37,'camote',2,6,'2037',4,0,'2018-02-05 19:48:20','0000-00-00 00:00:00'),(38,38,'yuca',2,8,'2038',4,0,'2018-02-05 19:48:20','0000-00-00 00:00:00');

/*Table structure for table `producto_etiquetado` */

DROP TABLE IF EXISTS `producto_etiquetado`;

CREATE TABLE `producto_etiquetado` (
  `id_etiqueta` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_barras` varchar(300) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'codigo de barras generado por productos etiquetados',
  `preciototal` float NOT NULL COMMENT 'precio deacurdo al peso o cantidad del producto',
  `peso_cantidad` float NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado si se vendio o no',
  `id_prod` bigint(20) DEFAULT NULL,
  `id_compra` bigint(20) DEFAULT NULL COMMENT 'aqui esta el id de la compra si es que se vende este producto',
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_etiqueta`),
  KEY `FK_PROD_DET` (`id_prod`),
  KEY `FK_COMPRA_DET` (`id_compra`),
  CONSTRAINT `FK_COMPRA_DET` FOREIGN KEY (`id_compra`) REFERENCES `compra_r` (`id_compra`),
  CONSTRAINT `FK_PROD_DET` FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `producto_etiquetado` */

/*Table structure for table `seccion` */

DROP TABLE IF EXISTS `seccion`;

CREATE TABLE `seccion` (
  `id_cat` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `limite` int(11) DEFAULT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `seccion` */

insert  into `seccion`(`id_cat`,`nombre`,`limite`,`fecha_actualizacion`,`fecha_modificacion`) values (1,'CARNES',0,'2018-02-05 19:48:26','0000-00-00 00:00:00'),(2,'FRUTAS',0,'2018-02-05 19:48:26','0000-00-00 00:00:00'),(3,'VERDURAS',0,'2018-02-05 19:48:26','0000-00-00 00:00:00'),(4,'TUBERCULOS',0,'2018-02-05 19:48:26','0000-00-00 00:00:00');

/*Table structure for table `usuario_login` */

DROP TABLE IF EXISTS `usuario_login`;

CREATE TABLE `usuario_login` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` int(11) NOT NULL DEFAULT '0',
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuario_login` */

insert  into `usuario_login`(`id_usuario`,`nombre`,`fecha_registro`,`usuario`,`contrasenia`,`estado`,`tipo`,`fecha_actualizacion`,`fecha_modificacion`) values (1,'Haki Ari','2018-02-01 02:26:10','admin','sss',1,0,'2018-02-05 20:54:52','0000-00-00 00:00:00'),(2,'Elmer Coronel Lima','2018-02-06 00:41:41','ecl','$2y$10$p3i4QEK5uD.OnxHku16Fc.ajk4lz6LMVsHA7eglVbMLAbUPhwU99a',1,2,'2018-02-05 19:48:29','0000-00-00 00:00:00'),(6,'Froilan Maidana','2018-02-06 01:38:54','froy','$2y$10$zKDvEzxFzeEqMEeNTHxzKeisj7MltVHsLj2MTGWS/RcnGej3B12cS',1,2,'2018-02-05 20:38:54','0000-00-00 00:00:00'),(7,'Sergio Quispe Flores','2018-02-06 01:41:48','sergui','$2y$10$Y1N/8mWxv817bxayZE2J1.xZjdflNNpvSiccP7CxlvW91tvOmQjyu',1,2,'2018-02-05 20:41:48','0000-00-00 00:00:00'),(8,'Luis miguel','2018-02-06 01:43:20','luis','$2y$10$27aC7EWNS4v.zQ9jBMuGh.QJgf2pceUbLxIlq9GVBSI16fnKqqw52',1,2,'2018-02-05 20:43:21','0000-00-00 00:00:00'),(9,'Jeanette Condori Mendoza','2018-02-06 01:49:51','jane','$2y$10$auRe.Hf.Pt5zuXvGJY8XtegTpv2Mn5ODGj925I0I1Nd..jXK2CyYu',1,2,'2018-02-05 20:49:51','0000-00-00 00:00:00');

/* Procedure structure for procedure `eliminarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente`(
in id_c int
)
BEGIN
delete from cliente where id_cliente=id_c;
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarUsuario`(
in id_u int
)
BEGIN
delete from usuario_login where id_usuario=id_u;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarcliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarcliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarcliente`(
in ci varchar(20),
in Nombre varchar(200)
)
BEGIN
insert into cliente(ci,nombre) values(ci,nombre);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarUsuario`(
in Nombre varchar(200),
in fecha_registro datetime,
in Usuario varchar(100),
in contrasenia varchar(255),
in tipo int(11)
)
BEGIN
insert into usuario_login(nombre, fecha_registro, usuario, contrasenia, tipo) values(Nombre,fecha_registro,Usuario,contrasenia,tipo);
END */$$
DELIMITER ;

/* Procedure structure for procedure `lista_clientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `lista_clientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_clientes`(
in cat bigint)
BEGIN
select * from cliente;
END */$$
DELIMITER ;

/* Procedure structure for procedure `modificarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `modificarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarCliente`(
in id_c int,
in ci varchar(20),
in Nombre varchar(200)
)
BEGIN
update cliente set nombre=Nombre, ci=ci where id_cliente=id_c;
END */$$
DELIMITER ;

/* Procedure structure for procedure `modificarUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `modificarUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarUsuario`(
in id_u int,
in Nombre varchar(200),
in fecha_reg datetime,
in Usuario varchar(100),
in contrasenia varchar(255),
in estado tinyint(1),
in tipo int(11)
)
BEGIN
update usuario_login set nombre=Nombre, fecha_registro=fecha_reg,usuario=Usuario,contrasenia=contrasenia,estado=estado,tipo=tipo where id_usuario=id_u;
END */$$
DELIMITER ;

/* Procedure structure for procedure `producto_categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `producto_categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `producto_categoria`(
in cat bigint)
BEGIN
select * from producto where id_cat=cat;
END */$$
DELIMITER ;

/* Procedure structure for procedure `usuario_estado1` */

/*!50003 DROP PROCEDURE IF EXISTS  `usuario_estado1` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_estado1`()
BEGIN
select * from usuario_login where estado=1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Usu_pass` */

/*!50003 DROP PROCEDURE IF EXISTS  `Usu_pass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Usu_pass`(
in id bigint(20),
in usu varchar(100),
in pass varchar(255)
)
BEGIN
if  usu = "null"  then
	update usuario_login set contrasenia=pass where id_usuario=id;
else
	update usuario_login set usuario=usu where id_usuario=id;
end if;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
