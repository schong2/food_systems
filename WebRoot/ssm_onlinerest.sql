/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50643
 Source Host           : localhost:3306
 Source Schema         : ssm_onlinerest

 Target Server Type    : MySQL
 Target Server Version : 50643
 File Encoding         : 65001

 Date: 03/07/2020 14:22:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser`  (
  `auid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`auid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES (1, 'admin', 'admin', 0);
INSERT INTO `adminuser` VALUES (2, '22', '22', 1);
INSERT INTO `adminuser` VALUES (3, '33', '33', 2);
INSERT INTO `adminuser` VALUES (4, '44', '44', 3);
INSERT INTO `adminuser` VALUES (5, '55', '55', 4);

-- ----------------------------
-- Table structure for billitem
-- ----------------------------
DROP TABLE IF EXISTS `billitem`;
CREATE TABLE `billitem`  (
  `billid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NULL DEFAULT NULL,
  `ptotal` double NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`billid`) USING BTREE,
  UNIQUE INDEX `pid`(`pid`) USING BTREE,
  INDEX `FK3510439A73B4E627`(`pid`) USING BTREE,
  CONSTRAINT `FK3510439A73B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '川菜');
INSERT INTO `category` VALUES (2, '粤菜');
INSERT INTO `category` VALUES (4, '湘菜');
INSERT INTO `category` VALUES (5, '浙菜');
INSERT INTO `category` VALUES (6, '酒水');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond`  (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`csid`) USING BTREE,
  INDEX `FK936FCAF2418BCBAF`(`cid`) USING BTREE,
  CONSTRAINT `FK936FCAF2418BCBAF` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES (1, '宫保鸡丁', 1);
INSERT INTO `categorysecond` VALUES (8, '阿一鲍鱼', 2);
INSERT INTO `categorysecond` VALUES (13, '东安子鸡', 4);
INSERT INTO `categorysecond` VALUES (14, '腊味合蒸', 4);
INSERT INTO `categorysecond` VALUES (15, '西湖醋鱼', 5);
INSERT INTO `categorysecond` VALUES (16, '东坡肉', 5);
INSERT INTO `categorysecond` VALUES (17, '龙井虾仁', 5);
INSERT INTO `categorysecond` VALUES (18, '雪花啤酒', 6);
INSERT INTO `categorysecond` VALUES (19, '二锅头', 6);
INSERT INTO `categorysecond` VALUES (25, '夫妻肺片', 1);
INSERT INTO `categorysecond` VALUES (26, '毛血旺', 1);
INSERT INTO `categorysecond` VALUES (27, '麻婆豆腐', 1);
INSERT INTO `categorysecond` VALUES (28, '烤乳猪', 2);
INSERT INTO `categorysecond` VALUES (29, '太爷鸡', 2);
INSERT INTO `categorysecond` VALUES (30, '盐焗鸡', 2);
INSERT INTO `categorysecond` VALUES (31, '组庵鱼翅', 4);
INSERT INTO `categorysecond` VALUES (32, '剁椒鱼头', 4);
INSERT INTO `categorysecond` VALUES (33, '虎跑素火煺', 5);
INSERT INTO `categorysecond` VALUES (34, '五粮液', 6);
INSERT INTO `categorysecond` VALUES (35, '可口可乐', 6);
INSERT INTO `categorysecond` VALUES (36, '矿泉水', 6);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageid` int(11) NULL DEFAULT NULL,
  `message` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `messagedate` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (NULL, '<p>hahahaha&nbsp;</p>\r\n', '2020-07-02 15:17:39', 1);
INSERT INTO `message` VALUES (NULL, '<p>sadas</p>\r\n', '2020-07-02 15:18:52', 4);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `oiid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `subtotal` double NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  PRIMARY KEY (`oiid`) USING BTREE,
  INDEX `FKE8B2AB61E818A405`(`oid`) USING BTREE,
  INDEX `FKE8B2AB6173B4E627`(`pid`) USING BTREE,
  CONSTRAINT `FKE8B2AB6173B4E627` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKE8B2AB61E818A405` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (5, 1, 16, 21, 3);
INSERT INTO `orderitem` VALUES (6, 1, 38, 24, 3);
INSERT INTO `orderitem` VALUES (7, 1, 12, 27, 3);
INSERT INTO `orderitem` VALUES (8, 1, 8, 28, 3);
INSERT INTO `orderitem` VALUES (9, 1, 50, 2, 4);
INSERT INTO `orderitem` VALUES (10, 1, 60, 20, 5);
INSERT INTO `orderitem` VALUES (11, 1, 16, 21, 5);
INSERT INTO `orderitem` VALUES (12, 1, 15, 23, 5);
INSERT INTO `orderitem` VALUES (13, 2, 120, 20, 6);
INSERT INTO `orderitem` VALUES (14, 1, 16, 21, 9);
INSERT INTO `orderitem` VALUES (15, 1, 8, 28, 10);
INSERT INTO `orderitem` VALUES (16, 1, 38, 24, 11);
INSERT INTO `orderitem` VALUES (17, 1, 38, 24, 12);
INSERT INTO `orderitem` VALUES (18, 1, 15, 23, 13);
INSERT INTO `orderitem` VALUES (19, 1, 15, 23, 14);
INSERT INTO `orderitem` VALUES (20, 1, 40, 31, 15);
INSERT INTO `orderitem` VALUES (21, 1, 16, 21, 16);
INSERT INTO `orderitem` VALUES (22, 1, 12, 22, 16);
INSERT INTO `orderitem` VALUES (23, 1, 60, 20, 17);
INSERT INTO `orderitem` VALUES (24, 1, 60, 20, 18);
INSERT INTO `orderitem` VALUES (25, 1, 15, 23, 18);
INSERT INTO `orderitem` VALUES (26, 1, 9, 30, 19);
INSERT INTO `orderitem` VALUES (27, 1, 40, 31, 20);
INSERT INTO `orderitem` VALUES (28, 1, 15, 23, 21);
INSERT INTO `orderitem` VALUES (29, 1, 12, 22, 22);
INSERT INTO `orderitem` VALUES (30, 1, 15, 23, 22);
INSERT INTO `orderitem` VALUES (31, 1, 15, 23, 23);
INSERT INTO `orderitem` VALUES (32, 1, 12, 22, 25);
INSERT INTO `orderitem` VALUES (33, 2, 32, 21, 26);
INSERT INTO `orderitem` VALUES (34, 1, 15, 23, 26);
INSERT INTO `orderitem` VALUES (35, 2, 24, 22, 27);
INSERT INTO `orderitem` VALUES (36, 1, 15, 23, 28);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `money` double NULL DEFAULT NULL,
  `state` int(11) NOT NULL,
  `receiveInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_time` datetime(0) NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `accepter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE,
  INDEX `FKC3DF62E5FC32F8E`(`uid`) USING BTREE,
  CONSTRAINT `FKC3DF62E5FC32F8E` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, 74, 1, '上海市静安区', '13913812312', '2018-01-30 22:58:30', 3, '嗷大猫');
