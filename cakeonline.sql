/*
Navicat MySQL Data Transfer

Source Server         : localhost_33061
Source Server Version : 50506
Source Host           : localhost:3306
Source Database       : cakeonline

Target Server Type    : MYSQL
Target Server Version : 50506
File Encoding         : 65001

Date: 2018-11-16 20:06:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_cake`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cake`;
CREATE TABLE `tbl_cake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `bigimg` varchar(100) DEFAULT NULL,
  `img1` varchar(100) DEFAULT NULL,
  `img2` varchar(100) DEFAULT NULL,
  `img3` varchar(100) DEFAULT NULL,
  `starlevel` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_cake
-- ----------------------------
INSERT INTO `tbl_cake` VALUES ('1', 'Chocolate Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '95', '10', 'images/g1.jpg', 'images/s1.png', 'images/s2.png', 'images/s3.png', '5', '2', 'Chocolate Friend', '5');
INSERT INTO `tbl_cake` VALUES ('2', 'Flower', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '150', '20', 'images/g2.jpg', 'images/g2.jpg', 'images/g2.jpg', 'images/g2.jpg', '5', '2', 'Flower Lover ', '6');
INSERT INTO `tbl_cake` VALUES ('3', 'Hello Ketty', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '80', '25', 'images/g3.png', 'images/g3.png', 'images/g3.png', 'images/g3.png', '2', '6', 'Hello Ketty Kids', '7');
INSERT INTO `tbl_cake` VALUES ('4', 'Chocolate Levels', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '120', '15', 'images/g4.png', 'images/g4.png', 'images/g4.png', 'images/g4.png', '4', '6', 'Chocalate Chocolate Sister', '8');
INSERT INTO `tbl_cake` VALUES ('5', 'Flower Levels', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '150', '15', 'images/g5.png', 'images/g5.png', 'images/g5.png', 'images/g5.png', '4', '6', 'Flower Level Brother', '9');
INSERT INTO `tbl_cake` VALUES ('6', 'Bear Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '80', '10', 'images/g6.png', 'images/g6.png', 'images/g6.png', 'images/g6.png', '3', '6', 'Bear Cake Parent', '10');
INSERT INTO `tbl_cake` VALUES ('7', 'Bear Levels', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '120', '10', 'images/g7.png', 'images/g7.png', 'images/g7.png', 'images/g7.png', '3', '6', 'Bear Cake Level', '18');
INSERT INTO `tbl_cake` VALUES ('8', 'Heart Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '80', '20', 'images/g8.png', 'images/g8.png', 'images/g8.png', 'images/g8.png', '2', '6', 'Colorful Cake Chocolate', '17');
INSERT INTO `tbl_cake` VALUES ('9', 'Colorful Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '90', '10', 'images/g9.png', 'images/g9.png', 'images/g9.png', 'images/g9.png', '4', '6', 'Heart Cake Beautiful', '16');
INSERT INTO `tbl_cake` VALUES ('10', 'Chocolate Cap', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '90', '20', 'images/g10.png', 'images/g10.png', 'images/g10.png', 'images/g10.png', '3', '6', 'Chocolate Vanilla ', '19');
INSERT INTO `tbl_cake` VALUES ('11', 'Pink Level', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '200', '20', 'images/m1.png', 'images/m1.png', 'images/m1.png', 'images/m1.png', '4', '4', 'Pink Level Strawberry', '14');
INSERT INTO `tbl_cake` VALUES ('12', 'Chocolate flower', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '260', '25', 'images/m2.png', 'images/m2.png', 'images/m2.png', 'images/m2.png', '5', '5', 'Chocolate Eggless Cake', '13');
INSERT INTO `tbl_cake` VALUES ('13', 'Green Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '230', '20', 'images/m3.png', 'images/m3.png', 'images/m3.png', 'images/m3.png', '4', '4', 'Green Cake Forest', '15');
INSERT INTO `tbl_cake` VALUES ('14', 'Chocolate zooCake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '120', '10', 'images/m4.png', 'images/m4.png', 'images/m4.png', 'images/m4.png', '3', '3', 'Chocolate Cake Mixed Fruit', '11');
INSERT INTO `tbl_cake` VALUES ('15', 'Pink Flower Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '100', '10', 'images/m5.png', 'images/m5.png', 'images/m5.png', 'images/m5.png', '2', '2', 'Pink Flower Pretty', '22');
INSERT INTO `tbl_cake` VALUES ('16', 'Chocolate Fruit', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '130', '15', 'images/m6.png', 'images/m6.png', 'images/m6.png', 'images/m6.png', '3', '2', 'Chocolate fruit', '12');
INSERT INTO `tbl_cake` VALUES ('17', 'Pink Heart', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '95', '10', 'images/m7.png', 'images/m7.png', 'images/m7.png', 'images/m7.png', '2', '1', 'Pink Heart Strawberry', '14');
INSERT INTO `tbl_cake` VALUES ('18', 'Square Cake', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '95', '10', 'images/m8.png', 'images/m8.png', 'images/m8.png', 'images/m8.png', '3', '1', 'Square Cake fruit', '20');
INSERT INTO `tbl_cake` VALUES ('19', 'Circle Chocolate', 'Cake cutting is one of the most wonderful ways of celebrating a special moment. What better way to celebrate than with a rich and mouth watering chocochips cake', '120', '20', 'images/m9.png', 'images/m9.png', 'images/m9.png', 'images/m9.png', '4', '2', 'Circle Cake pretty', '21');
INSERT INTO `tbl_cake` VALUES ('22', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tbl_order`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_order`;
CREATE TABLE `tbl_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  `orderTime` datetime DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_order
-- ----------------------------
INSERT INTO `tbl_order` VALUES ('7', '2018-10-20 20:13:58', '1234');
INSERT INTO `tbl_order` VALUES ('6', '2018-10-20 16:58:11', '1234');
INSERT INTO `tbl_order` VALUES ('8', '2018-10-20 20:26:50', '1234');
INSERT INTO `tbl_order` VALUES ('9', '2018-10-20 20:27:14', '1234');
INSERT INTO `tbl_order` VALUES ('10', '2018-10-20 20:28:16', '1234');
INSERT INTO `tbl_order` VALUES ('11', '2018-10-20 21:55:02', '1234');
INSERT INTO `tbl_order` VALUES ('12', '2018-10-21 09:53:05', '1234');
INSERT INTO `tbl_order` VALUES ('13', '2018-10-21 09:56:48', '1234');
INSERT INTO `tbl_order` VALUES ('14', '2018-10-21 11:40:56', '1234');
INSERT INTO `tbl_order` VALUES ('15', '2018-10-21 12:27:54', '1234');
INSERT INTO `tbl_order` VALUES ('16', '2018-10-21 12:31:27', '1234');
INSERT INTO `tbl_order` VALUES ('17', '2018-11-15 20:29:59', '1234');
INSERT INTO `tbl_order` VALUES ('18', '2018-11-15 20:31:51', '1234');
INSERT INTO `tbl_order` VALUES ('19', '2018-11-15 20:44:12', '1234');
INSERT INTO `tbl_order` VALUES ('20', '2018-11-15 21:12:43', '1234');
INSERT INTO `tbl_order` VALUES ('21', '2018-11-16 20:00:21', '99');

-- ----------------------------
-- Table structure for `tbl_orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderdetail`;
CREATE TABLE `tbl_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `cakeid` int(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_orderdetail
-- ----------------------------
INSERT INTO `tbl_orderdetail` VALUES ('1', '1', '3', '2');
INSERT INTO `tbl_orderdetail` VALUES ('2', '2', '4', '3');
INSERT INTO `tbl_orderdetail` VALUES ('3', '3', '4', '4');
INSERT INTO `tbl_orderdetail` VALUES ('4', '4', '5', '5');
INSERT INTO `tbl_orderdetail` VALUES ('5', '5', '5', '6');
INSERT INTO `tbl_orderdetail` VALUES ('6', '6', '6', '7');
INSERT INTO `tbl_orderdetail` VALUES ('7', '7', '6', '8');
INSERT INTO `tbl_orderdetail` VALUES ('8', '8', '7', '9');
INSERT INTO `tbl_orderdetail` VALUES ('9', '9', '7', '2');
INSERT INTO `tbl_orderdetail` VALUES ('10', '10', '8', '2');
INSERT INTO `tbl_orderdetail` VALUES ('11', '11', '8', '3');
INSERT INTO `tbl_orderdetail` VALUES ('12', '12', '9', '5');
INSERT INTO `tbl_orderdetail` VALUES ('13', '13', '9', '6');
INSERT INTO `tbl_orderdetail` VALUES ('14', '14', '10', '8');
INSERT INTO `tbl_orderdetail` VALUES ('15', '15', '10', '9');
INSERT INTO `tbl_orderdetail` VALUES ('16', '16', '10', '5');
INSERT INTO `tbl_orderdetail` VALUES ('17', '3', '5', '1');
INSERT INTO `tbl_orderdetail` VALUES ('18', '3', '8', '2');
INSERT INTO `tbl_orderdetail` VALUES ('19', '4', '5', '14');
INSERT INTO `tbl_orderdetail` VALUES ('20', '5', '3', '14');
INSERT INTO `tbl_orderdetail` VALUES ('21', '6', '8', '14');
INSERT INTO `tbl_orderdetail` VALUES ('22', '7', '3', '1');
INSERT INTO `tbl_orderdetail` VALUES ('23', '8', '3', '1');
INSERT INTO `tbl_orderdetail` VALUES ('24', '8', '10', '1');
INSERT INTO `tbl_orderdetail` VALUES ('25', '9', '3', '1');
INSERT INTO `tbl_orderdetail` VALUES ('26', '9', '9', '1');
INSERT INTO `tbl_orderdetail` VALUES ('27', '10', '9', '1');
INSERT INTO `tbl_orderdetail` VALUES ('28', '11', '9', '4');
INSERT INTO `tbl_orderdetail` VALUES ('29', '12', '8', '5');
INSERT INTO `tbl_orderdetail` VALUES ('30', '13', '4', '1');
INSERT INTO `tbl_orderdetail` VALUES ('31', '13', '10', '1');
INSERT INTO `tbl_orderdetail` VALUES ('32', '14', '5', '1');
INSERT INTO `tbl_orderdetail` VALUES ('33', '14', '9', '1');
INSERT INTO `tbl_orderdetail` VALUES ('34', '15', '5', '1');
INSERT INTO `tbl_orderdetail` VALUES ('35', '15', '7', '1');
INSERT INTO `tbl_orderdetail` VALUES ('36', '15', '8', '1');
INSERT INTO `tbl_orderdetail` VALUES ('37', '16', '7', '1');
INSERT INTO `tbl_orderdetail` VALUES ('38', '16', '3', '1');
INSERT INTO `tbl_orderdetail` VALUES ('39', '16', '5', '1');
INSERT INTO `tbl_orderdetail` VALUES ('40', '17', '5', '1');
INSERT INTO `tbl_orderdetail` VALUES ('41', '17', '14', '1');
INSERT INTO `tbl_orderdetail` VALUES ('42', '18', '15', '1');
INSERT INTO `tbl_orderdetail` VALUES ('43', '18', '12', '1');
INSERT INTO `tbl_orderdetail` VALUES ('44', '19', '1', '1');
INSERT INTO `tbl_orderdetail` VALUES ('45', '20', '18', '1');
INSERT INTO `tbl_orderdetail` VALUES ('46', '20', '9', '1');
INSERT INTO `tbl_orderdetail` VALUES ('47', '21', '10', '0');

-- ----------------------------
-- Table structure for `tbl_type`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_type`;
CREATE TABLE `tbl_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_type
-- ----------------------------
INSERT INTO `tbl_type` VALUES ('1', 'By Relation', null);
INSERT INTO `tbl_type` VALUES ('2', 'By Flavor', null);
INSERT INTO `tbl_type` VALUES ('3', 'By Theme', null);
INSERT INTO `tbl_type` VALUES ('4', 'Weight', null);
INSERT INTO `tbl_type` VALUES ('5', 'Friend', '1');
INSERT INTO `tbl_type` VALUES ('6', 'Lover', '1');
INSERT INTO `tbl_type` VALUES ('7', 'Kids', '1');
INSERT INTO `tbl_type` VALUES ('8', 'Sister', '1');
INSERT INTO `tbl_type` VALUES ('9', 'Brother', '1');
INSERT INTO `tbl_type` VALUES ('10', 'Parent', '1');
INSERT INTO `tbl_type` VALUES ('11', 'Chocolate', '2');
INSERT INTO `tbl_type` VALUES ('12', 'Mixed Fruit', '2');
INSERT INTO `tbl_type` VALUES ('13', 'Butterscotch', '2');
INSERT INTO `tbl_type` VALUES ('14', 'Strawberry', '2');
INSERT INTO `tbl_type` VALUES ('15', 'Vanilla', '2');
INSERT INTO `tbl_type` VALUES ('16', 'Eggless Cakes', '2');
INSERT INTO `tbl_type` VALUES ('17', 'Heart shaped', '3');
INSERT INTO `tbl_type` VALUES ('18', 'Cartoon Cakes', '3');
INSERT INTO `tbl_type` VALUES ('19', '2-3 Tier Cakes', '3');
INSERT INTO `tbl_type` VALUES ('20', 'Square shape', '3');
INSERT INTO `tbl_type` VALUES ('21', 'Round shape', '3');
INSERT INTO `tbl_type` VALUES ('22', 'Photo Cakes', '3');
INSERT INTO `tbl_type` VALUES ('23', '1kg', '4');
INSERT INTO `tbl_type` VALUES ('24', '2kg', '4');
INSERT INTO `tbl_type` VALUES ('25', '3kg', '4');
INSERT INTO `tbl_type` VALUES ('26', '4kg', '4');
INSERT INTO `tbl_type` VALUES ('27', '5kg', '4');
INSERT INTO `tbl_type` VALUES ('28', 'Large', '4');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `email` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `registertime` datetime DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='存储客户信息';

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('123@qq.com', '111', '河北省', '13612345678', '123', '2018-10-16 20:24:25');
INSERT INTO `tbl_user` VALUES ('1295357107@qq.com', 'wmz', '河北省', '13612345678', '123', '2018-10-16 20:05:14');
INSERT INTO `tbl_user` VALUES ('1111111', '111', '河北省', '13612345678', '111', '2018-10-17 08:57:26');
INSERT INTO `tbl_user` VALUES ('1234', '111', '河北省', '13612345678', '123', '2018-10-17 08:59:35');
INSERT INTO `tbl_user` VALUES ('789@qq.com', '456', '河北省', '12345678974', '123', '2018-10-20 17:01:02');
INSERT INTO `tbl_user` VALUES ('7362', '111', '河北省', '13435446546456', '456', '2018-10-21 12:41:24');
INSERT INTO `tbl_user` VALUES ('1666', '66', '66', '66', '66', '2018-11-15 22:01:03');
INSERT INTO `tbl_user` VALUES ('455', '555', '555', '55', '55', '2018-11-15 22:03:42');
INSERT INTO `tbl_user` VALUES ('99', '99', '99', '99', '99', '2018-11-15 22:09:09');
INSERT INTO `tbl_user` VALUES ('123', '123', '123', '123', '123', '2018-11-16 20:02:59');
