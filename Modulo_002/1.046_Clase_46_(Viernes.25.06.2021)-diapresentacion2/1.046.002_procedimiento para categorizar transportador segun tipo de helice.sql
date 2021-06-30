CREATE DEFINER=`root`@`localhost` PROCEDURE `transportador_tipoHelice`()
BEGIN
select nombreTransportador, tipoHelice from v_conveyor_parameters where tipoHelice='Helicoidal Sencillo, Paso Corto'
or tipoHelice='Helicoidal Sencillo, Paso Medio'
group by tipoHelice;
END