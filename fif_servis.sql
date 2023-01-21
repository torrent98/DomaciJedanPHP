/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.18 : Database - fif_servis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fif_servis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `fif_servis`;

/*Table structure for table `pruzalac` */

DROP TABLE IF EXISTS `pruzalac`;

CREATE TABLE `pruzalac` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imePrezime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `pruzalac` */

insert  into `pruzalac`(`id`,`imePrezime`) values 
(1,'Zarko Colic'),
(2,'Srdjan Colic'),
(3,'Darja Nedic'),
(4,'Ivan Petrovic');

/*Table structure for table `usluga` */

DROP TABLE IF EXISTS `usluga`;

CREATE TABLE `usluga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  `pruzalac` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pruzalac` (`pruzalac`),
  CONSTRAINT `usluga_pruzalac_fk` FOREIGN KEY (`pruzalac`) REFERENCES `pruzalac` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usluga` */

insert  into `usluga`(`id`,`naziv`,`pruzalac`) values 
(1,'Servo servis',1),
(2,'Zamena akumulatora',3),
(3,'Mali servis',3),
(4,'Veliki servis',2),
(5,'Zamena guma',4),
(6,'Popravka motora',1);

/*Table structure for table `termin` */

DROP TABLE IF EXISTS `termin`;

CREATE TABLE `termin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usluga` bigint(20) NOT NULL,
  `klijent` varchar(50) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `prostorija` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`usluga`),
  KEY `usluga` (`usluga`),
  CONSTRAINT `termin_usluga_fk` FOREIGN KEY (`usluga`) REFERENCES `usluga` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `termin` */

insert  into `termin`(`id`,`usluga`,`klijent`,`datum`,`prostorija`) values 
(1,2,'Damjan Belojevic','2022-02-14',19),
(2,3,'Milan Jevtic','2022-01-16',3),
(3,5,'Sergej Stefanovic','2022-02-22',16),
(4,4,'Petar Petrovic','2022-01-30',2),
(5,3,'Nikola Nikolic','2022-03-15',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
