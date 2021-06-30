CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_registro_material`(in _id_Motor varchar(50),
												in _sentidoGiro varchar(50),
                                                in _posicionInstalacion varchar(50))
BEGIN
insert into motor(id_Motor,
					sentidoGiro,
                    posicionInstalacion)
values (_id_Motor,_sentidoGiro,_posicionInstalacion);
                    
END