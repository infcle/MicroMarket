#Controller/producto/index.php
DELIMITER // 
    CREATE  procedure cantidad_peso () 
    BEGIN
       SELECT p.id_prod,p.nro_plu
			, p.nombre as nomProducto
			, CASE p.tipo WHEN 1 THEN 'Cantidad' WHEN 2 THEN 'Peso' END AS tipo
			, p.precio, p.cod_plu, s.nombre as nomSeccion
		FROM producto p, seccion s
		WHERE p.idseccion = s.id_seccion and p.estado=1;
    END
//
DELIMITER ;
call cantidad_peso();
#Controller/producto/index.php
DELIMITER // 
    CREATE  procedure genera_plu () 
    BEGIN
      SELECT IFNULL(MAX(nro_plu),0)+1  AS numero FROM producto;
    END
//
DELIMITER ;
#Controller/clienteusuario_estado1/index.php
DELIMITER // 
    CREATE  procedure lista_clientes () 
    BEGIN
      SELECT * FROM cliente where estado=1;
    END
//
DELIMITER ;
#Controller/seccion/index.php
DELIMITER // 
    CREATE  procedure listar_seccion () 
    BEGIN
      SELECT * FROM seccion where estado=1;
    END
//
DELIMITER ;
#Controller/models/buscar.php 
DELIMITER // 
    CREATE  procedure buscar_cliente (in carnet varchar(20)) 
    BEGIN
      SELECT * FROM cliente WHERE ci=carnet;
    END
//
DELIMITER ;
#Controller/models/editar_model.php 
DELIMITER // 
    CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarCliente`(
in id_c int,
in ci varchar(20),
in Nombre varchar(200)
)
BEGIN
update cliente set nombre=Nombre, ci=ci where id_cliente=id_c;
end
//
DELIMITER ;
#Controller/models/eliminar_model.php 
DELIMITER // 
    CREATE procedure eliminarCliente(
in id_c int
)
BEGIN
UPDATE cliente set estado=0 where id_cliente=id_c;
end
//
DELIMITER ;
#Controller/models/login.php 
DELIMITER // 
    CREATE PROCEDURE buscar_usuario(
in usu varchar(100)
)
BEGIN
SELECT id_usuario,nombre, usuario, estado, contrasenia, tipo
                            FROM usuario_login
                            WHERE usuario = usu AND estado=1;
end
//
DELIMITER ;
#Controller/models/login.php 
DELIMITER // 
    CREATE PROCEDURE modificar_producto(
in nombre_p varchar(100),
in precio_p float,
in tipo_p int,
in plu varchar(200),
in seccion bigint,
in id_p bigint
)
BEGIN
UPDATE producto set nombre=nombre_p, precio=precio_p, tipo=tipo_p, cod_plu=plu, idSeccion=seccion where id_prod=id_p;
end
//
DELIMITER ;
#Controller/models/eliminar_model.php 
DELIMITER // 
    CREATE procedure eliminarProducto(
in id_p int
)
BEGIN
UPDATE producto set estado=0 where id_prod=id_p;
end
//
DELIMITER ;


