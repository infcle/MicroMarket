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