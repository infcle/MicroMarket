insert  into `usuario_login`(`idusuario`,`nombre`,`fecha_registro`,`usuario`,`contrasenia`,`estado`,`tipo`) values (1,'Haki Ari','2018-02-01 02:26:10','admin','$2y$10$I18B6QvoVkPXvkgGTCdqNOx34WRsatkevdUvKbvfihfLizu/GmuTO',1,0);

#Lista de usuarios con estado=1
DELIMITER //

CREATE PROCEDURE  usuario_estado1()
BEGIN
select * from usuario_login where estado=1;
END
//
DELIMITER ; 

#Lista de productos de acuerdo a la categoría
DELIMITER //

CREATE PROCEDURE  producto_categoria(
in cat bigint)
BEGIN
select * from producto where seccionid=cat;
END
//
DELIMITER ; 

#lista de clientes
DELIMITER //

CREATE PROCEDURE  lista_clientes(
in cat bigint)
BEGIN
select * from cliente;
END
//
DELIMITER ; 

DELIMITER //

create PROCEDURE  existe_usuario(in usu varchar(100), out valor bool)

BEGIN
set valor =false;
if exists(select usuario from usuario_login where usuario=usu)
    
    then
        set valor= true;
    else 
        set valor = false;
    end if;

END
//
DELIMITER ; 
call existe_usuario('admin',@a); select @a;

DELIMITER // 
CREATE PROCEDURE  insertarProducto
(
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
END
//
DELIMITER ;

DELIMITER // 
    CREATE  procedure obtener_id_producto ( in nro_plu_F int, out valor int) 
    BEGIN
    declare id int;
       select id_prod as id from producto where nro_plu=nro_plu_F;
       set valor=id;
	
    END
//
DELIMITER ;
DELIMITER // 
    CREATE  procedure insertarTiene ( in idp int, in ids int) 
    BEGIN
    insert into tiene value (idp,ids);
	
    END
//
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `marketbd`.`Numeros_a_Letras`$$
CREATE PROCEDURE `marketbd`.`Numeros_a_Letras` (IN lnEntero TEXT)
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

END$$
DELIMITER ;$$