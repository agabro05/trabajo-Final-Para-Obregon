-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para trabajo
CREATE DATABASE IF NOT EXISTS `trabajo` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `trabajo`;

-- Volcando estructura para tabla trabajo.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Clientes` char(50) DEFAULT NULL,
  `Telefono` bigint(20) DEFAULT NULL,
  `Correo` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla trabajo.clientes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla trabajo.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` char(50) DEFAULT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Categoria` char(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla trabajo.productos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla trabajo.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDcliente` int(11) DEFAULT NULL,
  `Fecha` char(50) DEFAULT NULL,
  `Total` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDcliente` (`IDcliente`),
  CONSTRAINT `IDcliente` FOREIGN KEY (`IDcliente`) REFERENCES `clientes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla trabajo.ventas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla trabajo.ventasitems
CREATE TABLE IF NOT EXISTS `ventasitems` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PrecioUnitario` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioTotal` int(11) DEFAULT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `Idproducto` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IdVenta` (`IdVenta`),
  KEY `IdProducto` (`Idproducto`),
  CONSTRAINT `IdProducto` FOREIGN KEY (`Idproducto`) REFERENCES `productos` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `IdVenta` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla trabajo.ventasitems: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