INSERT INTO `orders` VALUES (4, 50, 1, '1212121', '1212121212', '2019-06-29 00:00:00', 1, '212121212');
INSERT INTO `orders` VALUES (5, 91, 1, '', '', '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (6, 120, 0, '', NULL, '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (7, 0, 0, '', NULL, '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (8, 0, 0, '', NULL, '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (9, 16, 1, '', '', '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (10, 8, 1, '', '', '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (11, 38, 1, '', '', '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (12, 38, 1, '', '', '2019-06-30 00:00:00', 5, '');
INSERT INTO `orders` VALUES (13, 15, 0, '', NULL, '2019-07-02 00:00:00', 1, '');
INSERT INTO `orders` VALUES (14, 15, 0, '', NULL, '2019-07-02 00:00:00', 6, '');
INSERT INTO `orders` VALUES (15, 40, 0, '', NULL, '2019-07-02 00:00:00', 6, '');
INSERT INTO `orders` VALUES (16, 28, 0, '', NULL, '2019-07-02 00:00:00', 6, '');
INSERT INTO `orders` VALUES (17, 60, 0, '', NULL, '2019-07-02 00:00:00', 6, '');
INSERT INTO `orders` VALUES (18, 75, 1, '', '', '2019-07-02 00:00:00', 6, '');
INSERT INTO `orders` VALUES (19, 9, 1, '', '', '2019-07-02 00:00:00', 5, '');
INSERT INTO `orders` VALUES (20, 40, 0, '', NULL, '2019-07-02 00:00:00', 1, '');
INSERT INTO `orders` VALUES (21, 15, 1, '', '', '2019-07-02 00:00:00', 5, '');
INSERT INTO `orders` VALUES (22, 27, 0, '', NULL, '2019-07-02 00:00:00', 8, '');
INSERT INTO `orders` VALUES (23, 15, 0, '', NULL, '2019-07-02 00:00:00', 5, '');
INSERT INTO `orders` VALUES (24, 0, 0, '', NULL, '2019-07-02 00:00:00', 5, '');
INSERT INTO `orders` VALUES (25, 12, 0, '', NULL, '2019-07-03 00:00:00', 8, '');
INSERT INTO `orders` VALUES (26, 47, 0, NULL, NULL, '2019-07-04 00:00:00', 9, NULL);
INSERT INTO `orders` VALUES (27, 24, 0, NULL, NULL, '2019-07-04 00:00:00', 8, NULL);
INSERT INTO `orders` VALUES (28, 15, 1, '源码码头', '121212121212', '2019-07-08 00:00:00', 1, '源码码头');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `market_price` double NULL DEFAULT NULL,
  `shop_price` double NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pdesc` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_hot` int(11) NULL DEFAULT NULL,
  `pdate` timestamp(0) NULL DEFAULT NULL,
  `csid` int(11) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `FKED8DCCEF5F778050`(`csid`) USING BTREE,
  CONSTRAINT `FKED8DCCEF5F778050` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (2, '夫妻肺片', 38, 50, 'products/67b463a0-46cb-4404-8bb9-6bba170e4dfd1668656ba8a.png', '太好吃了', 1, '2020-07-03 13:52:29', 25, 11);
INSERT INTO `product` VALUES (3, '太爷鸡', 78, 70, 'products/140577f4-2928-411f-83f8-04a85333ef0ftimg (2).jpg', '好吃', 0, '2020-07-03 13:51:39', 29, 2);
INSERT INTO `product` VALUES (5, '盐焗鸡', 70, 66, 'products/e03305eb-fff7-4491-8f91-6af64deed450u=485058735,260251482&fm=26&gp=0.jpg', '好吃', 0, '2020-07-03 13:51:04', 30, 3);
INSERT INTO `product` VALUES (10, '宫保鸡丁', 22, 5, 'products/ef9b1929-9f8e-4956-ba24-6376fb3c2f9eu=1528949076,2475365904&fm=26&gp=0.jpg', '好吃不贵', 0, '2020-07-03 13:52:05', 1, 22);
INSERT INTO `product` VALUES (14, '西湖醋鱼', 66, 60, 'products/49ec115c-2758-4654-ac9c-35ae9c1232f3timg (3).jpg', '鲜香', 1, '2020-07-03 13:55:05', 15, 20);
INSERT INTO `product` VALUES (16, '阿一鲍鱼', 99, 15, 'products/e9ba120a-f45b-4732-8b6c-36c25c50412dtimg (1).jpg', '很好吃', 0, '2020-07-03 13:51:54', 8, 21);
INSERT INTO `product` VALUES (17, '烤乳猪', 228, 220, 'products/e94a8cd6-df15-4fe7-b963-c7ede1ec473fu=2009682655,1376261229&fm=26&gp=0.jpg', '外焦里嫩', 0, '2020-07-03 13:51:48', 28, 3);
INSERT INTO `product` VALUES (20, '毛血旺', 50, 60, 'products/17229857-a084-4b85-8fe5-65e18dab8d9cu=2732769265,3157823324&fm=26&gp=0.jpg', '安逸得很', 1, '2020-07-03 13:52:15', 26, 24);
INSERT INTO `product` VALUES (21, '蜡味合蒸', 45, 43, 'products/a9da9d44-01b7-477a-b0e3-ede41c12bd20u=42174329,72155597&fm=26&gp=0.jpg', '好吃', 1, '2020-07-03 13:50:32', 14, 13);
INSERT INTO `product` VALUES (22, '祖庵鱼翅', 99, 88, 'products/584d91f6-74c5-4832-ba0d-e6f55533e1d3u=687102723,412075297&fm=26&gp=0.jpg', '很有营养', 1, '2020-07-03 13:50:20', 31, 14);
INSERT INTO `product` VALUES (23, '龙井虾仁', 66, 59, 'products/5231d625-7f0b-4715-a265-4980627dc0b8timg (5).jpg', '鲜香', 1, '2020-07-03 13:58:24', 17, 14);
INSERT INTO `product` VALUES (24, '东坡肉', 55, 50, 'products/0ac219c7-a058-4fc7-9785-4b29dc19953btimg (4).jpg', '肥而不腻', 0, '2020-07-03 13:57:03', 16, 14);
INSERT INTO `product` VALUES (25, '红星二锅头', 20, 18, 'products/de92d3ec-5ea7-46a9-8adf-5cc2d0589ecbtimg (6).jpg', '好喝', 0, '2020-07-03 14:07:16', 19, 15);
INSERT INTO `product` VALUES (26, '东安子鸡', 66, 59, 'products/f50f2385-739d-4481-a121-0d0a4cb93d9fu=2219556504,1278790557&fm=26&gp=0.jpg', '十分的香', 0, '2020-07-03 13:50:46', 13, 14);
INSERT INTO `product` VALUES (27, '麻婆豆腐', 12, 12, 'products/7bab8ff3-c17b-4a8a-8a9c-54fdfba774catimg.jpg', '麻婆豆腐', 0, '2020-07-03 13:52:22', 27, 15);
INSERT INTO `product` VALUES (28, '五粮液', 698, 688, 'products/d6f11542-6e3d-41dd-9b6a-18b229def725u=1744296534,2590307054&fm=26&gp=0.jpg', '入口柔', 0, '2020-07-03 14:08:36', 34, 13);
INSERT INTO `product` VALUES (29, '虎跑素火腿', 18, 15, 'products/f104f3e8-8e8b-4b55-8678-d57370e58809u=1942221234,2298292765&fm=26&gp=0.jpg', '好吃', 0, '2020-07-03 14:01:12', 33, 14);
INSERT INTO `product` VALUES (30, '雪花勇闯天下', 9, 6, 'products/f5834fce-a32f-4e7e-9ac3-8c5c1f0bd373u=2112738686,3025551781&fm=26&gp=0.jpg', '好喝', 0, '2020-07-03 14:04:35', 18, 14);
INSERT INTO `product` VALUES (31, '雪花纯生', 15, 12, 'products/2b27d607-a9a9-4279-b386-3a4caa7e8c7fu=3001780525,800398927&fm=26&gp=0.jpg', '特别好喝', 0, '2020-07-03 14:05:33', 18, 18);
INSERT INTO `product` VALUES (32, '可口可乐', 5, 4, 'products/d5adee70-0cf5-4bb8-ac73-5e404d30fee3u=2484238524,1162129735&fm=26&gp=0.jpg', '好喝', 0, '2020-07-03 00:00:00', 35, NULL);
INSERT INTO `product` VALUES (33, '百事可乐', 10, 8, 'products/93a7eef8-1b60-4fdf-b8a9-776cab34c0e7timg (7).jpg', '特别好喝', 0, '2020-07-03 00:00:00', 35, NULL);
INSERT INTO `product` VALUES (34, '矿泉水', 5, 4, 'products/dbfadd4a-6bcf-4ed9-98cd-e17d7118a2edtimg (8).jpg', '纯净水', 0, '2020-07-03 00:00:00', 36, NULL);

-- ----------------------------
-- Table structure for shopcartitem
-- ----------------------------
DROP TABLE IF EXISTS `shopcartitem`;
CREATE TABLE `shopcartitem`  (
  `cartitemid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `pcount` int(11) NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ptotal` double NULL DEFAULT NULL,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cartitemid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'user', '123456', '巴卓', 'hikitty@qq.com', '13555512345', '上海市', '1', NULL);
INSERT INTO `user` VALUES (2, 'jack', '123456', '马云', 'jack@qq.com', '13812312312', '中国', '1', NULL);
INSERT INTO `user` VALUES (3, 'hellokitty', '123456', '张三', 'aodamao@qq.com', '13555512345', '上海市', '0', 'ca0f6f5a-36da-402d-8c0f-22587423de20');
INSERT INTO `user` VALUES (4, '12', '12', '12', '1@gmail.com', '12', '12', '0', '7c62d99d-c759-4dd4-87e8-9a1eed997cf2');
INSERT INTO `user` VALUES (5, 'zc', '123456', '', '', '', '', '0', '7b2de927-adf7-4bc4-b5b0-3d99d82013b1');
INSERT INTO `user` VALUES (6, '111', '123', 'zc', '111@.com', '123456', '常州', '0', '127ef49d-08c1-4c07-a413-a6bee9210f48');
INSERT INTO `user` VALUES (7, '1111', '', '', '', '', '', '0', 'e67240b2-cb6c-492d-a675-c45961e68d91');
INSERT INTO `user` VALUES (8, '123456', '123456', '丹巴', '155699@.com', '15586674895', '西藏', '1', NULL);
INSERT INTO `user` VALUES (9, '3456', '3456', '小美', '', '12345678945', '', '0', '7ff1e82b-88e0-4b0b-9bb2-a15b0240e633');

SET FOREIGN_KEY_CHECKS = 1;
