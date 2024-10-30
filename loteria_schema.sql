CREATE DATABASE  IF NOT EXISTS `loteria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `loteria`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: loteria
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `Bitacora_Cambios`
--

DROP TABLE IF EXISTS `Bitacora_Cambios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bitacora_Cambios` (
  `id_cambio` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(255) NOT NULL,
  `tipo_cambio` varchar(50) NOT NULL,
  `usuario_realizador` varchar(50) DEFAULT NULL,
  `fecha_cambio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detalles` text,
  PRIMARY KEY (`id_cambio`),
  KEY `usuario_realizador` (`usuario_realizador`),
  KEY `cliente` (`usuario_realizador`),
  KEY `fechacambio` (`fecha_cambio`),
  KEY `tipocambio` (`tipo_cambio`),
  KEY `vw_bitacora` (`fecha_cambio`,`tipo_cambio`,`usuario_realizador`,`id_cambio`)
) ENGINE=InnoDB AUTO_INCREMENT=1859301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Boletos`
--

DROP TABLE IF EXISTS `Boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Boletos` (
  `idboletos` int NOT NULL,
  `idcliente` int NOT NULL,
  `idpremio` int NOT NULL AUTO_INCREMENT,
  `precio` int NOT NULL,
  `fecha_compra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `numero` varchar(45) NOT NULL,
  PRIMARY KEY (`idboletos`),
  UNIQUE KEY `idboletos_UNIQUE` (`idboletos`),
  KEY `idclientes_idx` (`idcliente`),
  KEY `idpremios_idx` (`idpremio`),
  KEY `idboleta` (`idboletos`),
  KEY `precio` (`precio`),
  CONSTRAINT `idclientes` FOREIGN KEY (`idcliente`) REFERENCES `Clientes` (`id_cliente`),
  CONSTRAINT `idpremios` FOREIGN KEY (`idpremio`) REFERENCES `Premios` (`id_sorteo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ha_generado` varchar(255) NOT NULL DEFAULT '0',
  `ha_ganado` tinyint DEFAULT '0',
  PRIMARY KEY (`id_cliente`,`ha_generado`),
  UNIQUE KEY `email` (`email`),
  KEY `nombres` (`nombre`),
  KEY `HAGANADO` (`ha_ganado`)
) ENGINE=InnoDB AUTO_INCREMENT=11373817 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_cliente_insert` AFTER INSERT ON `Clientes` FOR EACH ROW BEGIN
    INSERT INTO Bitacora_Cambios (tabla_afectada, tipo_cambio, usuario_realizador, detalles)
    VALUES ('Clientes', 'INSERT', NEW.id_cliente, CONCAT('Se insertó el cliente con ID ', NEW.id_cliente));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_cliente_update` AFTER UPDATE ON `Clientes` FOR EACH ROW BEGIN
    INSERT INTO Bitacora_Cambios (tabla_afectada, tipo_cambio, usuario_realizador, detalles)
    VALUES ('Clientes', 'UPDATE', NEW.id_cliente, CONCAT('Se actualizó el cliente con ID ', NEW.id_cliente));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `id` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Premios`
--

DROP TABLE IF EXISTS `Premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Premios` (
  `id_cliente` int DEFAULT NULL,
  `id_sorteo` int NOT NULL,
  `monto_cobrado` decimal(10,2) DEFAULT NULL,
  `monto_ganado` decimal(10,2) DEFAULT NULL,
  `fecha_de_sorteo` datetime DEFAULT NULL,
  `sorteo_nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_sorteo`),
  KEY `CLIENTE_ID` (`id_cliente`),
  KEY `sorteoid` (`id_sorteo`),
  KEY `montoc` (`monto_cobrado`),
  KEY `montog` (`monto_ganado`),
  KEY `vw_user` (`id_cliente`,`id_sorteo`,`monto_ganado`),
  CONSTRAINT `Premios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Registro_De_Acceso`
--

DROP TABLE IF EXISTS `Registro_De_Acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Registro_De_Acceso` (
  `id_acceso` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int DEFAULT NULL,
  `fecha_acceso` datetime NOT NULL,
  PRIMARY KEY (`id_acceso`),
  KEY `Registro_De_Acceso_ibfk_1` (`cliente_id`),
  CONSTRAINT `Registro_De_Acceso_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `Clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `VW_BITACORA_USER`
--

DROP TABLE IF EXISTS `VW_BITACORA_USER`;
/*!50001 DROP VIEW IF EXISTS `VW_BITACORA_USER`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_BITACORA_USER` AS SELECT 
 1 AS `id_cambio`,
 1 AS `fecha_cambio`,
 1 AS `usuario_realizador`,
 1 AS `tipo_cambio`,
 1 AS `nombre`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VW_BUYER_BOLETA`
--

DROP TABLE IF EXISTS `VW_BUYER_BOLETA`;
/*!50001 DROP VIEW IF EXISTS `VW_BUYER_BOLETA`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_BUYER_BOLETA` AS SELECT 
 1 AS `id_cliente`,
 1 AS `boletoscomprados`,
 1 AS `Precio_minimo`,
 1 AS `fecha_minima`,
 1 AS `Maximo_precio`,
 1 AS `fecha_maxima`,
 1 AS `nombre`,
 1 AS `email`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `VW_USER_RECIBO`
--

DROP TABLE IF EXISTS `VW_USER_RECIBO`;
/*!50001 DROP VIEW IF EXISTS `VW_USER_RECIBO`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `VW_USER_RECIBO` AS SELECT 
 1 AS `idpremio`,
 1 AS `Ganador`,
 1 AS `promedio_ganado`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'loteria'
--

--
-- Dumping routines for database 'loteria'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_monto_cobrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_monto_cobrado`(
    IN premio_id INT, 
    IN nuevo_monto DECIMAL(10, 2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error actualizando el monto cobrado.';
    END;
    
    START TRANSACTION;  
    
    UPDATE Premios
    SET monto_cobrado = nuevo_monto
    WHERE id_sorteo = premio_id;
    
    COMMIT; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar-ganador-sorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar-ganador-sorteo`(
    IN cliente_id varchar(255),
	IN sorteo_id varchar(255)
)
BEGIN
    UPDATE `loteria`.`Premios` SET `id_cliente` = cliente_id WHERE (`id_sorteo` = sorteo_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar-sorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar-sorteo`(
    IN idsorteo int,
    IN montocobrado DECIMAL(10,2),
    IN montoganado DECIMAL(10,2),
	IN fechadesorteo datetime
)
BEGIN
    INSERT INTO `loteria`.`Premios` 
    (`id_sorteo`, `monto_cobrado`, `monto_ganado`, `fecha_de_sorteo`) 
    VALUES (idsorteo, montocobrado, montoganado,fechadesorteo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_acceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_acceso`(
    IN cliente_id INT, 
    IN fecha DATETIME
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al registrar el acceso.';
    END;
    
    START TRANSACTION;      
   
    INSERT INTO Registro_De_Acceso (cliente_id, fecha_acceso)
    VALUES (cliente_id, fecha);
    
    COMMIT; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_cliente`(
    IN nombre VARCHAR(255), 
    IN apellido VARCHAR(255), 
    IN email VARCHAR(255), 
    IN telefono VARCHAR(20),
    IN password_hash VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;  
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar el nuevo cliente.';
    END;
    
    START TRANSACTION;  

    INSERT INTO Clientes (nombre,apellido, email, telefono, ha_generado) 
    VALUES (nombre,apellido, email, telefono, 0);
    
    -- Assuming Clients table has an auto increment id_cliente.
    -- You may want to capture the generated ID if needed.
    
    COMMIT; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_ganador-sorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_ganador-sorteo`(
    IN cliente_id varchar(255),
	IN sorteo_id varchar(255)
)
BEGIN
    UPDATE `loteria`.`Premios` SET `id_cliente` = cliente_id WHERE (`id_sorteo` = sorteo_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_ganador_sorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_ganador_sorteo`(
    IN cliente_id varchar(255),
	IN sorteo_id varchar(255)
)
BEGIN
    UPDATE `loteria`.`Premios` SET `id_cliente` = cliente_id WHERE (`id_sorteo` = sorteo_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_millones_primitivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_millones_primitivo`()
BEGIN
DECLARE i INT DEFAULT 632259; 
WHILE (i <= 2000000-632259) DO
INSERT IGNORE INTO `loteria`.`Clientes` (`nombre`, `email`, `telefono`, `ha_generado`) values (CONCAT('nombres',CAST(i AS CHAR)), CONCAT('emails', CAST(i AS CHAR)), CONCAT('33',CAST(i AS CHAR)), '0');
    SET i = i+1;
END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_sorteo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_sorteo`(
    IN idsorteo int,
    IN montocobrado DECIMAL(10,2),
    IN montoganado DECIMAL(10,2),
	IN fechadesorteo datetime
)
BEGIN
    INSERT INTO `loteria`.`Premios` 
    (`id_sorteo`, `monto_cobrado`, `monto_ganado`, `fecha_de_sorteo`) 
    VALUES (idsorteo, montocobrado, montoganado,fechadesorteo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeerGanadoresPorEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerGanadoresPorEmail`(
    IN p_email VARCHAR(255)
)
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    
    SELECT p.*
    FROM Premios p
    JOIN Clientes c ON p.id_cliente = c.id_cliente
    WHERE c.email = p_email;

    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Volver al nivel de aislamiento predeterminado
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LeerGanadorPorEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LeerGanadorPorEstado`(
    IN p_estado BOOLEAN
)
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

    SELECT p.*
    FROM Premios p
    JOIN Clientes c ON p.id_cliente = c.id_cliente
    WHERE c.ha_ganado = p_estado;

    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Volver al nivel de aislamiento predeterminado
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_sorteos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_sorteos`(
    IN idcliente int
)
BEGIN
select  p.monto_cobrado as Premio, p.fecha_de_sorteo as fecha_de_cierre
,b.numero,p.sorteo_nombre
from Premios p
inner join Boletos b on p.id_sorteo=b.idpremio
where p.id_sorteo=b.idpremio and b.idcliente=idcliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `VW_BITACORA_USER`
--

/*!50001 DROP VIEW IF EXISTS `VW_BITACORA_USER`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_BITACORA_USER` AS select `Bitacora_Cambios`.`id_cambio` AS `id_cambio`,`Bitacora_Cambios`.`fecha_cambio` AS `fecha_cambio`,`Bitacora_Cambios`.`usuario_realizador` AS `usuario_realizador`,`Bitacora_Cambios`.`tipo_cambio` AS `tipo_cambio`,`Clientes`.`nombre` AS `nombre`,`Clientes`.`email` AS `email` from (`Bitacora_Cambios` join `Clientes` on((`Bitacora_Cambios`.`usuario_realizador` = `Clientes`.`id_cliente`))) where (`Bitacora_Cambios`.`usuario_realizador` = `Clientes`.`id_cliente`) group by `Bitacora_Cambios`.`id_cambio`,`Bitacora_Cambios`.`usuario_realizador`,`Bitacora_Cambios`.`tipo_cambio`,`Clientes`.`nombre`,`Clientes`.`email`,lower(`Bitacora_Cambios`.`fecha_cambio`) order by `Clientes`.`nombre` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VW_BUYER_BOLETA`
--

/*!50001 DROP VIEW IF EXISTS `VW_BUYER_BOLETA`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_BUYER_BOLETA` AS select `Clientes`.`id_cliente` AS `id_cliente`,count(`Boletos`.`idcliente`) AS `boletoscomprados`,(select min(`Min`.`price`) from (select `Boletos`.`fecha_compra` AS `fecha_compra`,`Boletos`.`idcliente` AS `fc`,sum(`Boletos`.`precio`) AS `price` from `Boletos` where (`Boletos`.`idcliente` = `Clientes`.`id_cliente`) group by `Boletos`.`fecha_compra`) `Min`) AS `Precio_minimo`,(select `fecha_minima`.`fecha_compra` from (select `Boletos`.`fecha_compra` AS `fecha_compra`,`Boletos`.`idcliente` AS `fc`,sum(`Boletos`.`precio`) AS `p` from `Boletos` where ((`Boletos`.`idcliente` = `Clientes`.`id_cliente`) and (`Boletos`.`precio` = `Precio_minimo`)) group by `Boletos`.`fecha_compra`) `fecha_minima`) AS `fecha_minima`,(select max(`INC`.`p`) from (select `Boletos`.`fecha_compra` AS `fecha_compra`,`Boletos`.`idcliente` AS `fc`,sum(`Boletos`.`precio`) AS `p` from `Boletos` where (`Boletos`.`idcliente` = `Clientes`.`id_cliente`) group by `Boletos`.`fecha_compra`) `INC`) AS `Maximo_precio`,(select `fecha_maxima`.`fecha_compra` from (select `Boletos`.`fecha_compra` AS `fecha_compra`,`Boletos`.`idcliente` AS `fc`,sum(`Boletos`.`precio`) AS `p` from `Boletos` where ((`Boletos`.`idcliente` = `Clientes`.`id_cliente`) and (`Boletos`.`precio` = `Maximo_precio`)) group by `Boletos`.`fecha_compra`) `fecha_maxima`) AS `fecha_maxima`,`Clientes`.`nombre` AS `nombre`,`Clientes`.`email` AS `email`,`Clientes`.`apellido` AS `apellido` from (`Boletos` join `Clientes` on((`Boletos`.`idcliente` = `Clientes`.`id_cliente`))) where (`Boletos`.`idcliente` = `Clientes`.`id_cliente`) group by `Clientes`.`id_cliente`,`Clientes`.`id_cliente`,`Clientes`.`nombre`,`Clientes`.`email`,`Clientes`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VW_USER_RECIBO`
--

/*!50001 DROP VIEW IF EXISTS `VW_USER_RECIBO`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `VW_USER_RECIBO` AS select (select group_concat(`Premios`.`id_sorteo` order by `Premios`.`id_sorteo` ASC separator ',') from `Premios` where (`Premios`.`id_cliente` = `Clientes`.`id_cliente`)) AS `idpremio`,concat(`Premios`.`id_cliente`,'-',`Clientes`.`nombre`,'-',`Clientes`.`apellido`,'-',`Clientes`.`email`) AS `Ganador`,avg(`Premios`.`monto_ganado`) AS `promedio_ganado` from (`Premios` join `Clientes` on((`Premios`.`id_cliente` = `Clientes`.`id_cliente`))) group by `Clientes`.`apellido`,`Clientes`.`nombre`,`Clientes`.`email`,`Premios`.`id_cliente` */;
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

-- Dump completed on 2024-10-30 19:51:16
