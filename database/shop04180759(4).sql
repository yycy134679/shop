/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2023-04-18 07:59:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `detail` varchar(50) NOT NULL,
  `town_id` int(11) NOT NULL COMMENT '地址所属乡镇编号',
  `street_id` int(11) NOT NULL COMMENT '地址所属街道或社区编号',
  `postcode` char(6) DEFAULT '000000' COMMENT '邮编',
  `customer_id` int(11) DEFAULT NULL,
  `isDefault` char(1) NOT NULL DEFAULT '0' COMMENT '该地址是否为默认地址 0否1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_address_province` (`province_id`) USING BTREE,
  KEY `FK_address_city` (`city_id`) USING BTREE,
  KEY `FK_address_region` (`region_id`) USING BTREE,
  KEY `FK_address_town` (`town_id`),
  KEY `FK_address_street` (`street_id`),
  KEY `FK_address_customer` (`customer_id`),
  CONSTRAINT `FK_address_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_address_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_address_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_address_street` FOREIGN KEY (`street_id`) REFERENCES `street` (`id`),
  CONSTRAINT `FK_address_town` FOREIGN KEY (`town_id`) REFERENCES `town` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60002 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='地址表';

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('60000', '10000', '80000', '90003', '穗丰村委', '66000', '88000', '000000', '40000', '0');
INSERT INTO `address` VALUES ('60001', '10000', '80001', '90001', '广州理工学院', '66000', '88000', '000000', '40000', '1');

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '品牌编码',
  `chin_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '品牌中文名',
  `en_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌英文名',
  `intro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌介绍',
  `logo` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '品牌LOGO',
  `category_id` int(11) NOT NULL COMMENT '品牌所属分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IN_code` (`code`) USING BTREE,
  UNIQUE KEY `IN_ch_name` (`chin_name`) USING BTREE,
  UNIQUE KEY `IN_en_name` (`en_name`) USING BTREE,
  KEY `FK_brand_category` (`category_id`) USING BTREE,
  CONSTRAINT `FK_brand_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99010 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='品牌表';

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('99001', 'pp0001', '华为', null, null, null, '20013');
INSERT INTO `brand` VALUES ('99002', 'pp0002', '宝洁', null, null, null, '20000');
INSERT INTO `brand` VALUES ('99003', 'pp0003', '李宁', null, null, null, '20014');
INSERT INTO `brand` VALUES ('99004', 'pp0004', '三只米老鼠', '', null, null, '20001');
INSERT INTO `brand` VALUES ('99005', 'pp0005', '良品铺子', null, null, null, '20001');
INSERT INTO `brand` VALUES ('99006', 'pp0006', '钱小爹', null, null, null, '20012');
INSERT INTO `brand` VALUES ('99007', 'pp0007', '盒码鲜生', null, null, null, '20012');
INSERT INTO `brand` VALUES ('99008', 'pp0008', '花仙子', null, null, null, '20008');
INSERT INTO `brand` VALUES ('99009', 'pp0009', '特仑苏', null, null, null, '20009');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类编码',
  `aname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `pid` int(11) DEFAULT NULL COMMENT '分类父ID',
  `isShow` char(1) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IN_code` (`code`) USING BTREE,
  UNIQUE KEY `IN_name` (`aname`) USING BTREE,
  KEY `FK_cate_cate` (`pid`) USING BTREE,
  CONSTRAINT `FK_cate_cate` FOREIGN KEY (`pid`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20018 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='产品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('20000', 'FL0001', '日用品', null, '0');
INSERT INTO `category` VALUES ('20001', 'FL0002', '零食', null, '0');
INSERT INTO `category` VALUES ('20002', 'FL0003', '美妆', null, '0');
INSERT INTO `category` VALUES ('20003', 'FL0004', '家用电器', null, '0');
INSERT INTO `category` VALUES ('20004', 'FL0005', '电子设备', null, '0');
INSERT INTO `category` VALUES ('20005', 'FL0006', '即食', '20001', '0');
INSERT INTO `category` VALUES ('20006', 'FL0007', '麻辣', '20001', '0');
INSERT INTO `category` VALUES ('20007', 'FL0008', '香甜', '20001', '0');
INSERT INTO `category` VALUES ('20008', 'FL0009', '花卉', null, '1');
INSERT INTO `category` VALUES ('20009', 'FL0010', '水果', null, '1');
INSERT INTO `category` VALUES ('20012', 'FL0011', '生鲜', null, '0');
INSERT INTO `category` VALUES ('20013', 'FL0012', '手机', null, '0');
INSERT INTO `category` VALUES ('20014', 'FL0013', '服装', null, '0');
INSERT INTO `category` VALUES ('20015', 'FL0014', '家居', null, '0');
INSERT INTO `category` VALUES ('20016', 'FL0015', '家俱', null, '0');
INSERT INTO `category` VALUES ('20017', 'FL0016', '鞋子', null, '0');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `prov_id` int(11) NOT NULL COMMENT '所属省份ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IN_name` (`bname`) USING BTREE,
  KEY `FK_city_province` (`prov_id`) USING BTREE,
  CONSTRAINT `FK_city_province` FOREIGN KEY (`prov_id`) REFERENCES `province` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80006 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='地级市表';

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('80000', '广州市', '10000');
INSERT INTO `city` VALUES ('80001', '深圳市', '10000');
INSERT INTO `city` VALUES ('80002', '佛山市', '10000');
INSERT INTO `city` VALUES ('80003', '珠海市', '10000');
INSERT INTO `city` VALUES ('80005', '阳江市', '10001');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司名称',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '公司联系电话',
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司邮箱',
  `chief` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司负责人',
  `detail_address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司地址',
  `region_id` int(11) NOT NULL COMMENT '公司所在区ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IN_name` (`cname`) USING BTREE,
  KEY `FK_company_region` (`region_id`) USING BTREE,
  CONSTRAINT `FK_company_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='供应商表（公司表）';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('50001', '华为品牌专卖店', '13999999999', null, '李篮', '深圳南山区38号', '90003');
INSERT INTO `company` VALUES ('50002', '广州花仙子电子商务公司', '020999999', '120991752@qq.com', '陈生', '天河南二路', '90002');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户真实名',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户账号',
  `pass` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户密码',
  `imgUrl` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'anno.jpg' COMMENT '客户头像URL',
  `intro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户简介',
  `tel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '客户联系电话',
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户邮箱',
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '客户性别：1男2女',
  `cardID` char(18) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户身份证',
  `regTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '客户注册时间',
  `state` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '客户账号状态：1激活  2锁定 ',
  `level` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '会员等级：1普通会员2钻石会员',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_username` (`username`) USING BTREE,
  UNIQUE KEY `unique_tel` (`tel`) USING BTREE,
  UNIQUE KEY `unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42706 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='消费者表';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('40000', 'admin', 'admin', 'admin', 'anno.jpg', '管理员的个人介绍', '15920558888', '235643@qq.com', '0', '23653657', '2021-10-21 09:03:40', '1', '1');
