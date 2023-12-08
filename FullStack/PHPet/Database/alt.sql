CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `banhotosa`
--

DROP TABLE IF EXISTS `banhotosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banhotosa` (
  `id_veterinario` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `hora` time NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `perfilpet_id_perfilpet` int(11) NOT NULL,
  PRIMARY KEY (`id_veterinario`),
  KEY `fk_banhoTosa_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_banhoTosa_perfilpet1_idx` (`perfilpet_id_perfilpet`),
  CONSTRAINT `fk_banhoTosa_perfilpet1` FOREIGN KEY (`perfilpet_id_perfilpet`) REFERENCES `perfilpet` (`id_perfilpet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_banhoTosa_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banhotosa`
--

LOCK TABLES `banhotosa` WRITE;
/*!40000 ALTER TABLE `banhotosa` DISABLE KEYS */;
/*!40000 ALTER TABLE `banhotosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL AUTO_INCREMENT,
  `valorTotal` decimal(10,0) NOT NULL,
  `codigo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_carrinho`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES (1,0,'TESTE'),(2,0,'CODIGO_GERADO_PELO_SISTEMA'),(3,0,'CODIGO_GERADO_PELO_SISTEMA'),(4,0,'CODIGO_GERADO_PELO_SISTEMA'),(5,0,'CODIGO_GERADO_PELO_SISTEMA'),(6,0,'CODIGO_GERADO_PELO_SISTEMA'),(7,0,'CODIGO_GERADO_PELO_SISTEMA'),(8,0,'CODIGO_GERADO_PELO_SISTEMA'),(9,0,'CODIGO_GERADO_PELO_SISTEMA');
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho_produto`
--

DROP TABLE IF EXISTS `carrinho_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho_produto` (
  `id_carrinho_produto` int(11) NOT NULL AUTO_INCREMENT,
  `carrinho_id_carrinho` int(11) NOT NULL,
  `produto_id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_carrinho_produto`),
  KEY `fk_carrinho_produto_carrinho1_idx` (`carrinho_id_carrinho`),
  KEY `fk_carrinho_produto_produto1_idx` (`produto_id_produto`),
  CONSTRAINT `fk_carrinho_produto_carrinho1` FOREIGN KEY (`carrinho_id_carrinho`) REFERENCES `carrinho` (`id_carrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrinho_produto_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho_produto`
--

LOCK TABLES `carrinho_produto` WRITE;
/*!40000 ALTER TABLE `carrinho_produto` DISABLE KEYS */;
INSERT INTO `carrinho_produto` VALUES (95,1,23),(96,1,24),(97,1,25),(98,1,26),(99,1,27),(100,1,28),(101,1,29),(102,1,30),(103,1,31),(104,1,32),(105,1,33),(106,1,34),(107,1,35),(108,1,36),(109,1,37),(110,1,38),(111,1,39),(112,1,40),(113,1,41),(114,1,42),(115,1,43),(116,1,44),(117,1,45),(118,1,46),(119,1,47),(120,1,48),(121,1,49),(122,1,50),(123,1,51),(124,1,52),(125,1,53);
/*!40000 ALTER TABLE `carrinho_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `id_especie` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_especie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfilpet`
--

DROP TABLE IF EXISTS `perfilpet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfilpet` (
  `id_perfilpet` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `especie` varchar(45) NOT NULL,
  `raca` varchar(45) NOT NULL,
  `sexo` varchar(45) NOT NULL,
  `ano_nasc` varchar(45) NOT NULL,
  `peso` decimal(10,0) NOT NULL,
  `img` blob NOT NULL,
  `especie_id_especie` int(11) NOT NULL,
  `raca_id_raca` int(11) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_perfilpet`),
  KEY `fk_perfilpet_especie1_idx` (`especie_id_especie`),
  KEY `fk_perfilpet_raca1_idx` (`raca_id_raca`),
  KEY `fk_perfilpet_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_perfilpet_especie1` FOREIGN KEY (`especie_id_especie`) REFERENCES `especie` (`id_especie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfilpet_raca1` FOREIGN KEY (`raca_id_raca`) REFERENCES `raca` (`id_raca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfilpet_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfilpet`
--

LOCK TABLES `perfilpet` WRITE;
/*!40000 ALTER TABLE `perfilpet` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfilpet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `img` blob NOT NULL,
  `tag` varchar(45) NOT NULL,
  `carrinho_id_carrinho` int(11) NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_carrinho1_idx` (`carrinho_id_carrinho`),
  CONSTRAINT `fk_produto_carrinho1` FOREIGN KEY (`carrinho_id_carrinho`) REFERENCES `carrinho` (`id_carrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Produto 1',20,'Descrição do Produto 1','','TagProduto1',1,5),(2,'Produto 2',30,'Descrição do Produto 2','','TagProduto2',1,10),(3,'Produto 3',40,'Descrição do Produto 3','','TagProduto3',1,7),(4,'Produto 1',20,'Descrição do Produto 1','','TagProduto1',1,5),(5,'Produto 2',30,'Descrição do Produto 2','','TagProduto2',1,10),(6,'Produto 3',40,'Descrição do Produto 3','','TagProduto3',1,8),(7,'Produto 4',23,'Descrição do Produto 4','','TagProduto4',1,15),(8,'Produto 5',35,'Descrição do Produto 5','','TagProduto5',1,12),(9,'Produto 6',26,'Descrição do Produto 6','','TagProduto6',1,7),(10,'Produto 7',17,'Descrição do Produto 7','','TagProduto7',1,20),(11,'Produto 8',32,'Descrição do Produto 8','','TagProduto8',1,10),(12,'Produto 9',28,'Descrição do Produto 9','','TagProduto9',1,18),(13,'Produto 10',43,'Descrição do Produto 10','','TagProduto10',1,6),(14,'Produto 11',20,'Descrição do Produto 11','','TagProduto11',1,13),(15,'Produto 12',30,'Descrição do Produto 12','','TagProduto12',1,9),(16,'Produto 13',40,'Descrição do Produto 13','','TagProduto13',1,11),(17,'Produto 14',23,'Descrição do Produto 14','','TagProduto14',1,14),(18,'Produto 15',35,'Descrição do Produto 15','','TagProduto15',1,17),(19,'Produto 16',26,'Descrição do Produto 16','','TagProduto16',1,8),(20,'Produto 17',17,'Descrição do Produto 17','','TagProduto17',1,9),(21,'Produto 18',32,'Descrição do Produto 18','','TagProduto18',1,23),(22,'Produto 19',28,'Descrição do Produto 19','','TagProduto19',1,19),(23,'Produto 20',43,'Descrição do Produto 20','','TagProduto20',1,7),(24,'Produto 21',20,'Descrição do Produto 21','','TagProduto21',1,10),(25,'Produto 22',30,'Descrição do Produto 22','','TagProduto22',1,16),(26,'Produto 23',40,'Descrição do Produto 23','','TagProduto23',1,12),(27,'Produto 24',23,'Descrição do Produto 24','','TagProduto24',1,14),(28,'Produto 25',35,'Descrição do Produto 25','','TagProduto25',1,18),(29,'Produto 26',26,'Descrição do Produto 26','','TagProduto26',1,20),(30,'Produto 27',17,'Descrição do Produto 27','','TagProduto27',1,5),(31,'Produto 28',32,'Descrição do Produto 28','','TagProduto28',1,9),(32,'Produto 29',28,'Descrição do Produto 29','','TagProduto29',1,16),(33,'Produto 30',43,'Descrição do Produto 30','','TagProduto30',1,11),(34,'Produto 31',20,'Descrição do Produto 31','','TagProduto31',1,7),(35,'Produto 32',30,'Descrição do Produto 32','','TagProduto32',1,13),(36,'Produto 33',40,'Descrição do Produto 33','','TagProduto33',1,14),(37,'Produto 34',23,'Descrição do Produto 34','','TagProduto34',1,8),(38,'Produto 35',35,'Descrição do Produto 35','','TagProduto35',1,16),(39,'Produto 36',26,'Descrição do Produto 36','','TagProduto36',1,12),(40,'Produto 37',17,'Descrição do Produto 37','','TagProduto37',1,10),(41,'Produto 38',32,'Descrição do Produto 38','','TagProduto38',1,9),(42,'Produto 39',28,'Descrição do Produto 39','','TagProduto39',1,14),(43,'Produto 40',43,'Descrição do Produto 40','','TagProduto40',1,20),(44,'Produto 41',20,'Descrição do Produto 41','','TagProduto41',1,11),(45,'Produto 42',30,'Descrição do Produto 42','','TagProduto42',1,15),(46,'Produto 43',40,'Descrição do Produto 43','','TagProduto43',1,9),(47,'Produto 44',23,'Descrição do Produto 44','','TagProduto44',1,13),(48,'Produto 45',35,'Descrição do Produto 45','','TagProduto45',1,17),(49,'Produto 46',26,'Descrição do Produto 46','','TagProduto46',1,10),(50,'Produto 47',17,'Descrição do Produto 47','','TagProduto47',1,12),(51,'Produto 48',32,'Descrição do Produto 48','','TagProduto48',1,8),(52,'Produto 49',28,'Descrição do Produto 49','','TagProduto49',1,14),(53,'Produto 50',43,'Descrição do Produto 50','','TagProduto50',1,18);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raca`
--

DROP TABLE IF EXISTS `raca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raca` (
  `id_raca` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `especie_id_especie` int(11) NOT NULL,
  PRIMARY KEY (`id_raca`),
  KEY `fk_raca_especie1_idx` (`especie_id_especie`),
  CONSTRAINT `fk_raca_especie1` FOREIGN KEY (`especie_id_especie`) REFERENCES `especie` (`id_especie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raca`
--

LOCK TABLES `raca` WRITE;
/*!40000 ALTER TABLE `raca` DISABLE KEYS */;
/*!40000 ALTER TABLE `raca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `tag` int(11) NOT NULL,
  `banhoTosa_id_veterinario` int(11) NOT NULL,
  `veterinario_id_veterinario` int(11) NOT NULL,
  PRIMARY KEY (`id_servico`),
  KEY `fk_servico_banhoTosa1_idx` (`banhoTosa_id_veterinario`),
  KEY `fk_servico_veterinario1_idx` (`veterinario_id_veterinario`),
  CONSTRAINT `fk_servico_banhoTosa1` FOREIGN KEY (`banhoTosa_id_veterinario`) REFERENCES `banhotosa` (`id_veterinario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_veterinario1` FOREIGN KEY (`veterinario_id_veterinario`) REFERENCES `veterinario` (`id_veterinario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `carrinho_id_carrinho` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_carrinho1_idx` (`carrinho_id_carrinho`),
  CONSTRAINT `fk_usuario_carrinho1` FOREIGN KEY (`carrinho_id_carrinho`) REFERENCES `carrinho` (`id_carrinho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `id_veterinario` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `hora` time NOT NULL,
  `valor` decimal(10,0) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `usuario_id_usuario` int(11) NOT NULL,
  `perfilpet_id_perfilpet` int(11) NOT NULL,
  PRIMARY KEY (`id_veterinario`),
  KEY `fk_veterinario_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_veterinario_perfilpet1_idx` (`perfilpet_id_perfilpet`),
  CONSTRAINT `fk_veterinario_perfilpet1` FOREIGN KEY (`perfilpet_id_perfilpet`) REFERENCES `perfilpet` (`id_perfilpet`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_veterinario_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 13:47:08
