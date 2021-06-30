CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_helice_detail` AS
    SELECT 
        `transportador`.`nombreTransportador` AS `nombreTransportador`,
        `helice`.`tipoHelice` AS `tipoHelice`,
        `helice`.`diametroHelice` AS `diametroHelice`,
        `helice`.`sentidoHelice` AS `sentidoHelice`,
        `helice`.`pasoHelice` AS `pasoHelice`,
        `helice`.`sentidoGiro` AS `sentidoGiro`,
        `helice`.`velocidadGiro` AS `velocidadGiro`
    FROM
        (`helice`
        JOIN `transportador` ON ((`helice`.`Transportador_id_Transportador` = `transportador`.`id_Transportador`)))