INSERT INTO `customer` VALUES ('40003', '陈生', 'chen', 'chen', 'anno.jpg', '陈老师的个人信息', '15920558666', 'chen@edu.cn', '0', '1111111', '2021-10-21 09:02:27', '0', '2');
INSERT INTO `customer` VALUES ('42705', 'dd', 'dd', 'dd', 'anno.jpg', null, '222', null, '1', null, '2023-04-17 15:51:38', '1', '1');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(100) NOT NULL COMMENT '商品关键词',
  `code` varchar(6) NOT NULL COMMENT '内部商品编码',
  `spec` varchar(255) DEFAULT NULL COMMENT '规格参数',
  `ch_spec` varchar(255) DEFAULT NULL COMMENT '规格参数解释',
  `in_price` double(7,2) NOT NULL COMMENT '进货价格',
  `out_price` double(7,2) NOT NULL COMMENT '销售价格',
  `stock` int(11) NOT NULL COMMENT '库存量',
  `imgUrl` varchar(50) DEFAULT 'anno.jpg' COMMENT '商品图片',
  `product_id` int(11) NOT NULL COMMENT '所属产品ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `IN_code` (`code`) USING BTREE,
  KEY `FK_goods_product` (`product_id`) USING BTREE,
  CONSTRAINT `FK_goods_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90010 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品表SKU';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('90000', '红色玫瑰好看花期久直接发货', 'sp0001', '{20006:1018,20000:1001,20010:1055}', '{品种:玫瑰,颜色:红色,单位:束(10支装)}', '6.00', '36.00', '12', 'xh_img1.jpg', '50001');
INSERT INTO `goods` VALUES ('90002', '生日祝福自由各种主题可定制', 'sp0002', '{20006:1057,20008:1038}', '{品种:组合,主题:生日祝福}', '22.00', '38.00', '7', 'xh_img2.jpg', '50001');
INSERT INTO `goods` VALUES ('90005', '好看花期久可单支任选冲销量', 'sp0003', '{20006:1018,20000:1001,20010:1056}', '{品种:玫瑰,颜色:红色,单位:支}', '0.50', '5.50', '30', 'xh_img3.jpg', '50001');
INSERT INTO `goods` VALUES ('90006', '昙花一现好看各种主题可定制', 'sp0004', '{20006:1057,20008:1037}', '{品种:组合,主题:浪漫人生}', '5.00', '28.00', '23', 'xh_img4.jpg', '50001');
INSERT INTO `goods` VALUES ('90007', '五花装饰多种各种主题可定制', 'sp0005', '{20006:1057,20008:1040}', '{品种:组合,主题:财源广进}', '4.00', '26.00', '44', 'xh_img5.jpg', '50001');
INSERT INTO `goods` VALUES ('90008', '锦上添花红色玫瑰直接发货哦', 'sp0006', '{20006:1018,20000:1002,20010:1055}', '{品种:玫瑰,颜色:金色,单位:束(10支装)}', '11.00', '58.00', '23', 'xh_img6.jpg', '50001');
INSERT INTO `goods` VALUES ('90009', '百花齐放多种组合主题可定制', 'sp0007', '{20006:1057,20008:1059}', '{品种:组合,主题:花开富贵}', '21.00', '188.00', '3', 'xh_img2.jpg', '50001');

-- ----------------------------
-- Table structure for `goods_propitem`
-- ----------------------------
DROP TABLE IF EXISTS `goods_propitem`;
CREATE TABLE `goods_propitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `pi_id` int(11) NOT NULL COMMENT '属性详情ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_gdpi_goods` (`goods_id`) USING BTREE,
  KEY `FK_gdpi_pi` (`pi_id`) USING BTREE,
  CONSTRAINT `FK_gdpi_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_gdpi_pi` FOREIGN KEY (`pi_id`) REFERENCES `propertyitem` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100008 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品--属性详情表';

