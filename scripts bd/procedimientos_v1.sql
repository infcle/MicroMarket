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

CREATE PROCEDURE  existe_usuario(in usu varchar(100), out valor int)

BEGIN
set valor =0;
if exists(select usuario from usuario_login where usuario=usu)
    
    then
        set valor= 1;
    else 
        set valor = 0;
    end if;

END
//
DELIMITER ; 
call existe_usuario('jhjh',@a); select @a;