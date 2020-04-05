/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.24 : Database - travel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`travel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `travel`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PUBLISH',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`slug`,`image`,`status`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`,`deleted_by`) values 
(1,'Suva','Suva City','9ea345b390c382af60563092afe10464.jpg','PUBLISH','2019-12-27 02:23:48',NULL,NULL,NULL,NULL,NULL),
(2,'Lautoka','lautoka','8b9ed07f65b80aae3dcf0253bc5c4a89.jpg','PUBLISH','2019-12-27 02:23:49',NULL,NULL,NULL,NULL,NULL),
(3,'Nadi','nadi','798652faba6fcadee8ad7b217e6f85d3.jpg','PUBLISH','2019-12-27 02:23:51',NULL,NULL,NULL,NULL,NULL),
(9,'Ba','ba','798652faba6fcadee8ad7b217e6f85d3.jpg','PUBLISH',NULL,NULL,NULL,NULL,NULL,NULL),
(10,'Levuka','levuka','798652faba6fcadee8ad7b217e6f85d3.jpg','PUBLISH',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `category_destination` */

DROP TABLE IF EXISTS `category_destination`;

CREATE TABLE `category_destination` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_destination` */

/*Table structure for table `destination_order` */

DROP TABLE IF EXISTS `destination_order`;

CREATE TABLE `destination_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `destination_order` */

insert  into `destination_order`(`id`,`destination_id`,`order_id`,`quantity`,`created_at`,`updated_at`) values 
(7,1,8,2,'2020-01-10 01:15:24','2020-01-10 01:15:24'),
(8,1,9,1,'2020-01-10 01:46:00','2020-01-10 01:46:00'),
(9,1,10,1,'2020-01-17 01:56:12','2020-01-17 01:56:12'),
(18,4,20,1,'2020-01-17 02:46:39','2020-01-17 02:46:39'),
(19,2,21,1,'2020-01-17 02:47:29','2020-01-17 02:47:29'),
(20,3,22,1,'2020-01-17 03:17:39','2020-01-17 03:17:39'),
(21,1,23,4,'2020-01-20 02:09:07','2020-01-20 02:09:07'),
(22,1,24,1,'2020-01-20 08:09:28','2020-01-20 08:09:28'),
(23,1,25,2,'2020-01-20 08:52:20','2020-01-20 08:52:20'),
(24,1,27,1,'2020-01-20 09:01:41','2020-01-20 09:01:41'),
(25,1,28,3,'2020-01-20 09:02:12','2020-01-20 09:02:12'),
(26,1,29,1,'2020-02-11 03:21:05','2020-02-11 03:21:05'),
(27,1,30,1,'2020-02-19 01:26:53','2020-02-19 01:26:53'),
(28,1,31,1,'2020-03-10 13:52:06','2020-03-10 13:52:06');

/*Table structure for table `destinations` */

DROP TABLE IF EXISTS `destinations`;

CREATE TABLE `destinations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` int(10) unsigned NOT NULL DEFAULT '1',
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `destinations` */

insert  into `destinations`(`id`,`title`,`slug`,`description`,`cover`,`price`,`views`,`stock`,`status`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`,`deleted_by`) values 
(1,'Nadi','nadi','Nadi International Airport is the main international airport of Fiji as well as an important regional hub for the South Pacific islands, located by the coast on the western side of the main island Viti Levu. It is the main hub of Fiji Airways and its domestic and regional subsidiary Fiji Link. The airport is located at Namaka 10 km from the city of Nadi and 20 km from the city of Lautoka. In 2017, it handled 2,291,635 passengers on international and domestic flights. It handles about 97% of international visitors to Fiji, of which 86% are tourists. ','nadi.jpg',190.00,0,48,'ACTIVE','2019-12-27 02:23:11','2020-03-10 13:52:06',NULL,NULL,NULL,NULL),
(2,'Savusavu','savusavu','Savusavu Airport is an airport located near Savusavu known as the Paradise of Fiji, a town in the province of Cakaudrove on the island of Vanua Levu in Fiji. It is operated by Airports Fiji Limited provides access to lower south eastern parts of second biggest island of Fiji.','savusavu.jpg',250.00,0,30,'ACTIVE','2019-12-27 02:23:13','2020-01-17 02:47:29',NULL,NULL,NULL,NULL),
(3,'Suva','suva','Nausori Airport is the second International Airport in Fiji situated on the Eastern Side of the main Island of Viti Levu. Nausori Airport is a 30 minutes drive from the country\'s capital, Suva, the main bustling center for the South Pacific and home to many international and regional centers. This provides access to the capital city of Suva due to it being the closes airport.','suva.jpg',190.00,0,40,'ACTIVE','2019-12-27 02:23:14','2020-01-17 03:17:39',NULL,NULL,NULL,NULL),
(4,'Taveuni','taveuni','Taveuni Airport is a small, regional airport that has only one runway and only operates domestic flights around Fiji. This airport is located on the island of Taveuni know as the Garden Island of Fiji. The airport is quite small but receives a number of flights from Fiji Link and Air Fiji from Nadi and Suva. The airport is quite close to a number of resorts and small accommodation providers. ','taveuni.jpg',300.00,0,50,'ACTIVE','2019-12-27 02:23:15','2020-01-17 02:46:39',NULL,NULL,NULL,NULL),
(5,'Labasa','labasa','Labasa Airport an airport serving Labasa (pronounced [lamˈbasa]) is a town located in Macuata Province, in the northeastern part of the island of Vanua Levu in Fiji. It is operated by Airports Fiji Limited provides access to lower north eastern parts of second biggest island of Fiji.','labasa.jpg',220.00,0,70,'ACTIVE','2019-12-27 02:23:18',NULL,NULL,NULL,NULL,NULL),
(20,'realme 5x asaasa','realme','1212','indeh.PNG',121.00,0,1,'INACTIVE','2020-03-11 03:43:43','2020-03-11 03:43:43',NULL,NULL,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_08_05_033123_create_books_table',1),
(4,'2018_08_05_050155_alter_users_table',1),
(5,'2018_08_06_205410_create_categories_table',1),
(6,'2018_08_06_212931_create_orders_table',1),
(7,'2018_08_06_213012_create_book_category_table',1),
(8,'2018_08_06_213037_create_book_order_table',1),
(9,'2018_08_06_213134_create_provinces_table',1),
(10,'2018_08_06_213147_create_cities_table',1),
(11,'2018_08_18_211244_adds_api_token_to_users_table',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_bill` double(8,2) NOT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_phone` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`total_bill`,`invoice_number`,`created_at`,`updated_at`,`status`,`user_name`,`user_email`,`user_phone`) values 
(8,1,439000.00,'20200110011524','2020-01-10 01:15:24','2020-01-10 01:15:24',NULL,NULL,NULL,NULL),
(9,1,235000.00,'20200110014600','2020-01-10 01:46:00','2020-01-10 01:46:00',NULL,NULL,NULL,NULL),
(10,1,235000.00,'20200117015612','2020-01-17 01:56:12','2020-01-17 01:56:12',NULL,NULL,NULL,NULL),
(20,1,300000.00,'20200117024639','2020-01-17 02:46:39','2020-01-17 02:46:39',NULL,NULL,NULL,NULL),
(21,1,150000.00,'20200117024729','2020-01-17 02:47:29','2020-01-17 02:47:29',NULL,NULL,NULL,NULL),
(22,1,50000.00,'20200117031739','2020-01-17 03:17:39','2020-01-17 03:17:39',NULL,NULL,NULL,NULL),
(23,1,800000.00,'20200120020907','2020-01-20 02:09:07','2020-01-20 02:09:07',NULL,NULL,NULL,NULL),
(24,1,200000.00,'20200120080928','2020-01-20 08:09:28','2020-01-20 08:09:28',NULL,NULL,NULL,NULL),
(25,1,400000.00,'20200120085220','2020-01-20 08:52:20','2020-01-20 08:52:20',NULL,NULL,NULL,NULL),
(27,1,200000.00,'20200120090141','2020-01-20 09:01:41','2020-01-20 09:01:41',NULL,NULL,NULL,NULL),
(28,1,600000.00,'20200120090212','2020-01-20 09:02:12','2020-01-20 09:02:12',NULL,NULL,NULL,NULL),
(29,1,200000.00,'20200211032105','2020-02-11 03:21:05','2020-02-11 03:21:05',NULL,NULL,NULL,NULL),
(30,1,200000.00,'20200219012653','2020-02-19 01:26:53','2020-02-19 01:26:53',NULL,NULL,NULL,NULL),
(31,1,200000.00,'20200310135206','2020-03-10 13:52:06','2020-03-10 13:52:06','SUBMIT',NULL,NULL,NULL);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `prices` */

DROP TABLE IF EXISTS `prices`;

CREATE TABLE `prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(10) DEFAULT NULL,
  `to_id` int(10) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `departure_time` timestamp NULL DEFAULT NULL,
  `arrival_time` timestamp NULL DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `created_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `prices` */

/*Table structure for table `schedules` */

DROP TABLE IF EXISTS `schedules`;

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) DEFAULT NULL,
  `destination_name` varchar(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedules` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `roles` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`roles`,`address`,`city_id`,`province_id`,`phone`,`avatar`,`status`,`api_token`) values 
(1,'Nemesio Raitubus','nemesioroko15@gmail.com',NULL,'$2y$10$c2X8i3PmP1pVqrXzn5JRguJl7ayNP2twt.CeY8lpsFz.9ybEGHhfu','4l4BGsGbkZpw7UsYywZ5Qnva1UO1aQhQ2laf3NNcK31wAMGzQZh4H0jKukRV','2019-12-27 02:23:05','2020-03-11 02:22:23','ADMIN','Melbourne',30,2,'51413131','308f7724007d02037f468484b42600d4.jpg','ACTIVE',NULL),
(2,'Administrator','admin@gmail.com',NULL,'$2y$10$38VyrmmVvKeYlgytTBM0Ku9uLl7fJp0QEF8jKAXBjPZJyQxm8U3sS','aM8uT2pPkOG3UfsuAAXzym9oAo5dDcoYxTucGaT1SNUxAB7aq2SyRwJJ2L8H','2019-12-27 02:23:07',NULL,'[\"ADMIN\"]',NULL,NULL,NULL,NULL,'168eb8b1a2404ea6f5a5391bda517d56.jpg','ACTIVE',NULL),
(3,'Olen Howe','rhermann@example.net',NULL,'$2y$10$NpBPH/F5yLkB2JXh4eiR7e/uSzZbOepvU.S0F5fnXNfWxjQZOYljK',NULL,'2019-12-27 02:23:08',NULL,'[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,'85cb6c09d57b136d99e05a547aa18954.jpg','ACTIVE',NULL),
(4,'Miss Maryse Feil IV','uking@example.net',NULL,'$2y$10$Pmt9iR6n4HKPWGJiAlzTlOCzNy26Z6xkGA6E6P2lsT5YeGY.CZMaG',NULL,'2019-12-27 02:23:09',NULL,'[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,'0fd5938c0ce94fc3723ffaa23f0b5073.jpg','ACTIVE',NULL),
(5,'Prof. Walter Gaylord','bernier.zena@example.net',NULL,'$2y$10$i6D9IWkgCfoS01qetHw9duT9gwFV8Faqa8IHjdyXPQI1R.GNZ/eKK',NULL,'2019-12-27 02:23:10',NULL,'[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,'a935d636051d9dcc60ec53b2188014b1.jpg','ACTIVE',NULL),
(6,'nemesio','nemesioroko@gmailc.com',NULL,'$2y$10$IA/rSt.2Sxd00QnGFeX0ieQBMYLVEkk0C6acfrnvidVRbxW341uIS',NULL,'2020-01-02 01:45:39','2020-01-02 01:45:39','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(7,'nemesio','nemesioroko@gmail.com',NULL,'$2y$10$ku//P3qrlLtRmlf5WQ1/8e63fsba/AVuio4AUSo0Ci7HxnJipQZF6',NULL,'2020-01-02 01:46:12','2020-01-02 01:46:12','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(8,'nusa','nusa@gmail.com',NULL,'$2y$10$tVX20vaVko9vJafKXI8EGubE.nMuGEvX//O.Zvg4XCOs83cQ5Zuzy',NULL,'2020-01-02 01:55:06','2020-01-02 01:55:06','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(9,'nemesio','nemesioroko16@gmail.com',NULL,'$2y$10$bcuNZClCb/N922ndqPeifeYqhN.dXpIQyakVEavt07UAgW4RgBVlW',NULL,'2020-01-02 02:17:35','2020-01-02 02:17:35','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(10,'nus','nusa@nusa.com',NULL,'$2y$10$WvzNO3jS.UWGKQK0TZsO5O2VnCyxsmB3Vl2AWllcowIE292OZjJ7S',NULL,'2020-01-02 02:23:17','2020-01-02 02:23:17','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE','QoiHoPw62a122G8qAdpfaTpWRcTNWFp9YSrl5DDlqtvmgZxh7gUztw5DJZLy'),
(11,'nuys','akautzer@example.net',NULL,'$2y$10$JAaexjDsNwFUSdJNc0ockuS2muhPt/3c8U9k/ktdZd1qhV7Q7VKnS',NULL,'2020-01-02 02:24:32','2020-02-11 03:17:29','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(12,'nuys','akautzer@examples.net',NULL,'$2y$10$F.x6tFmC5d.2U6LA3CfAWuoN.zsCaxRH7gOwM42urrE4OJlcXB2SC',NULL,'2020-01-02 02:27:09','2020-01-02 02:27:09','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(13,'nemesio','nemesioroko162@gmail.com',NULL,'$2y$10$.87FBN9RZkKmoiYeO9ZViuki3Z8Tu6MaBS2u0AwMCbgB6W9w87vQa',NULL,'2020-01-02 02:33:29','2020-01-06 04:31:42','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE','mNCgr45uWDXSV4KkCNtJNkPEJdoBySgzLUEef8ZQL2kO9xWl1tWerjOWMf5R'),
(14,'asas','akautzer@example.nets',NULL,'$2y$10$EPwlSUAjfMjqZ301hzGvSetbtzowjwN9U21QUJgUj93d34rRsavMa',NULL,'2020-01-02 02:33:50','2020-01-02 02:33:56','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL),
(15,'adetiya bagus','bagus.nusantara313@gmail.com',NULL,'$2y$10$3pNW4/Wj9QsZi6RG67Xe.eMI0/siC.jwIVTbeX4Fy.TTUcskXgTZu',NULL,'2020-02-11 02:07:04','2020-02-11 02:09:26','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,'a935d636051d9dcc60ec53b2188014b1.jpg','ACTIVE',NULL),
(16,'infomedik solusi','pegi@sjf.com',NULL,'$2y$10$KtUw7uCYGkAMJTbcJF17IeHJwbPK22rfEpr7T8E5gUg1Vp5.aSwIa','CT7RkHUaQuPwbK2nY8PqIl5ilApeypD31j0L3qWFyNHpfLdiw9oFgt1CPTVO','2020-04-02 03:25:55','2020-04-02 03:25:55',NULL,NULL,NULL,NULL,NULL,NULL,'ACTIVE',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;