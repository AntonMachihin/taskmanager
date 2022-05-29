-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.33-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.3.0.6376
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных zadanie
DROP DATABASE IF EXISTS `zadanie`;
CREATE DATABASE IF NOT EXISTS `zadanie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `zadanie`;

-- Дамп структуры для таблица zadanie.log
DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idtask` int(11) DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zapis` varchar(800) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vrem` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица zadanie.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `code` int(11) NOT NULL,
  `OperMenu` tinyint(4) NOT NULL DEFAULT '0',
  `MastMenu` tinyint(4) NOT NULL DEFAULT '0',
  `AddTask` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица zadanie.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idperson` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roleID` int(11) DEFAULT '0',
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица zadanie.zadachi
DROP TABLE IF EXISTS `zadachi`;
CREATE TABLE IF NOT EXISTS `zadachi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Zaglav` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Operator` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mast` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Task` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Data_sozd` date DEFAULT NULL,
  `Data_vyp` date DEFAULT NULL,
  `Stat` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Comment` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
