/*
SQLyog Ultimate v13.1.1 (64 bit)
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

/*Table structure for table `book_category` */

DROP TABLE IF EXISTS `book_category`;

CREATE TABLE `book_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `book_category` */

/*Table structure for table `book_order` */

DROP TABLE IF EXISTS `book_order`;

CREATE TABLE `book_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `book_order` */

insert  into `book_order`(`id`,`book_id`,`order_id`,`quantity`,`created_at`,`updated_at`) values 
(7,1,8,2,'2020-01-10 01:15:24','2020-01-10 01:15:24'),
(8,1,9,1,'2020-01-10 01:46:00','2020-01-10 01:46:00'),
(9,1,10,1,'2020-01-17 01:56:12','2020-01-17 01:56:12'),
(18,4,20,1,'2020-01-17 02:46:39','2020-01-17 02:46:39'),
(19,2,21,1,'2020-01-17 02:47:29','2020-01-17 02:47:29'),
(20,3,22,1,'2020-01-17 03:17:39','2020-01-17 03:17:39'),
(21,1,23,4,'2020-01-20 02:09:07','2020-01-20 02:09:07'),
(22,1,24,1,'2020-01-20 08:09:28','2020-01-20 08:09:28'),
(23,1,25,2,'2020-01-20 08:52:20','2020-01-20 08:52:20');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publisher` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `weight` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` int(10) unsigned NOT NULL DEFAULT '1',
  `status` enum('PUBLISH','DRAFT') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PUBLISH',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `books_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `books` */

