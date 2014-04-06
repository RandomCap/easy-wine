/*
Navicat MySQL Data Transfer

Source Server         : mydb
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : easy-wine

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2014-03-27 22:26:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `classify_and_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `classify_and_attribute`;
CREATE TABLE `classify_and_attribute` (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_name` varchar(50) DEFAULT NULL,
  `classify_ename` varchar(100) DEFAULT NULL,
  `classify_type` int(2) DEFAULT NULL COMMENT '0-外观，1-嗅觉，2-味觉，3-结论，4-澄清度，5-颜色强度，6-状态，7-浓郁度，8-甜度，9-酸度，10-单宁，11-酒体，12-香气特征，13-回味，14-品质,15-颜色',
  `parent_id` int(11) DEFAULT NULL,
  `level` int(2) DEFAULT '1' COMMENT '1 ： 一级，2：二级，3：三级，4-四级',
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classify_and_attribute
-- ----------------------------
INSERT INTO `classify_and_attribute` VALUES ('1', '外观', 'appearance', '0', '0', '1');
INSERT INTO `classify_and_attribute` VALUES ('2', '嗅觉', 'nose', '1', '0', '1');
INSERT INTO `classify_and_attribute` VALUES ('3', '味觉', 'palate', '2', '0', '1');
INSERT INTO `classify_and_attribute` VALUES ('4', '结论', 'conclusion', '3', '0', '1');
INSERT INTO `classify_and_attribute` VALUES ('5', '澄清度', 'clarity', '4', '1', '2');
INSERT INTO `classify_and_attribute` VALUES ('6', '颜色强度', 'intensity', '5', '1', '2');
INSERT INTO `classify_and_attribute` VALUES ('7', '状态', 'condition', '6', '2', '2');
INSERT INTO `classify_and_attribute` VALUES ('8', '浓郁度', 'intensity', '7', '2', '2');
INSERT INTO `classify_and_attribute` VALUES ('9', '甜度', 'sweetness', '8', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('10', '酸度', 'acidity', '9', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('11', '单宁', 'tannin', '10', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('12', '酒体', 'body', '11', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('13', '香气类型', 'relish', '12', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('14', '回味', 'aftertast', '13', '3', '2');
INSERT INTO `classify_and_attribute` VALUES ('15', '品质', 'quality', '14', '4', '2');
INSERT INTO `classify_and_attribute` VALUES ('16', '清澈', 'clear', null, '5', '3');
INSERT INTO `classify_and_attribute` VALUES ('17', '浑浊', 'dull', null, '5', '3');
INSERT INTO `classify_and_attribute` VALUES ('18', '浅', 'pale', null, '6', '3');
INSERT INTO `classify_and_attribute` VALUES ('19', '中等', 'medium', null, '6', '3');
INSERT INTO `classify_and_attribute` VALUES ('20', '深', 'deep', null, '6', '3');
INSERT INTO `classify_and_attribute` VALUES ('21', '无异味', 'clean', null, '7', '3');
INSERT INTO `classify_and_attribute` VALUES ('22', '浊味', 'unclean', null, '7', '3');
INSERT INTO `classify_and_attribute` VALUES ('23', '清淡', 'light', null, '8', '3');
INSERT INTO `classify_and_attribute` VALUES ('24', '中等', 'medium', null, '8', '3');
INSERT INTO `classify_and_attribute` VALUES ('25', '浓郁', 'pronounced', null, '8', '3');
INSERT INTO `classify_and_attribute` VALUES ('26', '干', 'dry', null, '9', '3');
INSERT INTO `classify_and_attribute` VALUES ('27', '微甜', 'offdry', null, '9', '3');
INSERT INTO `classify_and_attribute` VALUES ('28', '中甜', 'medium', null, '9', '3');
INSERT INTO `classify_and_attribute` VALUES ('29', '甜', 'sweet', null, '9', '3');
INSERT INTO `classify_and_attribute` VALUES ('30', '低', 'low', null, '10', '3');
INSERT INTO `classify_and_attribute` VALUES ('31', '中', 'medinm', null, '10', '3');
INSERT INTO `classify_and_attribute` VALUES ('32', '高', 'high', null, '10', '3');
INSERT INTO `classify_and_attribute` VALUES ('33', '低', 'low', null, '11', '3');
INSERT INTO `classify_and_attribute` VALUES ('34', '中', 'medinm', null, '11', '3');
INSERT INTO `classify_and_attribute` VALUES ('35', '高', 'high', null, '11', '3');
INSERT INTO `classify_and_attribute` VALUES ('36', '轻', 'light', null, '12', '3');
INSERT INTO `classify_and_attribute` VALUES ('37', '中', 'medium', null, '12', '3');
INSERT INTO `classify_and_attribute` VALUES ('38', '重', 'full', null, '12', '3');
INSERT INTO `classify_and_attribute` VALUES ('39', '短', 'short', null, '14', '3');
INSERT INTO `classify_and_attribute` VALUES ('40', '中', 'medium', null, '14', '3');
INSERT INTO `classify_and_attribute` VALUES ('41', '长', 'long', null, '14', '3');
INSERT INTO `classify_and_attribute` VALUES ('42', '差', 'poor', null, '15', '3');
INSERT INTO `classify_and_attribute` VALUES ('43', '一般', 'acceptable', null, '15', '3');
INSERT INTO `classify_and_attribute` VALUES ('44', '好', 'good', null, '15', '3');
INSERT INTO `classify_and_attribute` VALUES ('45', '非常好', 'verygood', null, '15', '3');
INSERT INTO `classify_and_attribute` VALUES ('46', '优秀', 'outstanding', null, '15', '3');
INSERT INTO `classify_and_attribute` VALUES ('47', '果香', 'fruit', null, '13', '3');
INSERT INTO `classify_and_attribute` VALUES ('48', '花香', 'floral', null, '13', '3');
INSERT INTO `classify_and_attribute` VALUES ('49', '植物香', 'spice', null, '13', '3');
INSERT INTO `classify_and_attribute` VALUES ('50', '辛香', 'vegetal', null, '13', '3');
INSERT INTO `classify_and_attribute` VALUES ('51', '檀木香', 'oak', null, '13', '3');
INSERT INTO `classify_and_attribute` VALUES ('52', '苹果香', null, null, '47', '4');
INSERT INTO `classify_and_attribute` VALUES ('53', '桔子香', null, null, '47', '4');
INSERT INTO `classify_and_attribute` VALUES ('54', '芒果想', null, null, '47', '4');
INSERT INTO `classify_and_attribute` VALUES ('55', '玫瑰香', null, null, '48', '4');
INSERT INTO `classify_and_attribute` VALUES ('56', '百合香', null, null, '48', '4');
INSERT INTO `classify_and_attribute` VALUES ('57', '月季香', null, null, '48', '4');
INSERT INTO `classify_and_attribute` VALUES ('58', '茶香', null, null, '49', '4');
INSERT INTO `classify_and_attribute` VALUES ('59', '柳树香', null, null, '49', '4');
INSERT INTO `classify_and_attribute` VALUES ('60', '玉米香', null, null, '49', '4');
INSERT INTO `classify_and_attribute` VALUES ('61', '稻香', null, null, '49', '4');
INSERT INTO `classify_and_attribute` VALUES ('62', '辛一香', null, null, '50', '4');
INSERT INTO `classify_and_attribute` VALUES ('63', '辛二香', null, null, '50', '4');
INSERT INTO `classify_and_attribute` VALUES ('64', '檀木一香', null, null, '51', '4');
INSERT INTO `classify_and_attribute` VALUES ('65', '檀木二香', null, null, '51', '4');
INSERT INTO `classify_and_attribute` VALUES ('66', '颜色', 'colour', '15', '2', '2');
INSERT INTO `classify_and_attribute` VALUES ('67', '白葡萄酒', null, null, '66', '3');
INSERT INTO `classify_and_attribute` VALUES ('68', '红葡萄酒', null, null, '66', '3');
INSERT INTO `classify_and_attribute` VALUES ('69', '桃红葡萄酒', null, null, '66', '3');
INSERT INTO `classify_and_attribute` VALUES ('70', '柠檬黄', null, null, '67', '4');
INSERT INTO `classify_and_attribute` VALUES ('71', '金黄色', null, null, '67', '4');
INSERT INTO `classify_and_attribute` VALUES ('72', '琥珀色', null, null, '67', '4');
INSERT INTO `classify_and_attribute` VALUES ('73', '紫色', null, null, '68', '4');
INSERT INTO `classify_and_attribute` VALUES ('74', '宝石红', null, null, '68', '4');
INSERT INTO `classify_and_attribute` VALUES ('75', '石榴红', null, null, '68', '4');
INSERT INTO `classify_and_attribute` VALUES ('76', '茶色', null, null, '68', '4');
INSERT INTO `classify_and_attribute` VALUES ('77', '粉红色', null, null, '69', '4');
INSERT INTO `classify_and_attribute` VALUES ('78', '橙黄色', null, null, '69', '4');

-- ----------------------------
-- Table structure for `grape`
-- ----------------------------
DROP TABLE IF EXISTS `grape`;
CREATE TABLE `grape` (
  `grape_id` int(11) NOT NULL AUTO_INCREMENT,
  `grape_name` varchar(1000) DEFAULT NULL,
  `grape_e_name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`grape_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grape
-- ----------------------------
INSERT INTO `grape` VALUES ('1', '红葡萄酒', 'claret', '0');
INSERT INTO `grape` VALUES ('2', '白葡萄酒', 'sherry', '0');
INSERT INTO `grape` VALUES ('3', '桃红葡萄酒', 'rose wine', '0');
INSERT INTO `grape` VALUES ('4', '红葡萄酒A', null, '1');
INSERT INTO `grape` VALUES ('5', '红葡萄酒2', null, '1');
INSERT INTO `grape` VALUES ('6', '红葡萄酒3', null, '1');
INSERT INTO `grape` VALUES ('7', '红葡萄酒4', null, '1');
INSERT INTO `grape` VALUES ('8', '红葡萄酒5', null, '1');
INSERT INTO `grape` VALUES ('9', '红葡萄酒6', null, '1');
INSERT INTO `grape` VALUES ('10', '红葡萄酒7', null, '1');
INSERT INTO `grape` VALUES ('11', '白葡萄酒1', null, '2');
INSERT INTO `grape` VALUES ('12', '白葡萄酒2', null, '2');
INSERT INTO `grape` VALUES ('13', '白葡萄酒3', null, '2');
INSERT INTO `grape` VALUES ('14', '白葡萄酒4', null, '2');
INSERT INTO `grape` VALUES ('15', '白葡萄酒5', null, '2');
INSERT INTO `grape` VALUES ('16', '白葡萄酒6', null, '2');
INSERT INTO `grape` VALUES ('17', '桃红葡萄酒1', null, '3');

-- ----------------------------
-- Table structure for `manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(100) DEFAULT NULL,
  `manufacturer_address` varchar(200) DEFAULT NULL,
  `manufacturer_telephone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer
-- ----------------------------
INSERT INTO `manufacturer` VALUES ('1', '生产厂商中国12', '北京大马路二道街西城胡同', '121231314');
INSERT INTO `manufacturer` VALUES ('2', '生产厂商中国2', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('3', '生产厂商中国3', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('4', '生产厂商中国生产4', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('5', '生产厂商中国5', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('6', '生产厂商中国6', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('7', '生产厂商中国7', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('8', '生产厂商中国8', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('9', '生产厂商中国9', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('10', '生产厂商中国生产10', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('11', '生产厂商中国11', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('12', '生产厂商中国生产厂13', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('13', '生产厂商中国16', '北京大马路二道街西城胡同', null);
INSERT INTO `manufacturer` VALUES ('15', '中国特产', null, null);

-- ----------------------------
-- Table structure for `manufacturer_producing_area`
-- ----------------------------
DROP TABLE IF EXISTS `manufacturer_producing_area`;
CREATE TABLE `manufacturer_producing_area` (
  `manufacturer_id` int(11) DEFAULT NULL,
  `producing_area_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacturer_producing_area
-- ----------------------------

-- ----------------------------
-- Table structure for `note`
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL AUTO_INCREMENT,
  `note_title` varchar(100) DEFAULT NULL,
  `create_date` varchar(50) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '0-自己，1-对外',
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '第一个测试笔记', '2014-11-11', '0');
INSERT INTO `note` VALUES ('2', '品红酒笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('3', '白酒笔记', '2014-12-11', '1');
INSERT INTO `note` VALUES ('4', '桃红葡萄酒笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('5', '周六品酒笔记', '2014-09-11', '1');
INSERT INTO `note` VALUES ('6', '周周品酒笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('7', '第一个测试笔记', '2014-07-11', '0');
INSERT INTO `note` VALUES ('8', '品红酒笔记', '2014-03-23', '1');
INSERT INTO `note` VALUES ('9', '白酒笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('10', '桃红葡萄酒笔记', '2014-5-11', '1');
INSERT INTO `note` VALUES ('11', '周六品酒笔记', '2014-03-11', '0');
INSERT INTO `note` VALUES ('12', '周周品酒笔记', '2014-03-11', '0');
INSERT INTO `note` VALUES ('13', '第一个测试笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('14', '品红酒笔记', '2014-03-17', '1');
INSERT INTO `note` VALUES ('15', '白酒笔记', '2014-03-11', '1');
INSERT INTO `note` VALUES ('16', '桃红葡萄酒笔记', '2014-03-11', '0');
INSERT INTO `note` VALUES ('17', '周六品酒笔记', '2014-02-11', '0');
INSERT INTO `note` VALUES ('18', '周周品酒笔记', '2014-03-17', '0');
INSERT INTO `note` VALUES ('19', 'kjnjknhkjhjgt', '2014-03-23 23:16:59', '0');
INSERT INTO `note` VALUES ('20', '添加品酒笔记 0201', '2014-03-23', '0');
INSERT INTO `note` VALUES ('21', '添加品酒笔记 02', '2014-03-23', '0');
INSERT INTO `note` VALUES ('22', '第好几个测试比较', '2014-03-25', '0');
INSERT INTO `note` VALUES ('23', 'uuuuuuuu', '2014-03-25', '1');
INSERT INTO `note` VALUES ('24', 'dsfazcx', '2014-03-25', '1');
INSERT INTO `note` VALUES ('25', 'asdfadf', '2014-03-25', '1');
INSERT INTO `note` VALUES ('26', 'asdffdd', '2014-03-25', '1');

-- ----------------------------
-- Table structure for `note_project_relation`
-- ----------------------------
DROP TABLE IF EXISTS `note_project_relation`;
CREATE TABLE `note_project_relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of note_project_relation
-- ----------------------------
INSERT INTO `note_project_relation` VALUES ('4', '4', '10');
INSERT INTO `note_project_relation` VALUES ('5', '5', '10');
INSERT INTO `note_project_relation` VALUES ('6', '6', '10');
INSERT INTO `note_project_relation` VALUES ('7', '7', '10');
INSERT INTO `note_project_relation` VALUES ('8', '8', '1');
INSERT INTO `note_project_relation` VALUES ('9', '9', '1');
INSERT INTO `note_project_relation` VALUES ('10', '10', '1');
INSERT INTO `note_project_relation` VALUES ('11', '11', '1');
INSERT INTO `note_project_relation` VALUES ('12', '12', '1');
INSERT INTO `note_project_relation` VALUES ('13', '13', '1');
INSERT INTO `note_project_relation` VALUES ('14', '14', '1');
INSERT INTO `note_project_relation` VALUES ('15', '15', '1');
INSERT INTO `note_project_relation` VALUES ('16', '16', '10');
INSERT INTO `note_project_relation` VALUES ('17', '17', '10');
INSERT INTO `note_project_relation` VALUES ('18', '18', '10');

-- ----------------------------
-- Table structure for `object`
-- ----------------------------
DROP TABLE IF EXISTS `object`;
CREATE TABLE `object` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `object_name` varchar(200) DEFAULT NULL,
  `object_ename` varchar(100) DEFAULT NULL,
  `object_code` varchar(30) DEFAULT NULL,
  `producing_area_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object
-- ----------------------------
INSERT INTO `object` VALUES ('1', '3', '2014 / 03 / 01', '葡萄酒', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('2', '4', '2014 / 03 / 01', '葡萄酒', null, 'gb2312-1988', '14');
INSERT INTO `object` VALUES ('3', '2', '2014 / 03 / 01', '葡萄酒', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('4', '2', '2014 / 03 / 01', '葡萄酒', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('5', '2', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('6', '1', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '19');
INSERT INTO `object` VALUES ('7', '1', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('8', '5', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '19');
INSERT INTO `object` VALUES ('9', '2', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('10', '2', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '7');
INSERT INTO `object` VALUES ('11', '6', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '14');
INSERT INTO `object` VALUES ('12', '4', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '8');
INSERT INTO `object` VALUES ('13', '2', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '14');
INSERT INTO `object` VALUES ('14', '2', '2014 / 03 / 06', '张玉解百纳', null, 'gb2312-1988', '14');
INSERT INTO `object` VALUES ('15', '15', '2014 / 03 / 01', '张玉解百纳', null, 'gb2312-1988', '19');
INSERT INTO `object` VALUES ('16', '1', '2014 / 03 / 08', 'earfwer', null, 'werter_222', '16');
INSERT INTO `object` VALUES ('17', '4', '2014 / 03 / 05', '张玉解百纳sdf', null, 'asdfsasadf 234', '7');
INSERT INTO `object` VALUES ('18', '5', '2014 / 03 / 06', '张玉解百纳sdfd', null, 'gb2312-1988', '7');

-- ----------------------------
-- Table structure for `object_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `object_attribute`;
CREATE TABLE `object_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) DEFAULT NULL,
  `grape_id` int(11) DEFAULT NULL,
  `acidity_id` int(11) DEFAULT NULL,
  `climate_id` int(11) DEFAULT NULL,
  `colour_id` int(11) DEFAULT NULL,
  `aftertast_id` int(11) DEFAULT NULL,
  `intensity_id` int(11) DEFAULT NULL,
  `condition_id` int(11) DEFAULT NULL,
  `body_id` int(11) DEFAULT NULL,
  `relish_id` int(11) DEFAULT NULL,
  `quality_id` int(11) DEFAULT NULL,
  `tannin_id` int(11) DEFAULT NULL,
  `sweetness_id` int(11) DEFAULT NULL,
  `color_intensity_id` int(11) DEFAULT NULL,
  `clarity_id` int(11) DEFAULT NULL,
  `des` text,
  `date` varchar(50) DEFAULT NULL,
  `data_type` int(2) DEFAULT '0' COMMENT '0-瓶酒笔记属性，1-产品属性',
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of object_attribute
-- ----------------------------
INSERT INTO `object_attribute` VALUES ('4', '9', '5', '32', null, '72', '41', '24', '21', '38', '54', '43', '35', '28', '19', '17', '阿斯蒂芬撒打发阿斯蒂芬撒旦法撒旦法是的的阿斯蒂芬', '2014 / 03 / 28', '0');
INSERT INTO `object_attribute` VALUES ('5', '14', '11', '32', null, '70', '41', '24', '22', '38', '53', '44', '35', '28', '19', '17', '撒旦飞洒地方阿斯蒂芬阿斯蒂芬阿斯蒂芬', '2014 / 03 / 08', '0');
INSERT INTO `object_attribute` VALUES ('6', '15', '5', '32', null, '70', '41', '23', '21', '38', '54', '43', '35', '28', '19', '17', '撒的撒撒打发说', '2014 / 03 / 09', '0');
INSERT INTO `object_attribute` VALUES ('7', '16', '14', '30', null, '75', '41', '25', '22', '38', '56', '43', '34', '28', '19', '16', 'segfsadgfsagt', '2014 / 03 / 14', '0');
INSERT INTO `object_attribute` VALUES ('8', '17', '7', '32', null, '70', '41', '24', '22', '38', '53', '43', '34', '28', '20', '17', 'wsfdafasdf asdfasdf', '2014 / 03 / 08', '0');
INSERT INTO `object_attribute` VALUES ('9', '18', '4', '31', null, '72', '41', '24', '22', '38', '53', '45', '35', '28', '19', '17', 'sdfasdfasdfs', '2014 / 03 / 01', '0');

-- ----------------------------
-- Table structure for `photo`
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_id` int(11) DEFAULT NULL,
  `photo_url` varchar(200) DEFAULT NULL,
  `photo_name` varchar(200) DEFAULT NULL,
  `photo_des` text,
  `photo_type` int(2) DEFAULT NULL COMMENT '0-瓶酒笔记元素，1-品酒笔记，2-产品照片',
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of photo
-- ----------------------------

-- ----------------------------
-- Table structure for `price`
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `price_cost` decimal(9,2) DEFAULT NULL,
  `price_market` decimal(9,2) DEFAULT NULL,
  `price_sale` decimal(9,2) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '0-不公开，1-公开',
  `data_type` int(2) DEFAULT '0' COMMENT '0-瓶酒笔记元素价钱，1-产片价钱',
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('2', '66.00', '77.00', null, null, '2', '1', '0');
INSERT INTO `price` VALUES ('3', '66.00', '77.00', null, null, '3', '0', '0');
INSERT INTO `price` VALUES ('4', '66.00', '77.00', null, null, '4', '0', '0');
INSERT INTO `price` VALUES ('5', '66.00', '77.00', null, null, '5', '0', '0');
INSERT INTO `price` VALUES ('6', '66.00', '77.00', null, null, '6', '0', '0');
INSERT INTO `price` VALUES ('7', '66.00', '77.00', null, null, '7', '0', '0');
INSERT INTO `price` VALUES ('8', '66.00', '77.00', null, null, '8', '0', '0');
INSERT INTO `price` VALUES ('9', '66.00', '77.00', null, null, '9', '0', '0');
INSERT INTO `price` VALUES ('10', '66.00', '77.00', null, null, '10', '0', '0');
INSERT INTO `price` VALUES ('11', '66.00', '77.00', null, null, '11', '0', '0');
INSERT INTO `price` VALUES ('12', '66.00', '77.00', null, null, '12', '0', '0');
INSERT INTO `price` VALUES ('13', '66.00', '77.00', null, null, '13', '0', '0');
INSERT INTO `price` VALUES ('14', '66.00', '77.00', null, null, '14', '0', '0');
INSERT INTO `price` VALUES ('15', '66.00', '77.00', null, null, '15', '0', '0');
INSERT INTO `price` VALUES ('16', '443333.00', '222222.00', null, null, '16', '0', '0');
INSERT INTO `price` VALUES ('17', '443333.00', '222222.00', null, null, '17', '0', '0');
INSERT INTO `price` VALUES ('18', '443333.00', '222222.00', null, null, '18', '0', '0');

-- ----------------------------
-- Table structure for `producing_area`
-- ----------------------------
DROP TABLE IF EXISTS `producing_area`;
CREATE TABLE `producing_area` (
  `producing_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `producing_area_name` varchar(50) DEFAULT NULL,
  `producing_area_ename` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`producing_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of producing_area
-- ----------------------------
INSERT INTO `producing_area` VALUES ('1', '美国', 'meiguo', '0');
INSERT INTO `producing_area` VALUES ('2', '中国', 'zhongguo', '0');
INSERT INTO `producing_area` VALUES ('3', '日本', 'riben', '0');
INSERT INTO `producing_area` VALUES ('4', '英国', 'yingguo', '0');
INSERT INTO `producing_area` VALUES ('5', '葡萄牙', 'putapya', '0');
INSERT INTO `producing_area` VALUES ('6', '法国', 'faguo', '0');
INSERT INTO `producing_area` VALUES ('7', '地区A', 'guojiaa', '1');
INSERT INTO `producing_area` VALUES ('8', '地区A', 'guojiaa', '2');
INSERT INTO `producing_area` VALUES ('9', '地区A', 'guojiaa', '3');
INSERT INTO `producing_area` VALUES ('10', '地区A地区A地区A', 'guojiaa', '4');
INSERT INTO `producing_area` VALUES ('11', '地区A', 'guojiaa', '5');
INSERT INTO `producing_area` VALUES ('12', '地区A', 'guojiaa', '6');
INSERT INTO `producing_area` VALUES ('13', '地区A', 'guojiaa', '6');
INSERT INTO `producing_area` VALUES ('14', '地区B', 'diqub', '1');
INSERT INTO `producing_area` VALUES ('15', '地区B', 'diqub', '3');
INSERT INTO `producing_area` VALUES ('16', '地区B', 'diqub', '5');
INSERT INTO `producing_area` VALUES ('17', '地区B', 'diqub', '4');
INSERT INTO `producing_area` VALUES ('18', '地区B', 'diqub', '5');
INSERT INTO `producing_area` VALUES ('19', '地区C', 'diquC', '1');
INSERT INTO `producing_area` VALUES ('20', '地区C', 'diquC', '2');
INSERT INTO `producing_area` VALUES ('21', '地区C', 'diquC', '3');
INSERT INTO `producing_area` VALUES ('22', '地区C', 'diquC', '4');
INSERT INTO `producing_area` VALUES ('23', '地区C', 'diquC', '5');
INSERT INTO `producing_area` VALUES ('24', '地区C', 'diquC', '6');
INSERT INTO `producing_area` VALUES ('25', '地区f', 'diquf', '6');

-- ----------------------------
-- Table structure for `project_manufacturer_relation`
-- ----------------------------
DROP TABLE IF EXISTS `project_manufacturer_relation`;
CREATE TABLE `project_manufacturer_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) DEFAULT NULL,
  `producing_area_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_manufacturer_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gender` int(2) DEFAULT NULL COMMENT '0-男，1-女',
  `birthday` date DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '0-有效，1-无效',
  `create_date` datetime DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `qq` int(15) DEFAULT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `login_pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Luozg', '0', '1988-10-08', '0', '1988-10-08 00:00:00', '18311016155', '16953767@qq.com', '16953767', 'luozg', '96e79218965eb72c92a549dd5a330112');
INSERT INTO `user` VALUES ('2', 'Lozg01', '0', '1988-10-08', '0', '1988-10-08 00:00:00', '18311016155', '16953767@qq.com', '16953767', 'luozg01', '96e79218965eb72c92a549dd5a330112');
INSERT INTO `user` VALUES ('3', 'luozg_01', '0', null, '0', '2014-03-17 00:00:00', '18311016166', 'luozg_01@qq.com', null, 'luozg_01', '91ea2e643d12e8f71f18f1d1e34cd3a6');
INSERT INTO `user` VALUES ('4', 'luozg_02', '0', null, '0', '2014-03-17 00:37:30', '18311016111', 'luozg_02@qq.com', null, 'luozg_02', '38783eaf8c358a2bb5e5febf7aca3ae7');
INSERT INTO `user` VALUES ('5', 'luozg_03', '0', null, '0', '2014-03-17 00:41:38', '18311917777', 'luozg_03@qq.cn', null, 'luozg_03', '8f89190a69ddebecf96726e5f2ecb8f8');
INSERT INTO `user` VALUES ('6', 'luozg_04', '0', null, '0', '2014-03-17 00:57:14', '18311017177', 'luozg_04@qq.com', null, 'luozg_04', '42112c601d0ad3dff858715cc931063f');

-- ----------------------------
-- Table structure for `user_note_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_note_relation`;
CREATE TABLE `user_note_relation` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_note_relation
-- ----------------------------
INSERT INTO `user_note_relation` VALUES ('1', '1', '18');
INSERT INTO `user_note_relation` VALUES ('2', '1', '17');
INSERT INTO `user_note_relation` VALUES ('3', '1', '1');
INSERT INTO `user_note_relation` VALUES ('4', '2', '16');
INSERT INTO `user_note_relation` VALUES ('5', '1', '15');
INSERT INTO `user_note_relation` VALUES ('6', '1', '14');
INSERT INTO `user_note_relation` VALUES ('7', '1', '13');
INSERT INTO `user_note_relation` VALUES ('8', '1', '12');
INSERT INTO `user_note_relation` VALUES ('9', '1', '11');
INSERT INTO `user_note_relation` VALUES ('10', '1', '10');
INSERT INTO `user_note_relation` VALUES ('11', '1', '9');
INSERT INTO `user_note_relation` VALUES ('12', '2', '8');
INSERT INTO `user_note_relation` VALUES ('13', '2', '7');
INSERT INTO `user_note_relation` VALUES ('14', '2', '6');
INSERT INTO `user_note_relation` VALUES ('15', '2', '5');
INSERT INTO `user_note_relation` VALUES ('16', '2', '4');
INSERT INTO `user_note_relation` VALUES ('17', '2', '3');
INSERT INTO `user_note_relation` VALUES ('18', '2', '2');
INSERT INTO `user_note_relation` VALUES ('19', '2', '19');
INSERT INTO `user_note_relation` VALUES ('20', '2', '20');
INSERT INTO `user_note_relation` VALUES ('21', '2', '21');
INSERT INTO `user_note_relation` VALUES ('22', '2', '22');
INSERT INTO `user_note_relation` VALUES ('23', '2', '23');
INSERT INTO `user_note_relation` VALUES ('24', '2', '24');
INSERT INTO `user_note_relation` VALUES ('25', '2', '25');
INSERT INTO `user_note_relation` VALUES ('26', '2', '26');

-- ----------------------------
-- Table structure for `user_sys_filter`
-- ----------------------------
DROP TABLE IF EXISTS `user_sys_filter`;
CREATE TABLE `user_sys_filter` (
  `user_id` int(11) DEFAULT NULL,
  `note_photo_count` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_sys_filter
-- ----------------------------
INSERT INTO `user_sys_filter` VALUES ('6', '5');
