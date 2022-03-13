create database sql1_day4;
use sql1_day4;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: sql1_day4
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `bank_account_details`
--

DROP TABLE IF EXISTS `bank_account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account_details` (
  `Customer_id` int(11) DEFAULT NULL,
  `Account_Number` varchar(19) NOT NULL,
  `Account_type` varchar(25) DEFAULT NULL,
  `Balance_amount` int(11) DEFAULT NULL,
  `Account_status` varchar(10) DEFAULT NULL,
  `Relationship_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Account_Number`),
  KEY `Customer_id` (`Customer_id`),
  CONSTRAINT `bank_account_details_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `bank_customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account_details`
--

LOCK TABLES `bank_account_details` WRITE;
/*!40000 ALTER TABLE `bank_account_details` DISABLE KEYS */;
INSERT INTO `bank_account_details` VALUES (123002,'4000-1956-2001','SAVINGS',400000,'ACTIVE','P'),(123003,'4000-1956-2900','SAVINGS',750000,'INACTIVE','P'),(123004,'4000-1956-3401','SAVINGS',655000,'ACTIVE','P'),(123001,'4000-1956-3456','SAVINGS',200000,'ACTIVE','P'),(123005,'4000-1956-5102','SAVINGS',300000,'ACTIVE','P'),(123006,'4000-1956-5698','SAVINGS',455000,'ACTIVE','P'),(123007,'4000-1956-9977','RECURRING DEPOSITS',7025000,'ACTIVE','S'),(123001,'5000-1700-3456','RECURRING DEPOSITS',9400000,'ACTIVE','S'),(123002,'5000-1700-5001','RECURRING DEPOSITS',7500000,'ACTIVE','S'),(123004,'5000-1700-6091','RECURRING DEPOSITS',7500000,'ACTIVE','S'),(123008,'5000-1700-7755','SAVINGS',0,'INACTIVE','P'),(123007,'5000-1700-9800','SAVINGS',355000,'ACTIVE','P'),(123006,'5800-1700-9800-7755','Credit Card',0,'ACTIVE','P'),(123006,'5890-1970-7706-8912','Add-on Credit Card',0,'ACTIVE','S'),(123007,'5900-1900-9877-5543','Add-on Credit Card',0,'ACTIVE','S'),(123007,'9000-1700-7777-4321','Credit Card',0,'INACTIVE','P');
/*!40000 ALTER TABLE `bank_account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account_relationship_details`
--

DROP TABLE IF EXISTS `bank_account_relationship_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account_relationship_details` (
  `Customer_id` int(11) DEFAULT NULL,
  `Account_Number` varchar(19) NOT NULL,
  `Account_type` varchar(25) DEFAULT NULL,
  `Linking_Account_Number` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`Account_Number`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Linking_Account_Number` (`Linking_Account_Number`),
  CONSTRAINT `bank_account_relationship_details_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `bank_customer` (`customer_id`),
  CONSTRAINT `bank_account_relationship_details_ibfk_2` FOREIGN KEY (`Linking_Account_Number`) REFERENCES `bank_account_details` (`Account_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account_relationship_details`
--

LOCK TABLES `bank_account_relationship_details` WRITE;
/*!40000 ALTER TABLE `bank_account_relationship_details` DISABLE KEYS */;
INSERT INTO `bank_account_relationship_details` VALUES (123002,'4000-1956-2001','SAVINGS',NULL),(123003,'4000-1956-2900','SAVINGS',NULL),(123001,'4000-1956-3456','SAVINGS',NULL),(123007,'4000-1956-9977','RECURRING DEPOSITS','5000-1700-9800'),(123001,'5000-1700-3456','RECURRING DEPOSITS','4000-1956-3456'),(123002,'5000-1700-5001','RECURRING DEPOSITS','4000-1956-2001'),(123004,'5000-1700-6091','RECURRING DEPOSITS','4000-1956-2900'),(123004,'5000-1700-7791','RECURRING DEPOSITS','4000-1956-2900'),(123007,'5000-1700-9800','SAVINGS',NULL),(NULL,'5800-1700-9800-7755','Credit Card','4000-1956-5698'),(NULL,'5890-1970-7706-8912','Add-on Credit Card','5800-1700-9800-7755'),(NULL,'5900-1900-9877-5543','Add-on Credit Card','9000-1700-7777-4321'),(NULL,'9000-1700-7777-4321','Credit Card','5000-1700-9800');
/*!40000 ALTER TABLE `bank_account_relationship_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_account_transaction`
--

DROP TABLE IF EXISTS `bank_account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_account_transaction` (
  `Account_Number` varchar(19) DEFAULT NULL,
  `Transaction_amount` decimal(18,2) DEFAULT NULL,
  `Transcation_channel` varchar(18) DEFAULT NULL,
  `Province` varchar(3) DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  KEY `Account_Number` (`Account_Number`),
  CONSTRAINT `bank_account_transaction_ibfk_1` FOREIGN KEY (`Account_Number`) REFERENCES `bank_account_details` (`Account_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_account_transaction`
--

LOCK TABLES `bank_account_transaction` WRITE;
/*!40000 ALTER TABLE `bank_account_transaction` DISABLE KEYS */;
INSERT INTO `bank_account_transaction` VALUES ('4000-1956-3456',-2000.00,'ATM withdrawl','CA','2020-01-13'),('4000-1956-2001',-4000.00,'POS-Walmart','MN','2020-02-14'),('4000-1956-2001',-1600.00,'UPI transfer','MN','2020-01-19'),('4000-1956-2001',-6000.00,'Bankers cheque','CA','2020-03-23'),('4000-1956-2001',-3000.00,'Net banking','CA','2020-04-24'),('4000-1956-2001',23000.00,'cheque deposit','MN','2020-03-15'),('5000-1700-6091',40000.00,'ECS transfer','NY','2020-02-19'),('4000-1956-3401',8000.00,'Cash Deposit','NY','2020-01-19'),('4000-1956-5102',-6500.00,'ATM withdrawal','NY','2020-03-14'),('4000-1956-5698',-9000.00,'Cash Deposit','NY','2020-03-27'),('4000-1956-9977',50000.00,'ECS transfer','NY','2020-01-16'),('9000-1700-7777-4321',-5000.00,'POS-Walmart','NY','2020-02-17'),('9000-1700-7777-4321',-8000.00,'Shopping Cart','MN','2020-03-13'),('9000-1700-7777-4321',-2500.00,'Shopping Cart','MN','2020-04-21'),('5800-1700-9800-7755',-9000.00,'POS-Walmart','MN','2020-04-13'),('5890-1970-7706-8912',-11000.00,'Shopping Cart','NY','2020-03-12'),('4000-1956-9977',10000.00,'ECS transfer','MN','2020-02-16'),('4000-1956-9977',40000.00,'ECS transfer','MN','2020-03-18'),('4000-1956-9977',60000.00,'ECS transfer','MN','2020-04-18'),('4000-1956-9977',20000.00,'ECS transfer','MN','2020-03-20'),('4000-1956-9977',49000.00,'ECS transfer','MN','2020-06-18');
/*!40000 ALTER TABLE `bank_account_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_customer`
--

DROP TABLE IF EXISTS `bank_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(20) DEFAULT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `state_code` varchar(3) DEFAULT NULL,
  `Telephone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_customer`
