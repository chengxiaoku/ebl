/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50553
Source Host           : 127.0.0.1:3306
Source Database       : ebl

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-08-30 07:58:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ebl_admin
-- ----------------------------
DROP TABLE IF EXISTS `ebl_admin`;
CREATE TABLE `ebl_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_admin
-- ----------------------------
INSERT INTO `ebl_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '超级管理员', 'Uploads/d_head.jpg');

-- ----------------------------
-- Table structure for ebl_goods
-- ----------------------------
DROP TABLE IF EXISTS `ebl_goods`;
CREATE TABLE `ebl_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '小范围',
  `name` varchar(255) NOT NULL,
  `style_id` int(10) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_goods
-- ----------------------------
INSERT INTO `ebl_goods` VALUES ('1', '12312', '1', '2017-08-30 06:09:45');
INSERT INTO `ebl_goods` VALUES ('2', '1234', '1', '2017-08-29 19:05:40');
INSERT INTO `ebl_goods` VALUES ('3', '786', '1', '2017-08-29 19:06:13');
INSERT INTO `ebl_goods` VALUES ('4', '三个卧室门', '4', '2017-08-29 19:12:37');
INSERT INTO `ebl_goods` VALUES ('5', '卫生间门', '4', '2017-08-29 19:12:57');
INSERT INTO `ebl_goods` VALUES ('6', '厨房推拉门', '4', '2017-08-29 19:13:17');
INSERT INTO `ebl_goods` VALUES ('7', '卫生间推拉门', '4', '2017-08-29 19:13:33');
INSERT INTO `ebl_goods` VALUES ('8', '客厅吊顶', '3', '2017-08-29 19:14:14');
INSERT INTO `ebl_goods` VALUES ('9', '餐厅吊顶', '3', '2017-08-29 19:14:26');
INSERT INTO `ebl_goods` VALUES ('11', '过道吊顶', '3', '2017-08-29 19:15:04');
INSERT INTO `ebl_goods` VALUES ('12', '中央空调吊顶', '3', '2017-08-29 19:15:24');
INSERT INTO `ebl_goods` VALUES ('13', '78965', '6', '2017-08-29 22:11:39');

-- ----------------------------
-- Table structure for ebl_member
-- ----------------------------
DROP TABLE IF EXISTS `ebl_member`;
CREATE TABLE `ebl_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户姓名',
  `tel` varchar(255) NOT NULL,
  `adress` varchar(255) NOT NULL COMMENT '地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `headimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_member
-- ----------------------------
INSERT INTO `ebl_member` VALUES ('10', '213', '123', '123', '2017-08-29 19:28:12', null);
INSERT INTO `ebl_member` VALUES ('3', '李志玉11', '12323', 'admin', '0000-00-00 00:00:00', null);
INSERT INTO `ebl_member` VALUES ('8', '测试', '123224', '345345345', '2017-08-29 17:20:12', null);
INSERT INTO `ebl_member` VALUES ('11', '12', '12', '12', '2017-08-29 19:28:38', null);
INSERT INTO `ebl_member` VALUES ('12', '12', '12', '12', '2017-08-29 19:33:06', null);
INSERT INTO `ebl_member` VALUES ('13', '234', '234', '234', '2017-08-29 19:33:23', null);
INSERT INTO `ebl_member` VALUES ('14', '234', '234', '34', '2017-08-29 19:34:33', null);
INSERT INTO `ebl_member` VALUES ('15', '345', '435', '345', '2017-08-29 19:35:09', null);
INSERT INTO `ebl_member` VALUES ('16', '666', '66', '66', '2017-08-29 19:35:33', null);
INSERT INTO `ebl_member` VALUES ('17', '77', '77', '77', '2017-08-29 19:39:30', null);
INSERT INTO `ebl_member` VALUES ('18', '88', '888', '888', '2017-08-29 19:42:57', null);
INSERT INTO `ebl_member` VALUES ('19', '99', '99', '99', '2017-08-29 19:43:34', null);
INSERT INTO `ebl_member` VALUES ('20', '66', '66666', '666', '2017-08-29 19:46:17', null);
INSERT INTO `ebl_member` VALUES ('21', '88', '888', '8', '2017-08-29 19:46:58', null);
INSERT INTO `ebl_member` VALUES ('22', '90', '879', '789', '2017-08-29 19:51:25', null);
INSERT INTO `ebl_member` VALUES ('23', '56', '56', '56', '2017-08-29 20:12:33', null);
INSERT INTO `ebl_member` VALUES ('27', '程龙飞', '15638748938', '河南平顶山', '2017-08-29 23:21:20', null);
INSERT INTO `ebl_member` VALUES ('28', '程龙飞', '15638748938', '河南郏县广厦庄园小区', '2017-08-30 07:05:05', null);

