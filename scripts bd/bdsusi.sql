/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.1.53-community-log : Database - marketbd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`marketbd` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `marketbd`;

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `ci` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `ci_UNIQUE` (`ci`)
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
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FK_CLI_DET` (`id_cliente`),
  KEY `FK_USER_DET` (`id_usuario`),
  CONSTRAINT `FK_CLI_DET` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_USER_DET` FOREIGN KEY (`id_usuario`) REFERENCES `usuario_login` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `compra_r` */

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `id_prod` bigint(20) NOT NULL AUTO_INCREMENT,
  `nro_plu` int(11) NOT NULL COMMENT 'es el numero que esta registrado en la balanza',
  `nombre` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` int(11) NOT NULL COMMENT 'si es pesable 2 y si es unidad 1',
  `precio` float NOT NULL,
  `cod_plu` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_limite` bigint(11) DEFAULT NULL,
  `idseccion` bigint(20) NOT NULL,
  PRIMARY KEY (`id_prod`),
  UNIQUE KEY `nro_plu_UNIQUE` (`nro_plu`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `cod_plu_UNIQUE` (`cod_plu`),
  KEY `fk_producto_seccion1_idx` (`idseccion`),
  CONSTRAINT `fk_producto_seccion1` FOREIGN KEY (`idseccion`) REFERENCES `seccion` (`id_seccion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `producto` */

insert  into `producto`(`id_prod`,`nro_plu`,`nombre`,`tipo`,`precio`,`cod_plu`,`estado`,`fecha_registro`,`fecha_actualizacion`,`id_limite`,`idseccion`) values (1,1,'filete',2,58,'2001',1,'2018-02-15 15:32:58','2018-02-15 15:32:58',1,1),(2,2,'pulpa',2,48,'2002',1,'2018-02-15 15:35:49','2018-02-15 15:35:49',1,1),(3,3,'cabeza de lomo',2,48,'2003',1,'2018-02-15 15:38:44','2018-02-15 15:38:44',1,1),(4,4,'peceto',2,48,'2004',1,'2018-02-15 15:39:33','2018-02-15 15:39:33',1,1),(5,5,'molida',2,40,'2005',1,'2018-02-15 15:44:42','2018-02-15 15:44:42',1,1),(6,6,'lapim',2,39,'2006',1,'2018-02-15 15:48:01','2018-02-15 15:48:01',1,1),(7,7,'chuleta',2,39,'2007',1,'2018-02-15 15:48:56','2018-02-15 15:48:56',1,1),(8,8,'witu',2,36,'2008',1,'2018-02-15 15:50:17','2018-02-15 15:50:17',1,1),(9,9,'churrasco',2,36,'2009',1,'2018-02-15 15:51:40','2018-02-15 15:51:40',1,1),(10,10,'cadera',2,36,'2010',1,'2018-02-15 15:52:40','2018-02-15 15:52:40',1,1),(11,11,'paleta',2,36,'2011',1,'2018-02-15 15:53:19','2018-02-15 15:53:19',1,1),(12,12,'pecho',2,30,'2012',1,'2018-02-15 15:54:14','2018-02-15 15:54:14',1,1),(13,13,'jiba',2,30,'2013',1,'2018-02-15 15:56:04','2018-02-15 15:56:04',1,1),(14,14,'aujilla',2,30,'2014',1,'2018-02-15 15:56:44','2018-02-15 15:56:44',1,1),(15,15,'tira/costilla',2,28,'2015',1,'2018-02-15 15:57:45','2018-02-15 15:57:45',1,1),(16,16,'ozubuco',2,28,'2016',1,'2018-02-15 16:03:42','2018-02-15 16:03:42',1,1),(17,17,'canastillas',2,18,'2017',1,'2018-02-15 16:04:35','2018-02-15 16:04:35',1,1),(18,18,'chorizo',2,45,'2018',1,'2018-02-15 16:05:19','2018-02-15 16:05:19',1,1),(19,19,'corazon',2,32,'2019',1,'2018-02-15 16:15:10','2018-02-15 16:15:10',1,1),(20,20,'higado',2,24,'2020',1,'2018-02-15 16:16:02','2018-02-15 16:16:02',1,1),(21,21,'panza cocida',2,32,'2021',1,'2018-02-15 16:16:41','2018-02-15 16:16:41',1,1),(22,22,'pollo',2,16.5,'2022',1,'2018-02-15 16:17:35','2018-02-15 16:17:35',2,1),(23,23,'pescado_trucha',2,45,'2023',1,'2018-02-15 16:19:32','2018-02-15 16:19:32',2,1),(24,24,'pescado_pacu',2,50,'2024',1,'2018-02-15 16:20:35','2018-02-15 16:20:35',2,1),(25,25,'pescado_surubi',2,50,'2025',1,'2018-02-15 16:30:41','2018-02-15 16:30:41',2,1),(26,26,'huevo25',1,0.83,'1026',1,'2018-02-15 16:32:56','2018-02-15 16:32:56',3,1),(27,27,'huevo22',1,0.73,'1027',1,'2018-02-15 16:34:11','2018-02-15 16:34:11',3,1),(28,28,'Zanahoria',2,4,'2028',1,'2018-02-15 16:37:26','2018-02-15 16:37:26',NULL,3),(29,29,'Aba',2,8,'2029',1,'2018-02-15 16:42:31','2018-02-15 16:42:31',NULL,3),(30,30,'Espinaca',2,10,'2030',1,'2018-02-15 16:43:32','2018-02-15 16:43:32',NULL,3),(31,31,'Zapallo',2,6,'2031',1,'2018-02-15 16:44:37','2018-02-15 16:44:37',NULL,3),(32,32,'cebolla con cola',2,4.5,'2032',1,'2018-02-15 16:45:32','2018-02-15 16:45:32',NULL,3),(33,33,'cebolla con cabeza',2,6,'2033',1,'2018-02-15 16:46:03','2018-02-15 16:46:03',NULL,3),(34,34,'Tomate',2,9,'2034',1,'2018-02-15 17:14:04','2018-02-15 17:14:04',NULL,3),(35,35,'arberja',2,15,'2035',1,'2018-02-15 17:15:40','2018-02-15 17:15:40',NULL,3),(36,36,'Vaina',2,9,'2036',1,'2018-02-15 17:16:18','2018-02-15 17:16:18',NULL,3),(37,37,'locoto',2,14,'2037',1,'2018-02-15 17:16:52','2018-02-15 17:16:52',NULL,3),(38,38,'brocoli',1,10,'1038',1,'2018-02-15 17:17:26','2018-02-15 17:17:26',NULL,3),(39,39,'Apio',1,3,'1039',1,'2018-02-15 17:17:52','2018-02-15 17:17:52',NULL,3),(40,40,'pepino',1,2,'1040',1,'2018-02-15 17:18:31','2018-02-15 17:18:31',NULL,3),(41,41,'repollo',1,4,'1041',1,'2018-02-15 17:19:15','2018-02-15 17:19:15',NULL,3),(42,42,'postre',1,1.5,'1042',1,'2018-02-15 17:20:22','2018-02-15 17:20:22',NULL,3),(43,43,'durazno',2,15,'2043',1,'2018-02-15 17:21:21','2018-02-15 17:21:21',NULL,2),(44,44,'uva',2,15,'2044',1,'2018-02-15 17:22:08','2018-02-15 17:22:08',NULL,2),(45,45,'naranja',1,0.6,'1045',1,'2018-02-15 17:23:07','2018-02-15 17:23:07',NULL,2),(46,46,'mandarina',1,0.75,'1046',1,'2018-02-15 17:23:45','2018-02-15 17:23:45',NULL,2),(47,47,'papaya',1,10,'1047',1,'2018-02-15 17:24:24','2018-02-15 17:24:24',NULL,2),(48,48,'mango',1,0.8,'1048',1,'2018-02-15 17:25:06','2018-02-15 17:25:06',NULL,2),(49,49,'piÃ±a',1,10,'1049',1,'2018-02-15 17:25:38','2018-02-15 17:25:38',NULL,2),(50,50,'platano',1,0.75,'1050',1,'2018-02-15 17:53:53','2018-02-15 17:53:53',NULL,2),(51,51,'manzana',1,2,'1051',1,'2018-02-15 17:54:22','2018-02-15 17:54:22',NULL,2),(52,52,'sandia',1,15,'1052',1,'2018-02-15 17:55:13','2018-02-15 17:55:13',NULL,2),(53,53,'tuna',1,1.5,'1053',1,'2018-02-15 17:55:45','2018-02-15 17:55:45',NULL,2),(54,54,'papa grande',2,6.5,'2054',1,'2018-02-15 17:56:28','2018-02-15 17:56:28',NULL,4),(55,55,'papa pequeÃ±a',2,5,'2055',1,'2018-02-15 17:56:55','2018-02-15 17:56:55',NULL,4),(56,56,'camote',2,11.5,'2056',1,'2018-02-15 17:57:19','2018-02-15 17:57:19',NULL,4),(57,57,'yuca',2,8.5,'2057',1,'2018-02-15 17:57:49','2018-02-15 17:57:49',NULL,4);

/*Table structure for table `producto_etiquetado` */

DROP TABLE IF EXISTS `producto_etiquetado`;

CREATE TABLE `producto_etiquetado` (
  `id_etiqueta` bigint(20) NOT NULL AUTO_INCREMENT,
  `cod_barras` int(11) NOT NULL COMMENT 'codigo de barras generado por productos etiquetados',
  `preciototal` float NOT NULL COMMENT 'precio deacurdo al peso o cantidad del producto',
  `peso_cantidad` float NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado si se vendio o no',
  `id_prod` bigint(20) DEFAULT NULL,
  `id_compra` bigint(20) DEFAULT NULL COMMENT 'aqui esta el id de la compra si es que se vende este producto',
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
  `id_seccion` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `limite` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categoria` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_seccion`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `seccion` */

insert  into `seccion`(`id_seccion`,`nombre`,`limite`,`estado`,`fecha_registro`,`fecha_actualizacion`,`id_categoria`) values (1,'Carnes y derivados',550,1,'2018-02-10 12:44:12','2018-02-10 12:44:12',2),(2,'Frutas',60,1,'2018-02-10 12:44:31','2018-02-10 12:44:31',2),(3,'Verduras',60,1,'2018-02-10 12:44:48','2018-02-10 12:44:48',2),(4,'Leguminos, raices y tuberculos',80,1,'2018-02-10 12:45:36','2018-02-10 12:45:36',2);

/*Table structure for table `usuario_login` */

DROP TABLE IF EXISTS `usuario_login`;

CREATE TABLE `usuario_login` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasenia` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `tipo` int(11) NOT NULL DEFAULT '2',
  `fecha_registro` datetime NOT NULL,
  `fecha_actualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuario_login` */

insert  into `usuario_login`(`id_usuario`,`nombre`,`usuario`,`contrasenia`,`estado`,`tipo`,`fecha_registro`,`fecha_actualizacion`) values (1,'Haki Ari','admin','$2y$10$I18B6QvoVkPXvkgGTCdqNOx34WRsatkevdUvKbvfihfLizu/GmuTO',1,0,'2018-02-01 02:26:10','2018-02-07 10:11:35');

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

/* Procedure structure for procedure `existe_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `existe_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `existe_usuario`(in usu varchar(100), out valor bool)
BEGIN
set valor =false;
if exists(select usuario from usuario_login where usuario=usu)
    
    then
        set valor= true;
    else 
        set valor = false;
    end if;
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

/* Procedure structure for procedure `insertarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProducto`(
in nro_plu_p int,
in nombre_p varchar(100),
in tipo_p int,
in precio_p float,
in cod_plu_p varchar(200),
in id_limite_p bigint(11)
)
BEGIN
if id_limite_p>0 then
insert into producto (nro_plu,nombre,tipo,precio,cod_plu,fecha_registro,id_limite)values(nro_plu_p,nombre_p,tipo_p,precio_p,cod_plu_p,now(),id_limite_P);
else 
insert into producto (nro_plu,nombre,tipo,precio,cod_plu,fecha_registro)values(nro_plu_p,nombre_p,tipo_p,precio_p,cod_plu_p,now());
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarTiene` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarTiene` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTiene`( in idp bigint, in ids bigint)
BEGIN
    insert into tiene values(ids,idp);	
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

/* Procedure structure for procedure `lista_productos` */

/*!50003 DROP PROCEDURE IF EXISTS  `lista_productos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_productos`()
BEGIN

select nro_plu,p.nombre, s.nombre from producto as p , tiene as t , seccion as s where id_producto=id_prod and s.id_seccion=t.id_seccion order by t.id_producto;
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

/* Procedure structure for procedure `Numeros_a_Letras` */

/*!50003 DROP PROCEDURE IF EXISTS  `Numeros_a_Letras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Numeros_a_Letras`(IN lnEntero TEXT)
BEGIN
DECLARE lcRetorno VARCHAR(512);
DECLARE lnTerna INT;
DECLARE lcMiles VARCHAR(512);
DECLARE lcCadena VARCHAR(512);
DECLARE lnUnidades INT;
DECLARE lnDecenas INT;
DECLARE lnCentenas INT;
IF lnEntero > 0 THEN
SET lcRetorno = '';
SET lnTerna = 1 ;
WHILE lnEntero > 0 DO
-- Recorro columna por columna
SET lcCadena = '';
SET lnUnidades = RIGHT(lnEntero,1);
SET lnEntero = LEFT(lnEntero,LENGTH(lnEntero)-1) ;
SET lnDecenas = RIGHT(lnEntero,1);
SET lnEntero = LEFT(lnEntero,LENGTH(lnEntero)-1) ;
SET lnCentenas = RIGHT(lnEntero,1);
SET lnEntero = LEFT(lnEntero,LENGTH(lnEntero)-1) ;
-- Analizo las unidades
SET lcCadena =
CASE /* UNIDADES */
WHEN lnUnidades = 1 AND lnTerna = 1 THEN CONCAT('UNO ',lcCadena)
WHEN lnUnidades = 1 AND lnTerna <> 1 THEN CONCAT('',lcCadena)
WHEN lnUnidades = 2 THEN CONCAT('DOS ',lcCadena)
WHEN lnUnidades = 3 THEN CONCAT('TRES ',lcCadena)
WHEN lnUnidades = 4 THEN CONCAT('CUATRO ',lcCadena)
WHEN lnUnidades = 5 THEN CONCAT('CINCO ',lcCadena)
WHEN lnUnidades = 6 THEN CONCAT('SEIS ',lcCadena)
WHEN lnUnidades = 7 THEN CONCAT('SIETE ',lcCadena)
WHEN lnUnidades = 8 THEN CONCAT('OCHO ',lcCadena)
WHEN lnUnidades = 9 THEN CONCAT('NUEVE ',lcCadena)
ELSE lcCadena
END ;/* UNIDADES */
-- Analizo las decenas
SET lcCadena =
CASE /* DECENAS */
WHEN lnDecenas = 1 THEN
CASE lnUnidades
WHEN 0 THEN 'DIEZ '
WHEN 1 THEN 'ONCE '
WHEN 2 THEN 'DOCE '
WHEN 3 THEN 'TRECE '
WHEN 4 THEN 'CATORCE '
WHEN 5 THEN 'QUINCE '
ELSE CONCAT('DIECI',lcCadena)
END
WHEN lnDecenas = 2 AND lnUnidades = 0 THEN CONCAT('VEINTE ',lcCadena)
WHEN lnDecenas = 2 AND lnUnidades <> 0 THEN CONCAT('VEINTI',lcCadena)
WHEN lnDecenas = 3 AND lnUnidades = 0 THEN CONCAT('TREINTA ',lcCadena)
WHEN lnDecenas = 3 AND lnUnidades <> 0 THEN CONCAT('TREINTA Y ',lcCadena)
WHEN lnDecenas = 4 AND lnUnidades = 0 THEN CONCAT('CUARENTA ',lcCadena)
WHEN lnDecenas = 4 AND lnUnidades <> 0 THEN CONCAT('CUARENTA Y ',lcCadena)
WHEN lnDecenas = 5 AND lnUnidades = 0 THEN CONCAT('CINCUENTA ',lcCadena)
WHEN lnDecenas = 5 AND lnUnidades <> 0 THEN CONCAT('CINCUENTA Y ',lcCadena)
WHEN lnDecenas = 6 AND lnUnidades = 0 THEN CONCAT('SESENTA ',lcCadena)
WHEN lnDecenas = 6 AND lnUnidades <> 0 THEN CONCAT('SESENTA Y ',lcCadena)
WHEN lnDecenas = 7 AND lnUnidades = 0 THEN CONCAT('SETENTA ',lcCadena)
WHEN lnDecenas = 7 AND lnUnidades <> 0 THEN CONCAT('SETENTA Y ',lcCadena)
WHEN lnDecenas = 8 AND lnUnidades = 0 THEN CONCAT('OCHENTA ',lcCadena)
WHEN lnDecenas = 8 AND lnUnidades <> 0 THEN CONCAT('OCHENTA Y ',lcCadena)
WHEN lnDecenas = 9 AND lnUnidades = 0 THEN CONCAT('NOVENTA ',lcCadena)
WHEN lnDecenas = 9 AND lnUnidades <> 0 THEN CONCAT('NOVENTA Y ',lcCadena)
ELSE lcCadena
END ;/* DECENAS */
-- Analizo las centenas
SET lcCadena =
CASE /* CENTENAS */
WHEN lnCentenas = 1 AND lnUnidades = 0 AND lnDecenas = 0 THEN CONCAT('CIEN ',lcCadena)
WHEN lnCentenas = 1 AND NOT(lnUnidades = 0 AND lnDecenas = 0) THEN CONCAT('CIENTO ',lcCadena)
WHEN lnCentenas = 2 THEN CONCAT('DOSCIENTOS ',lcCadena)
WHEN lnCentenas = 3 THEN CONCAT('TRESCIENTOS ',lcCadena)
WHEN lnCentenas = 4 THEN CONCAT('CUATROCIENTOS ',lcCadena)
WHEN lnCentenas = 5 THEN CONCAT('QUINIENTOS ',lcCadena)
WHEN lnCentenas = 6 THEN CONCAT('SEISCIENTOS ',lcCadena)
WHEN lnCentenas = 7 THEN CONCAT('SETECIENTOS ',lcCadena)
WHEN lnCentenas = 8 THEN CONCAT('OCHOCIENTOS ',lcCadena)
WHEN lnCentenas = 9 THEN CONCAT('NOVECIENTOS ',lcCadena)
ELSE lcCadena
END ;/* CENTENAS */
-- Analizo los millares
SET lcCadena =
CASE /* TERNA */
WHEN lnTerna = 1 THEN lcCadena
WHEN lnTerna = 2 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN CONCAT(lcCadena,' MIL ')
WHEN lnTerna = 3 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0 THEN CONCAT(lcCadena,' MILLON ')
WHEN lnTerna = 3 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND NOT (lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0) THEN CONCAT(lcCadena,' MILLONES ')
WHEN lnTerna = 4 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN CONCAT(lcCadena,' MIL MILLONES ')
WHEN lnTerna = 5 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0 THEN CONCAT(lcCadena,' BILLON ')
WHEN lnTerna = 5 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND NOT (lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0) THEN CONCAT(lcCadena,' BILLONES ')
WHEN lnTerna = 6 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN CONCAT(lcCadena,' MIL BILLONES ')
WHEN lnTerna = 7 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0 THEN CONCAT(lcCadena,' TRILLON ')
WHEN lnTerna = 7 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND NOT (lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0) THEN CONCAT(lcCadena,' TRILLONES ')
WHEN lnTerna = 8 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN CONCAT(lcCadena,' MIL TRILLONES ')
ELSE ''
END ;/* MILLARES */
-- Armo el retorno columna a columna
SET lcRetorno = CONCAT(lcCadena,lcRetorno);
SET lnTerna = lnTerna + 1;
END WHILE ; /* WHILE */
ELSE
SET lcRetorno = 'CERO' ;
END IF ;
SELECT RTRIM(lcRetorno) ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `obtener_id_producto` */

/*!50003 DROP PROCEDURE IF EXISTS  `obtener_id_producto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_id_producto`( in nro_plu_F int)
BEGIN
       select id_prod from producto where nro_plu=nro_plu_F;
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
