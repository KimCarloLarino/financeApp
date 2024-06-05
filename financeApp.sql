-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: financeapp
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `tblbudget`
--

DROP TABLE IF EXISTS `tblbudget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbudget` (
  `budgetId` int NOT NULL AUTO_INCREMENT,
  `budgetOwner_id` int NOT NULL,
  `budgetTitle` varchar(255) NOT NULL,
  `budgetCurrency` varchar(3) NOT NULL,
  `budgetAmount` int NOT NULL,
  PRIMARY KEY (`budgetId`,`budgetOwner_id`),
  UNIQUE KEY `budgetOwner_id` (`budgetOwner_id`,`budgetTitle`),
  UNIQUE KEY `budgetId_UNIQUE` (`budgetId`),
  UNIQUE KEY `budgetOwner_id_UNIQUE` (`budgetOwner_id`),
  CONSTRAINT `tblbudget_ibfk_1` FOREIGN KEY (`budgetOwner_id`) REFERENCES `tbluser` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbudget`
--

LOCK TABLES `tblbudget` WRITE;
/*!40000 ALTER TABLE `tblbudget` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbudget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbudget_transactions`
--

DROP TABLE IF EXISTS `tblbudget_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblbudget_transactions` (
  `budget_transactionsId` int NOT NULL AUTO_INCREMENT,
  `budget_transactionsBudget_id` int NOT NULL,
  `budget_transactionsTransaction_id` int NOT NULL,
  `budget_transactionsAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`budget_transactionsId`,`budget_transactionsBudget_id`,`budget_transactionsTransaction_id`),
  UNIQUE KEY `budget_transactionsId_UNIQUE` (`budget_transactionsId`),
  UNIQUE KEY `budget_transactionsBudget_id_UNIQUE` (`budget_transactionsBudget_id`),
  UNIQUE KEY `budget_transactionsTransaction_id_UNIQUE` (`budget_transactionsTransaction_id`),
  CONSTRAINT `tblbudget_transactions_ibfk_1` FOREIGN KEY (`budget_transactionsBudget_id`) REFERENCES `tblbudget` (`budgetId`),
  CONSTRAINT `tblbudget_transactions_ibfk_2` FOREIGN KEY (`budget_transactionsId`) REFERENCES `tbltransaction` (`transactionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbudget_transactions`
--

LOCK TABLES `tblbudget_transactions` WRITE;
/*!40000 ALTER TABLE `tblbudget_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbudget_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcategory`
--

DROP TABLE IF EXISTS `tblcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcategory` (
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcategory`
--

LOCK TABLES `tblcategory` WRITE;
/*!40000 ALTER TABLE `tblcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltransaction`
--

DROP TABLE IF EXISTS `tbltransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltransaction` (
  `transactionId` int NOT NULL AUTO_INCREMENT,
  `transactionUser_id` int NOT NULL,
  `transactionCategory` varchar(255) NOT NULL,
  `transactionExpense_date` date NOT NULL,
  `transactionExpense_name` varchar(255) NOT NULL,
  `transactionAmount` decimal(12,2) NOT NULL,
  `transactionNote` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transactionId`),
  UNIQUE KEY `transactionId_UNIQUE` (`transactionId`),
  UNIQUE KEY `transactionUser_id_UNIQUE` (`transactionUser_id`),
  KEY `transactionCategory` (`transactionCategory`),
  CONSTRAINT `tbltransaction_ibfk_1` FOREIGN KEY (`transactionUser_id`) REFERENCES `tbluser` (`userId`),
  CONSTRAINT `tbltransaction_ibfk_2` FOREIGN KEY (`transactionCategory`) REFERENCES `tblcategory` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltransaction`
--

LOCK TABLES `tbltransaction` WRITE;
/*!40000 ALTER TABLE `tbltransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluser` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userEmail` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  PRIMARY KEY (`userId`,`userEmail`),
  UNIQUE KEY `userEmail` (`userEmail`),
  UNIQUE KEY `userId_UNIQUE` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-05 18:47:02
