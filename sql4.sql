/*
 Navicat Premium Data Transfer

 Source Server         : localMySql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 15/06/2020 21:14:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('PUBLISH','DRAFT') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PUBLISH',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Airport', 'airport', '9ea345b390c382af60563092afe10464.jpg', 'PUBLISH', '2019-12-27 02:23:48', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for category_destination
-- ----------------------------
DROP TABLE IF EXISTS `category_destination`;
CREATE TABLE `category_destination`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `destination_id`(`destination_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `category_destination_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `category_destination_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_destination
-- ----------------------------

-- ----------------------------
-- Table structure for destination_order
-- ----------------------------
DROP TABLE IF EXISTS `destination_order`;
CREATE TABLE `destination_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `destination_id`(`destination_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `destination_order_ibfk_1` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `destination_order_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of destination_order
-- ----------------------------
INSERT INTO `destination_order` VALUES (7, 1, 8, 2, '2020-01-10 01:15:24', '2020-01-10 01:15:24');
INSERT INTO `destination_order` VALUES (8, 1, 9, 1, '2020-01-10 01:46:00', '2020-01-10 01:46:00');
INSERT INTO `destination_order` VALUES (9, 1, 10, 1, '2020-01-17 01:56:12', '2020-01-17 01:56:12');
INSERT INTO `destination_order` VALUES (18, 4, 20, 1, '2020-01-17 02:46:39', '2020-01-17 02:46:39');
INSERT INTO `destination_order` VALUES (19, 2, 21, 1, '2020-01-17 02:47:29', '2020-01-17 02:47:29');
INSERT INTO `destination_order` VALUES (20, 3, 22, 1, '2020-01-17 03:17:39', '2020-01-17 03:17:39');
INSERT INTO `destination_order` VALUES (21, 1, 23, 4, '2020-01-20 02:09:07', '2020-01-20 02:09:07');
INSERT INTO `destination_order` VALUES (22, 1, 24, 1, '2020-01-20 08:09:28', '2020-01-20 08:09:28');
INSERT INTO `destination_order` VALUES (23, 1, 25, 2, '2020-01-20 08:52:20', '2020-01-20 08:52:20');
INSERT INTO `destination_order` VALUES (24, 1, 27, 1, '2020-01-20 09:01:41', '2020-01-20 09:01:41');
INSERT INTO `destination_order` VALUES (25, 1, 28, 3, '2020-01-20 09:02:12', '2020-01-20 09:02:12');
INSERT INTO `destination_order` VALUES (26, 1, 29, 1, '2020-02-11 03:21:05', '2020-02-11 03:21:05');
INSERT INTO `destination_order` VALUES (27, 1, 30, 1, '2020-02-19 01:26:53', '2020-02-19 01:26:53');
INSERT INTO `destination_order` VALUES (28, 1, 31, 1, '2020-03-10 13:52:06', '2020-03-10 13:52:06');
INSERT INTO `destination_order` VALUES (29, 1, 32, 1, '2020-04-05 15:38:05', '2020-04-05 15:38:05');
INSERT INTO `destination_order` VALUES (30, 1, 33, 1, '2020-04-05 15:53:20', '2020-04-05 15:53:20');
INSERT INTO `destination_order` VALUES (31, 2, 57, 1, '2020-04-05 17:45:08', '2020-04-05 17:45:08');
INSERT INTO `destination_order` VALUES (32, 1, 57, 1, '2020-04-05 17:45:08', '2020-04-05 17:45:08');
INSERT INTO `destination_order` VALUES (33, 2, 58, 1, '2020-04-05 17:46:04', '2020-04-05 17:46:04');
INSERT INTO `destination_order` VALUES (34, 1, 58, 1, '2020-04-05 17:46:04', '2020-04-05 17:46:04');
INSERT INTO `destination_order` VALUES (35, 1, 59, 2, '2020-04-05 17:48:56', '2020-04-05 17:48:56');
INSERT INTO `destination_order` VALUES (36, 2, 59, 1, '2020-04-05 17:48:56', '2020-04-05 17:48:56');
INSERT INTO `destination_order` VALUES (37, 1, 60, 2, '2020-04-05 17:56:04', '2020-04-05 17:56:04');
INSERT INTO `destination_order` VALUES (38, 1, 61, 1, '2020-04-05 17:57:05', '2020-04-05 17:57:05');
INSERT INTO `destination_order` VALUES (39, 3, 61, 2, '2020-04-05 17:57:05', '2020-04-05 17:57:05');
INSERT INTO `destination_order` VALUES (40, 2, 62, 1, '2020-04-10 03:40:01', '2020-04-10 03:40:01');
INSERT INTO `destination_order` VALUES (41, 2, 63, 1, '2020-04-10 03:43:50', '2020-04-10 03:43:50');
INSERT INTO `destination_order` VALUES (42, 2, 64, 1, '2020-04-12 01:43:05', '2020-04-12 01:43:05');
INSERT INTO `destination_order` VALUES (43, 3, 65, 1, '2020-04-12 03:08:54', '2020-04-12 03:08:54');

-- ----------------------------
-- Table structure for destinations
-- ----------------------------
DROP TABLE IF EXISTS `destinations`;
CREATE TABLE `destinations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `price` double(8, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `datetime` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `deleted_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `books_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of destinations
-- ----------------------------
INSERT INTO `destinations` VALUES (1, 'Nadi', 'nadi', 'Nadi International Airport is the main international airport of Fiji as well as an important regional hub for the South Pacific islands, located by the coast on the western side of the main island Viti Levu. It is the main hub of Fiji Airways and its domestic and regional subsidiary Fiji Link. The airport is located at Namaka 10 km from the city of Nadi and 20 km from the city of Lautoka. In 2017, it handled 2,291,635 passengers on international and domestic flights. It handles about 97% of international visitors to Fiji, of which 86% are tourists. ', 'nadi.jpg', 190.00, 0, 43, 'ACTIVE', '2020-04-30 08:03:16', '2019-12-27 02:23:11', '2020-04-05 17:57:05', NULL, NULL, NULL, NULL);
INSERT INTO `destinations` VALUES (2, 'Savusavu', 'savusavu', 'Savusavu Airport is an airport located near Savusavu known as the Paradise of Fiji, a town in the province of Cakaudrove on the island of Vanua Levu in Fiji. It is operated by Airports Fiji Limited provides access to lower south eastern parts of second biggest island of Fiji.', 'savusavu.jpg', 250.00, 0, 27, 'ACTIVE', '2020-04-30 08:03:16', '2019-12-27 02:23:13', '2020-04-12 01:43:05', NULL, NULL, NULL, NULL);
INSERT INTO `destinations` VALUES (3, 'Suva', 'suva', 'Nausori Airport is the second International Airport in Fiji situated on the Eastern Side of the main Island of Viti Levu. Nausori Airport is a 30 minutes drive from the country\'s capital, Suva, the main bustling center for the South Pacific and home to many international and regional centers. This provides access to the capital city of Suva due to it being the closes airport.', 'suva.jpg', 190.00, 0, 37, 'ACTIVE', '2020-04-30 08:03:16', '2019-12-27 02:23:14', '2020-04-12 03:08:54', NULL, NULL, NULL, NULL);
INSERT INTO `destinations` VALUES (4, 'Taveuni', 'taveuni', 'Taveuni Airport is a small, regional airport that has only one runway and only operates domestic flights around Fiji. This airport is located on the island of Taveuni know as the Garden Island of Fiji. The airport is quite small but receives a number of flights from Fiji Link and Air Fiji from Nadi and Suva. The airport is quite close to a number of resorts and small accommodation providers. ', 'taveuni.jpg', 300.00, 0, 50, 'ACTIVE', '2020-04-30 08:03:16', '2019-12-27 02:23:15', '2020-01-17 02:46:39', NULL, NULL, NULL, NULL);
INSERT INTO `destinations` VALUES (5, 'Labasa', 'labasa', 'Labasa Airport an airport serving Labasa (pronounced [lamˈbasa]) is a town located in Macuata Province, in the northeastern part of the island of Vanua Levu in Fiji. It is operated by Airports Fiji Limited provides access to lower north eastern parts of second biggest island of Fiji.', 'labasa.jpg', 220.00, 0, 70, 'ACTIVE', '2020-04-30 08:03:16', '2019-12-27 02:23:18', '2020-06-15 15:49:43', NULL, NULL, NULL, NULL);
INSERT INTO `destinations` VALUES (6, 'Yasawa Island', 'yasawa-island', 'There are 15 words in the Fijian language meaning Heaven and \'Yasawa\' is the first. Yasawa Island Resort and Spa is an exclusive all-inclusive resort on one of the most remote and unspoiled islands of Fiji. Just 18 luxury bungalows are hidden among the palms, each just a few steps from a pristine white beach. Swim in crystal clear waters, explore any of our 10 private beaches, dive on vividly colored corals, connect with an ancient culture or indulge in Fiji\'s first beachfront spa. Whatever you choose to do at Yasawa, you\'ll do it in complete seclusion.', 'yasawa-home-hammock.jpg', 225.00, 0, 1, 'ACTIVE', NULL, '2020-06-15 11:38:30', '2020-06-15 11:38:30', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_08_05_033123_create_books_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_08_05_050155_alter_users_table', 1);
INSERT INTO `migrations` VALUES (5, '2018_08_06_205410_create_categories_table', 1);
INSERT INTO `migrations` VALUES (6, '2018_08_06_212931_create_orders_table', 1);
INSERT INTO `migrations` VALUES (7, '2018_08_06_213012_create_book_category_table', 1);
INSERT INTO `migrations` VALUES (8, '2018_08_06_213037_create_book_order_table', 1);
INSERT INTO `migrations` VALUES (9, '2018_08_06_213134_create_provinces_table', 1);
INSERT INTO `migrations` VALUES (10, '2018_08_06_213147_create_cities_table', 1);
INSERT INTO `migrations` VALUES (11, '2018_08_18_211244_adds_api_token_to_users_table', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `total_bill` double(8, 2) NOT NULL,
  `invoice_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_phone` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (8, 1, 439000.00, '20200110011524', '2020-01-10 01:15:24', '2020-01-10 01:15:24', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (9, 1, 235000.00, '20200110014600', '2020-01-10 01:46:00', '2020-01-10 01:46:00', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (10, 1, 235000.00, '20200117015612', '2020-01-17 01:56:12', '2020-01-17 01:56:12', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (20, 1, 300000.00, '20200117024639', '2020-01-17 02:46:39', '2020-01-17 02:46:39', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (21, 1, 150000.00, '20200117024729', '2020-01-17 02:47:29', '2020-01-17 02:47:29', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (22, 1, 50000.00, '20200117031739', '2020-01-17 03:17:39', '2020-01-17 03:17:39', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (23, 1, 800000.00, '20200120020907', '2020-01-20 02:09:07', '2020-01-20 02:09:07', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (24, 1, 200000.00, '20200120080928', '2020-01-20 08:09:28', '2020-01-20 08:09:28', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (25, 1, 400000.00, '20200120085220', '2020-01-20 08:52:20', '2020-01-20 08:52:20', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (27, 1, 200000.00, '20200120090141', '2020-01-20 09:01:41', '2020-01-20 09:01:41', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (28, 1, 600000.00, '20200120090212', '2020-01-20 09:02:12', '2020-01-20 09:02:12', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (29, 1, 200000.00, '20200211032105', '2020-02-11 03:21:05', '2020-02-11 03:21:05', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (30, 1, 200000.00, '20200219012653', '2020-02-19 01:26:53', '2020-02-19 01:26:53', NULL, NULL, NULL, NULL);
INSERT INTO `orders` VALUES (31, 1, 200000.00, '20200310135206', '2020-03-10 13:52:06', '2020-03-10 13:52:06', 'SUBMIT', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (32, 1, 190.00, '20200405153805', '2020-04-05 15:38:05', '2020-04-05 15:38:05', 'SUBMIT', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (33, 1, 190.00, '20200405155320', '2020-04-05 15:53:20', '2020-04-05 15:53:20', 'SUBMIT', NULL, NULL, NULL);
INSERT INTO `orders` VALUES (35, 1, 190.00, '20200405163833', '2020-04-05 16:38:33', '2020-04-05 16:38:33', NULL, 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (36, 1, 190.00, '20200405164139', '2020-04-05 16:41:39', '2020-04-05 16:41:39', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (37, 1, 190.00, '20200405164306', '2020-04-05 16:43:06', '2020-04-05 16:43:06', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (38, 1, 190.00, '20200405164453', '2020-04-05 16:44:53', '2020-04-05 16:44:53', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (39, 1, 190.00, '20200405164614', '2020-04-05 16:46:14', '2020-04-05 16:46:14', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (40, 1, 190.00, '20200405165037', '2020-04-05 16:50:37', '2020-04-05 16:50:37', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (41, 1, 190.00, '20200405165203', '2020-04-05 16:52:03', '2020-04-05 16:52:03', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (42, 1, 190.00, '20200405165218', '2020-04-05 16:52:18', '2020-04-05 16:52:18', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (43, 1, 190.00, '20200405165526', '2020-04-05 16:55:26', '2020-04-05 16:55:26', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (44, 1, 190.00, '20200405165706', '2020-04-05 16:57:06', '2020-04-05 16:57:06', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (45, 1, 190.00, '20200405170428', '2020-04-05 17:04:28', '2020-04-05 17:04:28', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (46, 1, 190.00, '20200405170500', '2020-04-05 17:05:00', '2020-04-05 17:05:00', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (47, 1, 190.00, '20200405170556', '2020-04-05 17:05:56', '2020-04-05 17:05:56', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (48, 1, 190.00, '20200405170610', '2020-04-05 17:06:10', '2020-04-05 17:06:10', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (49, 1, 190.00, '20200405170629', '2020-04-05 17:06:29', '2020-04-05 17:06:29', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (50, 1, 190.00, '20200405170743', '2020-04-05 17:07:43', '2020-04-05 17:07:43', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (51, 1, 190.00, '20200405171018', '2020-04-05 17:10:18', '2020-04-05 17:10:18', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (52, 1, 440.00, '20200405172439', '2020-04-05 17:24:39', '2020-04-05 17:24:39', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (53, 1, 440.00, '20200405172742', '2020-04-05 17:27:42', '2020-04-05 17:27:42', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (54, 1, 440.00, '20200405172854', '2020-04-05 17:28:54', '2020-04-05 17:28:54', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (55, 1, 440.00, '20200405173554', '2020-04-05 17:35:54', '2020-04-05 17:35:54', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (56, 1, 440.00, '20200405174210', '2020-04-05 17:42:10', '2020-04-05 17:42:10', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (57, 1, 440.00, '20200405174508', '2020-04-05 17:45:08', '2020-04-05 17:45:08', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (58, 1, 440.00, '20200405174604', '2020-04-05 17:46:04', '2020-04-05 17:46:04', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (59, 1, 630.00, '20200405174856', '2020-04-05 17:48:56', '2020-04-05 17:48:56', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (60, 1, 380.00, '20200405175604', '2020-04-05 17:56:04', '2020-04-05 17:56:04', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (61, 1, 570.00, '20200405175705', '2020-04-05 17:57:05', '2020-04-05 17:57:05', 'SUBMIT', 'Nemesio Raitubus', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (62, 1, 250.00, '20200410034001', '2020-04-10 03:40:01', '2020-04-10 03:40:01', 'SUBMIT', 'Nemesio Raitubu', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (63, 1, 250.00, '20200410034350', '2020-04-10 03:43:50', '2020-04-10 03:43:50', 'SUBMIT', 'Nemesio Raitubu', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (64, 1, 250.00, '20200412014305', '2020-04-12 01:43:05', '2020-04-12 01:43:05', 'SUBMIT', 'Nemesio Raitubu', 'nemesioroko15@gmail.com', '51413131');
INSERT INTO `orders` VALUES (65, 1, 190.00, '20200412030854', '2020-05-01 03:08:54', '2020-05-01 03:08:54', 'SUBMIT', 'Nemesio Raitubu', 'nemesioroko15@gmail.com', '51413131');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for prices
-- ----------------------------
DROP TABLE IF EXISTS `prices`;
CREATE TABLE `prices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_id` int(10) NULL DEFAULT NULL,
  `to_id` int(10) NULL DEFAULT NULL,
  `from_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `to_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `departure_time` timestamp(0) NULL DEFAULT NULL,
  `arrival_time` timestamp(0) NULL DEFAULT NULL,
  `price` double(8, 2) NULL DEFAULT NULL,
  `seats` int(11) NULL DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prices
-- ----------------------------

-- ----------------------------
-- Table structure for schedules
-- ----------------------------
DROP TABLE IF EXISTS `schedules`;
CREATE TABLE `schedules`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` int(11) NULL DEFAULT NULL,
  `destination_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedules
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `roles` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'CUSTOMER',
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `province_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `api_token` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_api_token_unique`(`api_token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Nemesio Raitubu', 'nemesioroko15@gmail.com', NULL, '$2y$10$c2X8i3PmP1pVqrXzn5JRguJl7ayNP2twt.CeY8lpsFz.9ybEGHhfu', '1BN06UuFy8csPN6nqgdZXPJGPx3kpbEjhDV0VFDrxiekyHQ6AtpJFy4YblvF', '2019-12-27 02:23:05', '2020-06-15 08:49:58', 'CUSTOMER', 'Melbourne', 30, 2, '51413131', '308f7724007d02037f468484b42600d4.jpg', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (2, 'Administrator', 'admin@gmail.com', NULL, '$2y$10$38VyrmmVvKeYlgytTBM0Ku9uLl7fJp0QEF8jKAXBjPZJyQxm8U3sS', '59F5Cga5KcrFSg0m7IPCGPFtajYYRVTU21jJxmLd654dSKfRTI9VnQ2YutqJ', '2019-12-27 02:23:07', NULL, 'ADMIN', 'Suva\r\n', NULL, NULL, NULL, '168eb8b1a2404ea6f5a5391bda517d56.jpg', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (3, 'Olen Howe', 'rhermann@example.net', NULL, '$2y$10$NpBPH/F5yLkB2JXh4eiR7e/uSzZbOepvU.S0F5fnXNfWxjQZOYljK', NULL, '2019-12-27 02:23:08', NULL, 'CUSTOMER', NULL, NULL, NULL, NULL, '85cb6c09d57b136d99e05a547aa18954.jpg', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (4, 'Miss Maryse Feil IV', 'uking@example.net', NULL, '$2y$10$Pmt9iR6n4HKPWGJiAlzTlOCzNy26Z6xkGA6E6P2lsT5YeGY.CZMaG', NULL, '2019-12-27 02:23:09', NULL, 'CUSTOMER', NULL, NULL, NULL, NULL, '0fd5938c0ce94fc3723ffaa23f0b5073.jpg', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (5, 'Prof. Walter Gaylord', 'bernier.zena@example.net', NULL, '$2y$10$i6D9IWkgCfoS01qetHw9duT9gwFV8Faqa8IHjdyXPQI1R.GNZ/eKK', NULL, '2019-12-27 02:23:10', NULL, 'CUSTOMER', NULL, NULL, NULL, NULL, 'a935d636051d9dcc60ec53b2188014b1.jpg', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (6, 'Roko', 'roko@gmail.com', NULL, '$2y$10$IA/rSt.2Sxd00QnGFeX0ieQBMYLVEkk0C6acfrnvidVRbxW341uIS', NULL, '2020-01-02 01:45:39', '2020-01-02 01:45:39', 'ADMIN', NULL, NULL, NULL, NULL, 'BERDIRI.PNG', 'ACTIVE', NULL);
INSERT INTO `users` VALUES (20, 'Nicola', 'nicola@test.com', NULL, '$2y$10$FNe86fibPUHhDchUCmw6AeSBsqAuCJczrdD2IWYJAKKYYEPoBsvAC', NULL, '2020-06-15 14:08:03', '2020-06-15 14:08:03', 'CUSTOMER', 'Savusavu', NULL, NULL, '51231312', NULL, 'ACTIVE', NULL);

SET FOREIGN_KEY_CHECKS = 1;