-- ----------------------------
-- Records of goods_propitem
-- ----------------------------
INSERT INTO `goods_propitem` VALUES ('100000', '90000', '1018');
INSERT INTO `goods_propitem` VALUES ('100001', '90000', '1001');
INSERT INTO `goods_propitem` VALUES ('100002', '90000', '1055');
INSERT INTO `goods_propitem` VALUES ('100003', '90002', '1038');
INSERT INTO `goods_propitem` VALUES ('100004', '90002', '1057');
INSERT INTO `goods_propitem` VALUES ('100005', '90005', '1001');
INSERT INTO `goods_propitem` VALUES ('100006', '90005', '1018');
INSERT INTO `goods_propitem` VALUES ('100007', '90005', '1056');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '所属订单ID',
  `goods_id` int(11) NOT NULL COMMENT '所属商品ID',
  `buyPrice` double(7,2) NOT NULL COMMENT '会员价',
  `buyNum` int(11) NOT NULL COMMENT '购买数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_orderItem_orders` (`orders_id`) USING BTREE,
  KEY `FK_orderItem_product` (`goods_id`) USING BTREE,
  CONSTRAINT `FK_orderItem_goods` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orderItem_orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70046 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='订单详情表';

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('70003', '60000', '90000', '10.00', '1');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(17) COLLATE utf8_unicode_ci NOT NULL COMMENT '流水号',
  `totalSum` double(7,2) NOT NULL COMMENT '总金额',
  `carriage` double(7,2) NOT NULL COMMENT '邮费(运费)',
  `realSum` double(7,2) NOT NULL COMMENT '实付金额',
  `totalNum` int(11) NOT NULL COMMENT '总数量',
  `receiverAddress` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件 人地址全名',
  `receiverName` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人姓名',
  `receiverTel` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '收件人电话',
  `state` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0未支付1已支付未发货 2已支付已发货3已支付已收货',
  `orderTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下单时间',
  `payTime` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `payType` char(1) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '1支付宝2微信3信用卡4银行卡5到付6现金',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_order_customer` (`customer_id`) USING BTREE,
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60039 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='订单表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('60000', '2021102808585', '100.00', '0.00', '97.00', '4', '广州市从化区街口环市东路', '陈生', '13599888888', '1', '2021-10-28 11:30:09', '2021-10-12 21:34:17', '40000', '1');
INSERT INTO `orders` VALUES ('60001', '2021102509212', '200.00', '0.00', '198.00', '8', '广东省深圳市南山区马二路', '曹女士', '13588888888', '1', '2021-10-28 16:37:33', '2021-10-06 21:34:30', '40003', '2');
INSERT INTO `orders` VALUES ('60027', '20211217015109', '5.50', '0.00', '5.50', '1', '教师宿舍307-1', '陈生', '15151515151', '1', '2021-12-17 01:51:09', '2021-12-17 01:51:09', '40003', '1');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '产品名(或关键词)',
  `code` varchar(6) COLLATE utf8_unicode_ci NOT NULL COMMENT '产品内部编码，如xh0000',
  `intro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品简介',
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'anno.jpg' COMMENT '产品详情',
  `category_id` int(11) NOT NULL COMMENT '所属分类',
  `brand_id` int(11) NOT NULL COMMENT '所属品牌',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_product_category` (`category_id`) USING BTREE,
  KEY `FK_product_brand` (`brand_id`) USING BTREE,
  CONSTRAINT `FK_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='产品表SPU';

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('50001', '鲜花', 'xh0001', '花开富贵', '', '20008', '99008');

-- ----------------------------
-- Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `chin_name` varchar(20) NOT NULL COMMENT '属性名称中文',
  `en_name` varchar(20) DEFAULT NULL COMMENT '属性名称中文',
  `category_id` int(11) NOT NULL COMMENT '所属分类ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_property_category` (`category_id`) USING BTREE,
  CONSTRAINT `FK_property_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20011 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='属性表';

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('20000', '颜色', 'color', '20013');
INSERT INTO `property` VALUES ('20001', '版本', 'version', '20013');
INSERT INTO `property` VALUES ('20003', '容量', 'capcity', '20013');
INSERT INTO `property` VALUES ('20004', '尺寸', 'size', '20014');
INSERT INTO `property` VALUES ('20005', '计量单位', 'unit', '20001');
INSERT INTO `property` VALUES ('20006', '品种', 'kind', '20008');
INSERT INTO `property` VALUES ('20007', '品种', 'kind', '20009');
INSERT INTO `property` VALUES ('20008', '主题', 'theme', '20008');
INSERT INTO `property` VALUES ('20009', '尺寸', 'size', '20017');
INSERT INTO `property` VALUES ('20010', '计量单位', 'unit', '20008');

-- ----------------------------
-- Table structure for `propertyitem`
-- ----------------------------
DROP TABLE IF EXISTS `propertyitem`;
CREATE TABLE `propertyitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chin_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '中文属性项名称',
  `en_name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '英文属性项名称',
  `property_id` int(11) NOT NULL COMMENT '所属属性ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_pi_prop` (`property_id`) USING BTREE,
  CONSTRAINT `FK_pi_prop` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='属性详情表';

