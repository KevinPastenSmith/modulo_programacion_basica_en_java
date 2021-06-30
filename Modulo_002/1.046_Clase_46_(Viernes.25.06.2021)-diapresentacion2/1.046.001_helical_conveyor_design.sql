CREATE DATABASE  IF NOT EXISTS `helical_conveyor_design` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `helical_conveyor_design`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: helical_conveyor_design
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `helice`
--

DROP TABLE IF EXISTS `helice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `helice` (
  `id_Helice` varchar(50) NOT NULL,
  `diametroHelice` double DEFAULT NULL,
  `sentidoHelice` varchar(50) DEFAULT NULL,
  `tipoHelice` varchar(50) DEFAULT NULL,
  `pasoHelice` varchar(50) DEFAULT NULL,
  `sentidoGiro` varchar(50) DEFAULT NULL,
  `velocidadGiro` double DEFAULT NULL,
  `Transportador_id_Transportador` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Helice`),
  KEY `fk_Helice_Transportador1_idx` (`Transportador_id_Transportador`),
  CONSTRAINT `fk_Helice_Transportador1` FOREIGN KEY (`Transportador_id_Transportador`) REFERENCES `transportador` (`id_Transportador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helice`
--

LOCK TABLES `helice` WRITE;
/*!40000 ALTER TABLE `helice` DISABLE KEYS */;
/*!40000 ALTER TABLE `helice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `id_Material` varchar(50) NOT NULL,
  `nombreMaterial` varchar(100) DEFAULT NULL,
  `tipoMezcla` varchar(50) DEFAULT NULL,
  `clasificacion` varchar(50) DEFAULT NULL,
  `tipoMaterial` varchar(50) DEFAULT NULL,
  `abrasividad` varchar(50) DEFAULT NULL,
  `densidad` double DEFAULT NULL,
  `fluidez` varchar(50) DEFAULT NULL,
  `categoriaPeso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_Material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_has_transportador`
--

DROP TABLE IF EXISTS `material_has_transportador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_has_transportador` (
  `Material_id_Material` varchar(45) NOT NULL,
  `Transportador_id_Transportador` varchar(45) NOT NULL,
  PRIMARY KEY (`Material_id_Material`,`Transportador_id_Transportador`),
  KEY `fk_Material_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador`),
  KEY `fk_Material_has_Transportador_Material1_idx` (`Material_id_Material`),
  CONSTRAINT `fk_Material_has_Transportador_Material1` FOREIGN KEY (`Material_id_Material`) REFERENCES `material` (`id_Material`),
  CONSTRAINT `fk_Material_has_Transportador_Transportador1` FOREIGN KEY (`Transportador_id_Transportador`) REFERENCES `transportador` (`id_Transportador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_has_transportador`
--

LOCK TABLES `material_has_transportador` WRITE;
/*!40000 ALTER TABLE `material_has_transportador` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_has_transportador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor`
--

DROP TABLE IF EXISTS `motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor` (
  `id_Motor` varchar(45) NOT NULL,
  `sentidoGiro` varchar(45) DEFAULT NULL,
  `posicionInstalacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_Motor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor`
--

LOCK TABLES `motor` WRITE;
/*!40000 ALTER TABLE `motor` DISABLE KEYS */;
INSERT INTO `motor` VALUES ('2021-06-26 00:32:48','horario','arriba');
/*!40000 ALTER TABLE `motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motor_has_transportador`
--

DROP TABLE IF EXISTS `motor_has_transportador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motor_has_transportador` (
  `Motor_id_Motor` varchar(45) NOT NULL,
  `Transportador_id_Transportador` varchar(45) NOT NULL,
  PRIMARY KEY (`Motor_id_Motor`,`Transportador_id_Transportador`),
  KEY `fk_Motor_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador`),
  KEY `fk_Motor_has_Transportador_Motor_idx` (`Motor_id_Motor`),
  CONSTRAINT `fk_Motor_has_Transportador_Motor` FOREIGN KEY (`Motor_id_Motor`) REFERENCES `motor` (`id_Motor`),
  CONSTRAINT `fk_Motor_has_Transportador_Transportador1` FOREIGN KEY (`Transportador_id_Transportador`) REFERENCES `transportador` (`id_Transportador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motor_has_transportador`
--

LOCK TABLES `motor_has_transportador` WRITE;
/*!40000 ALTER TABLE `motor_has_transportador` DISABLE KEYS */;
/*!40000 ALTER TABLE `motor_has_transportador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportador`
--

DROP TABLE IF EXISTS `transportador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportador` (
  `id_Transportador` varchar(50) NOT NULL,
  `nombreTransportador` varchar(100) DEFAULT NULL,
  `velocidadTransporte` double DEFAULT NULL,
  `coeficienteRelleno` double DEFAULT NULL,
  `areaRelleno` double DEFAULT NULL,
  `inclinacion` int DEFAULT NULL,
  `coeficienteInclinacion` double DEFAULT NULL,
  `capacidadTransportador` double DEFAULT NULL,
  `fechaDiseño` datetime DEFAULT NULL,
  PRIMARY KEY (`id_Transportador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportador`
--

LOCK TABLES `transportador` WRITE;
/*!40000 ALTER TABLE `transportador` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tubo`
--

DROP TABLE IF EXISTS `tubo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tubo` (
  `id_Tubo` varchar(45) NOT NULL,
  `diametroNominalTubo` double DEFAULT NULL,
  `Transportador_id_Transportador` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Tubo`),
  KEY `fk_Tubo_Transportador1_idx` (`Transportador_id_Transportador`),
  CONSTRAINT `fk_Tubo_Transportador1` FOREIGN KEY (`Transportador_id_Transportador`) REFERENCES `transportador` (`id_Transportador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tubo`
--

LOCK TABLES `tubo` WRITE;
/*!40000 ALTER TABLE `tubo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tubo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tubo_has_helice`
--

DROP TABLE IF EXISTS `tubo_has_helice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tubo_has_helice` (
  `Tubo_id_Tubo` varchar(45) NOT NULL,
  `Helice_id_Helice` varchar(45) NOT NULL,
  PRIMARY KEY (`Tubo_id_Tubo`,`Helice_id_Helice`),
  KEY `fk_Tubo_has_Helice_Helice1_idx` (`Helice_id_Helice`),
  KEY `fk_Tubo_has_Helice_Tubo1_idx` (`Tubo_id_Tubo`),
  CONSTRAINT `fk_Tubo_has_Helice_Helice1` FOREIGN KEY (`Helice_id_Helice`) REFERENCES `helice` (`id_Helice`),
  CONSTRAINT `fk_Tubo_has_Helice_Tubo1` FOREIGN KEY (`Tubo_id_Tubo`) REFERENCES `tubo` (`id_Tubo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tubo_has_helice`
--

LOCK TABLES `tubo_has_helice` WRITE;
/*!40000 ALTER TABLE `tubo_has_helice` DISABLE KEYS */;
/*!40000 ALTER TABLE `tubo_has_helice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usuario` varchar(50) NOT NULL,
  `nickName` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `profesionOficio` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_transportador`
--

DROP TABLE IF EXISTS `usuario_has_transportador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_transportador` (
  `Usuario_id_Usuario` varchar(45) NOT NULL,
  `Transportador_id_Transportador` varchar(45) NOT NULL,
  PRIMARY KEY (`Usuario_id_Usuario`,`Transportador_id_Transportador`),
  KEY `fk_Usuario_has_Transportador_Transportador1_idx` (`Transportador_id_Transportador`),
  KEY `fk_Usuario_has_Transportador_Usuario1_idx` (`Usuario_id_Usuario`),
  CONSTRAINT `fk_Usuario_has_Transportador_Transportador1` FOREIGN KEY (`Transportador_id_Transportador`) REFERENCES `transportador` (`id_Transportador`),
  CONSTRAINT `fk_Usuario_has_Transportador_Usuario1` FOREIGN KEY (`Usuario_id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_transportador`
--

LOCK TABLES `usuario_has_transportador` WRITE;
/*!40000 ALTER TABLE `usuario_has_transportador` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_transportador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_conveyor_parameters`
--

DROP TABLE IF EXISTS `v_conveyor_parameters`;
/*!50001 DROP VIEW IF EXISTS `v_conveyor_parameters`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_conveyor_parameters` AS SELECT 
 1 AS `nombreTransportador`,
 1 AS `fechaDiseño`,
 1 AS `tipoHelice`,
 1 AS `diametroNominalTubo`,
 1 AS `velocidadTransporte`,
 1 AS `areaRelleno`,
 1 AS `inclinacion`,
 1 AS `capacidadTransportador`,
 1 AS `velocidadGiro`,
 1 AS `sentidoGiro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_helice_detail`
--

DROP TABLE IF EXISTS `v_helice_detail`;
/*!50001 DROP VIEW IF EXISTS `v_helice_detail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_helice_detail` AS SELECT 
 1 AS `nombreTransportador`,
 1 AS `tipoHelice`,
 1 AS `diametroHelice`,
 1 AS `sentidoHelice`,
 1 AS `pasoHelice`,
 1 AS `sentidoGiro`,
 1 AS `velocidadGiro`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_material`
--

DROP TABLE IF EXISTS `v_material`;
/*!50001 DROP VIEW IF EXISTS `v_material`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_material` AS SELECT 
 1 AS `nombreMaterial`,
 1 AS `tipoMezcla`,
 1 AS `clasificacion`,
 1 AS `tipoMaterial`,
 1 AS `abrasividad`,
 1 AS `densidad`,
 1 AS `fluidez`,
 1 AS `categoriaPeso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_user_design`
--

DROP TABLE IF EXISTS `v_user_design`;
/*!50001 DROP VIEW IF EXISTS `v_user_design`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_user_design` AS SELECT 
 1 AS `nickName`,
 1 AS `mail`,
 1 AS `profesionOficio`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_conveyor_parameters`
--

/*!50001 DROP VIEW IF EXISTS `v_conveyor_parameters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_conveyor_parameters` AS select `transportador`.`nombreTransportador` AS `nombreTransportador`,`transportador`.`fechaDiseño` AS `fechaDiseño`,`helice`.`tipoHelice` AS `tipoHelice`,`tubo`.`diametroNominalTubo` AS `diametroNominalTubo`,`transportador`.`velocidadTransporte` AS `velocidadTransporte`,`transportador`.`areaRelleno` AS `areaRelleno`,`transportador`.`inclinacion` AS `inclinacion`,`transportador`.`capacidadTransportador` AS `capacidadTransportador`,`helice`.`velocidadGiro` AS `velocidadGiro`,`helice`.`sentidoGiro` AS `sentidoGiro` from ((`transportador` join `helice` on((`transportador`.`id_Transportador` = `helice`.`Transportador_id_Transportador`))) join `tubo` on((`transportador`.`id_Transportador` = `tubo`.`Transportador_id_Transportador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_helice_detail`
--

/*!50001 DROP VIEW IF EXISTS `v_helice_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_helice_detail` AS select `transportador`.`nombreTransportador` AS `nombreTransportador`,`helice`.`tipoHelice` AS `tipoHelice`,`helice`.`diametroHelice` AS `diametroHelice`,`helice`.`sentidoHelice` AS `sentidoHelice`,`helice`.`pasoHelice` AS `pasoHelice`,`helice`.`sentidoGiro` AS `sentidoGiro`,`helice`.`velocidadGiro` AS `velocidadGiro` from (`helice` join `transportador` on((`helice`.`Transportador_id_Transportador` = `transportador`.`id_Transportador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_material`
--

/*!50001 DROP VIEW IF EXISTS `v_material`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_material` AS select `material`.`nombreMaterial` AS `nombreMaterial`,`material`.`tipoMezcla` AS `tipoMezcla`,`material`.`clasificacion` AS `clasificacion`,`material`.`tipoMaterial` AS `tipoMaterial`,`material`.`abrasividad` AS `abrasividad`,`material`.`densidad` AS `densidad`,`material`.`fluidez` AS `fluidez`,`material`.`categoriaPeso` AS `categoriaPeso` from `material` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_user_design`
--

/*!50001 DROP VIEW IF EXISTS `v_user_design`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_user_design` AS select `usuario`.`nickName` AS `nickName`,`usuario`.`mail` AS `mail`,`usuario`.`profesionOficio` AS `profesionOficio` from `usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-26  0:37:06