--

LOCK TABLES `bank_customer` WRITE;
/*!40000 ALTER TABLE `bank_customer` DISABLE KEYS */;
INSERT INTO `bank_customer` VALUES (123001,'Oliver','225-5, Emeryville','CA','1897614500'),(123002,'George','194-6,New brighton','MN','1897617000'),(123003,'Harry','2909-5,walnut creek','CA','1897617866'),(123004,'Jack','229-5, Concord','CA','1897627999'),(123005,'Jacob','325-7, Mission Dist','SFO','1897637000'),(123006,'Noah','275-9, saint-paul','MN','1897613200'),(123007,'Charlie','125-1,Richfield','MN','1897617666'),(123008,'Robin','3005-1,Heathrow','NY','1897614000');
/*!40000 ALTER TABLE `bank_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_customer_export`
--

DROP TABLE IF EXISTS `bank_customer_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_customer_export` (
  `customer_id` char(10) NOT NULL,
  `customer_name` char(20) DEFAULT NULL,
  `Address` char(20) DEFAULT NULL,
  `state_code` char(3) DEFAULT NULL,
  `Telephone` char(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_customer_export`
--

LOCK TABLES `bank_customer_export` WRITE;
/*!40000 ALTER TABLE `bank_customer_export` DISABLE KEYS */;
INSERT INTO `bank_customer_export` VALUES ('123001','Oliver','225-5, Emeryville','CA','1897614500'),('123002','George','194-6,New brighton','MN','189761700');
/*!40000 ALTER TABLE `bank_customer_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_customer_messages`
--

DROP TABLE IF EXISTS `bank_customer_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_customer_messages` (
  `Event` varchar(24) DEFAULT NULL,
  `Customer_message` varchar(75) DEFAULT NULL,
  `Notice_delivery_mode` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_customer_messages`
--

LOCK TABLES `bank_customer_messages` WRITE;
/*!40000 ALTER TABLE `bank_customer_messages` DISABLE KEYS */;
INSERT INTO `bank_customer_messages` VALUES ('Adhoc','All Banks are closed due to announcement of National strike','mobile'),('Transaction Limit','Only limited withdrawals per card are allowed from ATM machines','mobile');
/*!40000 ALTER TABLE `bank_customer_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_holidays`
--

DROP TABLE IF EXISTS `bank_holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_holidays` (
  `Holiday` date NOT NULL,
  `Start_time` datetime DEFAULT NULL,
  `End_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Holiday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_holidays`
--

LOCK TABLES `bank_holidays` WRITE;
/*!40000 ALTER TABLE `bank_holidays` DISABLE KEYS */;
INSERT INTO `bank_holidays` VALUES ('2020-03-13','2020-03-13 00:00:00','2020-03-12 18:30:00'),('2020-05-20','2020-05-20 00:00:00','2020-05-19 18:30:00');
/*!40000 ALTER TABLE `bank_holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_interest_rate`
--

DROP TABLE IF EXISTS `bank_interest_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_interest_rate` (
  `account_type` varchar(24) NOT NULL,
  `interest_rate` decimal(4,2) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`account_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_interest_rate`
--

LOCK TABLES `bank_interest_rate` WRITE;
/*!40000 ALTER TABLE `bank_interest_rate` DISABLE KEYS */;
INSERT INTO `bank_interest_rate` VALUES ('PRIVILEGED_INTEREST_RATE',0.08,'02','2020'),('RECURRING DEPOSITS',0.07,'02','2020'),('SAVINGS',0.04,'02','2020');
/*!40000 ALTER TABLE `bank_interest_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 12:09:08
