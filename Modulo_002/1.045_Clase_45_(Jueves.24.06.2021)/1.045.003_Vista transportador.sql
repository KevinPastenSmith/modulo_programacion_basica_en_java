CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_conveyor_parameters` AS
    SELECT 
        `transportador`.`nombreTransportador` AS `nombreTransportador`,
        `transportador`.fechaDiseño AS fechaDiseño,
        tubo.diametroNominalTubo AS diametroNominalTubo,
        transportador.velocidadTransporte AS velocidadTransporte,
        transportador.areaRelleno AS areaRelleno,
        transportador.inclinacion AS inclinacion,
        transportador.capacidadTransportador AS capacidadTransportador,
        helice.velocidadGiro AS velocidadGiro,
        helice.sentidoGiro AS sentidoGiro
    FROM
        ((transportador
        JOIN helice ON ((transportador.id_Transportador = helice.Transportador_id_Transportador)))
        JOIN tubo ON ((transportador.id_Transportador = tubo.Transportador_id_Transportador)))