-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: SistemaGP
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Caso_Prueba`
--

DROP TABLE IF EXISTS `Caso_Prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Caso_Prueba` (
  `id_caso` int NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `tipo` varchar(30) DEFAULT NULL,
  `prioridad` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_requisito` int DEFAULT NULL,
  `id_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`id_caso`),
  KEY `id_requisito` (`id_requisito`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `Caso_Prueba_ibfk_1` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`),
  CONSTRAINT `Caso_Prueba_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `Proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Caso_Prueba`
--

LOCK TABLES `Caso_Prueba` WRITE;
/*!40000 ALTER TABLE `Caso_Prueba` DISABLE KEYS */;
INSERT INTO `Caso_Prueba` VALUES (1,'Validar login con credenciales válidas','Funcional','Alta','Finalizado',1,1),(2,'Validar login con contraseña incorrecta','Funcional','Alta','Finalizado',1,1),(3,'Registrar cliente nuevo','Funcional','Media','En ejecución',2,2),(4,'Registrar cliente con datos incompletos','Funcional','Media','Pendiente',2,2),(5,'Visualizar reporte diario','UI','Baja','Pendiente',3,2),(6,'Acceder sin login','Seguridad','Alta','Finalizado',1,1);
/*!40000 ALTER TABLE `Caso_Prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejecucion`
--

DROP TABLE IF EXISTS `Ejecucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ejecucion` (
  `id_ejecucion` int NOT NULL AUTO_INCREMENT,
  `historial` text,
  `prioridad` varchar(20) DEFAULT NULL,
  `comentarios` text,
  `resultado` varchar(20) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_caso` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_ejecucion`),
  KEY `id_caso` (`id_caso`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Ejecucion_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `Caso_Prueba` (`id_caso`),
  CONSTRAINT `Ejecucion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejecucion`
--

LOCK TABLES `Ejecucion` WRITE;
/*!40000 ALTER TABLE `Ejecucion` DISABLE KEYS */;
INSERT INTO `Ejecucion` VALUES (1,'Ejecución exitosa del login','Alta','Todo funcionó correctamente','Exitoso','2023-05-10',1,2),(2,'Falla por contraseña incorrecta','Alta','Se mostró mensaje de error','Fallido','2023-05-12',2,2),(3,'Cliente registrado correctamente','Media','Datos almacenados en la base','Exitoso','2023-06-01',3,4),(4,'Error por falta de datos','Media','Validación no activada','Fallido','2023-06-02',4,4),(5,'Diseño mal renderizado','Baja','Botones desalineados','Fallido','2023-06-03',5,4),(6,'Acceso denegado correctamente','Alta','El sistema bloqueó correctamente','Exitoso','2023-06-04',6,2);
/*!40000 ALTER TABLE `Ejecucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proyecto` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcon` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_requisito` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_requisito` (`id_requisito`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `Proyecto_ibfk_1` FOREIGN KEY (`id_requisito`) REFERENCES `Requisito` (`id_requisito`),
  CONSTRAINT `Proyecto_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (1,'Activo','Sistema de Gestión Escolar','Proyecto para administrar estudiantes y profesores','2023-03-01','2023-10-30',1,1),(2,'Finalizado','App de Ventas','Aplicación móvil para ventas en línea','2023-01-15','2023-06-20',2,3);
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requisito`
--

DROP TABLE IF EXISTS `Requisito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Requisito` (
  `id_requisito` int NOT NULL AUTO_INCREMENT,
  `prioridad` varchar(20) DEFAULT NULL,
  `descripcion` text,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_requisito`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requisito`
--

LOCK TABLES `Requisito` WRITE;
/*!40000 ALTER TABLE `Requisito` DISABLE KEYS */;
INSERT INTO `Requisito` VALUES (1,'Alta','Login de usuario','Completado'),(2,'Media','Registro de nuevo cliente','En progreso'),(3,'Baja','Visualización de reportes','Pendiente');
/*!40000 ALTER TABLE `Requisito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (1,'Administrador','Gestión total del sistema'),(2,'Tester','Realiza pruebas funcionales y de regresión'),(3,'Desarrollador','Implementa funcionalidades y corrige errores');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `Rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Ana','ana@gmail.com','Administrador',1),(2,'Carlos','carlos@gmail.com','Tester',2),(3,'Luis','luis@gmail.com','Desarrollador',3),(4,'Marta','marta@gmail.com','Tester',2);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_caso_ejecu_falli`
--

DROP TABLE IF EXISTS `vista_caso_ejecu_falli`;
/*!50001 DROP VIEW IF EXISTS `vista_caso_ejecu_falli`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_caso_ejecu_falli` AS SELECT 
 1 AS `id_caso`,
 1 AS `descripcion`,
 1 AS `resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_caso_estado`
--

DROP TABLE IF EXISTS `vista_caso_estado`;
/*!50001 DROP VIEW IF EXISTS `vista_caso_estado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_caso_estado` AS SELECT 
 1 AS `desc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_caso_pend_pro`
--

DROP TABLE IF EXISTS `vista_caso_pend_pro`;
/*!50001 DROP VIEW IF EXISTS `vista_caso_pend_pro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_caso_pend_pro` AS SELECT 
 1 AS `nombre_caso`,
 1 AS `nombre_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_casos_funcional_alto`
--

DROP TABLE IF EXISTS `vista_casos_funcional_alto`;
/*!50001 DROP VIEW IF EXISTS `vista_casos_funcional_alto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_casos_funcional_alto` AS SELECT 
 1 AS `id_caso`,
 1 AS `descripcion`,
 1 AS `tipo`,
 1 AS `prioridad`,
 1 AS `estado`,
 1 AS `id_requisito`,
 1 AS `id_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ejecu_exitosas`
--

DROP TABLE IF EXISTS `vista_ejecu_exitosas`;
/*!50001 DROP VIEW IF EXISTS `vista_ejecu_exitosas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ejecu_exitosas` AS SELECT 
 1 AS `id_ejecucion`,
 1 AS `historial`,
 1 AS `prioridad`,
 1 AS `comentarios`,
 1 AS `resultado`,
 1 AS `fecha`,
 1 AS `id_caso`,
 1 AS `id_usuario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ejecu_usua`
--

DROP TABLE IF EXISTS `vista_ejecu_usua`;
/*!50001 DROP VIEW IF EXISTS `vista_ejecu_usua`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ejecu_usua` AS SELECT 
 1 AS `nombre`,
 1 AS `correo`,
 1 AS `id_ejecucion`,
 1 AS `fecha`,
 1 AS `resultado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_test_exit`
--

DROP TABLE IF EXISTS `vista_test_exit`;
/*!50001 DROP VIEW IF EXISTS `vista_test_exit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_test_exit` AS SELECT 
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuario_ejecu`
--

DROP TABLE IF EXISTS `vista_usuario_ejecu`;
/*!50001 DROP VIEW IF EXISTS `vista_usuario_ejecu`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuario_ejecu` AS SELECT 
 1 AS `nombre`,
 1 AS `correo`,
 1 AS `id_ejecucion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_caso_ejecu_falli`
--

/*!50001 DROP VIEW IF EXISTS `vista_caso_ejecu_falli`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_caso_ejecu_falli` AS select `Caso_Prueba`.`id_caso` AS `id_caso`,`Caso_Prueba`.`descripcion` AS `descripcion`,`Ejecucion`.`resultado` AS `resultado` from (`Ejecucion` join `Caso_Prueba` on((`Ejecucion`.`id_caso` = `Caso_Prueba`.`id_caso`))) where (`Ejecucion`.`resultado` = 'Fallido') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_caso_estado`
--

/*!50001 DROP VIEW IF EXISTS `vista_caso_estado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_caso_estado` AS select `cp`.`descripcion` AS `desc` from (`Caso_Prueba` `cp` join (select distinct `Requisito`.`id_requisito` AS `id_requisito` from `Requisito` where (`Requisito`.`estado` = 'En progreso')) `requisitos_en_progreso` on((`cp`.`id_requisito` = `requisitos_en_progreso`.`id_requisito`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_caso_pend_pro`
--

/*!50001 DROP VIEW IF EXISTS `vista_caso_pend_pro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_caso_pend_pro` AS select `Caso_Prueba`.`descripcion` AS `nombre_caso`,`Proyecto`.`nombre` AS `nombre_proyecto` from (`Caso_Prueba` join `Proyecto` on((`Caso_Prueba`.`id_proyecto` = `Proyecto`.`id_proyecto`))) where (`Caso_Prueba`.`estado` = 'Pendiente') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_casos_funcional_alto`
--

/*!50001 DROP VIEW IF EXISTS `vista_casos_funcional_alto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_casos_funcional_alto` AS select `Caso_Prueba`.`id_caso` AS `id_caso`,`Caso_Prueba`.`descripcion` AS `descripcion`,`Caso_Prueba`.`tipo` AS `tipo`,`Caso_Prueba`.`prioridad` AS `prioridad`,`Caso_Prueba`.`estado` AS `estado`,`Caso_Prueba`.`id_requisito` AS `id_requisito`,`Caso_Prueba`.`id_proyecto` AS `id_proyecto` from `Caso_Prueba` where ((`Caso_Prueba`.`prioridad` = 'Alta') and (`Caso_Prueba`.`tipo` = 'Funcional')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ejecu_exitosas`
--

/*!50001 DROP VIEW IF EXISTS `vista_ejecu_exitosas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ejecu_exitosas` AS select `Ejecucion`.`id_ejecucion` AS `id_ejecucion`,`Ejecucion`.`historial` AS `historial`,`Ejecucion`.`prioridad` AS `prioridad`,`Ejecucion`.`comentarios` AS `comentarios`,`Ejecucion`.`resultado` AS `resultado`,`Ejecucion`.`fecha` AS `fecha`,`Ejecucion`.`id_caso` AS `id_caso`,`Ejecucion`.`id_usuario` AS `id_usuario` from `Ejecucion` where (`Ejecucion`.`resultado` = 'Exitoso') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ejecu_usua`
--

/*!50001 DROP VIEW IF EXISTS `vista_ejecu_usua`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ejecu_usua` AS select `Usuario`.`nombre` AS `nombre`,`Usuario`.`correo` AS `correo`,`Ejecucion`.`id_ejecucion` AS `id_ejecucion`,`Ejecucion`.`fecha` AS `fecha`,`Ejecucion`.`resultado` AS `resultado` from (`Usuario` join `Ejecucion` on((`Usuario`.`id_usuario` = `Ejecucion`.`id_usuario`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_test_exit`
--

/*!50001 DROP VIEW IF EXISTS `vista_test_exit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_test_exit` AS select distinct `u`.`nombre` AS `nombre` from (`Usuario` `u` join `Ejecucion` `e` on((`u`.`id_usuario` = `e`.`id_usuario`))) where ((`u`.`rol` = 'Tester') and (`e`.`resultado` = 'Exitoso')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuario_ejecu`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuario_ejecu`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuario_ejecu` AS select `Usuario`.`nombre` AS `nombre`,`Usuario`.`correo` AS `correo`,`Ejecucion`.`id_ejecucion` AS `id_ejecucion` from (`Usuario` join `Ejecucion` on((`Usuario`.`id_usuario` = `Ejecucion`.`id_usuario`))) */;
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

-- Dump completed on 2025-07-29 19:59:32
