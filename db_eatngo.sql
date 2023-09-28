/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : db_eatngo

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 28/09/2023 12:19:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking`  (
  `bookingId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customerId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bookingDate` datetime(0) NOT NULL,
  `numberOfPerson` int NOT NULL,
  `status` enum('pending','accepted','rejected','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`bookingId`) USING BTREE,
  INDEX `customerId`(`customerId`, `restaurantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking
-- ----------------------------
INSERT INTO `booking` VALUES ('BOK056', 'CS009', 'RST001', '2023-07-18 04:00:00', 5, 'pending');
INSERT INTO `booking` VALUES ('BOK057', 'CS009', 'RST001', '2023-07-19 06:00:00', 2, 'pending');
INSERT INTO `booking` VALUES ('BOK058', 'CS009', 'RST001', '2023-07-12 00:00:00', 5, 'pending');
INSERT INTO `booking` VALUES ('BOK059', 'CS009', 'RST001', '2023-07-12 00:00:00', 5, 'pending');
INSERT INTO `booking` VALUES ('BOK060', 'CS009', 'RST001', '2023-07-12 00:00:00', 5, 'pending');
INSERT INTO `booking` VALUES ('BOK061', 'CS009', 'RST001', '2023-07-12 00:00:00', 5, 'pending');
INSERT INTO `booking` VALUES ('BOK062', 'CS009', 'RST001', '2023-07-19 06:00:00', 5, 'pending');

