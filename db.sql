/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - public_complaint_sorting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`public_complaint_sorting` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `public_complaint_sorting`;

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Replay` varchar(50) DEFAULT NULL,
  `Lid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`complaint`,`Date`,`Replay`,`Lid`) values 
(0,'','0000-00-00','',0),
(1,'ssssss','2021-04-27','',2),
(3,'eeee','2021-04-28','ok done',2);

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`feedback`,`Date`,`uid`) values 
(1,'good','2021-04-17',2);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User name` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`User name`,`Password`,`type`) values 
(1,'shameem','1234','admin'),
(2,'staff','staff','staff'),
(7,'shameem','1234','staff'),
(8,'shameem','1234','staff'),
(9,'shameem','1235','staff'),
(10,'shameem','1234','staff'),
(11,'shameem','1234','staff'),
(12,'shameem','1234','staff'),
(13,'shameem','1234','staff'),
(14,'shameem','1234','staff'),
(15,'shameem','123','staff'),
(16,'akshay','1234','staff'),
(17,'sabith','1234','staff'),
(18,'sabith','1234','staff'),
(19,'7','8','staff'),
(20,'shan','1234','staff'),
(21,'sabith','1234','staff'),
(22,'1','1','staff'),
(23,'1','1','staff'),
(24,'eeee','1234','staff');

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Notification` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`id`,`Notification`,`Date`) values 
(1,'bbbb','2021-04-20'),
(2,'SQSQDSQ','2021-04-20'),
(3,'www','2021-04-27'),
(4,'haiii','2021-04-27'),
(5,'aaa','2021-04-29'),
(6,'qqq','2021-04-30');

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` varchar(50) DEFAULT NULL,
  `staff_name` varchar(50) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `phone no` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`id`,`login_id`,`staff_name`,`place`,`post`,`pin`,`phone no`,`email`) values 
(10,'shameem','shameem','pmna','22222',333333,'3333','shamee'),
(15,'20','shan','malappuram','pmna',1111,'090909090','shan@gmail.com'),
(16,'21','sabith','kuttipuram','athavavand',679888,'9961000902','sabith@gmail.com'),
(18,'23','1','2','3',4,'5','6'),
(19,'24','Electricity','perinthalmanna','perinthalmanna',679322,'9961000902','electricty111@gmail.');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) DEFAULT NULL,
  `Place` varchar(50) DEFAULT NULL,
  `Post` varchar(30) DEFAULT NULL,
  `Pin` int(11) DEFAULT NULL,
  `Phone no` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `Lid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`Username`,`Place`,`Post`,`Pin`,`Phone no`,`email`,`Lid`) values 
(1,'shami','eeddf','dffgg',333,'4444','ssss',2),
(2,'qqqq','qqqqq','qqqq',2222,'5555','ssss',17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