-- ----------------------------
-- Table structure for ebl_order
-- ----------------------------
DROP TABLE IF EXISTS `ebl_order`;
CREATE TABLE `ebl_order` (
  `id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(225) NOT NULL,
  `goods_id` int(225) NOT NULL,
  `goods_cz` varchar(255) DEFAULT NULL COMMENT '商品材质',
  `goods_color` varchar(255) DEFAULT NULL,
  `goods_num` int(11) NOT NULL COMMENT '商品数量',
  `goods_price` decimal(10,2) DEFAULT NULL COMMENT '商品报价',
  `goods_cc` varchar(255) DEFAULT NULL COMMENT '商品尺寸',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_order
-- ----------------------------
INSERT INTO `ebl_order` VALUES ('23', '26', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('24', '26', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('25', '26', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('26', '26', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('27', '26', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('28', '26', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('29', '26', '4', '1', '2', '1', '4.00', null);
INSERT INTO `ebl_order` VALUES ('30', '26', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('31', '26', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('32', '26', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('33', '26', '13', '1', '2', '3', '4.00', '');
INSERT INTO `ebl_order` VALUES ('34', '23', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('35', '23', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('36', '23', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('37', '23', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('38', '23', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('39', '23', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('40', '23', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('41', '23', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('42', '23', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('43', '23', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('44', '23', '13', '1', '2', '3', '4.00', '');
INSERT INTO `ebl_order` VALUES ('45', '26', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('46', '26', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('47', '26', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('48', '26', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('49', '26', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('50', '26', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('51', '26', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('52', '26', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('53', '26', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('54', '26', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('55', '26', '13', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('56', '26', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('57', '26', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('58', '26', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('59', '26', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('60', '26', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('61', '26', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('62', '26', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('63', '26', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('64', '26', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('65', '26', '7', '', '', '0', '0.00', '5');
INSERT INTO `ebl_order` VALUES ('66', '26', '13', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('67', '24', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('68', '24', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('69', '24', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('70', '24', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('71', '24', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('72', '24', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('73', '24', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('74', '24', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('75', '24', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('76', '24', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('77', '24', '13', '1', '2', '3', '4.00', '5');
INSERT INTO `ebl_order` VALUES ('78', '25', '2', '11111', '22222', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('79', '25', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('80', '25', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('81', '25', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('82', '25', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('83', '25', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('84', '25', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('85', '25', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('86', '25', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('87', '25', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('88', '25', '13', '', '', '0', '0.00', '');
INSERT INTO `ebl_order` VALUES ('89', '3', '2', '1', '2', '3', '4.00', null);
INSERT INTO `ebl_order` VALUES ('90', '3', '3', '5', '6', '7', '8.00', null);
INSERT INTO `ebl_order` VALUES ('91', '3', '8', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('92', '3', '9', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('93', '3', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('94', '3', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('95', '3', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('96', '3', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('97', '3', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('98', '3', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('99', '3', '13', '1', '2', '3', '4.00', '5');
INSERT INTO `ebl_order` VALUES ('100', '27', '2', '1', '2', '3', '7.00', null);
INSERT INTO `ebl_order` VALUES ('101', '27', '3', '5', '6', '7', '600.00', null);
INSERT INTO `ebl_order` VALUES ('102', '27', '8', '1', '2', '3', '6.00', null);
INSERT INTO `ebl_order` VALUES ('103', '27', '9', '5', '6', '7', '6.00', null);
INSERT INTO `ebl_order` VALUES ('104', '27', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('105', '27', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('106', '27', '4', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('107', '27', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('108', '27', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('109', '27', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('110', '27', '13', '1', '2', '3', '4.00', '6');
INSERT INTO `ebl_order` VALUES ('111', '27', '1', '1', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('112', '28', '1', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('113', '28', '2', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('114', '28', '3', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('115', '28', '8', '全透明材质', '透明色', '1', '100.00', null);
INSERT INTO `ebl_order` VALUES ('116', '28', '9', '餐厅吊顶', '白色', '2', '200.00', null);
INSERT INTO `ebl_order` VALUES ('117', '28', '11', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('118', '28', '12', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('119', '28', '4', '卧室门', '咖啡色', '3', '300.00', null);
INSERT INTO `ebl_order` VALUES ('120', '28', '5', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('121', '28', '6', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('122', '28', '7', '', '', '0', '0.00', null);
INSERT INTO `ebl_order` VALUES ('123', '28', '13', '衣柜', '咖啡色', '2', '700.00', '1.6');

-- ----------------------------
-- Table structure for ebl_style
-- ----------------------------
DROP TABLE IF EXISTS `ebl_style`;
CREATE TABLE `ebl_style` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type_id` int(10) NOT NULL COMMENT '父级ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_style
-- ----------------------------
INSERT INTO `ebl_style` VALUES ('1', '前期', '2017-08-29 19:10:03', '1');
INSERT INTO `ebl_style` VALUES ('3', '吊顶', '2017-08-29 19:10:16', '1');
INSERT INTO `ebl_style` VALUES ('4', '门', '2017-08-29 19:10:31', '1');
INSERT INTO `ebl_style` VALUES ('5', '后期', '2017-08-29 19:10:48', '1');
INSERT INTO `ebl_style` VALUES ('6', '衣柜', '2017-08-29 19:11:13', '3');
INSERT INTO `ebl_style` VALUES ('7', '系统柜', '2017-08-29 19:11:23', '3');
INSERT INTO `ebl_style` VALUES ('8', '宅配', '2017-08-29 19:11:44', '3');

-- ----------------------------
-- Table structure for ebl_type
-- ----------------------------
DROP TABLE IF EXISTS `ebl_type`;
CREATE TABLE `ebl_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '硬装1，定制2',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` int(11) NOT NULL COMMENT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ebl_type
-- ----------------------------
INSERT INTO `ebl_type` VALUES ('1', '硬装', '2017-08-29 19:09:28', '0');
INSERT INTO `ebl_type` VALUES ('3', '定制', '2017-08-29 20:45:16', '1');
