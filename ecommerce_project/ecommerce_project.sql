-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Michael Roos','Michaelr@gmail.com',737386805),(2,'Julia Poulsen','Juliapoulsen@yahoo.com',764365378),(3,'Musa Habeti','Musahabeti@gmail.com',739852838),(4,'Fizza Zeeshan','Fizzazeeshan123@gmail.com',769232837),(5,'Ali Samow','Alisamow@hotmail.com',737963239),(6,'John Doe','johndoe@yahoo.com',769748669),(7,'Mickey Mouse','mickeymouse88@gmail.com',733336863);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_type` varchar(45) NOT NULL,
  `order_date` date NOT NULL,
  `price` int DEFAULT NULL,
  `customer_customer_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customer1_idx` (`customer_customer_id`),
  CONSTRAINT `fk_orders_customer1` FOREIGN KEY (`customer_customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'Bakery Items','2021-02-22',250,1),(2,'Household Items','2021-01-19',350,2),(3,'Clothing ','2021-01-02',800,3),(4,'Outdoor ','2021-02-07',1000,4),(5,'Cosmetics','2021-01-11',750,5),(6,'Cutlery','2020-12-17',1500,6),(7,'Health','2020-06-02',445,7);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_product`
--

DROP TABLE IF EXISTS `orders_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_product` (
  `orders_order_id` int NOT NULL,
  `product_product_id` int NOT NULL,
  PRIMARY KEY (`orders_order_id`,`product_product_id`),
  KEY `fk_orders_has_product_product1_idx` (`product_product_id`),
  KEY `fk_orders_has_product_orders1_idx` (`orders_order_id`),
  CONSTRAINT `fk_orders_has_product_orders1` FOREIGN KEY (`orders_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_orders_has_product_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_product`
--

LOCK TABLES `orders_has_product` WRITE;
/*!40000 ALTER TABLE `orders_has_product` DISABLE KEYS */;
INSERT INTO `orders_has_product` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `orders_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `name` varchar(45) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `weight` int NOT NULL,
  `orders_order_id` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('Chocolate Cake',1,2,1,1),('Tea Cups',2,6,2,2),('Jacket',3,1,4,3),('Garden Chairs',4,4,11,4),('Lipstick',5,3,3,5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_details`
--

DROP TABLE IF EXISTS `shipping_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_details` (
  `shipping_detailsid` int NOT NULL,
  `description` varchar(45) NOT NULL,
  `shipping_status` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `orders_order_id` int NOT NULL,
  PRIMARY KEY (`shipping_detailsid`),
  KEY `fk_shipping_details_orders1_idx` (`orders_order_id`),
  CONSTRAINT `fk_shipping_details_orders1` FOREIGN KEY (`orders_order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_details`
--

LOCK TABLES `shipping_details` WRITE;
/*!40000 ALTER TABLE `shipping_details` DISABLE KEYS */;
INSERT INTO `shipping_details` VALUES (1,'chocolate cake','2 days','35 James Street',1),(2,'fragile','3 days','47 Alivallsgatan',2),(3,'leather','5 days','31 Mölndal',3),(5,'red color','1 day','22 Maria Park',5);
/*!40000 ALTER TABLE `shipping_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-11 12:40:31
