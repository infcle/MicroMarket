ALTER TABLE categoria RENAME seccion;
#creacion de la tabla limite
CREATE TABLE `marketbd`.`limite` (
  `idlimite` INT NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `limite` INT NOT NULL,
  PRIMARY KEY (`idlimite`));
  #adicionando el campo liminite a producto
  ALTER TABLE `marketbd`.`producto` 
ADD COLUMN `id_limite` bigint(11) not null;

#adicion de la llave foranea
ALTER TABLE `marketbd`.`producto`  ADD CONSTRAINT fk_limite FOREIGN KEY (id_limite) REFERENCES limite(idlimite);

#creacion de la tabla categoria
CREATE TABLE `marketbd`.`categoria` (
  `idcategoria` BIGINT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NULL,
  `estado` TINYINT NULL DEFAULT 1,
  `fecha_actualizacion` TIMESTAMP NOT NULL,
  `fecha_modificacion` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idcategoria`));
  
  #creacion de la relacion cliente categoria n:n
  CREATE TABLE `marketbd`.`pertenece` (
  `cliente_id` BIGINT(20) NOT NULL,
  `categoria_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`cliente_id`, `categoria_id`),
  INDEX `fk_categoria_idx` (`categoria_id` ASC),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `marketbd`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `marketbd`.`categoria` (`idcategoria`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

#adicion de los campos fechas a todas las tablas
  
  
   ALTER TABLE `marketbd`.`cliente` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`compra_r` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`limite` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`producto` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`producto_etiquetado` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`seccion` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;

 ALTER TABLE `marketbd`.`usuario_login` 
ADD COLUMN `fecha_actualizacion` TIMESTAMP NOT NULL,
ADD COLUMN `fecha_modificacion` TIMESTAMP NOT NULL;



