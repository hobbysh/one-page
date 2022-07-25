/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 127.0.0.1:3306
 Source Schema         : onepage

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 24/07/2022 23:17:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blocks
-- ----------------------------
DROP TABLE IF EXISTS `blocks`;
CREATE TABLE `blocks` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '父编号',
  `view` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL COMMENT '模块编码',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `img_alt` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图片alt',
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_class` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_target` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `orderby` int DEFAULT NULL COMMENT '模块排序方式',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '模块状态',
  `created` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=728 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='模块管理';

-- ----------------------------
-- Records of blocks
-- ----------------------------
BEGIN;
INSERT INTO `blocks` VALUES (722, 0, 'hero-01', 'hero', '潜意识直觉卡 NET+', '为更多人激发创造力和想象力，捕捉、提升自觉力，增进沟通和连结，打造OH卡线上体验、学习、交互的平台', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/ohcard.png', '', '', '', '', '', '', 0, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `blocks` VALUES (723, 0, 'features-01', 'features', '小程序 语音引导体验', '多种模式探索与交流，激发创造力和想象力，捕捉和提升自觉力，增进沟通和连结。', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/features2.svg', '', '立刻体验', 'https://ohcard-2g0qmhqf26a1301d-1257029016.tcloudbaseapp.com/jump-mp.html', 'getstarted', '_blank', 'link', 10, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `blocks` VALUES (724, 0, 'testimonials-01', 'testimonials', '圈子打卡', NULL, NULL, NULL, '', NULL, NULL, NULL, '', 20, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `blocks` VALUES (725, 0, 'blog-01', 'elearning', '了解OH卡', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `blocks` VALUES (726, 0, 'gallery-01', 'gallery', '公众号抽卡', '通过发送关键词或者识别二维码，快速抽取一张或者多张的图卡组合来进行潜意识对话', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `blocks` VALUES (727, 0, 'features-02', 'features2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, '1', '2008-01-01 00:00:00', '2008-01-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT COMMENT '参数ID',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户编号[0:系统]',
  `group_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '参数组',
  `subgroup_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '参数名\r\n\r\n称',
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '参数类型',
  `name` varchar(50) NOT NULL,
  `value` text,
  `options` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `readonly` int NOT NULL DEFAULT '0' COMMENT '是否只读，0不是，1是',
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态：0.无效;1.有效',
  `orderby` int unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `created` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `store_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=827 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of configs
-- ----------------------------
BEGIN;
INSERT INTO `configs` VALUES (218, 0, 'content', 'base', 'title', 'text', '标题', 'OH卡在线', NULL, NULL, 0, '1', 10, '2009-02-24 07:39:09', '2017-04-28 11:11:21');
INSERT INTO `configs` VALUES (234, 0, 'content', 'base', 'logo', 'image', 'LOGO图片', '', NULL, NULL, 0, '1', 21, '2009-02-24 07:51:53', '2017-03-07 16:48:36');
INSERT INTO `configs` VALUES (241, 0, 'content', 'base', 'icp_number', 'text', 'ICP备案号', '沪ICP备17049273号-2', NULL, NULL, 0, '1', 90, '2009-02-24 08:09:49', '2017-04-28 11:11:27');
INSERT INTO `configs` VALUES (427, 0, 'website', 'website_advance', 'version', 'text', '', NULL, NULL, NULL, 0, '0', 140, '2009-05-19 06:23:46', '2016-06-07 16:46:03');
INSERT INTO `configs` VALUES (529, 0, 'website', 'base', 'icon', 'image', 'ICON', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/logo.png', NULL, NULL, 0, '1', 22, '2008-01-01 00:00:00', '2017-03-11 16:20:09');
INSERT INTO `configs` VALUES (572, 0, 'website', 'base', 'tongji_js', 'textarea', '统计代码', 'var _hmt = _hmt || [];\n(function() {\nvar hm = document.createElement(\"script\");\nhm.src = \"https://hm.baidu.com/hm.js?e0dc13bd357cf0e6e2694cc671cafeb6\";\nvar s = document.getElementsByTagName(\"script\")[0]; \ns.parentNode.insertBefore(hm, s);\n})();', NULL, NULL, 0, '1', 900, '2008-01-01 00:00:00', '2017-04-28 11:05:42');
INSERT INTO `configs` VALUES (584, 0, 'website', 'emailsever', 'mail-setting', 'radio', '', NULL, NULL, NULL, 0, '0', 10, '2008-01-01 00:00:00', '2014-10-21 16:09:38');
INSERT INTO `configs` VALUES (585, 0, 'website', 'emailsever', 'mail-method', 'radio', '', NULL, NULL, NULL, 0, '0', 20, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (586, 0, 'website', 'emailsever', 'mail-service', 'radio', '', NULL, NULL, NULL, 0, '0', 30, '2008-01-01 00:00:00', '2014-11-14 14:16:13');
INSERT INTO `configs` VALUES (587, 0, 'website', 'emailsever', 'mail-ssl', 'radio', '', NULL, NULL, NULL, 0, '0', 40, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (588, 0, 'website', 'emailsever', 'mail-smtp', 'text', '', NULL, NULL, NULL, 0, '0', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (589, 0, 'website', 'emailsever', 'mail-port', 'text', '', NULL, NULL, NULL, 0, '0', 60, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (590, 0, 'website', 'emailsever', 'mail-account', 'text', '', NULL, NULL, NULL, 0, '0', 70, '2008-01-01 00:00:00', '2014-10-21 16:11:14');
INSERT INTO `configs` VALUES (591, 0, 'website', 'emailsever', 'mail-password', 'text', '', NULL, NULL, NULL, 0, '0', 80, '2008-01-01 00:00:00', '2014-10-21 16:11:54');
INSERT INTO `configs` VALUES (592, 0, 'website', 'emailsever', 'mail-readdess', 'text', '', NULL, NULL, NULL, 0, '0', 90, '2008-01-01 00:00:00', '2014-10-21 16:12:21');
INSERT INTO `configs` VALUES (593, 0, 'website', 'emailsever', 'mail-encode', 'radio', '', NULL, NULL, NULL, 0, '0', 100, '2008-01-01 00:00:00', '2014-11-14 13:45:48');
INSERT INTO `configs` VALUES (594, 0, 'website', 'emailsever', 'mail-address', 'text', '', NULL, NULL, NULL, 0, '0', 110, '2008-01-01 00:00:00', '2014-10-21 16:12:47');
INSERT INTO `configs` VALUES (595, 0, 'website', 'emailsever', 'mail-notic', 'text', '', NULL, NULL, NULL, 0, '0', 120, '2008-01-01 00:00:00', '2014-12-23 10:32:35');
INSERT INTO `configs` VALUES (596, 0, 'website', 'emailsever', 'mail-email', 'send_email_test', '', NULL, NULL, NULL, 0, '0', 130, '2008-01-01 00:00:00', '2014-10-23 10:41:17');
INSERT INTO `configs` VALUES (598, 0, 'website', 'sms', 'sms_kanal', 'radio', '', NULL, NULL, NULL, 0, '0', 10, '2008-01-01 00:00:00', '2016-09-26 12:53:45');
INSERT INTO `configs` VALUES (599, 0, 'website', 'sms', 'sms_parameter3', 'text', '', NULL, NULL, NULL, 0, '0', 40, '2008-01-01 00:00:00', '2016-07-28 14:06:31');
INSERT INTO `configs` VALUES (600, 0, 'website', 'sms', 'sms_parameter1', 'text', '', NULL, NULL, NULL, 0, '0', 20, '2008-01-01 00:00:00', '2016-07-28 14:06:30');
INSERT INTO `configs` VALUES (601, 0, 'website', 'sms', 'sms_parameter2', 'text', '', NULL, NULL, NULL, 0, '0', 30, '2008-01-01 00:00:00', '2016-07-28 14:06:30');
INSERT INTO `configs` VALUES (607, 0, 'website', 'base', 'meta_description', 'text', 'META描述', 'OH卡在线,为更多人激发创造力和想象力，捕捉、提升自觉力，增进沟通和连结，打造OH卡线上体验、学习、交互的平台', NULL, NULL, 0, '1', 191, '2008-01-01 00:00:00', '2014-11-19 10:30:08');
INSERT INTO `configs` VALUES (608, 0, 'website', 'base', 'meta_keywords', 'text', 'META关键字', '线上OH卡,线上欧卡,OH卡视频,OH卡游戏,OH卡教练,OH卡工具,潜意识直觉卡,潜意识投射卡', NULL, NULL, 0, '1', 190, '2008-01-01 00:00:00', '2014-11-19 10:29:51');
INSERT INTO `configs` VALUES (610, 0, 'content', 'base', 'email', 'text', '邮箱', 'info@ohcard.cn', NULL, NULL, 0, '1', 60, '2008-01-01 00:00:00', '2014-10-21 15:40:31');
INSERT INTO `configs` VALUES (611, 0, 'website', 'website_base', 'zipcode', 'text', '', NULL, NULL, NULL, 0, '0', 70, '2008-01-01 00:00:00', '2014-10-21 15:41:29');
INSERT INTO `configs` VALUES (613, 0, 'website', 'website_base', 'tel', 'text', '', NULL, NULL, NULL, 0, '0', 40, '2008-01-01 00:00:00', '2014-10-21 15:39:32');
INSERT INTO `configs` VALUES (616, 0, 'content', 'base', 'officail_account_img', 'text', '公众号二维码', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/official-account.jpg', NULL, NULL, 0, '1', 71, '2008-01-01 00:00:00', '2014-10-21 15:43:28');
INSERT INTO `configs` VALUES (716, 0, 'website', 'base', 'head_content', 'textarea', '自定义HEAD', '', NULL, NULL, 0, '1', 210, '2015-03-31 13:09:28', '2017-04-28 11:04:43');
INSERT INTO `configs` VALUES (725, 0, 'website', 'emailsever', 'mail-requires-authorization', 'radio', '', NULL, NULL, NULL, 0, '0', 69, '2015-08-26 09:54:31', '2015-08-26 09:54:31');
INSERT INTO `configs` VALUES (735, 0, 'website', 'sms', 'sms-signature', 'text', '', NULL, NULL, NULL, 0, '0', 50, '2016-02-23 14:06:15', '2016-07-28 14:06:32');
INSERT INTO `configs` VALUES (780, 0, 'website', 'base', 'technical_support', 'text', '技术支持', '', NULL, NULL, 0, '0', 120, '2017-04-28 11:18:27', '2017-04-28 11:18:27');
INSERT INTO `configs` VALUES (781, 0, 'website', 'base', 'beiangov', 'text', '公安备案', '', NULL, NULL, 0, '0', 100, '2017-04-28 11:23:16', '2017-04-28 11:23:16');
INSERT INTO `configs` VALUES (810, 0, 'website', 'website_advance', 'QcloudSecretId', 'text', '', NULL, NULL, NULL, 0, '0', 50, '2020-02-05 21:46:57', '2020-02-05 21:46:57');
INSERT INTO `configs` VALUES (811, 0, 'website', 'website_advance', 'QcloudSecretKey', 'text', '', NULL, NULL, NULL, 0, '0', 50, '2020-02-05 21:47:36', '2020-02-05 21:47:36');
INSERT INTO `configs` VALUES (812, 0, 'content', 'base', 'logo_name', 'text', 'LOGO文字', 'OH卡在线', NULL, NULL, 0, '1', 20, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (813, 0, 'content', 'base', 'copyright', 'text', '版权', 'OH卡在线', NULL, NULL, 0, '1', 80, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (814, 0, 'content', 'base', 'officail_account_name', 'text', '公众号名称', 'OH卡在线公众号', NULL, NULL, 0, '1', 70, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (815, 0, 'wechatShare', 'base', 'wechat_share', 'radio', '启用微信公众号分享', '1', '{\"1\":\"有效\",\"0\":\"无效\"}', NULL, 0, '1', 10, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (816, 0, 'wechatShare', 'base', 'wechat_share_api', 'text', '授权URL', 'https://api.ohcard.cn/wechat/server/getSignPackage', NULL, NULL, 0, '1', 20, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (819, 0, 'wechatShare', 'message', 'wxm_title', 'text', '标题', 'OH卡在线', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (820, 0, 'wechatShare', 'message', 'wxm_desc', 'text', '分享描述', '为更多人激发创造力和想象力，捕捉、提升自觉力，增进沟通和连结，打造OH卡线上体验、学习、交互的平台', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (821, 0, 'wechatShare', 'message', 'wxm_link', 'text', '分享链接地址', 'https://www.ohcard.cn/new/', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (822, 0, 'wechatShare', 'message', 'wxm_imgUrl', 'text', '分享图片', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/logo.jpg', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (823, 0, 'wechatShare', 'timeline', 'wxt_title', 'text', '朋友圈标题', 'OH卡在线 - OH卡线上体验、学习、交互的平台', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (825, 0, 'wechatShare', 'timeline', 'wxt_imgUrl', 'text', '朋友圈图片', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/logo.jpg', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `configs` VALUES (826, 0, 'wechatShare', 'timeline', 'wxt_link', 'text', '朋友圈链接地址', 'https://www.ohcard.cn/new/', NULL, NULL, 0, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '上级菜单编号',
  `user_id` int NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '连接地址',
  `class` varchar(50) DEFAULT NULL,
  `target` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态[0:无效;1:有效;]',
  `orderby` tinyint NOT NULL DEFAULT '50' COMMENT '排序',
  `created` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=128678 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of links
-- ----------------------------
BEGIN;
INSERT INTO `links` VALUES (2, 0, 0, 'menu', '首页', '', '#hero', '', '', '1', 0, '2008-01-01 00:00:00', '2019-12-22 16:43:59');
INSERT INTO `links` VALUES (4, 0, 0, 'menu', '小程序体验', NULL, '#features', NULL, '', '1', 10, '2008-01-01 00:00:00', '2019-12-22 16:41:33');
INSERT INTO `links` VALUES (5, 0, 0, 'menu', '了解OH卡', NULL, '#elearning', NULL, '', '1', 20, '2008-01-01 00:00:00', '2019-12-22 16:43:12');
INSERT INTO `links` VALUES (8, 0, 0, 'menu', '公众号抽卡', NULL, '#gallery', NULL, '', '1', 30, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (29, 0, 0, 'menu', '虚拟空间', NULL, '#cardspace', NULL, '', '1', 40, '2008-01-01 00:00:00', '2015-03-20 10:51:19');
INSERT INTO `links` VALUES (30, 0, 0, 'menu', '故事接龙', NULL, '#story', NULL, '', '1', 50, '2008-01-01 00:00:00', '2009-08-13 06:24:14');
INSERT INTO `links` VALUES (31, 0, 0, 'menu', '群名片', NULL, '#groupcard', NULL, '', '1', 60, '2008-01-01 00:00:00', '2017-02-07 21:32:43');
INSERT INTO `links` VALUES (33, 0, 0, 'menu', '灵魂匹配', NULL, '#soulmatch', NULL, '', '1', 70, '2008-01-01 00:00:00', '2017-02-07 21:32:55');
INSERT INTO `links` VALUES (34, 0, 0, 'menu', '开始体验', NULL, 'https://ohcard-2g0qmhqf26a1301d-1257029016.tcloudbaseapp.com/jump-mp.html', 'getstarted', '_blank', '1', 80, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128663, 0, 0, 'link', '首页', NULL, '#', NULL, '', '1', 60, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128664, 0, 0, 'link', 'OH-Card.com', NULL, 'https://oh-cards.com/', NULL, '_blank', '1', 70, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128665, 0, 0, 'service', 'OH卡培训认证', NULL, '', NULL, '', '1', 80, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128666, 0, 0, 'service', '心理咨询师培训认证', NULL, '', NULL, '', '1', 90, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128667, 0, 0, 'service', '证书查询', NULL, '', NULL, '', '1', 100, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `links` VALUES (128668, 0, 0, 'service', 'API', NULL, '', NULL, '', '1', 110, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for nodes
-- ----------------------------
DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
  `block_id` int NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_class` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_target` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `delay` int DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0:无效;1:有效;2:删除',
  `orderby` tinyint NOT NULL DEFAULT '50' COMMENT '排序',
  `created` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '创建时间',
  `modified` datetime NOT NULL DEFAULT '2008-01-01 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nodes
-- ----------------------------
BEGIN;
INSERT INTO `nodes` VALUES (1, 723, NULL, '每日OH卡对话', '通过抽取一张图卡，与潜意识产生链接，与自我进行对话，走近自己。', 'calendar', NULL, NULL, NULL, NULL, NULL, 0, '1', 10, '2018-06-11 13:27:45', '2021-11-15 08:59:16');
INSERT INTO `nodes` VALUES (2, 723, NULL, '遇见自己', '通过选取卡牌，探索自我的不同部分，进行图形连接，有效整合自我，让你看到一个更全面、多样的自己！', 'cube-alt', NULL, NULL, NULL, NULL, NULL, 100, '1', 20, '2020-01-22 15:19:13', '2020-01-22 15:19:13');
INSERT INTO `nodes` VALUES (3, 723, NULL, '自愈之旅', '压力山大？和自己对话吧，展开一场自愈之旅', 'heart', NULL, NULL, NULL, NULL, NULL, 200, '1', 30, '2020-01-22 16:34:34', '2020-01-22 16:34:34');
INSERT INTO `nodes` VALUES (4, 723, NULL, '释放压力、轻松心灵', '一枚神奇的“钓钩”，钩拉、呈现出我们外部、内在的各种讯息，带领我们去探索、感受、处理和整合。', 'shield', NULL, NULL, NULL, NULL, NULL, 300, '1', 40, '2020-01-28 09:40:56', '2021-12-11 08:56:49');
INSERT INTO `nodes` VALUES (5, 723, NULL, '时间之旅', '通过抽取一张图卡，带领我们进入一个崭新而安全的探险。', 'atom', NULL, NULL, NULL, NULL, NULL, 400, '1', 50, '2020-08-27 12:55:21', '2020-08-27 13:14:23');
INSERT INTO `nodes` VALUES (6, 723, NULL, '限时开放', '新年规划，英雄之旅，母亲节的礼物，金钱关系探索', 'lock-alt', NULL, NULL, NULL, NULL, NULL, 500, '1', 60, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (7, 724, '', '小梦', '忙碌忙碌 无法静下心去欣赏美景。每个假期都能够很好地调适心情 一旦投入到繁忙的工作中 好像就会忘记那些最初的期望', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIve3YOvX2ZrDaZbloSoJYKML2icDlT5BH71x6Ew04aOohEDLD6Eq8kMSC8YNt4tDiciciaZ8yvohx8AQ/132', '', '', '', '', '', 0, '1', 50, '2022-06-29 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (8, 724, NULL, '汐', '特别的舒服，特别的爽，是那种自由的感觉，翱翔天空，然后自由自在的，视线也特别的好，就是那种，嗯，会当凌绝顶，一览众山小。就觉得这样没有任何的阻碍，嗯，能够在做自己特别喜欢的事情，展开自己的翅膀，翱翔在自己喜欢的天空里，好快乐呀。\n	              我可能是各个方面，正在向这只鸟学习，就是在自己喜欢的兴趣爱好上面，投入一定的精力，然后去学习成长，嗯，然后就，嗯，希望嗯自己也是可以做什么事情都勇敢翱翔吧，你可以的，加油~~你没问题哟，自由自在', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJULVoOM5rdjfh5vP0uV1mhH2g75quvd01AA8GyOctBbbNSsgG9eC40e70IkAVXJZcllaL2mFgNzw/132', NULL, NULL, NULL, NULL, NULL, NULL, '1', 50, '2022-06-29 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (9, 724, NULL, '🌼 汵煦🌼', '我在看画的时候，不知不觉，已经成为别人眼中的风景。\n	              我看画看得入迷，一旦发觉被别的目光锁定，就不会专心看景，而是，努力调整好姿态，展现自认为最好的一面，却忘了，其实，能吸引的往往是自己最专注的那一刻卡牌说：不必在意，心之向往皆美。我说：这么简单的事情，我只有此刻才知晓。', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLrbyvyBdlQfOUjpYibdTKp3r7FnwCt9OgtC9y6ibBkI7ylR2CicGDYQYNlhDDbLiaOPf39PvCEmHxUDg/132', NULL, NULL, NULL, NULL, NULL, NULL, '1', 50, '2022-06-28 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (10, 724, NULL, '念下', '敞开能量的牢笼或许能收获更多的解决办法', 'https://thirdwx.qlogo.cn/mmopen/vi_32/J2hXoOYL2J21Dicj9Y0SSmBeVkI6IW6E7pZo32nvZ9nS4udbrwrzIr4c56yxrSIYsJh5kKWUxwgibx1w15XUOlzg/132', NULL, NULL, NULL, NULL, NULL, NULL, '1', 50, '2022-06-27 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (11, 724, NULL, '翠皮妈', '这里有很多人挤压在一起，空间很窄，空气很不好，喘不过气。方法就是离开这里，直到呼吸到新鲜的空气\n	              停止，不要！\n	              特质就是自由自在，应对就是展翅高飞吧！\n	              走出去吧，不要再逼迫自己了！', 'https://thirdwx.qlogo.cn/mmopen/vi_32/uAcZrdmmxXbnibsNxYoUH2BzWZvrIW6SiaBy40NsbagnvbKTYKghRznaDriaslLHLrPdxTddpt40EfZPtiacQutg2Q/132', NULL, NULL, NULL, NULL, NULL, NULL, '1', 50, '2022-06-27 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (12, 725, NULL, '走进OH卡', '由一位加拿大的心理咨询师Moritz Egetmeyer和一位墨西哥裔的艺术家 Ely Raman 共同研发的一种心理学的投射工具。', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/video/v01.png', 'https://v.qq.com/txp/iframe/player.html?vid=u33456mo1kv', '观看视频', 'play-circle', NULL, NULL, 100, '1', 10, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (13, 725, NULL, 'OH卡内涵与使用礼节', '没有牌意，每张图卡没有固定含义；没有对错，放下关于是非评判的惯性标准，如实地呈现自我。', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/video/v02.png', 'https://v.qq.com/txp/iframe/player.html?vid=u33452b9w4x', '观看视频', 'play-circle', NULL, NULL, 200, '1', 20, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (14, 725, NULL, 'OH卡应用', '可以是一个人的自我对话，走近真实内心。可以和朋友聚会当做游戏玩，交流情感与想法。', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/video/v03.png', 'https://v.qq.com/txp/iframe/player.html?vid=v33456epkd3', '观看视频', 'play-circle', NULL, NULL, 300, '1', 30, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (15, 725, NULL, 'OH卡使用技巧', '开放式提问，具体引导式提问；也可以有牌阵，可以依据具体状况灵活运用', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/video/v04.png', 'https://v.qq.com/txp/iframe/player.html?vid=s3345ir56ba', '观看视频', 'play-circle', NULL, NULL, 400, '1', 40, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (16, 726, NULL, NULL, NULL, 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-1.jpg', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-1.jpg', NULL, NULL, NULL, NULL, NULL, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (17, 726, NULL, NULL, NULL, 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-2.jpg', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-2.jpg', NULL, NULL, NULL, NULL, NULL, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (18, 726, NULL, NULL, NULL, 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-3.jpg', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-3.jpg', NULL, NULL, NULL, NULL, NULL, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (19, 726, NULL, NULL, NULL, 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-4.jpg', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-4.jpg', NULL, NULL, NULL, NULL, NULL, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (20, 726, NULL, NULL, NULL, 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-5.jpg', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/gallery/gallery-5.jpg', NULL, NULL, NULL, NULL, NULL, '1', 50, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (21, 727, 'cardspace', '虚拟空间', '<p class=\"fst-italic\">\r\n              由带领者创建并主导，多名参与者一起使用的互动模式。在虚拟空间中，带领者可以邀请参与者选卡，抽卡，以及摆卡，创建一个在线使用卡牌的虚拟环境。\r\n            </p>\r\n            <ul>\r\n              <li><i class=\"bi bi-check\"></i> 单人模式</li>\r\n              <li><i class=\"bi bi-check\"></i> 1V1 语音视频</li>\r\n              <li><i class=\"bi bi-check\"></i> 多人互动 直播辅助工具</li>\r\n              <!--<li><i class=\"bi bi-check\"></i> Est ipsa assumenda id facilis nesciunt placeat sed doloribus praesentium.</li>-->\r\n            </ul>\r\n            <p>\r\n              可以设置图卡大小，显示所有人的头像，根据不同模式显示图卡等\r\n            </p>', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/details-1.png', 'https://ohcard-2g0qmhqf26a1301d-1257029016.tcloudbaseapp.com/jump-mp2.html', '立即体验', 'link', 'getstarted', '_blank', NULL, '1', 10, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (22, 727, 'story', '五图故事接龙', '<p class=\"fst-italic\">\r\n              根据5张图卡构思一段剧情，每张卡接着上一段剧情发展，形成一个多种元素融合的故事\r\n            </p>\r\n            <p>\r\n              OH卡可以刺激我们发挥创造力和想象力，促进认知，增强自我觉察，亲近自己的潜意识，训练我们的倾听和理解能力，增强我们真正听取对方意见的能力，也可以帮助我们交流感情、观念、心理，找到解决困惑的途径和方法，发掘自己的潜能。\n            </p>\r\n            <p>\r\n              而学习讲故事，既能锻炼你清晰的逻辑架构能力，又能加强你细腻的情感共鸣能力。沟通高手，说服大师，销售冠军等，往往都是讲故事的高手。\n			</p>', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/details-2.png', NULL, NULL, NULL, NULL, NULL, NULL, '1', 20, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (23, 727, 'groupcard', '微信群名片', '<p>OH卡群名片是使用一张与自己产生联接的图卡代表自己，并告诉大家选这张图卡的缘由，可以让指定群友对你有个深刻的认识，加深彼此的了解。</p>\r\n            <ul>\r\n              <li><i class=\"bi bi-check\"></i> 团队建设</li>\r\n              <li><i class=\"bi bi-check\"></i> 学习小组</li>\r\n              <li><i class=\"bi bi-check\"></i> 相亲交友</li>\r\n            </ul>\r\n            <p>\r\n              不同群可以选择不同的图卡，写入不一样的信息。\r\n            </p>\r\n            <p>\r\n              使用方法： 将本页分享到微信群，通过群的入口进入到该群的群名片中，选则图卡及填写自己信息，查看群中其他人的信息。\r\n            </p>', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/details-3.png', NULL, NULL, NULL, NULL, NULL, NULL, '1', 30, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
INSERT INTO `nodes` VALUES (24, 727, NULL, '灵魂匹配', '<p class=\"fst-italic\">\r\n              好看的皮囊千篇一律，有趣的灵魂万里挑一。\r\n            </p>\r\n            <p>互为灵魂伴侣的人，智识和认知水平是相当的，所以总能带给彼此一些深度的启发与思考一这些启发往往正好是彼此想要的或正在困惑的。</p>\r\n            <p>\r\n              互为灵魂伴侣的人，常常能感觉到彼此之间有一种不言自明的默契和同频的联结感，那些未说出口的话， Ta 总能 GET 到你的意思。这种精神上的同频联结，会带来一种强烈的狂喜。那种幸福和愉悦，甚至会超越热恋中的爱情。            </p>\r\n            <ul>\r\n              <li><i class=\"bi bi-check\"></i> 情绪篇</li>\r\n              <li><i class=\"bi bi-check\"></i> 压力篇</li>\r\n              <li><i class=\"bi bi-check\"></i> 爱是什么</li>\r\n            </ul>', 'https://ohcard-1257029016.cos.ap-shanghai.myqcloud.com/assets/img/details-4.png', NULL, NULL, NULL, NULL, NULL, NULL, '1', 40, '2008-01-01 00:00:00', '2008-01-01 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for sections
-- ----------------------------
DROP TABLE IF EXISTS `sections`;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci DEFAULT NULL,
  `view` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1 有效 0 无效',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sections
-- ----------------------------
BEGIN;
INSERT INTO `sections` VALUES (1, '故事01', 'hero-01', '1', '2014-10-11 14:31:58', '2017-05-27 09:57:53');
INSERT INTO `sections` VALUES (2, '特色01', 'features-01', '1', '2014-10-11 14:33:11', '2014-10-11 14:33:11');
INSERT INTO `sections` VALUES (3, '推荐词01', 'testimonials-01', '1', '2014-11-03 14:01:16', '2014-11-03 14:01:16');
INSERT INTO `sections` VALUES (4, '博客01', 'blog-01', '1', '2014-11-05 10:35:26', '2014-11-05 10:35:26');
INSERT INTO `sections` VALUES (5, '相册01', 'gallery-01', '1', '2014-11-05 13:13:35', '2014-11-05 13:13:35');
INSERT INTO `sections` VALUES (6, '特色02', 'features-02', '1', '2014-11-05 14:12:27', '2014-11-05 14:12:27');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
