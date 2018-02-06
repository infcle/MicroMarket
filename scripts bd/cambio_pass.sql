#modificar usurio contrseña

DELIMITER // 
create PROCEDURE  Usu_pass
(
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
END
//
DELIMITER ; 
call Usu_pass(1,'null',"sss");

#usuario unico 
ALTER TABLE `marketbd`.`usuario_login` 
ADD UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC);
