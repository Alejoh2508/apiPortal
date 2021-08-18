CREATE DATABASE  IF NOT EXISTS `portal` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `portal`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: portal
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `noticias`
--

DROP TABLE IF EXISTS `noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias` (
  `id_noticia` int NOT NULL AUTO_INCREMENT,
  `titulo` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `ruta_imagen` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenido` text COLLATE utf8_unicode_ci NOT NULL,
  `seccion` int NOT NULL,
  `autor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_creacion` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `usuario_modificacion` int NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `hora_modificacion` time NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_noticia`),
  KEY `seccion` (`seccion`),
  KEY `usuario_creacion` (`usuario_creacion`),
  KEY `usuario_modificacion` (`usuario_modificacion`),
  CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`seccion`) REFERENCES `secciones` (`id_seccion`),
  CONSTRAINT `noticias_ibfk_2` FOREIGN KEY (`usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `noticias_ibfk_3` FOREIGN KEY (`usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias`
--

LOCK TABLES `noticias` WRITE;
/*!40000 ALTER TABLE `noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secciones` (
  `id_seccion` int NOT NULL AUTO_INCREMENT,
  `nombre_seccion` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_creacion` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `usuario_modificacion` int NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `hora_modificacion` time NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `usuario_creacion` (`usuario_creacion`),
  KEY `usuario_modificacion` (`usuario_modificacion`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `secciones_ibfk_2` FOREIGN KEY (`usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secciones`
--

LOCK TABLES `secciones` WRITE;
/*!40000 ALTER TABLE `secciones` DISABLE KEYS */;
INSERT INTO `secciones` VALUES (1,'Deportes',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO'),(2,'Política',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO'),(3,'Social',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO'),(4,'Internacional',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO'),(5,'Cultura',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO'),(6,'Salud',1,'2021-08-17','15:19:00',1,'2021-08-17','15:19:00','ACTIVO');
/*!40000 ALTER TABLE `secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `cedula` int NOT NULL,
  `primer_nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `segundo_nombre` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primer_apellido` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `segundo_apellido` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `usuario_creacion` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `usuario_modificacion` int NOT NULL,
  `fecha_modificacion` date NOT NULL,
  `hora_modificacion` time NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `usuario_creacion` (`usuario_creacion`),
  KEY `usuario_modificacion` (`usuario_modificacion`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1013647676,'Freddy','Alejandro','Leal','Lozano','1994-02-25','alejoh94xd','alejohleal2508@outlook.com','13f1e20a705fb9176f389274bfb8b5e020e0e447',1,'2021-08-15','20:54:00',1,'2021-08-15','20:54:00','ACTIVO'),(2,3955898,'Azucena',NULL,'Leal','Lozano','1963-03-08','Azucena','azucena0308@outlook.com','e7903a5cd54592d21d847dfabe2b99bc4e9605ba',1,'2021-08-15','20:54:00',1,'2021-08-15','20:54:00','ACTIVO'),(3,123456789,'Prueba',NULL,'Portal','Noticias','1920-03-08','pruebas','correo123@outlook.com','e15e65648ff7daf69ad2ea80a555216980e92707',1,'2021-08-15','20:54:00',1,'2021-08-15','20:54:00','ACTIVO');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'portal'
--

--
-- Dumping routines for database 'portal'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-17 20:09:19