-- ----------------------------
-- Table structure for booking_seq
-- ----------------------------
DROP TABLE IF EXISTS `booking_seq`;
CREATE TABLE `booking_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of booking_seq
-- ----------------------------
INSERT INTO `booking_seq` VALUES (1);
INSERT INTO `booking_seq` VALUES (2);
INSERT INTO `booking_seq` VALUES (3);
INSERT INTO `booking_seq` VALUES (4);
INSERT INTO `booking_seq` VALUES (5);
INSERT INTO `booking_seq` VALUES (6);
INSERT INTO `booking_seq` VALUES (7);
INSERT INTO `booking_seq` VALUES (8);
INSERT INTO `booking_seq` VALUES (9);
INSERT INTO `booking_seq` VALUES (10);
INSERT INTO `booking_seq` VALUES (11);
INSERT INTO `booking_seq` VALUES (12);
INSERT INTO `booking_seq` VALUES (13);
INSERT INTO `booking_seq` VALUES (14);
INSERT INTO `booking_seq` VALUES (15);
INSERT INTO `booking_seq` VALUES (16);
INSERT INTO `booking_seq` VALUES (17);
INSERT INTO `booking_seq` VALUES (18);
INSERT INTO `booking_seq` VALUES (19);
INSERT INTO `booking_seq` VALUES (20);
INSERT INTO `booking_seq` VALUES (21);
INSERT INTO `booking_seq` VALUES (22);
INSERT INTO `booking_seq` VALUES (23);
INSERT INTO `booking_seq` VALUES (24);
INSERT INTO `booking_seq` VALUES (25);
INSERT INTO `booking_seq` VALUES (26);
INSERT INTO `booking_seq` VALUES (27);
INSERT INTO `booking_seq` VALUES (28);
INSERT INTO `booking_seq` VALUES (29);
INSERT INTO `booking_seq` VALUES (30);
INSERT INTO `booking_seq` VALUES (31);
INSERT INTO `booking_seq` VALUES (32);
INSERT INTO `booking_seq` VALUES (33);
INSERT INTO `booking_seq` VALUES (34);
INSERT INTO `booking_seq` VALUES (35);
INSERT INTO `booking_seq` VALUES (36);
INSERT INTO `booking_seq` VALUES (37);
INSERT INTO `booking_seq` VALUES (38);
INSERT INTO `booking_seq` VALUES (39);
INSERT INTO `booking_seq` VALUES (40);
INSERT INTO `booking_seq` VALUES (41);
INSERT INTO `booking_seq` VALUES (42);
INSERT INTO `booking_seq` VALUES (43);
INSERT INTO `booking_seq` VALUES (44);
INSERT INTO `booking_seq` VALUES (45);
INSERT INTO `booking_seq` VALUES (46);
INSERT INTO `booking_seq` VALUES (47);
INSERT INTO `booking_seq` VALUES (48);
INSERT INTO `booking_seq` VALUES (49);
INSERT INTO `booking_seq` VALUES (50);
INSERT INTO `booking_seq` VALUES (51);
INSERT INTO `booking_seq` VALUES (52);
INSERT INTO `booking_seq` VALUES (53);
INSERT INTO `booking_seq` VALUES (54);
INSERT INTO `booking_seq` VALUES (55);
INSERT INTO `booking_seq` VALUES (56);
INSERT INTO `booking_seq` VALUES (57);
INSERT INTO `booking_seq` VALUES (58);
INSERT INTO `booking_seq` VALUES (59);
INSERT INTO `booking_seq` VALUES (60);
INSERT INTO `booking_seq` VALUES (61);
INSERT INTO `booking_seq` VALUES (62);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `restaurantId` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Food', 'RST001');
INSERT INTO `category` VALUES (2, 'Beverages', 'RST001');
INSERT INTO `category` VALUES (3, 'Food', 'RST002');
INSERT INTO `category` VALUES (4, 'Beverages', 'RST002');
INSERT INTO `category` VALUES (5, 'Food', 'RST003');
INSERT INTO `category` VALUES (6, 'Beverages', 'RST003');
INSERT INTO `category` VALUES (7, 'Food', 'RST004');
INSERT INTO `category` VALUES (8, 'Beverages', 'RST004');
INSERT INTO `category` VALUES (9, 'Food', 'RST005');
INSERT INTO `category` VALUES (10, 'Beverages', 'RST005');

-- ----------------------------
-- Table structure for coordinates
-- ----------------------------
DROP TABLE IF EXISTS `coordinates`;
CREATE TABLE `coordinates`  (
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  INDEX `restaurantId`(`restaurantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coordinates
-- ----------------------------
INSERT INTO `coordinates` VALUES ('RS001', -7.939666, 112.681267);
INSERT INTO `coordinates` VALUES ('RS002', -7.948137, 112.657586);
INSERT INTO `coordinates` VALUES ('RS003', -7.947322, 112.654624);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customerId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `isOrdering` tinyint(1) NOT NULL,
  `isBooking` tinyint(1) NOT NULL,
  PRIMARY KEY (`customerId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('CS009', 'US029', 1, 0);
INSERT INTO `customer` VALUES ('CS010', 'US030', 1, 0);

-- ----------------------------
-- Table structure for customer_seq
-- ----------------------------
DROP TABLE IF EXISTS `customer_seq`;
CREATE TABLE `customer_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_seq
-- ----------------------------
INSERT INTO `customer_seq` VALUES (6);
INSERT INTO `customer_seq` VALUES (7);
INSERT INTO `customer_seq` VALUES (8);
INSERT INTO `customer_seq` VALUES (9);
INSERT INTO `customer_seq` VALUES (10);

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history`  (
  `historyId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cust_rating` double NOT NULL,
  PRIMARY KEY (`historyId`) USING BTREE,
  INDEX `transactionId`(`transactionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('H001', 'TRS061', 5);
INSERT INTO `history` VALUES ('HSR001', 'TRS072', 3);

-- ----------------------------
-- Table structure for history_seq
-- ----------------------------
DROP TABLE IF EXISTS `history_seq`;
CREATE TABLE `history_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_seq
-- ----------------------------
INSERT INTO `history_seq` VALUES (1);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `itemId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemCategoryId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemDescription` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cost` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`itemId`) USING BTREE,
  INDEX `restaurantId`(`restaurantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('ITM001', '1', 'RST001', 'Mie Goreng Jawa Timur', 'Mie goreng dimasak dengan bumbu Jawa dilengkapi suwiran ayam, telur dadar, taburan seledri, dan bram', 'Harmoni Cafe & Resto_MieGorengJawa.jpg', 40300, 5);
INSERT INTO `menu` VALUES ('ITM002', '1', 'RST001', 'Mie Godhog', 'Mie kuah dimasak dengan bumbu Jawa diberi suwiran ayam dan taburan seledri', 'Harmoni Cafe & Resto_MieGodhog.jpg', 40300, 13);
INSERT INTO `menu` VALUES ('ITM003', '2', 'RST001', 'Es Soda Gembira', 'Sirup rosen dipadu susu dan soda', 'Harmoni Cafe & Resto_EsSodaGembira.jpg', 24600, 16);
INSERT INTO `menu` VALUES ('ITM004', '2', 'RST001', 'Es Teh Manis', 'Es Teh Manis', 'Harmoni Cafe & Resto_EsTehManis.jpg', 9000, 19);
INSERT INTO `menu` VALUES ('ITM005', '2', 'RST001', 'Es Jeruk Nipis', 'Es Jeruk Nipis', 'Harmoni Cafe & Resto_EsJerukNipis.jpg', 17900, 12);
INSERT INTO `menu` VALUES ('ITM006', '1', 'RST001', 'Cap Cay Goreng', 'Cap cay goreng dengan isian daging ayam, bakso ikan, bakso sapi, udang, kekian, sayur brungkul, wort', 'Harmoni Cafe & Resto_CapCayGoreng.jpg', 50400, 0);
INSERT INTO `menu` VALUES ('ITM007', '1', 'RST001', 'Sapo Tahu Jepang', 'Hidangan daging ayam, seafood, tahu, sayur wortel, jamur moku, jamur kuping dimasak dengan saus tira', 'Harmoni Cafe & Resto_SapoTahuJepang.jpg', 65000, 20);
INSERT INTO `menu` VALUES ('ITM008', '1', 'RST001', 'Asem-asem Iga', 'Daging iga yang empuk dengan kuah asam yang segar', 'Harmoni Cafe & Resto_Asem-AsemIga.jpg', 63800, 0);
INSERT INTO `menu` VALUES ('ITM009', '1', 'RST001', 'Nasi Goreng Merah', 'Nasi goreng ayam, udang, dan telur dengan saus tomat', 'Harmoni Cafe & Resto_NasiGorengMerah.jpg', 42600, 20);
INSERT INTO `menu` VALUES ('ITM010', '1', 'RST001', 'Sate ayam bumbu kacang', 'Daging ayam tanpa lemak kulit disajikan dengan saus kacang plus potongan brambang segar', 'Harmoni Cafe & Resto_SateAyamBumbuKacang.jpg', 39200, 20);
INSERT INTO `menu` VALUES ('ITM011', '1', 'RST001', 'Iga Bakar Spesial', 'Daging iga dibakar dengan bumbu khas Harmoni disajikan dengan lalapan segar, sambal bajak kuah asam ', 'Harmoni Cafe & Resto_IgaBakarSpesial.jpg', 63800, 8);
INSERT INTO `menu` VALUES ('ITM012', '4', 'RST002', 'Es Jeruk Nipis', 'Es jeruk nipis', 'Hot Cui Mie_EsJerukNipis.jpg', 15700, 20);
INSERT INTO `menu` VALUES ('ITM013', '4', 'RST002', 'Es Jeruk Manis', 'Es Jeruk Manis', 'Hot Cui Mie_EsJerukManis.jpg', 19000, 20);
INSERT INTO `menu` VALUES ('ITM014', '3', 'RST002', 'Cap Cay Goreng', 'Cap cay goreng dengan isian sayur brungkul, wortel, sawi, babycorn, kubis, serta daging ayam, bakso ', 'Hot Cui Mie_CapCayGoreng.jpg', 44800, 14);
INSERT INTO `menu` VALUES ('ITM015', '3', 'RST002', 'Siomay Ayam', 'Siomay ayam mini yang direbus, isi 3 biji, dan disajikan dengan sambal sukiaw', 'Hot Cui Mie_SiomayAyam.jpg', 20200, 20);
INSERT INTO `menu` VALUES ('ITM016', '3', 'RST002', 'Bakmi Goreng Ayam', 'Bakmi goreng ayam dengan campuran bakso, udang, ayam, telur, dan sawi', 'Hot Cui Mie_BakmieGorengAyam.jpg', 42600, 14);
INSERT INTO `menu` VALUES ('ITM017', '3', 'RST002', 'Hot Cui Mie Jamur', 'Cui mie dengan paduan jamur digoreng crispy dan disiram saus pedas ala HOTCUIMIE (untuk bungkus saus', 'Hot Cui Mie_HotCuiMieJamur.jpg', 32500, 20);
INSERT INTO `menu` VALUES ('ITM018', '3', 'RST002', 'Nasi Goreng Lombok Ijo', 'Nasi goreng dengan isian telur, udang, bakso, dan bumbu lombok ijo (rasa pedas)', 'Hot Cui Mie_NasiGorengLombokIjo.jpg', 42600, 20);
INSERT INTO `menu` VALUES ('ITM019', '3', 'RST002', 'Kulit Ayam Crispy', 'Kulit ayam goreng crispy porsi besar tersaji dengan saus asam manis yang lezat', 'Hot Cui Mie_KulitAyamCrispy.jpg', 37000, 20);
INSERT INTO `menu` VALUES ('ITM020', '3', 'RST002', 'Hot Cui Mie Ayam', 'Cui mie dengan paduan ayam digoreng crispy dan disiram saus pedas ala HOTCUIMIE (untuk bungkus saus ', 'Hot Cui Mie_HotCuiMieAyam.jpg', 32500, 14);
INSERT INTO `menu` VALUES ('ITM021', '5', 'RST003', 'Teriyaki Abura Udon', 'Mie udon tanpa kuah yang disajikan dengan saus abura dan potongan ayam dengan bumbu teriyaki', 'Marugame Udon_Teriyaki Abura Udon.jpg', 67000, 25);
INSERT INTO `menu` VALUES ('ITM022', '5', 'RST003', 'Kake Udon', 'Mie udon hangat disajikan dengan sup kake dashi yang juga hangat', 'Marugame Udon_Kake Udon.jpg', 49000, 25);
INSERT INTO `menu` VALUES ('ITM023', '5', 'RST003', 'Niku Udon', 'Mie udon disajikan dengan sup kake dashi dan daging sapi sukiyaki impor yang manis juga gurih', 'Marugame Udon_Niku Udon.jpg', 72000, 25);
INSERT INTO `menu` VALUES ('ITM024', '5', 'RST003', 'Beef Curry Udon', 'Mie udon dengan kuah kari gurih disajikan dengan daging sapi sukiyaki', 'Marugame Udon_Beef Curry Udon.jpg', 72000, 25);
INSERT INTO `menu` VALUES ('ITM025', '5', 'RST003', 'Chicken Katsu Curry Udon', 'Mie udon yang disajikan dengan kuah kari dan katsu ayam spesial', 'Marugame Udon_Chicken Katsu Curry Udon.jpg', 68000, 25);
INSERT INTO `menu` VALUES ('ITM026', '5', 'RST003', 'Spicy Tori Baitan Udon', 'Mie udon dengan sup ayam bertabur daging ayam spicy dan jamur, pedas pas rasa gurih ayam', 'Marugame Udon_Spicy Tori Baitan Udon.jpg', 67000, 25);
INSERT INTO `menu` VALUES ('ITM027', '5', 'RST003', 'Niku Zaru Udon', 'Udon dengan sup bukkake dashi (panas/dingin) dan topping daging sapi sukiyaki serta ikan cakalang se', 'Marugame Udon_Niku Zaru Udon.jpg', 68000, 25);
INSERT INTO `menu` VALUES ('ITM028', '6', 'RST003', 'Coca Cola', 'Coca Cola', 'Marugame Udon_Coca Cola.jpg', 17000, 25);
INSERT INTO `menu` VALUES ('ITM029', '6', 'RST003', 'Fanta', 'Fanta', 'Marugame Udon_Fanta.jpg', 17000, 25);
INSERT INTO `menu` VALUES ('ITM030', '6', 'RST003', 'Aqua 330ml', 'Aqua sebanyak 330ml', 'Marugame Udon_Aqua 330ml.jpg', 14000, 25);
INSERT INTO `menu` VALUES ('ITM031', '8', 'RST004', 'Orange Juice', 'Jus Jeruk', 'Solaria_Orange Juice.jpg', 23000, 25);
INSERT INTO `menu` VALUES ('ITM032', '8', 'RST004', 'Thai Tea', 'Thai Tea', 'Solaria_Thai Tea.jpg', 21000, 25);
INSERT INTO `menu` VALUES ('ITM033', '8', 'RST004', 'Teh Tarik', 'Teh Tarik', 'Solaria_Teh Tarik.jpg', 21000, 25);
INSERT INTO `menu` VALUES ('ITM034', '7', 'RST004', 'Kwetiau Goreng Ayam', 'Kwetiau Goreng Ayam', 'Solaria_Kwetiau Goreng Ayam.jpg', 44000, 25);
INSERT INTO `menu` VALUES ('ITM035', '7', 'RST004', 'Mie Goreng Ayam', 'Mie Goreng Ayam', 'Solaria_Mie Goreng Ayam.jpg', 42000, 25);
INSERT INTO `menu` VALUES ('ITM036', '7', 'RST004', 'Mie Ayam', 'Mie Ayam', 'Solaria_Mie Ayam.jpg', 28000, 25);
INSERT INTO `menu` VALUES ('ITM037', '7', 'RST004', 'Nasi + Sapo Tahu Seafood', 'Nasi dengan sapo tahu dan seafood', 'Solaria_Nasi + Sapo Tahu Seafood.jpg', 47000, 25);
INSERT INTO `menu` VALUES ('ITM038', '7', 'RST004', 'Bowl Mix Mayo', 'Nasi dengan campuran udang, ayam, ikan, dan mayonaise', 'Solaria_Bowl Mix Mayo.jpg', 31000, 25);
INSERT INTO `menu` VALUES ('ITM039', '7', 'RST004', 'Bowl Ikan Asam Manis', 'Nasi dengan ikan asam manis', 'Solaria_Bowl Ikan Asam Manis.jpg', 28000, 25);
INSERT INTO `menu` VALUES ('ITM040', '7', 'RST004', 'Bowl Ayam Rica', 'Nasi dengan campuran udang, ayam, ikan, dan bumbu rica', 'Solaria_Bowl Ayam Rica.jpg', 31000, 25);
INSERT INTO `menu` VALUES ('ITM041', '7', 'RST004', 'Bowl Ayam Mentega', 'Nasi dengan ayam goreng tepung disajikan dengan saus mentega', 'Solaria_Bowl Ayam Mentega.jpg', 24000, 25);
INSERT INTO `menu` VALUES ('ITM042', '10', 'RST005', 'Cold Ocha', 'Teh dingin khas Jepang sebanyak 250mL', 'Sushi Tei_ColdOcha.jpg', 7700, 25);
INSERT INTO `menu` VALUES ('ITM043', '10', 'RST005', 'Iced Passion Fruit Tea', 'Teh buah markisa dingin sebanyak 250mL', 'Sushi Tei_IcedPassionFruitTea.jpg', 27500, 25);
INSERT INTO `menu` VALUES ('ITM044', '10', 'RST005', 'Iced Peach Tea', 'Teh buah persik dingin sebanyak 250mL', 'Sushi Tei_IcedPeachTea.jpg', 27500, 25);
INSERT INTO `menu` VALUES ('ITM045', '9', 'RST005', 'Bakudan Sushi', 'Sushi dengan kombinasi berbagai macam toping', 'Sushi Tei_BakudanSushi.jpg', 70000, 25);
INSERT INTO `menu` VALUES ('ITM046', '9', 'RST005', 'Tuna Salad Crispy Mentai', 'Sushi salad tuna gulung dengan saus mayonaise cod roe', 'Sushi Tei_TunaSaladCrispyMentai.jpg', 112200, 25);
INSERT INTO `menu` VALUES ('ITM047', '9', 'RST005', 'Fried Enoki Tempura', 'Jamur enoki digoreng ala tempura', 'Sushi Tei_FriedEnokiTempura.jpg', 22000, 25);
INSERT INTO `menu` VALUES ('ITM048', '9', 'RST005', 'Salmon cheese tempura roll', 'Salmon gulung goreng dengan toping lelehan keju mozarella', 'Sushi Tei_SalmonCheeseTempuraRoll.jpg', 90200, 25);
INSERT INTO `menu` VALUES ('ITM049', '9', 'RST005', 'Salmon Yasai Don', 'Salmon teriyaki dan campuran sayuran dengan nasi', 'Sushi Tei_SalmonYasaiDon.jpg', 60500, 25);
INSERT INTO `menu` VALUES ('ITM050', '9', 'RST005', 'Salmon Chazuke', 'Satu set mangkuk salmon panggang dengan kaldu ikan', 'Sushi Tei_SalmonChazuke.jpg', 52800, 25);

-- ----------------------------
-- Table structure for menu_seq
-- ----------------------------
DROP TABLE IF EXISTS `menu_seq`;
CREATE TABLE `menu_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_seq
-- ----------------------------
INSERT INTO `menu_seq` VALUES (1);
INSERT INTO `menu_seq` VALUES (2);
INSERT INTO `menu_seq` VALUES (3);
INSERT INTO `menu_seq` VALUES (4);
INSERT INTO `menu_seq` VALUES (5);
INSERT INTO `menu_seq` VALUES (6);
INSERT INTO `menu_seq` VALUES (7);
INSERT INTO `menu_seq` VALUES (8);
INSERT INTO `menu_seq` VALUES (9);
INSERT INTO `menu_seq` VALUES (10);
INSERT INTO `menu_seq` VALUES (11);
INSERT INTO `menu_seq` VALUES (12);
INSERT INTO `menu_seq` VALUES (13);
INSERT INTO `menu_seq` VALUES (14);
INSERT INTO `menu_seq` VALUES (15);
INSERT INTO `menu_seq` VALUES (16);
INSERT INTO `menu_seq` VALUES (17);
INSERT INTO `menu_seq` VALUES (18);
INSERT INTO `menu_seq` VALUES (19);
INSERT INTO `menu_seq` VALUES (20);
INSERT INTO `menu_seq` VALUES (21);
INSERT INTO `menu_seq` VALUES (22);
INSERT INTO `menu_seq` VALUES (23);
INSERT INTO `menu_seq` VALUES (24);
INSERT INTO `menu_seq` VALUES (25);
INSERT INTO `menu_seq` VALUES (26);
INSERT INTO `menu_seq` VALUES (27);
INSERT INTO `menu_seq` VALUES (28);
INSERT INTO `menu_seq` VALUES (29);
INSERT INTO `menu_seq` VALUES (30);
INSERT INTO `menu_seq` VALUES (31);
INSERT INTO `menu_seq` VALUES (32);
INSERT INTO `menu_seq` VALUES (33);
INSERT INTO `menu_seq` VALUES (34);
INSERT INTO `menu_seq` VALUES (35);
INSERT INTO `menu_seq` VALUES (36);
INSERT INTO `menu_seq` VALUES (37);
INSERT INTO `menu_seq` VALUES (38);
INSERT INTO `menu_seq` VALUES (39);
INSERT INTO `menu_seq` VALUES (40);
INSERT INTO `menu_seq` VALUES (41);
INSERT INTO `menu_seq` VALUES (42);
INSERT INTO `menu_seq` VALUES (43);
INSERT INTO `menu_seq` VALUES (44);
INSERT INTO `menu_seq` VALUES (45);
INSERT INTO `menu_seq` VALUES (46);
INSERT INTO `menu_seq` VALUES (47);
INSERT INTO `menu_seq` VALUES (48);
INSERT INTO `menu_seq` VALUES (49);
INSERT INTO `menu_seq` VALUES (50);

-- ----------------------------
-- Table structure for order_seq
-- ----------------------------
DROP TABLE IF EXISTS `order_seq`;
CREATE TABLE `order_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_seq
-- ----------------------------
INSERT INTO `order_seq` VALUES (1);
INSERT INTO `order_seq` VALUES (2);
INSERT INTO `order_seq` VALUES (3);
INSERT INTO `order_seq` VALUES (4);
INSERT INTO `order_seq` VALUES (5);
INSERT INTO `order_seq` VALUES (6);
INSERT INTO `order_seq` VALUES (7);
INSERT INTO `order_seq` VALUES (8);
INSERT INTO `order_seq` VALUES (9);
INSERT INTO `order_seq` VALUES (10);
INSERT INTO `order_seq` VALUES (11);
INSERT INTO `order_seq` VALUES (12);
INSERT INTO `order_seq` VALUES (13);
INSERT INTO `order_seq` VALUES (14);
INSERT INTO `order_seq` VALUES (15);
INSERT INTO `order_seq` VALUES (16);
INSERT INTO `order_seq` VALUES (17);
INSERT INTO `order_seq` VALUES (18);
INSERT INTO `order_seq` VALUES (19);
INSERT INTO `order_seq` VALUES (20);
INSERT INTO `order_seq` VALUES (21);
INSERT INTO `order_seq` VALUES (22);
INSERT INTO `order_seq` VALUES (23);
INSERT INTO `order_seq` VALUES (24);
INSERT INTO `order_seq` VALUES (25);
INSERT INTO `order_seq` VALUES (26);
INSERT INTO `order_seq` VALUES (27);
INSERT INTO `order_seq` VALUES (28);
INSERT INTO `order_seq` VALUES (29);
INSERT INTO `order_seq` VALUES (30);
INSERT INTO `order_seq` VALUES (31);
INSERT INTO `order_seq` VALUES (32);
INSERT INTO `order_seq` VALUES (33);
INSERT INTO `order_seq` VALUES (34);
INSERT INTO `order_seq` VALUES (35);
INSERT INTO `order_seq` VALUES (36);
INSERT INTO `order_seq` VALUES (37);
INSERT INTO `order_seq` VALUES (38);
INSERT INTO `order_seq` VALUES (39);
INSERT INTO `order_seq` VALUES (40);
INSERT INTO `order_seq` VALUES (41);
INSERT INTO `order_seq` VALUES (42);
INSERT INTO `order_seq` VALUES (43);
INSERT INTO `order_seq` VALUES (44);
INSERT INTO `order_seq` VALUES (45);
INSERT INTO `order_seq` VALUES (46);
INSERT INTO `order_seq` VALUES (47);
INSERT INTO `order_seq` VALUES (48);
INSERT INTO `order_seq` VALUES (49);
INSERT INTO `order_seq` VALUES (50);
INSERT INTO `order_seq` VALUES (51);
INSERT INTO `order_seq` VALUES (52);
INSERT INTO `order_seq` VALUES (53);
INSERT INTO `order_seq` VALUES (54);
INSERT INTO `order_seq` VALUES (55);
INSERT INTO `order_seq` VALUES (56);
INSERT INTO `order_seq` VALUES (57);
INSERT INTO `order_seq` VALUES (58);
INSERT INTO `order_seq` VALUES (59);
INSERT INTO `order_seq` VALUES (60);
INSERT INTO `order_seq` VALUES (61);
INSERT INTO `order_seq` VALUES (62);
INSERT INTO `order_seq` VALUES (63);
INSERT INTO `order_seq` VALUES (64);
INSERT INTO `order_seq` VALUES (65);
INSERT INTO `order_seq` VALUES (66);
INSERT INTO `order_seq` VALUES (67);
INSERT INTO `order_seq` VALUES (68);
INSERT INTO `order_seq` VALUES (69);
INSERT INTO `order_seq` VALUES (70);
INSERT INTO `order_seq` VALUES (71);
INSERT INTO `order_seq` VALUES (72);
INSERT INTO `order_seq` VALUES (73);
INSERT INTO `order_seq` VALUES (74);
INSERT INTO `order_seq` VALUES (75);
INSERT INTO `order_seq` VALUES (76);
INSERT INTO `order_seq` VALUES (77);
INSERT INTO `order_seq` VALUES (78);
INSERT INTO `order_seq` VALUES (79);
INSERT INTO `order_seq` VALUES (80);
INSERT INTO `order_seq` VALUES (81);
INSERT INTO `order_seq` VALUES (82);
INSERT INTO `order_seq` VALUES (83);
INSERT INTO `order_seq` VALUES (84);
INSERT INTO `order_seq` VALUES (85);
INSERT INTO `order_seq` VALUES (86);
INSERT INTO `order_seq` VALUES (87);
INSERT INTO `order_seq` VALUES (88);
INSERT INTO `order_seq` VALUES (89);
INSERT INTO `order_seq` VALUES (90);
INSERT INTO `order_seq` VALUES (91);
INSERT INTO `order_seq` VALUES (92);
INSERT INTO `order_seq` VALUES (93);
INSERT INTO `order_seq` VALUES (94);
INSERT INTO `order_seq` VALUES (95);
INSERT INTO `order_seq` VALUES (96);
INSERT INTO `order_seq` VALUES (97);
INSERT INTO `order_seq` VALUES (98);
INSERT INTO `order_seq` VALUES (99);
INSERT INTO `order_seq` VALUES (100);
INSERT INTO `order_seq` VALUES (101);
INSERT INTO `order_seq` VALUES (102);
INSERT INTO `order_seq` VALUES (103);
INSERT INTO `order_seq` VALUES (104);
INSERT INTO `order_seq` VALUES (105);
INSERT INTO `order_seq` VALUES (106);
INSERT INTO `order_seq` VALUES (107);
INSERT INTO `order_seq` VALUES (108);
INSERT INTO `order_seq` VALUES (109);
INSERT INTO `order_seq` VALUES (110);
INSERT INTO `order_seq` VALUES (111);
INSERT INTO `order_seq` VALUES (112);
INSERT INTO `order_seq` VALUES (113);
INSERT INTO `order_seq` VALUES (114);
INSERT INTO `order_seq` VALUES (115);
INSERT INTO `order_seq` VALUES (116);
INSERT INTO `order_seq` VALUES (117);
INSERT INTO `order_seq` VALUES (118);
INSERT INTO `order_seq` VALUES (119);
INSERT INTO `order_seq` VALUES (120);
INSERT INTO `order_seq` VALUES (121);
INSERT INTO `order_seq` VALUES (122);
INSERT INTO `order_seq` VALUES (123);
INSERT INTO `order_seq` VALUES (124);
INSERT INTO `order_seq` VALUES (125);
INSERT INTO `order_seq` VALUES (126);
INSERT INTO `order_seq` VALUES (127);
INSERT INTO `order_seq` VALUES (128);
INSERT INTO `order_seq` VALUES (129);
INSERT INTO `order_seq` VALUES (130);
INSERT INTO `order_seq` VALUES (131);
INSERT INTO `order_seq` VALUES (132);
INSERT INTO `order_seq` VALUES (133);
INSERT INTO `order_seq` VALUES (134);
INSERT INTO `order_seq` VALUES (135);
INSERT INTO `order_seq` VALUES (136);
INSERT INTO `order_seq` VALUES (137);
INSERT INTO `order_seq` VALUES (138);
INSERT INTO `order_seq` VALUES (139);
INSERT INTO `order_seq` VALUES (140);
INSERT INTO `order_seq` VALUES (141);
INSERT INTO `order_seq` VALUES (142);
INSERT INTO `order_seq` VALUES (143);
INSERT INTO `order_seq` VALUES (144);
INSERT INTO `order_seq` VALUES (145);
INSERT INTO `order_seq` VALUES (146);
INSERT INTO `order_seq` VALUES (147);
INSERT INTO `order_seq` VALUES (148);
INSERT INTO `order_seq` VALUES (149);
INSERT INTO `order_seq` VALUES (150);
INSERT INTO `order_seq` VALUES (151);
INSERT INTO `order_seq` VALUES (152);
INSERT INTO `order_seq` VALUES (153);
INSERT INTO `order_seq` VALUES (154);
INSERT INTO `order_seq` VALUES (155);
INSERT INTO `order_seq` VALUES (156);
INSERT INTO `order_seq` VALUES (157);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `orderId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `transactionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemQuantity` int NOT NULL,
  `note` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `transactionId`(`transactionId`, `itemId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('ORD146', 'TRS073', 'ITM002', 1, '');
INSERT INTO `orders` VALUES ('ORD147', 'TRS073', 'ITM003', 1, '');
INSERT INTO `orders` VALUES ('ORD148', 'TRS073', 'ITM005', 1, '');
INSERT INTO `orders` VALUES ('ORD149', 'TRS073', 'ITM011', 3, '');
INSERT INTO `orders` VALUES ('ORD150', 'TRS075', 'ITM002', 1, '');
INSERT INTO `orders` VALUES ('ORD151', 'TRS075', 'ITM011', 3, '');
INSERT INTO `orders` VALUES ('ORD155', 'TRS077', 'ITM014', 5, 'tes');
INSERT INTO `orders` VALUES ('ORD156', 'TRS077', 'ITM016', 5, '');
INSERT INTO `orders` VALUES ('ORD157', 'TRS077', 'ITM020', 5, '');

-- ----------------------------
-- Table structure for promo
-- ----------------------------
DROP TABLE IF EXISTS `promo`;
CREATE TABLE `promo`  (
  `promoId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `promoName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `promoDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `promoImg` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `promoDateStart` date NOT NULL,
  `promoDateEnd` date NOT NULL,
  PRIMARY KEY (`promoId`) USING BTREE,
  INDEX `restaurantId`(`restaurantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promo
-- ----------------------------
INSERT INTO `promo` VALUES ('PR001', 'RST001', '20% Off', 'Pembelian Min 200rb', 'https://cdn-apac.onetrust.com/logos/5dff103c-2a09-4851-a961-b111ef81c289/9dc3dcac-20e2-4454-a403-d22', '2023-05-22', '2023-05-23');
INSERT INTO `promo` VALUES ('PR002', 'RST002', '60% Off', 'Pembelian Min 200rb', 'https://cdn-apac.onetrust.com/logos/5dff103c-2a09-4851-a961-b111ef81c289/9dc3dcac-20e2-4454-a403-d22', '2023-05-10', '2023-05-23');
INSERT INTO `promo` VALUES ('PR003', 'RST003', '20% Off', 'Pembelian Min 200rb', 'https://cdn-apac.onetrust.com/logos/5dff103c-2a09-4851-a961-b111ef81c289/9dc3dcac-20e2-4454-a403-d22', '2023-05-11', '2023-05-23');
INSERT INTO `promo` VALUES ('PR004', 'RST004', '25% Off', 'Pembelian Min 200rb', 'https://cdn-apac.onetrust.com/logos/5dff103c-2a09-4851-a961-b111ef81c289/9dc3dcac-20e2-4454-a403-d22', '2023-05-12', '2023-05-23');
INSERT INTO `promo` VALUES ('PR005', 'RST005', '30% Off', 'Pembelian Min 200rb', 'https://cdn-apac.onetrust.com/logos/5dff103c-2a09-4851-a961-b111ef81c289/9dc3dcac-20e2-4454-a403-d22', '2023-05-13', '2023-05-23');

-- ----------------------------
-- Table structure for promo_seq
-- ----------------------------
DROP TABLE IF EXISTS `promo_seq`;
CREATE TABLE `promo_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promo_seq
-- ----------------------------
INSERT INTO `promo_seq` VALUES (1);

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant`  (
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `isOpen` tinyint(1) NOT NULL,
  `isTableAvailable` tinyint(1) NOT NULL,
  `currentQueue` int NOT NULL,
  `rating` double NOT NULL,
  `coordinates` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`restaurantId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `userId_2`(`userId`) USING BTREE,
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO `restaurant` VALUES ('RST001', 'US023', 'Restoran terbuka yang tenang menyajikan hidangan daerah seperti hidangan mie & nasi, plus jus & mi', 1, 1, 1, 5, '0,0');
INSERT INTO `restaurant` VALUES ('RST002', 'US024', 'Resto minimalis di tempat kontemporer bernuansa cerah yang menyajikan mi dengan berbagai topping.', 1, 1, 2, 5, '0,0');
INSERT INTO `restaurant` VALUES ('RST003', 'US025', 'Marugame Udon adalah Udon & Tempura terbaik dari Jepang.', 1, 1, 3, 5, '0,0');
INSERT INTO `restaurant` VALUES ('RST004', 'US026', 'Solaria adalah restoran keluarga yang menawarkan berbagai macam makanan dan minuman', 1, 1, 4, 5, '0,0');
INSERT INTO `restaurant` VALUES ('RST005', 'US027', 'Sushi Tei adalah sebuah jaringan restoran hidangan Jepang asal Indonesia yang menyajikan hidangan sushi', 1, 1, 5, 5, '0,0');

-- ----------------------------
-- Table structure for restaurant_seq
-- ----------------------------
DROP TABLE IF EXISTS `restaurant_seq`;
CREATE TABLE `restaurant_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restaurant_seq
-- ----------------------------
INSERT INTO `restaurant_seq` VALUES (1);
INSERT INTO `restaurant_seq` VALUES (2);
INSERT INTO `restaurant_seq` VALUES (3);
INSERT INTO `restaurant_seq` VALUES (4);
INSERT INTO `restaurant_seq` VALUES (5);

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `transactionId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queueNumber` int NOT NULL,
  `customerId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `restaurantId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_date` datetime(0) NOT NULL,
  `order_type` enum('dine in','takeaway','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total_cost` int NOT NULL,
  `status` enum('pending','accepted','finished','canceled','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`transactionId`) USING BTREE,
  INDEX `customerId`(`customerId`, `restaurantId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES ('TRS073', 4, 'CS010', 'RST001', '2023-07-04 16:10:20', 'dine in', 274200, 'pending');
INSERT INTO `transaction` VALUES ('TRS075', 5, 'CS009', 'RST001', '2023-07-10 20:17:06', 'dine in', 231700, 'pending');
INSERT INTO `transaction` VALUES ('TRS077', 1, 'CS009', 'RST002', '2023-07-10 20:49:56', 'dine in', 599500, 'pending');

-- ----------------------------
-- Table structure for transaction_seq
-- ----------------------------
DROP TABLE IF EXISTS `transaction_seq`;
CREATE TABLE `transaction_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaction_seq
-- ----------------------------
INSERT INTO `transaction_seq` VALUES (1);
INSERT INTO `transaction_seq` VALUES (2);
INSERT INTO `transaction_seq` VALUES (3);
INSERT INTO `transaction_seq` VALUES (4);
INSERT INTO `transaction_seq` VALUES (5);
INSERT INTO `transaction_seq` VALUES (6);
INSERT INTO `transaction_seq` VALUES (7);
INSERT INTO `transaction_seq` VALUES (8);
INSERT INTO `transaction_seq` VALUES (9);
INSERT INTO `transaction_seq` VALUES (10);
INSERT INTO `transaction_seq` VALUES (11);
INSERT INTO `transaction_seq` VALUES (12);
INSERT INTO `transaction_seq` VALUES (13);
INSERT INTO `transaction_seq` VALUES (14);
INSERT INTO `transaction_seq` VALUES (15);
INSERT INTO `transaction_seq` VALUES (16);
INSERT INTO `transaction_seq` VALUES (17);
INSERT INTO `transaction_seq` VALUES (18);
INSERT INTO `transaction_seq` VALUES (19);
INSERT INTO `transaction_seq` VALUES (20);
INSERT INTO `transaction_seq` VALUES (21);
INSERT INTO `transaction_seq` VALUES (22);
INSERT INTO `transaction_seq` VALUES (23);
INSERT INTO `transaction_seq` VALUES (24);
INSERT INTO `transaction_seq` VALUES (25);
INSERT INTO `transaction_seq` VALUES (26);
INSERT INTO `transaction_seq` VALUES (27);
INSERT INTO `transaction_seq` VALUES (28);
INSERT INTO `transaction_seq` VALUES (29);
INSERT INTO `transaction_seq` VALUES (30);
INSERT INTO `transaction_seq` VALUES (31);
INSERT INTO `transaction_seq` VALUES (32);
INSERT INTO `transaction_seq` VALUES (33);
INSERT INTO `transaction_seq` VALUES (34);
INSERT INTO `transaction_seq` VALUES (35);
INSERT INTO `transaction_seq` VALUES (36);
INSERT INTO `transaction_seq` VALUES (37);
INSERT INTO `transaction_seq` VALUES (38);
INSERT INTO `transaction_seq` VALUES (39);
INSERT INTO `transaction_seq` VALUES (40);
INSERT INTO `transaction_seq` VALUES (41);
INSERT INTO `transaction_seq` VALUES (42);
INSERT INTO `transaction_seq` VALUES (43);
INSERT INTO `transaction_seq` VALUES (44);
INSERT INTO `transaction_seq` VALUES (45);
INSERT INTO `transaction_seq` VALUES (46);
INSERT INTO `transaction_seq` VALUES (47);
INSERT INTO `transaction_seq` VALUES (48);
INSERT INTO `transaction_seq` VALUES (49);
INSERT INTO `transaction_seq` VALUES (50);
INSERT INTO `transaction_seq` VALUES (51);
INSERT INTO `transaction_seq` VALUES (52);
INSERT INTO `transaction_seq` VALUES (53);
INSERT INTO `transaction_seq` VALUES (54);
INSERT INTO `transaction_seq` VALUES (55);
INSERT INTO `transaction_seq` VALUES (56);
INSERT INTO `transaction_seq` VALUES (57);
INSERT INTO `transaction_seq` VALUES (58);
INSERT INTO `transaction_seq` VALUES (59);
INSERT INTO `transaction_seq` VALUES (60);
INSERT INTO `transaction_seq` VALUES (61);
INSERT INTO `transaction_seq` VALUES (62);
INSERT INTO `transaction_seq` VALUES (63);
INSERT INTO `transaction_seq` VALUES (64);
INSERT INTO `transaction_seq` VALUES (65);
INSERT INTO `transaction_seq` VALUES (66);
INSERT INTO `transaction_seq` VALUES (67);
INSERT INTO `transaction_seq` VALUES (68);
INSERT INTO `transaction_seq` VALUES (69);
INSERT INTO `transaction_seq` VALUES (70);
INSERT INTO `transaction_seq` VALUES (71);
INSERT INTO `transaction_seq` VALUES (72);
INSERT INTO `transaction_seq` VALUES (73);
INSERT INTO `transaction_seq` VALUES (74);
INSERT INTO `transaction_seq` VALUES (75);
INSERT INTO `transaction_seq` VALUES (76);
INSERT INTO `transaction_seq` VALUES (77);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contact_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `account_status` enum('verified','unverified','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('restaurant','customer','','') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('US023', 'Harmoni Cafe & Resto', 'harmonicaferesto@gmail.com', '087859925122', '123', 'Jl. Bromo No.44, Oro-oro Dowo, Kec. Klojen, Kota Malang, Jawa Timur 65119', 'Harmoni Cafe & Resto_avatar.jpg', 'verified', 'restaurant');
INSERT INTO `user` VALUES ('US024', 'Hot Cui Mie', 'hotcuimie@gmail.com', '081236600876', '121212', 'Ruko Parman, Jl. Letjend S. Parman No.56, Purwantoro, Kec. Blimbing, Kota Malang, Jawa Timur 65125', 'Hot Cui Mie_avatar.jpg', 'verified', 'restaurant');
INSERT INTO `user` VALUES ('US025', 'Marugame Udon', 'marugameudon@gmail.com', '081233300888', '123412', 'Jl. Semeru No.49, Kauman, Kec. Klojen, Kota Malang, Jawa Timur 65115', 'Marugame Udon_avatar.jpg', 'verified', 'restaurant');
INSERT INTO `user` VALUES ('US026', 'Solaria', 'solaria@gmail.com', '081236611921', '123456', 'Solaria, Mall Olympic Garden, Jl. Kawi No.24, Kauman, Kec. Klojen, Kota Malang, Jawa Timur 65119', 'Solaria_avatar.jpg', 'verified', 'restaurant');
INSERT INTO `user` VALUES ('US027', 'Sushi Tei', 'sushitei@gmail.com', '083331600776', '141414', 'Jl. Kawi No.29 65116, Kauman, Kec. Klojen, Kota Malang, Jawa Timur 65116', 'Sushi Tei_avatar.jpg', 'verified', 'restaurant');
INSERT INTO `user` VALUES ('US029', 'Rizky', 'tes', '0811', 'tes', 'Malang', 'default-ava.jpg', 'verified', 'customer');
INSERT INTO `user` VALUES ('US030', 'Rizky Octavian', 'rizky.dwipratama@binus.ac.id', '087859925122', '123', 'Malang', 'default-ava.jpg', 'verified', 'customer');

-- ----------------------------
-- Table structure for user_seq
-- ----------------------------
DROP TABLE IF EXISTS `user_seq`;
CREATE TABLE `user_seq`  (
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_seq
-- ----------------------------
INSERT INTO `user_seq` VALUES (1);
INSERT INTO `user_seq` VALUES (2);
INSERT INTO `user_seq` VALUES (6);
INSERT INTO `user_seq` VALUES (7);
INSERT INTO `user_seq` VALUES (8);
INSERT INTO `user_seq` VALUES (9);
INSERT INTO `user_seq` VALUES (10);
INSERT INTO `user_seq` VALUES (14);
INSERT INTO `user_seq` VALUES (17);
INSERT INTO `user_seq` VALUES (19);
INSERT INTO `user_seq` VALUES (20);
INSERT INTO `user_seq` VALUES (21);
INSERT INTO `user_seq` VALUES (22);
INSERT INTO `user_seq` VALUES (23);
INSERT INTO `user_seq` VALUES (24);
INSERT INTO `user_seq` VALUES (25);
INSERT INTO `user_seq` VALUES (26);
INSERT INTO `user_seq` VALUES (27);
INSERT INTO `user_seq` VALUES (28);
INSERT INTO `user_seq` VALUES (29);
INSERT INTO `user_seq` VALUES (30);

-- ----------------------------
-- Triggers structure for table booking
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_booking_insert`;
delimiter ;;
CREATE TRIGGER `tb_booking_insert` BEFORE INSERT ON `booking` FOR EACH ROW BEGIN
    INSERT INTO booking_seq VALUES (NULL);
    SET NEW.bookingId = CONCAT('BOK', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table customer
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_customer_insert`;
delimiter ;;
CREATE TRIGGER `tb_customer_insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
    INSERT INTO customer_seq VALUES (NULL);
    SET NEW.customerID = CONCAT('CS', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table history
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_history_insert`;
delimiter ;;
CREATE TRIGGER `tb_history_insert` BEFORE INSERT ON `history` FOR EACH ROW BEGIN
    INSERT INTO history_seq VALUES (NULL);
    SET NEW.historyId = CONCAT('HSR', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table menu
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_menu_insert`;
delimiter ;;
CREATE TRIGGER `tb_menu_insert` BEFORE INSERT ON `menu` FOR EACH ROW BEGIN
    INSERT INTO menu_seq VALUES (NULL);
    SET NEW.itemId = CONCAT('ITM', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table orders
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_order_insert`;
delimiter ;;
CREATE TRIGGER `tb_order_insert` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    INSERT INTO order_seq VALUES (NULL);
    SET NEW.orderId = CONCAT('ORD', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table promo
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_promo_insert`;
delimiter ;;
CREATE TRIGGER `tb_promo_insert` BEFORE INSERT ON `promo` FOR EACH ROW BEGIN
    INSERT INTO promo_seq VALUES (NULL);
    SET NEW.promoId = CONCAT('PRO', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table restaurant
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_restaurant_insert`;
delimiter ;;
CREATE TRIGGER `tb_restaurant_insert` BEFORE INSERT ON `restaurant` FOR EACH ROW BEGIN
    INSERT INTO restaurant_seq VALUES (NULL);
    SET NEW.restaurantId = CONCAT('RST', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table transaction
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_transaction_insert`;
delimiter ;;
CREATE TRIGGER `tb_transaction_insert` BEFORE INSERT ON `transaction` FOR EACH ROW BEGIN
    INSERT INTO transaction_seq VALUES (NULL);
    SET NEW.transactionId = CONCAT('TRS', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `tb_user_insert`;
delimiter ;;
CREATE TRIGGER `tb_user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
    INSERT INTO user_seq VALUES (NULL);
    SET NEW.userID = CONCAT('US', LPAD(LAST_INSERT_ID(), 3, '0'));
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table user
-- ----------------------------
DROP TRIGGER IF EXISTS `auto_inst_cust`;
delimiter ;;
CREATE TRIGGER `auto_inst_cust` AFTER INSERT ON `user` FOR EACH ROW BEGIN
 IF(NEW.role = 'customer') THEN 
		INSERT INTO customer VALUES('', NEW.userId, 0, 0);
 ELSE
		INSERT INTO restaurant VALUES('', NEW.userId, '', 0, 0, 0, 0, '');
 END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
