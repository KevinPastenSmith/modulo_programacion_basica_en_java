CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_user_design` AS
    SELECT 
        `usuario`.`nickName` AS `nickName`,
        `usuario`.`mail` AS `mail`,
        `usuario`.`profesionOficio` AS `profesionOficio`
    FROM
        `usuario`