insert  into `books`(`id`,`title`,`slug`,`description`,`author`,`publisher`,`cover`,`price`,`weight`,`views`,`stock`,`status`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`,`deleted_by`) values 
(1,'Adipisci voluptas quam','adipisci-voluptas-quam','Inventore dolore et nostrum aut aut doloribus. Est facilis tempore non quaerat. Ut eos est tempore eos nemo vitae minus. Eum et odit optio facilis aut id vitae.','Lauriane Lynch','O\'Reilly-Walter','a05463161ac8d1b926418aed812b7ec1.jpg',200000.00,0.50,0,89,'PUBLISH','2019-12-27 02:23:11','2020-01-20 08:52:20',NULL,NULL,NULL,NULL),
(2,'Rerum quis neque quisquam quam non','rerum-quis-neque-quisquam-quam-non','Sed accusamus suscipit sit labore molestiae voluptates qui autem. Eveniet iste dolores odit. Exercitationem laborum ducimus saepe non possimus eos. Et voluptas et recusandae quae. Dolorem dolorem corrupti in.','Dr. Enos Corkery','Padberg Ltd','c02bad1796f29f9f57c35b7a68c9dfce.jpg',150000.00,0.50,0,0,'PUBLISH','2019-12-27 02:23:13','2020-01-17 02:47:29',NULL,NULL,NULL,NULL),
(3,'Eum alias qui voluptatibus consequatur','eum-alias-qui-voluptatibus-consequatur','Quidem maxime voluptatem consectetur. Nulla quo labore hic in. Dolores ab libero aliquam odio tenetur numquam.','Dr. Maverick Torp I','McGlynn-Yundt','50b47c2c8344a98091bb9838422ff2c6.jpg',50000.00,0.50,0,0,'PUBLISH','2019-12-27 02:23:14','2020-01-17 03:17:39',NULL,NULL,NULL,NULL),
(4,'Soluta hic rem','soluta-hic-rem','Aut inventore ea omnis voluptas possimus. In numquam consequatur impedit culpa culpa. Quia placeat doloremque accusantium laboriosam voluptatem.','Allie Ferry V','Cruickshank, Marks and Cummerata','8c72dc3791ed4e8026a5d97920790eb2.jpg',300000.00,0.50,0,0,'PUBLISH','2019-12-27 02:23:15','2020-01-17 02:46:39',NULL,NULL,NULL,NULL),
(5,'Eum impedit qui voluptatem sapiente aliquid','eum-impedit-qui-voluptatem-sapiente-aliquid','Aperiam voluptatem hic et et natus aliquam ratione. Est et blanditiis laborum nisi. Quo tenetur possimus ex.','Dr. Russell Hand','Simonis-Bashirian','7589fff56749dc6ac39583dce8b5a61b.jpg',50000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:18',NULL,NULL,NULL,NULL,NULL),
(6,'Nostrum libero quae non','nostrum-libero-quae-non','Facere sunt ipsam magnam accusamus aut. Quam cupiditate quia et voluptatem. Iure et aut alias quod inventore similique et. Aut quibusdam accusantium natus harum ea. Rerum earum quisquam quia nulla laboriosam odit aut animi.','Sylvan Russel','O\'Conner, Fritsch and McGlynn','40254316f557b3ce704d8f689394199a.jpg',400000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:19',NULL,NULL,NULL,NULL,NULL),
(7,'Et est neque dolor incidunt','et-est-neque-dolor-incidunt','Similique id delectus eaque omnis. Tenetur dolorum quia voluptatum esse cum. Eligendi culpa aliquid ipsam porro cum. Officia quod dignissimos eos cumque quasi consequuntur. Praesentium rem ut autem maxime. Deleniti quia sequi et numquam voluptas.','Mrs. Maia Ernser','Erdman, Thiel and Becker','b78ed750a0a5954c01a6ecef8ba5b7bf.jpg',200000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:21',NULL,NULL,NULL,NULL,NULL),
(8,'Sequi ab sapiente et quidem voluptatibus qui enim sunt','sequi-ab-sapiente-et-quidem-voluptatibus-qui-enim-sunt','Cum beatae et tenetur reiciendis atque. Ipsam vero autem ut veritatis eligendi. Explicabo error consequatur non dolorum iste.','Dr. Horacio Ryan I','Klein PLC','45dc2f49225193259498e04a27a7211e.jpg',50000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:22',NULL,NULL,NULL,NULL,NULL),
(9,'Voluptates natus cupiditate fuga eveniet','voluptates-natus-cupiditate-fuga-eveniet','In quod numquam nobis nulla molestias culpa. Debitis facilis aut odit dolore voluptas qui. Qui et et aut dolor iure quis.','Ashtyn Predovic','Douglas, Gaylord and Strosin','3f534cf51c2b096c9b650af1d603d919.jpg',50000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:24',NULL,NULL,NULL,NULL,NULL),
(10,'Omnis quia quam corrupti repudiandae laboriosam eum','omnis-quia-quam-corrupti-repudiandae-laboriosam-eum','Architecto earum quod et quidem ex. Aut qui dolorem voluptatem molestiae. Ut aut aut voluptate dolorum alias aliquam. Aut ipsa voluptas veniam enim.','Selina Sanford','Zemlak Group','6b39f57ed68ada83d30f56f9858fbb85.jpg',150000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:25',NULL,NULL,NULL,NULL,NULL),
(11,'Quo quaerat quas dolor','quo-quaerat-quas-dolor','Neque perspiciatis quos saepe voluptate tempora sed. Exercitationem architecto velit distinctio impedit unde consequatur. Quia ut eos minus aut sed incidunt sunt. Aut doloribus id aut sint voluptates ipsam occaecati.','Jaqueline Lockman PhD','Braun Ltd','b53e8df3851bd35af8716240cf4a7461.jpg',500000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:26',NULL,NULL,NULL,NULL,NULL),
(12,'Eos iure veritatis','eos-iure-veritatis','Nesciunt et vitae vitae. Ab voluptates harum occaecati aut laboriosam modi quo soluta. Nulla qui aut fugiat voluptatem expedita. Libero explicabo excepturi et numquam est.','Kiarra Sanford','Sawayn-Schuster','470d43ce1a2c9044cff226e894f490a8.jpg',450000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:29',NULL,NULL,NULL,NULL,NULL),
(13,'Dolores praesentium asperiores architecto et','dolores-praesentium-asperiores-architecto-et','Eius repellat et dicta non quam. Reprehenderit error eos quia voluptates. Iste sit totam qui corporis cupiditate perspiciatis. Qui sunt ex maxime totam modi blanditiis perspiciatis. Excepturi sapiente et animi perferendis.','Miss Amya Ward Jr.','Kilback Group','ddb718b5dd78c10034c7ebd048c8d226.jpg',150000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:30',NULL,NULL,NULL,NULL,NULL),
(14,'Ullam veritatis sit cupiditate accusamus voluptatem itaque sapiente','ullam-veritatis-sit-cupiditate-accusamus-voluptatem-itaque-sapiente','Consequatur aut totam placeat. Vel ratione dolorem aut autem illo. At quia sit odit architecto omnis. Qui rerum dicta et nihil laboriosam.','Mrs. Susie Reinger','Turcotte and Sons','2312661e8b1d6ba77f7d9192548b2877.jpg',300000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:31',NULL,NULL,NULL,NULL,NULL),
(15,'Quae sed in eveniet totam ut ea nam','quae-sed-in-eveniet-totam-ut-ea-nam','Nam ut dolor eum perferendis dolorum nulla excepturi. Repudiandae in vel ea voluptatem. Molestias aut ratione eligendi ut voluptas facere cum ratione. Reiciendis ea nihil sed atque. Quia quis alias non voluptas quaerat consequatur vitae.','Colby Howe','Mraz LLC','e1386059762c4991e980352ac6de633f.jpg',200000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:33',NULL,NULL,NULL,NULL,NULL),
(16,'Expedita fugiat architecto aperiam aliquid harum hic et','expedita-fugiat-architecto-aperiam-aliquid-harum-hic-et','Dolores quasi soluta fugit dolorum nisi illo. Qui quasi eos aut sit recusandae molestias. Sed omnis accusantium vel dolor eaque aut iusto nemo.','Hassie Ratke','Beatty Group','71f83350f840c171116d45983d2193b4.jpg',450000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:34',NULL,NULL,NULL,NULL,NULL),
(17,'Necessitatibus velit officiis velit','necessitatibus-velit-officiis-velit','Atque numquam nisi dolores. Ducimus nam omnis dolorem ea minus qui. Illum id enim ex consequatur deserunt.','Lester Mraz','Ankunding, Douglas and Kemmer','85fe63d20896779d25d1661c44d42319.jpg',150000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:36',NULL,NULL,NULL,NULL,NULL),
(18,'Velit ut laudantium aperiam','velit-ut-laudantium-aperiam','Voluptas fugit ut voluptatem voluptatem ut voluptatum vitae aut. Dolore in rerum est in nam voluptatem. Aperiam culpa est ipsam magni est magni voluptatem et.','Cydney Bashirian','Wyman, Reilly and Gleason','081c522411130d1d64eac3226052e84d.jpg',50000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:37',NULL,NULL,NULL,NULL,NULL),
(19,'Ut maiores rerum','ut-maiores-rerum','Vel aspernatur saepe distinctio qui quas. Sit perferendis aut suscipit maxime illo accusantium voluptas ullam. Laudantium possimus voluptatem quaerat aut laborum in consequatur ipsum. Repellat nihil hic atque officia et sit quis.','Ollie Goldner','Ruecker-Paucek','cf2ea41fe5e7a44f253dd075bd9cd7b9.jpg',50000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:38',NULL,NULL,NULL,NULL,NULL),
(20,'Et atque unde mollitia corporis aut animi','et-atque-unde-mollitia-corporis-aut-animi','Voluptatibus corporis non quia quidem iusto eos. Eius sunt sint architecto iure distinctio est asperiores. Dolore neque non velit eveniet. Voluptates delectus quia modi est sed voluptates perspiciatis.','Elisa Becker','Parisian-Hintz','19eee896a6bf2c21616a72a53d387038.jpg',200000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:39',NULL,NULL,NULL,NULL,NULL),
(21,'Iste debitis nostrum','iste-debitis-nostrum','Quod ad nisi in dolores blanditiis sed. Corporis id cum est omnis laudantium hic est. Possimus deleniti et magnam ab repellat rem rerum.','Desmond Nikolaus IV','Ortiz-Hansen','139ad3c4bb2530a99a00bd0320574647.jpg',150000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:41',NULL,NULL,NULL,NULL,NULL),
(22,'Rerum eum illum dolore qui perferendis voluptas culpa','rerum-eum-illum-dolore-qui-perferendis-voluptas-culpa','Voluptatibus ea aut dolores est. Commodi quam et qui sint. Voluptatem expedita nisi et quos. Voluptas et sint nobis aliquid qui et enim. Quisquam esse voluptatem eum eos. Sint et aliquid consequatur quia provident tenetur.','Gregg Volkman','Brakus, Kub and Sipes','3c3074633b3541d7fea53fcf423305f0.jpg',500000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:42',NULL,NULL,NULL,NULL,NULL),
(23,'Reiciendis suscipit est autem laboriosam sapiente non','reiciendis-suscipit-est-autem-laboriosam-sapiente-non','Reiciendis possimus laborum nemo nam. Veritatis optio eum quo omnis ea eaque. Ut voluptates in recusandae.','Arlie Braun','Murazik-Grady','94a04857498bbc3fefc45ac6869baf46.jpg',350000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:43',NULL,NULL,NULL,NULL,NULL),
(24,'Ad et ut provident aut hic cumque','ad-et-ut-provident-aut-hic-cumque','Eos qui repudiandae quis sit rem nesciunt atque. Sequi ut corrupti ipsa reiciendis molestiae iusto tempore. Voluptatibus et unde soluta illo voluptatem fugit quos.','Abdiel Bartoletti','Beer, Towne and Walsh','ba22bdc318276277fce07a99d5a60c30.jpg',150000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:45',NULL,NULL,NULL,NULL,NULL),
(25,'Est iure delectus corrupti praesentium debitis omnis','est-iure-delectus-corrupti-praesentium-debitis-omnis','Iusto quae qui nihil ea. Sequi voluptate iure possimus perspiciatis vel sit cumque consequatur. Asperiores et repudiandae dolor iure.','Eldon Schulist','Douglas Inc','a61c2d5193644b9b19d38162502b69d3.jpg',300000.00,0.50,0,1,'PUBLISH','2019-12-27 02:23:47',NULL,NULL,NULL,NULL,NULL);

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

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

insert  into `customer`(`id_customer`,`name`,`email`,`city`,`country`) values 
(1,'Ipan Ardian','ipan.ardian@indosystem.com','Cirebon','Indonesia'),
(2,'Reimy Gaillard','remi@yahoo.com','Paris','France'),
(3,'Centro Moctezuma','centro@ask.com','México D.F.','Mexico'),
(4,'Ernst Handel','ernst@handel.com','Graz','Austria'),
(6,'Galería del gastrónomo','galeria@gmail.com','Barcelona','Spain'),
(7,'Bradley Smith','Bradley@goo.com','Cowes','UK'),
(8,'Königlich Essen','Koniglich@intel.com','Munchen','Germany'),
(10,'Magazzini Alimentari Riuniti','Magazzini@intel.com','Bergamo','Italy'),
(13,'John Doe','john@microsoft.com','Las Vegas','US'),
(14,'Mourinhou','mou@gmail.com','Lisbon','Portugal'),
(15,'Dart Vader','dart@gmail.com','Netingham','First Order'),
(16,'Messi','messi@gmail.com','Barcelona','Spain');

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
(1,'Nadi','nadi','Inventore dolore et nostrum aut aut doloribus. Est facilis tempore non quaerat. Ut eos est tempore eos nemo vitae minus. Eum et odit optio facilis aut id vitae.','nadi.jpg',200000.00,0,48,'ACTIVE','2019-12-27 02:23:11','2020-03-10 13:52:06',NULL,NULL,NULL,NULL),
(2,'Savusavu','savusavu','Sed accusamus suscipit sit labore molestiae voluptates qui autem. Eveniet iste dolores odit. Exercitationem laborum ducimus saepe non possimus eos. Et voluptas et recusandae quae. Dolorem dolorem corrupti in.','savusavu.jpg',150000.00,0,30,'ACTIVE','2019-12-27 02:23:13','2020-01-17 02:47:29',NULL,NULL,NULL,NULL),
(3,'Suva','suva','Quidem maxime voluptatem consectetur. Nulla quo labore hic in. Dolores ab libero aliquam odio tenetur numquam.','suva.jpg',50000.00,0,40,'ACTIVE','2019-12-27 02:23:14','2020-01-17 03:17:39',NULL,NULL,NULL,NULL),
(4,'Taveuni','taveuni','Aut inventore ea omnis voluptas possimus. In numquam consequatur impedit culpa culpa. Quia placeat doloremque accusantium laboriosam voluptatem.','taveuni.jpg',300000.00,0,50,'ACTIVE','2019-12-27 02:23:15','2020-01-17 02:46:39',NULL,NULL,NULL,NULL),
(5,'Labasa','labasa','Aperiam voluptatem hic et et natus aliquam ratione. Est et blanditiis laborum nisi. Quo tenetur possimus ex.','labasa.jpg',50000.00,0,70,'ACTIVE','2019-12-27 02:23:18',NULL,NULL,NULL,NULL,NULL),
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`user_id`,`total_bill`,`invoice_number`,`created_at`,`updated_at`,`status`) values 
(8,1,439000.00,'20200110011524','2020-01-10 01:15:24','2020-01-10 01:15:24',NULL),
(9,1,235000.00,'20200110014600','2020-01-10 01:46:00','2020-01-10 01:46:00',NULL),
(10,1,235000.00,'20200117015612','2020-01-17 01:56:12','2020-01-17 01:56:12',NULL),
(20,1,300000.00,'20200117024639','2020-01-17 02:46:39','2020-01-17 02:46:39',NULL),
(21,1,150000.00,'20200117024729','2020-01-17 02:47:29','2020-01-17 02:47:29',NULL),
(22,1,50000.00,'20200117031739','2020-01-17 03:17:39','2020-01-17 03:17:39',NULL),
(23,1,800000.00,'20200120020907','2020-01-20 02:09:07','2020-01-20 02:09:07',NULL),
(24,1,200000.00,'20200120080928','2020-01-20 08:09:28','2020-01-20 08:09:28',NULL),
(25,1,400000.00,'20200120085220','2020-01-20 08:52:20','2020-01-20 08:52:20',NULL),
(27,1,200000.00,'20200120090141','2020-01-20 09:01:41','2020-01-20 09:01:41',NULL),
(28,1,600000.00,'20200120090212','2020-01-20 09:02:12','2020-01-20 09:02:12',NULL),
(29,1,200000.00,'20200211032105','2020-02-11 03:21:05','2020-02-11 03:21:05',NULL),
(30,1,200000.00,'20200219012653','2020-02-19 01:26:53','2020-02-19 01:26:53',NULL),
(31,1,200000.00,'20200310135206','2020-03-10 13:52:06','2020-03-10 13:52:06','SUBMIT');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`roles`,`address`,`city_id`,`province_id`,`phone`,`avatar`,`status`,`api_token`) values 
(1,'Nemesio Raitubu','nemesioroko15@gmail.com',NULL,'$2y$10$c2X8i3PmP1pVqrXzn5JRguJl7ayNP2twt.CeY8lpsFz.9ybEGHhfu','5YLARBXmV2dnFtPkXvAWNQC00LPeZSPazGXZuKqTyGiOnoVo9l54XvS8C2jY','2019-12-27 02:23:05','2020-03-11 02:22:23','[\"CUSTOMER\"]','Melbourne',30,2,'51413131','308f7724007d02037f468484b42600d4.jpg','ACTIVE',NULL),
(2,'Administrator','admin@gmail.com',NULL,'$2y$10$38VyrmmVvKeYlgytTBM0Ku9uLl7fJp0QEF8jKAXBjPZJyQxm8U3sS','8NE7r4mfK4NYogFEG3jNsRMnvdfqw9gMST3f5UMFJXrOzA4UVHIfdAfUUQpW','2019-12-27 02:23:07',NULL,'[\"ADMIN\"]',NULL,NULL,NULL,NULL,'168eb8b1a2404ea6f5a5391bda517d56.jpg','ACTIVE',NULL),
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
(15,'adetiya bagus','bagus.nusantara313@gmail.com',NULL,'$2y$10$3pNW4/Wj9QsZi6RG67Xe.eMI0/siC.jwIVTbeX4Fy.TTUcskXgTZu',NULL,'2020-02-11 02:07:04','2020-02-11 02:09:26','[\"CUSTOMER\"]',NULL,NULL,NULL,NULL,'a935d636051d9dcc60ec53b2188014b1.jpg','ACTIVE',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