-- ----------------------------
-- Records of propertyitem
-- ----------------------------
INSERT INTO `propertyitem` VALUES ('1001', '红色', 'red', '20000');
INSERT INTO `propertyitem` VALUES ('1002', '黄色', 'yellow', '20000');
INSERT INTO `propertyitem` VALUES ('1003', '金色', 'golden', '20000');
INSERT INTO `propertyitem` VALUES ('1004', '蓝色', 'blue', '20000');
INSERT INTO `propertyitem` VALUES ('1005', '淡蓝色', null, '20000');
INSERT INTO `propertyitem` VALUES ('1006', '白色', 'white', '20000');
INSERT INTO `propertyitem` VALUES ('1007', '黑色', 'black', '20000');
INSERT INTO `propertyitem` VALUES ('1008', '绿色', 'green', '20000');
INSERT INTO `propertyitem` VALUES ('1009', '橙色', 'orange', '20000');
INSERT INTO `propertyitem` VALUES ('1010', '灰色', 'grey', '20000');
INSERT INTO `propertyitem` VALUES ('1011', '移动4G版', null, '20001');
INSERT INTO `propertyitem` VALUES ('1013', '16G', null, '20003');
INSERT INTO `propertyitem` VALUES ('1014', '64G', null, '20003');
INSERT INTO `propertyitem` VALUES ('1015', '移动5G版', null, '20001');
INSERT INTO `propertyitem` VALUES ('1017', '联通5G版', null, '20001');
INSERT INTO `propertyitem` VALUES ('1018', '玫瑰', 'rose', '20006');
INSERT INTO `propertyitem` VALUES ('1019', '百合', 'lily', '20006');
INSERT INTO `propertyitem` VALUES ('1020', '菊花', 'chrysanthemum', '20006');
INSERT INTO `propertyitem` VALUES ('1021', '月季', 'china rose', '20006');
INSERT INTO `propertyitem` VALUES ('1022', '满天星', 'babysbreath', '20006');
INSERT INTO `propertyitem` VALUES ('1023', '茉莉花', 'jasmine', '20006');
INSERT INTO `propertyitem` VALUES ('1024', '康乃馨', 'carnation', '20006');
INSERT INTO `propertyitem` VALUES ('1025', '丁香花', 'lilac', '20006');
INSERT INTO `propertyitem` VALUES ('1026', '牡丹', 'peony', '20006');
INSERT INTO `propertyitem` VALUES ('1027', '郁金香', 'tulip', '20006');
INSERT INTO `propertyitem` VALUES ('1029', '紫罗兰', 'violet', '20006');
INSERT INTO `propertyitem` VALUES ('1030', '勿忘我', 'forget me not', '20006');
INSERT INTO `propertyitem` VALUES ('1031', '水仙花', 'narcissus', '20006');
INSERT INTO `propertyitem` VALUES ('1032', '凤梨', 'pineapple', '20007');
INSERT INTO `propertyitem` VALUES ('1033', '桃子', 'peach', '20007');
INSERT INTO `propertyitem` VALUES ('1034', '杨桃', 'carambola', '20007');
INSERT INTO `propertyitem` VALUES ('1035', '樱桃', 'cherry', '20007');
INSERT INTO `propertyitem` VALUES ('1036', '柿子', 'persimmon', '20007');
INSERT INTO `propertyitem` VALUES ('1037', '浪漫人生', null, '20008');
INSERT INTO `propertyitem` VALUES ('1038', '生日祝福', null, '20008');
INSERT INTO `propertyitem` VALUES ('1040', '财源广进', null, '20008');
INSERT INTO `propertyitem` VALUES ('1041', 'L', 'large', '20004');
INSERT INTO `propertyitem` VALUES ('1042', 'M', 'middle', '20004');
INSERT INTO `propertyitem` VALUES ('1043', 'S', 'small', '20004');
INSERT INTO `propertyitem` VALUES ('1044', 'XL', null, '20004');
INSERT INTO `propertyitem` VALUES ('1045', 'XXL', null, '20004');
INSERT INTO `propertyitem` VALUES ('1046', '25', null, '20009');
INSERT INTO `propertyitem` VALUES ('1047', '26', null, '20009');
INSERT INTO `propertyitem` VALUES ('1048', '27', null, '20009');
INSERT INTO `propertyitem` VALUES ('1049', '28', null, '20009');
INSERT INTO `propertyitem` VALUES ('1050', '29', null, '20009');
INSERT INTO `propertyitem` VALUES ('1051', '30', null, '20009');
INSERT INTO `propertyitem` VALUES ('1052', '31', null, '20009');
INSERT INTO `propertyitem` VALUES ('1053', '32', null, '20009');
INSERT INTO `propertyitem` VALUES ('1054', '33', null, '20009');
INSERT INTO `propertyitem` VALUES ('1055', '束(10支装)', null, '20010');
INSERT INTO `propertyitem` VALUES ('1056', '支', null, '20010');
INSERT INTO `propertyitem` VALUES ('1057', '组合', null, '20006');
INSERT INTO `propertyitem` VALUES ('1058', '一往情深', null, '20008');
INSERT INTO `propertyitem` VALUES ('1059', '花开富贵', null, '20008');

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='省（直辖市）表';

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('10000', '广东省');
INSERT INTO `province` VALUES ('10001', '湖北省');
INSERT INTO `province` VALUES ('10002', '湖南省');
INSERT INTO `province` VALUES ('10003', '广西壮族自治区');
INSERT INTO `province` VALUES ('10009', '江西');
INSERT INTO `province` VALUES ('10011', '辽宁省');

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL COMMENT '所属市级ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_region_city` (`city_id`) USING BTREE,
  CONSTRAINT `FK_region_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90007 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='辖区表';

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('90000', '天河区', '80000');
INSERT INTO `region` VALUES ('90001', '荔湾区', '80000');
INSERT INTO `region` VALUES ('90002', '从化区', '80000');
INSERT INTO `region` VALUES ('90003', '黄埔区', '80000');
INSERT INTO `region` VALUES ('90004', '增城区', '80000');
INSERT INTO `region` VALUES ('90005', '花都区', '80000');
INSERT INTO `region` VALUES ('90006', '白云区', '80000');

-- ----------------------------
-- Table structure for `street`
-- ----------------------------
DROP TABLE IF EXISTS `street`;
CREATE TABLE `street` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(20) NOT NULL COMMENT '街道或社区名称',
  `town_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_street_town` (`town_id`),
  CONSTRAINT `FK_street_town` FOREIGN KEY (`town_id`) REFERENCES `town` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of street
-- ----------------------------
INSERT INTO `street` VALUES ('88000', '穗丰村', '66000');

-- ----------------------------
-- Table structure for `town`
-- ----------------------------
DROP TABLE IF EXISTS `town`;
CREATE TABLE `town` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NOT NULL,
  `region_id` int(11) NOT NULL COMMENT '乡镇所属区',
  PRIMARY KEY (`id`),
  KEY `FK_town_region` (`region_id`),
  CONSTRAINT `FK_town_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of town
-- ----------------------------
INSERT INTO `town` VALUES ('66000', '太和镇', '90005');
INSERT INTO `town` VALUES ('66001', '钟落潭镇', '90005');
