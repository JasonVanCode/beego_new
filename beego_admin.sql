/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 100605
 Source Host           : localhost:3306
 Source Schema         : beego_admin

 Target Server Type    : MySQL
 Target Server Version : 100605
 File Encoding         : 65001

 Date: 01/03/2022 10:36:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) NOT NULL COMMENT '用户',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'URL',
  `log_method` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '不记录' COMMENT '记录日志方法',
  `log_ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '操作IP',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '操作时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台操作日志';

-- ----------------------------
-- Records of admin_log
-- ----------------------------
BEGIN;
INSERT INTO `admin_log` VALUES (1036, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-13 15:45:45', '2021-11-13 15:45:45');
INSERT INTO `admin_log` VALUES (1037, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 09:30:24', '2021-11-15 09:30:24');
INSERT INTO `admin_log` VALUES (1038, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 09:31:20', '2021-11-15 09:31:20');
INSERT INTO `admin_log` VALUES (1039, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 09:34:00', '2021-11-15 09:34:00');
INSERT INTO `admin_log` VALUES (1040, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 09:53:00', '2021-11-15 09:53:00');
INSERT INTO `admin_log` VALUES (1041, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 10:45:30', '2021-11-15 10:45:30');
INSERT INTO `admin_log` VALUES (1042, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 13:12:15', '2021-11-15 13:12:15');
INSERT INTO `admin_log` VALUES (1043, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 13:12:34', '2021-11-15 13:12:34');
INSERT INTO `admin_log` VALUES (1044, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-15 14:27:45', '2021-11-15 14:27:45');
INSERT INTO `admin_log` VALUES (1045, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 08:58:37', '2021-11-16 08:58:37');
INSERT INTO `admin_log` VALUES (1046, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:42:28', '2021-11-16 10:42:28');
INSERT INTO `admin_log` VALUES (1047, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:43:34', '2021-11-16 10:43:34');
INSERT INTO `admin_log` VALUES (1048, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:44:22', '2021-11-16 10:44:22');
INSERT INTO `admin_log` VALUES (1049, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:45:39', '2021-11-16 10:45:39');
INSERT INTO `admin_log` VALUES (1050, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:46:05', '2021-11-16 10:46:05');
INSERT INTO `admin_log` VALUES (1051, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:46:49', '2021-11-16 10:46:49');
INSERT INTO `admin_log` VALUES (1052, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:47:52', '2021-11-16 10:47:52');
INSERT INTO `admin_log` VALUES (1053, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:50:53', '2021-11-16 10:50:53');
INSERT INTO `admin_log` VALUES (1054, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:51:52', '2021-11-16 10:51:52');
INSERT INTO `admin_log` VALUES (1055, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 10:55:53', '2021-11-16 10:55:53');
INSERT INTO `admin_log` VALUES (1056, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 11:08:51', '2021-11-16 11:08:51');
INSERT INTO `admin_log` VALUES (1057, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 11:15:18', '2021-11-16 11:15:18');
INSERT INTO `admin_log` VALUES (1058, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 17:09:54', '2021-11-16 17:09:54');
INSERT INTO `admin_log` VALUES (1059, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-16 17:10:37', '2021-11-16 17:10:37');
INSERT INTO `admin_log` VALUES (1060, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 10:17:29', '2021-11-17 10:17:29');
INSERT INTO `admin_log` VALUES (1061, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 10:18:58', '2021-11-17 10:18:58');
INSERT INTO `admin_log` VALUES (1062, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 10:24:21', '2021-11-17 10:24:21');
INSERT INTO `admin_log` VALUES (1063, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 10:42:33', '2021-11-17 10:42:33');
INSERT INTO `admin_log` VALUES (1064, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 10:46:03', '2021-11-17 10:46:03');
INSERT INTO `admin_log` VALUES (1065, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-17 16:24:00', '2021-11-17 16:24:00');
INSERT INTO `admin_log` VALUES (1066, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-18 09:06:18', '2021-11-18 09:06:18');
INSERT INTO `admin_log` VALUES (1067, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-20 13:55:46', '2021-11-20 13:55:46');
INSERT INTO `admin_log` VALUES (1068, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-20 16:44:08', '2021-11-20 16:44:08');
INSERT INTO `admin_log` VALUES (1069, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-23 09:02:01', '2021-11-23 09:02:01');
INSERT INTO `admin_log` VALUES (1070, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-24 11:16:57', '2021-11-24 11:16:57');
INSERT INTO `admin_log` VALUES (1071, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-24 13:22:16', '2021-11-24 13:22:16');
INSERT INTO `admin_log` VALUES (1072, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-24 13:22:40', '2021-11-24 13:22:40');
INSERT INTO `admin_log` VALUES (1073, 2, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-25 08:39:47', '2021-11-25 08:39:47');
INSERT INTO `admin_log` VALUES (1074, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:09:34', '2021-11-27 16:09:34');
INSERT INTO `admin_log` VALUES (1075, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:13:16', '2021-11-27 16:13:16');
INSERT INTO `admin_log` VALUES (1076, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:14:19', '2021-11-27 16:14:19');
INSERT INTO `admin_log` VALUES (1077, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:15:50', '2021-11-27 16:15:50');
INSERT INTO `admin_log` VALUES (1078, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:18:13', '2021-11-27 16:18:13');
INSERT INTO `admin_log` VALUES (1079, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:32:19', '2021-11-27 16:32:19');
INSERT INTO `admin_log` VALUES (1080, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:32:27', '2021-11-27 16:32:27');
INSERT INTO `admin_log` VALUES (1081, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:34:27', '2021-11-27 16:34:27');
INSERT INTO `admin_log` VALUES (1082, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:36:08', '2021-11-27 16:36:08');
INSERT INTO `admin_log` VALUES (1083, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:46:17', '2021-11-27 16:46:17');
INSERT INTO `admin_log` VALUES (1084, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:53:51', '2021-11-27 16:53:51');
INSERT INTO `admin_log` VALUES (1085, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 16:58:40', '2021-11-27 16:58:40');
INSERT INTO `admin_log` VALUES (1086, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 17:01:22', '2021-11-27 17:01:22');
INSERT INTO `admin_log` VALUES (1087, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-27 17:10:05', '2021-11-27 17:10:05');
INSERT INTO `admin_log` VALUES (1088, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-29 09:11:02', '2021-11-29 09:11:02');
INSERT INTO `admin_log` VALUES (1089, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-29 10:12:36', '2021-11-29 10:12:36');
INSERT INTO `admin_log` VALUES (1090, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-29 10:53:01', '2021-11-29 10:53:01');
INSERT INTO `admin_log` VALUES (1091, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-11-29 11:11:28', '2021-11-29 11:11:28');
INSERT INTO `admin_log` VALUES (1092, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-03 10:33:03', '2021-12-03 10:33:03');
INSERT INTO `admin_log` VALUES (1093, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:38:27', '2021-12-06 08:38:27');
INSERT INTO `admin_log` VALUES (1094, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 08:41:35', '2021-12-06 08:41:35');
INSERT INTO `admin_log` VALUES (1095, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:41:35', '2021-12-06 08:41:35');
INSERT INTO `admin_log` VALUES (1096, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:43:15', '2021-12-06 08:43:15');
INSERT INTO `admin_log` VALUES (1097, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:44:13', '2021-12-06 08:44:13');
INSERT INTO `admin_log` VALUES (1098, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:45:26', '2021-12-06 08:45:26');
INSERT INTO `admin_log` VALUES (1099, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:46:05', '2021-12-06 08:46:05');
INSERT INTO `admin_log` VALUES (1100, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:50:30', '2021-12-06 08:50:30');
INSERT INTO `admin_log` VALUES (1101, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 08:51:52', '2021-12-06 08:51:52');
INSERT INTO `admin_log` VALUES (1102, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:51:52', '2021-12-06 08:51:52');
INSERT INTO `admin_log` VALUES (1103, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:52:02', '2021-12-06 08:52:02');
INSERT INTO `admin_log` VALUES (1104, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 08:55:20', '2021-12-06 08:55:20');
INSERT INTO `admin_log` VALUES (1105, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 09:09:04', '2021-12-06 09:09:04');
INSERT INTO `admin_log` VALUES (1106, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 09:09:05', '2021-12-06 09:09:05');
INSERT INTO `admin_log` VALUES (1107, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 09:11:05', '2021-12-06 09:11:05');
INSERT INTO `admin_log` VALUES (1108, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 09:11:05', '2021-12-06 09:11:05');
INSERT INTO `admin_log` VALUES (1109, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 09:13:13', '2021-12-06 09:13:13');
INSERT INTO `admin_log` VALUES (1110, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 09:13:13', '2021-12-06 09:13:13');
INSERT INTO `admin_log` VALUES (1111, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 09:14:28', '2021-12-06 09:14:28');
INSERT INTO `admin_log` VALUES (1112, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 09:14:28', '2021-12-06 09:14:28');
INSERT INTO `admin_log` VALUES (1113, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 09:17:38', '2021-12-06 09:17:38');
INSERT INTO `admin_log` VALUES (1114, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 09:17:38', '2021-12-06 09:17:38');
INSERT INTO `admin_log` VALUES (1115, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 13:52:05', '2021-12-06 13:52:05');
INSERT INTO `admin_log` VALUES (1116, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 13:52:05', '2021-12-06 13:52:05');
INSERT INTO `admin_log` VALUES (1117, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 13:54:28', '2021-12-06 13:54:28');
INSERT INTO `admin_log` VALUES (1118, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 13:54:28', '2021-12-06 13:54:28');
INSERT INTO `admin_log` VALUES (1119, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 13:55:51', '2021-12-06 13:55:51');
INSERT INTO `admin_log` VALUES (1120, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 13:55:51', '2021-12-06 13:55:51');
INSERT INTO `admin_log` VALUES (1121, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 13:56:36', '2021-12-06 13:56:36');
INSERT INTO `admin_log` VALUES (1122, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 13:56:36', '2021-12-06 13:56:36');
INSERT INTO `admin_log` VALUES (1123, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 13:57:18', '2021-12-06 13:57:18');
INSERT INTO `admin_log` VALUES (1124, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 13:57:18', '2021-12-06 13:57:18');
INSERT INTO `admin_log` VALUES (1125, 1, '登录', '/admin/auth/login', 'POST', '127.0.0.1', '2021-12-06 14:00:02', '2021-12-06 14:00:02');
INSERT INTO `admin_log` VALUES (1126, 1, '后台首页', 'admin/index/index', 'GET', '127.0.0.1', '2021-12-06 14:00:02', '2021-12-06 14:00:02');
INSERT INTO `admin_log` VALUES (1127, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 14:10:52', '2021-12-06 14:10:52');
INSERT INTO `admin_log` VALUES (1128, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 14:10:52', '2021-12-06 14:10:52');
INSERT INTO `admin_log` VALUES (1129, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 14:14:45', '2021-12-06 14:14:45');
INSERT INTO `admin_log` VALUES (1130, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 14:15:41', '2021-12-06 14:15:41');
INSERT INTO `admin_log` VALUES (1131, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 14:16:44', '2021-12-06 14:16:44');
INSERT INTO `admin_log` VALUES (1132, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 14:23:52', '2021-12-06 14:23:52');
INSERT INTO `admin_log` VALUES (1133, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 16:05:59', '2021-12-06 16:05:59');
INSERT INTO `admin_log` VALUES (1134, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 16:05:59', '2021-12-06 16:05:59');
INSERT INTO `admin_log` VALUES (1135, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 16:27:06', '2021-12-06 16:27:06');
INSERT INTO `admin_log` VALUES (1136, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 16:27:06', '2021-12-06 16:27:06');
INSERT INTO `admin_log` VALUES (1137, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 16:28:03', '2021-12-06 16:28:03');
INSERT INTO `admin_log` VALUES (1138, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 16:35:46', '2021-12-06 16:35:46');
INSERT INTO `admin_log` VALUES (1139, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 16:36:26', '2021-12-06 16:36:26');
INSERT INTO `admin_log` VALUES (1140, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-06 17:55:37', '2021-12-06 17:55:37');
INSERT INTO `admin_log` VALUES (1141, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 17:55:37', '2021-12-06 17:55:37');
INSERT INTO `admin_log` VALUES (1142, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-06 17:56:06', '2021-12-06 17:56:06');
INSERT INTO `admin_log` VALUES (1143, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 08:56:43', '2021-12-07 08:56:43');
INSERT INTO `admin_log` VALUES (1144, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 08:56:43', '2021-12-07 08:56:43');
INSERT INTO `admin_log` VALUES (1145, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 08:59:49', '2021-12-07 08:59:49');
INSERT INTO `admin_log` VALUES (1146, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 08:59:49', '2021-12-07 08:59:49');
INSERT INTO `admin_log` VALUES (1147, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 09:11:40', '2021-12-07 09:11:40');
INSERT INTO `admin_log` VALUES (1148, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 09:11:40', '2021-12-07 09:11:40');
INSERT INTO `admin_log` VALUES (1149, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 09:16:25', '2021-12-07 09:16:25');
INSERT INTO `admin_log` VALUES (1150, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 09:16:25', '2021-12-07 09:16:25');
INSERT INTO `admin_log` VALUES (1151, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 11:11:37', '2021-12-07 11:11:37');
INSERT INTO `admin_log` VALUES (1152, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:11:37', '2021-12-07 11:11:37');
INSERT INTO `admin_log` VALUES (1153, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 11:14:28', '2021-12-07 11:14:28');
INSERT INTO `admin_log` VALUES (1154, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:14:28', '2021-12-07 11:14:28');
INSERT INTO `admin_log` VALUES (1155, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:15:47', '2021-12-07 11:15:47');
INSERT INTO `admin_log` VALUES (1156, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:16:31', '2021-12-07 11:16:31');
INSERT INTO `admin_log` VALUES (1157, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 11:27:54', '2021-12-07 11:27:54');
INSERT INTO `admin_log` VALUES (1158, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:27:54', '2021-12-07 11:27:54');
INSERT INTO `admin_log` VALUES (1159, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 11:29:55', '2021-12-07 11:29:55');
INSERT INTO `admin_log` VALUES (1160, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 13:15:36', '2021-12-07 13:15:36');
INSERT INTO `admin_log` VALUES (1161, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:15:36', '2021-12-07 13:15:36');
INSERT INTO `admin_log` VALUES (1162, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:23:04', '2021-12-07 13:23:04');
INSERT INTO `admin_log` VALUES (1163, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:23:50', '2021-12-07 13:23:50');
INSERT INTO `admin_log` VALUES (1164, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:37:29', '2021-12-07 13:37:29');
INSERT INTO `admin_log` VALUES (1165, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:37:55', '2021-12-07 13:37:55');
INSERT INTO `admin_log` VALUES (1166, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 13:49:51', '2021-12-07 13:49:51');
INSERT INTO `admin_log` VALUES (1167, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:49:51', '2021-12-07 13:49:51');
INSERT INTO `admin_log` VALUES (1168, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:50:50', '2021-12-07 13:50:50');
INSERT INTO `admin_log` VALUES (1169, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:51:34', '2021-12-07 13:51:34');
INSERT INTO `admin_log` VALUES (1170, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:55:19', '2021-12-07 13:55:19');
INSERT INTO `admin_log` VALUES (1171, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:55:47', '2021-12-07 13:55:47');
INSERT INTO `admin_log` VALUES (1172, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:57:30', '2021-12-07 13:57:30');
INSERT INTO `admin_log` VALUES (1173, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 13:58:07', '2021-12-07 13:58:07');
INSERT INTO `admin_log` VALUES (1174, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 14:11:59', '2021-12-07 14:11:59');
INSERT INTO `admin_log` VALUES (1175, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 14:11:59', '2021-12-07 14:11:59');
INSERT INTO `admin_log` VALUES (1176, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 14:24:28', '2021-12-07 14:24:28');
INSERT INTO `admin_log` VALUES (1177, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 14:24:28', '2021-12-07 14:24:28');
INSERT INTO `admin_log` VALUES (1178, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-07 14:27:47', '2021-12-07 14:27:47');
INSERT INTO `admin_log` VALUES (1179, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-07 14:27:47', '2021-12-07 14:27:47');
INSERT INTO `admin_log` VALUES (1180, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-08 15:13:24', '2021-12-08 15:13:24');
INSERT INTO `admin_log` VALUES (1181, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:13:24', '2021-12-08 15:13:24');
INSERT INTO `admin_log` VALUES (1182, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:15:36', '2021-12-08 15:15:36');
INSERT INTO `admin_log` VALUES (1183, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:15:38', '2021-12-08 15:15:38');
INSERT INTO `admin_log` VALUES (1184, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-08 15:15:41', '2021-12-08 15:15:41');
INSERT INTO `admin_log` VALUES (1185, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:15:41', '2021-12-08 15:15:41');
INSERT INTO `admin_log` VALUES (1186, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:15:49', '2021-12-08 15:15:49');
INSERT INTO `admin_log` VALUES (1187, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:16:25', '2021-12-08 15:16:25');
INSERT INTO `admin_log` VALUES (1188, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:18:48', '2021-12-08 15:18:48');
INSERT INTO `admin_log` VALUES (1189, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-08 15:33:40', '2021-12-08 15:33:40');
INSERT INTO `admin_log` VALUES (1190, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-09 14:56:43', '2021-12-09 14:56:43');
INSERT INTO `admin_log` VALUES (1191, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-09 14:56:43', '2021-12-09 14:56:43');
INSERT INTO `admin_log` VALUES (1192, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-09 14:59:45', '2021-12-09 14:59:45');
INSERT INTO `admin_log` VALUES (1193, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-09 14:59:45', '2021-12-09 14:59:45');
INSERT INTO `admin_log` VALUES (1194, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-10 16:09:45', '2021-12-10 16:09:45');
INSERT INTO `admin_log` VALUES (1195, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:09:45', '2021-12-10 16:09:45');
INSERT INTO `admin_log` VALUES (1196, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-10 16:13:48', '2021-12-10 16:13:48');
INSERT INTO `admin_log` VALUES (1197, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:13:48', '2021-12-10 16:13:48');
INSERT INTO `admin_log` VALUES (1198, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-10 16:15:02', '2021-12-10 16:15:02');
INSERT INTO `admin_log` VALUES (1199, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:15:02', '2021-12-10 16:15:02');
INSERT INTO `admin_log` VALUES (1200, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-10 16:19:38', '2021-12-10 16:19:38');
INSERT INTO `admin_log` VALUES (1201, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:19:38', '2021-12-10 16:19:38');
INSERT INTO `admin_log` VALUES (1202, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-10 16:39:49', '2021-12-10 16:39:49');
INSERT INTO `admin_log` VALUES (1203, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:39:49', '2021-12-10 16:39:49');
INSERT INTO `admin_log` VALUES (1204, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:40:21', '2021-12-10 16:40:21');
INSERT INTO `admin_log` VALUES (1205, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:40:42', '2021-12-10 16:40:42');
INSERT INTO `admin_log` VALUES (1206, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:46:21', '2021-12-10 16:46:21');
INSERT INTO `admin_log` VALUES (1207, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:57:09', '2021-12-10 16:57:09');
INSERT INTO `admin_log` VALUES (1208, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-10 16:59:46', '2021-12-10 16:59:46');
INSERT INTO `admin_log` VALUES (1209, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-11 07:54:43', '2021-12-11 07:54:43');
INSERT INTO `admin_log` VALUES (1210, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 07:54:43', '2021-12-11 07:54:43');
INSERT INTO `admin_log` VALUES (1211, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:26:59', '2021-12-11 08:26:59');
INSERT INTO `admin_log` VALUES (1212, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:29:17', '2021-12-11 08:29:17');
INSERT INTO `admin_log` VALUES (1213, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:30:26', '2021-12-11 08:30:26');
INSERT INTO `admin_log` VALUES (1214, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:30:27', '2021-12-11 08:30:27');
INSERT INTO `admin_log` VALUES (1215, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:31:05', '2021-12-11 08:31:05');
INSERT INTO `admin_log` VALUES (1216, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:31:17', '2021-12-11 08:31:17');
INSERT INTO `admin_log` VALUES (1217, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:32:04', '2021-12-11 08:32:04');
INSERT INTO `admin_log` VALUES (1218, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:33:19', '2021-12-11 08:33:19');
INSERT INTO `admin_log` VALUES (1219, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:35:50', '2021-12-11 08:35:50');
INSERT INTO `admin_log` VALUES (1220, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:42:48', '2021-12-11 08:42:48');
INSERT INTO `admin_log` VALUES (1221, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:46:43', '2021-12-11 08:46:43');
INSERT INTO `admin_log` VALUES (1222, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:52:01', '2021-12-11 08:52:01');
INSERT INTO `admin_log` VALUES (1223, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:56:43', '2021-12-11 08:56:43');
INSERT INTO `admin_log` VALUES (1224, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 08:57:23', '2021-12-11 08:57:23');
INSERT INTO `admin_log` VALUES (1225, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:30:50', '2021-12-11 09:30:50');
INSERT INTO `admin_log` VALUES (1226, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:36:54', '2021-12-11 09:36:54');
INSERT INTO `admin_log` VALUES (1227, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:38:15', '2021-12-11 09:38:15');
INSERT INTO `admin_log` VALUES (1228, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:45:31', '2021-12-11 09:45:31');
INSERT INTO `admin_log` VALUES (1229, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:46:07', '2021-12-11 09:46:07');
INSERT INTO `admin_log` VALUES (1230, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:48:15', '2021-12-11 09:48:15');
INSERT INTO `admin_log` VALUES (1231, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:54:14', '2021-12-11 09:54:14');
INSERT INTO `admin_log` VALUES (1232, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-11 09:57:55', '2021-12-11 09:57:55');
INSERT INTO `admin_log` VALUES (1233, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-13 11:41:06', '2021-12-13 11:41:06');
INSERT INTO `admin_log` VALUES (1234, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-13 13:16:31', '2021-12-13 13:16:31');
INSERT INTO `admin_log` VALUES (1235, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 09:31:10', '2021-12-18 09:31:10');
INSERT INTO `admin_log` VALUES (1236, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 09:31:10', '2021-12-18 09:31:10');
INSERT INTO `admin_log` VALUES (1237, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 09:40:00', '2021-12-18 09:40:00');
INSERT INTO `admin_log` VALUES (1238, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 09:41:52', '2021-12-18 09:41:52');
INSERT INTO `admin_log` VALUES (1239, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 09:41:52', '2021-12-18 09:41:52');
INSERT INTO `admin_log` VALUES (1240, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 10:16:06', '2021-12-18 10:16:06');
INSERT INTO `admin_log` VALUES (1241, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 10:16:06', '2021-12-18 10:16:06');
INSERT INTO `admin_log` VALUES (1242, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 10:16:26', '2021-12-18 10:16:26');
INSERT INTO `admin_log` VALUES (1243, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 13:37:49', '2021-12-18 13:37:49');
INSERT INTO `admin_log` VALUES (1244, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 13:37:49', '2021-12-18 13:37:49');
INSERT INTO `admin_log` VALUES (1245, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 13:38:45', '2021-12-18 13:38:45');
INSERT INTO `admin_log` VALUES (1246, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 13:40:44', '2021-12-18 13:40:44');
INSERT INTO `admin_log` VALUES (1247, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 13:49:35', '2021-12-18 13:49:35');
INSERT INTO `admin_log` VALUES (1248, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 13:49:35', '2021-12-18 13:49:35');
INSERT INTO `admin_log` VALUES (1249, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:00:28', '2021-12-18 14:00:28');
INSERT INTO `admin_log` VALUES (1250, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:00:28', '2021-12-18 14:00:28');
INSERT INTO `admin_log` VALUES (1251, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:02:13', '2021-12-18 14:02:13');
INSERT INTO `admin_log` VALUES (1252, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:02:13', '2021-12-18 14:02:13');
INSERT INTO `admin_log` VALUES (1253, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:04:30', '2021-12-18 14:04:30');
INSERT INTO `admin_log` VALUES (1254, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:04:30', '2021-12-18 14:04:30');
INSERT INTO `admin_log` VALUES (1255, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:07:02', '2021-12-18 14:07:02');
INSERT INTO `admin_log` VALUES (1256, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:07:02', '2021-12-18 14:07:02');
INSERT INTO `admin_log` VALUES (1257, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:14:33', '2021-12-18 14:14:33');
INSERT INTO `admin_log` VALUES (1258, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:14:33', '2021-12-18 14:14:33');
INSERT INTO `admin_log` VALUES (1259, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:14:45', '2021-12-18 14:14:45');
INSERT INTO `admin_log` VALUES (1260, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:14:51', '2021-12-18 14:14:51');
INSERT INTO `admin_log` VALUES (1261, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:14:51', '2021-12-18 14:14:51');
INSERT INTO `admin_log` VALUES (1262, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:21:56', '2021-12-18 14:21:56');
INSERT INTO `admin_log` VALUES (1263, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:21:56', '2021-12-18 14:21:56');
INSERT INTO `admin_log` VALUES (1264, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:25:17', '2021-12-18 14:25:17');
INSERT INTO `admin_log` VALUES (1265, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:25:17', '2021-12-18 14:25:17');
INSERT INTO `admin_log` VALUES (1266, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 14:41:04', '2021-12-18 14:41:04');
INSERT INTO `admin_log` VALUES (1267, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:41:04', '2021-12-18 14:41:04');
INSERT INTO `admin_log` VALUES (1268, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:41:20', '2021-12-18 14:41:20');
INSERT INTO `admin_log` VALUES (1269, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:41:31', '2021-12-18 14:41:31');
INSERT INTO `admin_log` VALUES (1270, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:42:57', '2021-12-18 14:42:57');
INSERT INTO `admin_log` VALUES (1271, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:44:43', '2021-12-18 14:44:43');
INSERT INTO `admin_log` VALUES (1272, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:44:45', '2021-12-18 14:44:45');
INSERT INTO `admin_log` VALUES (1273, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:46:55', '2021-12-18 14:46:55');
INSERT INTO `admin_log` VALUES (1274, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:46:58', '2021-12-18 14:46:58');
INSERT INTO `admin_log` VALUES (1275, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:47:27', '2021-12-18 14:47:27');
INSERT INTO `admin_log` VALUES (1276, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 14:48:00', '2021-12-18 14:48:00');
INSERT INTO `admin_log` VALUES (1277, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-18 15:37:11', '2021-12-18 15:37:11');
INSERT INTO `admin_log` VALUES (1278, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-18 15:37:11', '2021-12-18 15:37:11');
INSERT INTO `admin_log` VALUES (1279, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-22 13:57:03', '2021-12-22 13:57:03');
INSERT INTO `admin_log` VALUES (1280, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-22 13:57:03', '2021-12-22 13:57:03');
INSERT INTO `admin_log` VALUES (1281, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-22 13:57:05', '2021-12-22 13:57:05');
INSERT INTO `admin_log` VALUES (1282, 1, '登录', '/admin/auth/login', 'POST', '::1', '2021-12-25 09:55:43', '2021-12-25 09:55:43');
INSERT INTO `admin_log` VALUES (1283, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2021-12-25 09:55:43', '2021-12-25 09:55:43');
INSERT INTO `admin_log` VALUES (1284, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-01-04 14:53:23', '2022-01-04 14:53:23');
INSERT INTO `admin_log` VALUES (1285, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-04 14:53:23', '2022-01-04 14:53:23');
INSERT INTO `admin_log` VALUES (1286, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-01-05 08:45:28', '2022-01-05 08:45:28');
INSERT INTO `admin_log` VALUES (1287, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-05 08:45:28', '2022-01-05 08:45:28');
INSERT INTO `admin_log` VALUES (1288, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-01-07 11:29:24', '2022-01-07 11:29:24');
INSERT INTO `admin_log` VALUES (1289, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-07 11:29:24', '2022-01-07 11:29:24');
INSERT INTO `admin_log` VALUES (1290, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-08 13:37:37', '2022-01-08 13:37:37');
INSERT INTO `admin_log` VALUES (1291, 0, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-08 13:39:13', '2022-01-08 13:39:13');
INSERT INTO `admin_log` VALUES (1292, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-01-08 13:39:25', '2022-01-08 13:39:25');
INSERT INTO `admin_log` VALUES (1293, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-08 13:39:25', '2022-01-08 13:39:25');
INSERT INTO `admin_log` VALUES (1294, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-01-19 17:26:26', '2022-01-19 17:26:26');
INSERT INTO `admin_log` VALUES (1295, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-01-19 17:26:26', '2022-01-19 17:26:26');
INSERT INTO `admin_log` VALUES (1296, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-02-14 11:22:42', '2022-02-14 11:22:42');
INSERT INTO `admin_log` VALUES (1297, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-02-14 11:22:42', '2022-02-14 11:22:42');
INSERT INTO `admin_log` VALUES (1298, 1, '登录', '/admin/auth/login', 'POST', '::1', '2022-03-01 10:15:17', '2022-03-01 10:15:17');
INSERT INTO `admin_log` VALUES (1299, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-03-01 10:15:18', '2022-03-01 10:15:18');
INSERT INTO `admin_log` VALUES (1300, 1, '后台首页', 'admin/index/index', 'GET', '::1', '2022-03-01 10:15:34', '2022-03-01 10:15:34');
COMMIT;

-- ----------------------------
-- Table structure for admin_log_data
-- ----------------------------
DROP TABLE IF EXISTS `admin_log_data`;
CREATE TABLE `admin_log_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_log_id` int(11) NOT NULL COMMENT '日志ID',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日志内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台操作日志数据';

-- ----------------------------
-- Records of admin_log_data
-- ----------------------------
BEGIN;
INSERT INTO `admin_log_data` VALUES (1001, 1011, 'cJ+ssubOX501AHIMB6MjwVUfh5QDupu7sxfj5dMrHpYXPwYCkH6koTyJDPRMfHBqLMn4P5SrwLSSsi/woPm8jThv7xByh+pEcUeYt4YzFzWWVyHzt1YK6lysdBFwXiMouuAlo9i85EKnNXAPyYT2ebdRMihnVKeCUQ4CU4UlzcrsypwHKaWLqb26c5j9CePlsSVXQSjZt/fMUHfn04a42A==');
INSERT INTO `admin_log_data` VALUES (1002, 1012, 'swbFGdXjF/jTjW2t6zLxp8EWPMOcPKFcMbBBBIf1qNL9eQg1/whUkb9H9ZxoyAk17FiZPIsiJl55aUS3atHFa+MRTh1Drs0gxqkaAB8cyZWNvSv3riQcMPJU3g4lNzE/Cn7p7yAP/wkbonABja0Dh6lqGABZYIkQ8ifhyOXgg9fuxRoH+4ImEz8CUdpSXOvzYvbYLfB+Do3a802WS1ecl56Fij0qQvHZ6pgC2Y3A5Ws=');
INSERT INTO `admin_log_data` VALUES (1003, 1013, 'tEI/slUvnX9unHcLZEJ1lybCwpYaXMMD1FikwD3BVXRWzfvI5ZpmcsfAkSewrBLmSIHis3Y+Y/p5QUFFOmlKCUl9fun6XxQYSnfAchU6EL96MXmTIokL1PbYDMpPVmj9BoaBmAx17faaVnGp9AIR3U33rkCVh5s5Mc20gppzZEx0R/0ShGTl/mrO2JhQP2RHgX1j+OU5r8d/Pcr3Dujx5eK+da/i+iwimamDHhT/WuM=');
INSERT INTO `admin_log_data` VALUES (1004, 1014, '+60EH/9s6D4uCLdHrQAmIXXu0zbH1OFwS+W7RU0OqainU8L4p2pvUuXiswEEXjIYLZjQgeC8D+YCFW7xp0acnwTBvZl4MhfZCtC9gI2Zevq1cjHK1U8ttKl/AaEHuwMIcmgU4BpS9NIQdaq9bDdukBLJX2MFOh1r/3GJlQ7w5OknCldsu9EZXYhPU6V/tT2O284F/l75PCSLxEkb/6bEiQ==');
INSERT INTO `admin_log_data` VALUES (1005, 1015, '+60EH/9s6D4uCLdHrQAmIXXu0zbH1OFwS+W7RU0OqainU8L4p2pvUuXiswEEXjIY6jJHtLyz7XstXFZEn83+IosMEZcVlGAZgQ+6x1wAOyQpVVELsVpq1f7C/gSnM53jah968eOd/8ohBGg1INLnSd7gHfxfkvSa2c3H9x89e7maCw5gN6pQK24lClh86mLrqk/PwKKC3XPP8kmB5KXJGCigVpIMWrWI4RRePqlDbd0=');
INSERT INTO `admin_log_data` VALUES (1006, 1016, 'zgd6ukCPTohmrtmojQ2NpXkX/cXfI3m/72iL/6hCu/sQFPGt5j/sLMNPT40i2f+Ny7Sr/fNa/UZeebTllhBD+2rsmY4AZTSxVn4oqPEHzkm8+xBqd0nqGcBqY4GtjQL8xUuMdOETjv2r+JpzykCjG3kNlLQReDpbf3QBMtLU3ksMGmQU/ZLiC8w46Mxcqen+LxDL1foa7dN7sn3CdyzotK/Pfox+von+UW7eYdAtCbg=');
INSERT INTO `admin_log_data` VALUES (1007, 1017, 'Z2yfPRgf1pwcj5Ul9p+i2Dso2tcAY+XR7ccfj+jfHuCTRVofolBIu56PV5KebbjcR2IjYuCacFPSlls1wKP5PE15t3Gylxi43Sew4qDuUtk54jD9DYAg81JAKC0/8+RgYXoD137F9HpxtFiMnsQhbDDf2MiK+889eKhpI2TtFEjIfaOpr1oHFJg8xzYUtIYrThHcqhtmyl9AAjSQm/BvAQ==');
INSERT INTO `admin_log_data` VALUES (1008, 1018, 'jRy2pqkyxnseiZFm7cyzZwN2M2OV0dXOHarLjp7zRag=');
INSERT INTO `admin_log_data` VALUES (1009, 1019, '29Td4975v61BbAd6k7kf33EuxJCxOlhRMVYWe5Gd18RMwJGMXWQJT+YjhSQ5FMol2qVbWcXN3gjdJkVdLQ9B9qErOcUImvxt5ttYqNaF3bzJO0Dfea0NmdYmmLTr9qEyP9GH0E6+qcQTb/KqiTvbitXQXbMWNfJanclch3fVkJarAXeL6s/2kTSiCIf01BWSAIBLSE1rvMw31nb6Xyeo46XLNND4uyImwbHDo0cxEf0=');
INSERT INTO `admin_log_data` VALUES (1010, 1020, '29Td4975v61BbAd6k7kf33EuxJCxOlhRMVYWe5Gd18Q2K57nUZ3rUxHBk/pZbK1zB9VHyrGt1iK4ZT/0Wo/a6QV6pI9IfsbhD4NKyKm9f4zqSTVlT01vcbiI8s04WfNq0dYodEHXos8p3qMFbyfDVlf9FgDS0Q1/jQNJEpEl8rKyrsz5HY9ERZzA4KtZZTiUPRWOno7S873y0QCRgEUovJVpWmwCYFAyUERUodanYHBZcuaCiuLO+sH/ce6IPpN1SmCOBbtQ8Cj17aaDe/DrhQ1HL23BZnYxTuxe2EHn0dEoJjvIOOjaA0qu3OAXTJBXLVa2fqTdyU7Y1AwMXuuGb+URmHrztEa4V1X3Q7XrCNy/v7QcLzvHREKjbetR4eik');
INSERT INTO `admin_log_data` VALUES (1011, 1021, 'A9MaEGQOFd3k4b7or/b88g==');
INSERT INTO `admin_log_data` VALUES (1012, 1022, 'A9MaEGQOFd3k4b7or/b88g==');
INSERT INTO `admin_log_data` VALUES (1013, 1023, '1FxSkF29D7f/80EJzW6I4OL5X+50teY5hDOtUAiIKNfQmuZ8ApTChI/C1M4nxuVWC/s2fkzfYxLUpwUsaMqhv0bMagw8Pp8ZIH5RIoyTq7vPUG1GQ/BxRblAQC8iysydkPEvIy2vh4tuqoPlS33GZjG0ZU9jRxgF9uq3pqIIDbxVUw5jY/iIH2fsjXf2xroDazKDJRZ2gKihWQBJ+ywNBtlqNIBJd4B+iN/q+mg7gkI=');
INSERT INTO `admin_log_data` VALUES (1014, 1024, 'Q3Iv23mRTgPIgUVTbQQqfv8RekkYJAdxKkPmAVHHYyxG7vTsRmKR3w5hIXe8yJ6CJQQWuC1ZYFZeY0JjuBV5J/DzGLB8RTBFbeDzC4XnOpyCSp9eYPTKitEga4Xq5fPKDu30RFsUDyWZ14G73V8j+ek+rrzgJ88s3XO+uqq1EEIiY1jxNJpNpAADGJZgvfBZrBs2PxOcECx+0BMIsjnukVob9k3YESV29XfL/JKfT7o=');
INSERT INTO `admin_log_data` VALUES (1015, 1025, 'Q3Iv23mRTgPIgUVTbQQqfv8RekkYJAdxKkPmAVHHYyxKvXmqJmysGy0aU1ONaWqpbL8wxayWVNn6BBlTfkK2q0gG1q+tdoHjZOn8GSufCHzh4nJTBGgpJ0h8X0MzSBAzKBHn2KEbcN+qQCEBMaisPVGJ0/1H+J7GtIdDAd5BQj+35FAnPhnXvHs0ocxGP/it64H3vXyiEzPJDgPdb8Kyccxuueh/iJ2O9NO4FrouPEw=');
INSERT INTO `admin_log_data` VALUES (1016, 1026, 'Q3Iv23mRTgPIgUVTbQQqfv8RekkYJAdxKkPmAVHHYywRLn2HLIsXMTMv25+yk8MptsMgHlbXmcfX2VXT7YiSBiVSWFRs3wR34jjIxUJ2tWVHMPhMnnUMWxCl4I+OznewinkXAFAJKRGgoE2ZSGZtij375WBDSrtIkHlSFEk7GBOwUsx7nQH5n1jMBGkSJqz8N9uMO+3FBCHbWRc5xNMwig==');
INSERT INTO `admin_log_data` VALUES (1017, 1027, 'Q3Iv23mRTgPIgUVTbQQqfv8RekkYJAdxKkPmAVHHYyxG7vTsRmKR3w5hIXe8yJ6CtD28GU473xTRpBVtN6kOUi8ZMwwOJKZJWvgHaP7GjELAfUx9e/wN/zGhmolRXs/DqIaCe5VkMWbh6d6Vr1JDV010EsHYrj2b+dOa1AcyqAZK+W8RqY9CP/VC6t83t+zN6HyyoeGdLv5YkMp9+AmzxnerVxTVPxCYjVmlah3xEIY=');
INSERT INTO `admin_log_data` VALUES (1018, 1028, 'BYHCLR6oQXuFw17Rn6Y7r8D4Q+6luAhQlrfnk8WHUDYYS8NJTkqJN6dkOAWO1MatIoigbn1B+Vo9+UXkK1IBk6hVUp6ch2m9Zn1JT5rmt82hGyObp5zuG3eyp1HozZ5ihtHPWdY3p8KvWeEze6ivrw==');
INSERT INTO `admin_log_data` VALUES (1019, 1029, 'xopa1pBSZzbQ4LGY/KVh2mvCZEpLeMGDWVWJWYjIuKlsk8szadua5e6KhBERlJKJLFMwIMdArs7YVO+DqRIgGxWWbKWTEvr/nlh9lYCARZ/IAxFW+iBa2XHImptmvqgbEUyj/bMFxbL+LaOwp21Hgw==');
INSERT INTO `admin_log_data` VALUES (1020, 1032, '测试data');
INSERT INTO `admin_log_data` VALUES (1021, 1033, '测试data');
INSERT INTO `admin_log_data` VALUES (1022, 1034, '测试data');
INSERT INTO `admin_log_data` VALUES (1023, 1035, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1024, 1036, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1025, 1037, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1026, 1038, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1027, 1039, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1028, 1040, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1029, 1041, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1030, 1042, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1031, 1043, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1032, 1044, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1033, 1045, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1034, 1046, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1035, 1047, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1036, 1048, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1037, 1049, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1038, 1050, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1039, 1051, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1040, 1052, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1041, 1053, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1042, 1054, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1043, 1055, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1044, 1056, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1045, 1057, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1046, 1058, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1047, 1059, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1048, 1060, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1049, 1061, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1050, 1062, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1051, 1063, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1052, 1064, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1053, 1065, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1054, 1066, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1055, 1067, '{\"password\":[\"123456\"],\"username\":[\"jack\"]}');
INSERT INTO `admin_log_data` VALUES (1056, 1068, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1057, 1069, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1058, 1070, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1059, 1071, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1060, 1072, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1061, 1073, '{\"password\":[\"456789\"],\"username\":[\"jack123\"]}');
INSERT INTO `admin_log_data` VALUES (1062, 1074, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1063, 1075, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1064, 1076, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1065, 1077, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1066, 1078, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1067, 1079, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1068, 1080, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1069, 1081, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1070, 1082, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1071, 1083, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1072, 1084, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1073, 1085, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1074, 1086, '{\"password\":[\"super_admin\"],\"remember\":[\"on\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1075, 1087, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1076, 1088, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1077, 1089, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1078, 1090, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1079, 1091, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1080, 1092, 'id=1');
INSERT INTO `admin_log_data` VALUES (1081, 1093, 'id=1');
INSERT INTO `admin_log_data` VALUES (1082, 1094, '{\"password\":[\"super_admin\"],\"remember\":[\"on\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1083, 1095, '');
INSERT INTO `admin_log_data` VALUES (1084, 1096, '');
INSERT INTO `admin_log_data` VALUES (1085, 1097, '');
INSERT INTO `admin_log_data` VALUES (1086, 1098, '');
INSERT INTO `admin_log_data` VALUES (1087, 1099, '');
INSERT INTO `admin_log_data` VALUES (1088, 1100, '');
INSERT INTO `admin_log_data` VALUES (1089, 1101, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1090, 1102, '');
INSERT INTO `admin_log_data` VALUES (1091, 1103, '');
INSERT INTO `admin_log_data` VALUES (1092, 1104, '');
INSERT INTO `admin_log_data` VALUES (1093, 1105, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1094, 1106, '');
INSERT INTO `admin_log_data` VALUES (1095, 1107, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1096, 1108, '');
INSERT INTO `admin_log_data` VALUES (1097, 1109, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1098, 1110, '');
INSERT INTO `admin_log_data` VALUES (1099, 1111, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1100, 1112, '');
INSERT INTO `admin_log_data` VALUES (1101, 1113, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1102, 1114, '');
INSERT INTO `admin_log_data` VALUES (1103, 1115, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1104, 1116, '');
INSERT INTO `admin_log_data` VALUES (1105, 1117, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1106, 1118, '');
INSERT INTO `admin_log_data` VALUES (1107, 1119, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1108, 1120, '');
INSERT INTO `admin_log_data` VALUES (1109, 1121, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1110, 1122, '');
INSERT INTO `admin_log_data` VALUES (1111, 1123, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1112, 1124, '');
INSERT INTO `admin_log_data` VALUES (1113, 1125, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1114, 1126, '');
INSERT INTO `admin_log_data` VALUES (1115, 1127, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1116, 1128, '');
INSERT INTO `admin_log_data` VALUES (1117, 1129, '');
INSERT INTO `admin_log_data` VALUES (1118, 1130, '');
INSERT INTO `admin_log_data` VALUES (1119, 1131, '');
INSERT INTO `admin_log_data` VALUES (1120, 1132, '');
INSERT INTO `admin_log_data` VALUES (1121, 1133, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1122, 1134, '');
INSERT INTO `admin_log_data` VALUES (1123, 1135, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1124, 1136, '');
INSERT INTO `admin_log_data` VALUES (1125, 1137, '');
INSERT INTO `admin_log_data` VALUES (1126, 1138, '');
INSERT INTO `admin_log_data` VALUES (1127, 1139, '');
INSERT INTO `admin_log_data` VALUES (1128, 1140, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1129, 1141, '');
INSERT INTO `admin_log_data` VALUES (1130, 1142, '');
INSERT INTO `admin_log_data` VALUES (1131, 1143, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1132, 1144, '');
INSERT INTO `admin_log_data` VALUES (1133, 1145, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1134, 1146, '');
INSERT INTO `admin_log_data` VALUES (1135, 1147, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1136, 1148, '');
INSERT INTO `admin_log_data` VALUES (1137, 1149, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1138, 1150, '');
INSERT INTO `admin_log_data` VALUES (1139, 1151, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1140, 1152, '');
INSERT INTO `admin_log_data` VALUES (1141, 1153, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1142, 1154, '');
INSERT INTO `admin_log_data` VALUES (1143, 1155, '');
INSERT INTO `admin_log_data` VALUES (1144, 1156, '');
INSERT INTO `admin_log_data` VALUES (1145, 1157, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1146, 1158, '');
INSERT INTO `admin_log_data` VALUES (1147, 1159, '');
INSERT INTO `admin_log_data` VALUES (1148, 1160, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1149, 1161, '');
INSERT INTO `admin_log_data` VALUES (1150, 1162, '');
INSERT INTO `admin_log_data` VALUES (1151, 1163, '');
INSERT INTO `admin_log_data` VALUES (1152, 1164, '');
INSERT INTO `admin_log_data` VALUES (1153, 1165, '');
INSERT INTO `admin_log_data` VALUES (1154, 1166, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1155, 1167, '');
INSERT INTO `admin_log_data` VALUES (1156, 1168, '');
INSERT INTO `admin_log_data` VALUES (1157, 1169, '');
INSERT INTO `admin_log_data` VALUES (1158, 1170, '');
INSERT INTO `admin_log_data` VALUES (1159, 1171, '');
INSERT INTO `admin_log_data` VALUES (1160, 1172, '');
INSERT INTO `admin_log_data` VALUES (1161, 1173, '');
INSERT INTO `admin_log_data` VALUES (1162, 1174, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1163, 1175, '');
INSERT INTO `admin_log_data` VALUES (1164, 1176, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1165, 1177, '');
INSERT INTO `admin_log_data` VALUES (1166, 1178, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1167, 1179, '');
INSERT INTO `admin_log_data` VALUES (1168, 1180, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1169, 1181, '');
INSERT INTO `admin_log_data` VALUES (1170, 1182, '');
INSERT INTO `admin_log_data` VALUES (1171, 1183, '');
INSERT INTO `admin_log_data` VALUES (1172, 1184, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1173, 1185, '');
INSERT INTO `admin_log_data` VALUES (1174, 1186, '');
INSERT INTO `admin_log_data` VALUES (1175, 1187, '');
INSERT INTO `admin_log_data` VALUES (1176, 1188, '');
INSERT INTO `admin_log_data` VALUES (1177, 1189, '');
INSERT INTO `admin_log_data` VALUES (1178, 1190, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1179, 1191, '');
INSERT INTO `admin_log_data` VALUES (1180, 1192, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1181, 1193, '');
INSERT INTO `admin_log_data` VALUES (1182, 1194, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1183, 1195, '');
INSERT INTO `admin_log_data` VALUES (1184, 1196, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1185, 1197, '');
INSERT INTO `admin_log_data` VALUES (1186, 1198, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1187, 1199, '');
INSERT INTO `admin_log_data` VALUES (1188, 1200, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1189, 1201, '');
INSERT INTO `admin_log_data` VALUES (1190, 1202, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1191, 1203, '');
INSERT INTO `admin_log_data` VALUES (1192, 1204, '');
INSERT INTO `admin_log_data` VALUES (1193, 1205, '');
INSERT INTO `admin_log_data` VALUES (1194, 1206, '');
INSERT INTO `admin_log_data` VALUES (1195, 1207, '');
INSERT INTO `admin_log_data` VALUES (1196, 1208, '');
INSERT INTO `admin_log_data` VALUES (1197, 1209, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1198, 1210, '');
INSERT INTO `admin_log_data` VALUES (1199, 1211, '');
INSERT INTO `admin_log_data` VALUES (1200, 1212, '');
INSERT INTO `admin_log_data` VALUES (1201, 1213, '');
INSERT INTO `admin_log_data` VALUES (1202, 1214, '');
INSERT INTO `admin_log_data` VALUES (1203, 1215, '');
INSERT INTO `admin_log_data` VALUES (1204, 1216, '');
INSERT INTO `admin_log_data` VALUES (1205, 1217, '');
INSERT INTO `admin_log_data` VALUES (1206, 1218, '');
INSERT INTO `admin_log_data` VALUES (1207, 1219, '');
INSERT INTO `admin_log_data` VALUES (1208, 1220, '');
INSERT INTO `admin_log_data` VALUES (1209, 1221, '');
INSERT INTO `admin_log_data` VALUES (1210, 1222, '');
INSERT INTO `admin_log_data` VALUES (1211, 1223, '');
INSERT INTO `admin_log_data` VALUES (1212, 1224, '');
INSERT INTO `admin_log_data` VALUES (1213, 1225, '');
INSERT INTO `admin_log_data` VALUES (1214, 1226, '');
INSERT INTO `admin_log_data` VALUES (1215, 1227, '');
INSERT INTO `admin_log_data` VALUES (1216, 1228, '');
INSERT INTO `admin_log_data` VALUES (1217, 1229, '');
INSERT INTO `admin_log_data` VALUES (1218, 1230, '');
INSERT INTO `admin_log_data` VALUES (1219, 1231, '');
INSERT INTO `admin_log_data` VALUES (1220, 1232, '');
INSERT INTO `admin_log_data` VALUES (1221, 1233, '');
INSERT INTO `admin_log_data` VALUES (1222, 1234, '');
INSERT INTO `admin_log_data` VALUES (1223, 1235, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1224, 1236, '');
INSERT INTO `admin_log_data` VALUES (1225, 1237, '');
INSERT INTO `admin_log_data` VALUES (1226, 1238, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1227, 1239, '');
INSERT INTO `admin_log_data` VALUES (1228, 1240, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1229, 1241, '');
INSERT INTO `admin_log_data` VALUES (1230, 1242, '');
INSERT INTO `admin_log_data` VALUES (1231, 1243, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1232, 1244, '');
INSERT INTO `admin_log_data` VALUES (1233, 1245, '');
INSERT INTO `admin_log_data` VALUES (1234, 1246, '');
INSERT INTO `admin_log_data` VALUES (1235, 1247, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1236, 1248, '');
INSERT INTO `admin_log_data` VALUES (1237, 1249, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1238, 1250, '');
INSERT INTO `admin_log_data` VALUES (1239, 1251, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1240, 1252, '');
INSERT INTO `admin_log_data` VALUES (1241, 1253, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1242, 1254, '');
INSERT INTO `admin_log_data` VALUES (1243, 1255, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1244, 1256, '');
INSERT INTO `admin_log_data` VALUES (1245, 1257, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1246, 1258, '');
INSERT INTO `admin_log_data` VALUES (1247, 1259, '');
INSERT INTO `admin_log_data` VALUES (1248, 1260, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1249, 1261, '');
INSERT INTO `admin_log_data` VALUES (1250, 1262, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1251, 1263, '');
INSERT INTO `admin_log_data` VALUES (1252, 1264, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1253, 1265, '');
INSERT INTO `admin_log_data` VALUES (1254, 1266, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1255, 1267, '');
INSERT INTO `admin_log_data` VALUES (1256, 1268, '');
INSERT INTO `admin_log_data` VALUES (1257, 1269, '');
INSERT INTO `admin_log_data` VALUES (1258, 1270, '');
INSERT INTO `admin_log_data` VALUES (1259, 1271, '');
INSERT INTO `admin_log_data` VALUES (1260, 1272, '');
INSERT INTO `admin_log_data` VALUES (1261, 1273, '');
INSERT INTO `admin_log_data` VALUES (1262, 1274, '');
INSERT INTO `admin_log_data` VALUES (1263, 1275, '');
INSERT INTO `admin_log_data` VALUES (1264, 1276, '');
INSERT INTO `admin_log_data` VALUES (1265, 1277, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1266, 1278, '');
INSERT INTO `admin_log_data` VALUES (1267, 1279, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1268, 1280, '');
INSERT INTO `admin_log_data` VALUES (1269, 1281, '');
INSERT INTO `admin_log_data` VALUES (1270, 1282, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1271, 1283, '');
INSERT INTO `admin_log_data` VALUES (1272, 1284, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1273, 1285, '');
INSERT INTO `admin_log_data` VALUES (1274, 1286, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1275, 1287, '');
INSERT INTO `admin_log_data` VALUES (1276, 1288, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1277, 1289, '');
INSERT INTO `admin_log_data` VALUES (1278, 1290, '');
INSERT INTO `admin_log_data` VALUES (1279, 1291, '');
INSERT INTO `admin_log_data` VALUES (1280, 1292, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1281, 1293, '');
INSERT INTO `admin_log_data` VALUES (1282, 1294, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1283, 1295, '');
INSERT INTO `admin_log_data` VALUES (1284, 1296, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1285, 1297, '');
INSERT INTO `admin_log_data` VALUES (1286, 1298, '{\"password\":[\"super_admin\"],\"username\":[\"super_admin\"]}');
INSERT INTO `admin_log_data` VALUES (1287, 1299, '');
INSERT INTO `admin_log_data` VALUES (1288, 1300, '');
COMMIT;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级菜单',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'url',
  `icon` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fa-list' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '等级',
  `sort_id` int(10) NOT NULL DEFAULT 1000 COMMENT '排序',
  `log_method` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '不记录' COMMENT '记录日志方法',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_url` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台菜单';

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `admin_menu` VALUES (1, 0, '后台首页', 'admin/index/index', 'fa-home', 1, 99, 'GET');
INSERT INTO `admin_menu` VALUES (2, 0, '系统管理', 'admin/sys', 'fa-desktop', 1, 1099, '不记录');
INSERT INTO `admin_menu` VALUES (3, 2, '用户管理', 'admin/admin_user/index', 'fa-user', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (4, 3, '添加用户界面', 'admin/admin_user/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (5, 3, '修改用户界面', 'admin/admin_user/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (6, 3, '删除用户', 'admin/admin_user/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (7, 2, '角色管理', 'admin/admin_role/index', 'fa-group', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (8, 7, '添加角色界面', 'admin/admin_role/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (9, 7, '修改角色界面', 'admin/admin_role/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (10, 7, '删除角色', 'admin/admin_role/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (11, 7, '角色授权界面', 'admin/admin_role/access', 'fa-key', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (12, 2, '菜单管理', 'admin/admin_menu/index', 'fa-align-justify', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (13, 12, '添加菜单界面', 'admin/admin_menu/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (14, 12, '修改菜单界面', 'admin/admin_menu/edit', 'fa-edit', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (15, 12, '删除菜单', 'admin/admin_menu/del', 'fa-close', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (16, 2, '操作日志', 'admin/admin_log/index', 'fa-keyboard-o', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (17, 16, '查看操作日志详情', 'admin/admin_log/view', 'fa-search-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (18, 2, '个人资料', 'admin/admin_user/profile', 'fa-smile-o', 1, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (19, 0, '用户管理', 'admin/user/mange', 'fa-users', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (20, 19, '用户管理', 'admin/user/index', 'fa-user', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (21, 20, '添加用户界面', 'admin/user/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (22, 20, '修改用户界面', 'admin/user/edit', 'fa-pencil', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (23, 20, '删除用户', 'admin/user/del', 'fa-trash', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (24, 20, '启用用户', 'admin/user/enable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (25, 20, '禁用用户', 'admin/user/disable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (26, 19, '用户等级管理', 'admin/user_level/index', 'fa-th-list', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (27, 26, '添加用户等级界面', 'admin/user_level/add', 'fa-plus', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (28, 26, '修改用户等级界面', 'admin/user_level/edit', 'fa-pencil', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (29, 26, '删除用户等级', 'admin/user_level/del', 'fa-trash', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (30, 26, '启用用户等级', 'admin/user_level/enable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (31, 26, '禁用用户等级', 'admin/user_level/disable', 'fa-circle', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (32, 2, '开发管理', 'admin/develop/manager', 'fa-code', 1, 1005, '不记录');
INSERT INTO `admin_menu` VALUES (43, 0, '设置中心', 'admin/setting/center', 'fa-cogs', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (47, 43, '后台设置', 'admin/setting/admin', 'fa-adjust', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (48, 43, '更新设置', 'admin/setting/update', 'fa-pencil', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (49, 32, '数据维护', 'admin/database/table', 'fa-database', 1, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (50, 49, '查看表详情', 'admin/database/view', 'fa-eye', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (51, 49, '优化表', 'admin/database/optimize', 'fa-refresh', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (52, 49, '修复表', 'admin/database/repair', 'fa-circle-o-notch', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (53, 20, '创建用户', 'admin/user/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (54, 20, '修改用户', 'admin/user/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (55, 3, '修改头像', 'admin/admin_user/update_avatar', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (56, 3, '添加用户', 'admin/admin_user/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (57, 3, '修改用户', 'admin/admin_user/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (58, 3, '用户启用', 'admin/admin_user/enable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (59, 3, '用户禁用', 'admin/admin_user/disable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (60, 3, '修改昵称', 'admin/admin_user/update_nickname', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (61, 3, '修改密码', 'admin/admin_user/update_password', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (62, 7, '创建角色', 'admin/admin_role/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (63, 7, '修改角色', 'admin/admin_role/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (64, 7, '启用角色', 'admin/admin_role/enable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (65, 7, '禁用角色', 'admin/admin_role/disable', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (66, 7, '角色授权', 'admin/admin_role/access_operate', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (67, 12, '创建菜单', 'admin/admin_menu/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (68, 12, '修改菜单', 'admin/admin_menu/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (71, 47, '修改设置', 'admin/setting/info', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (76, 20, '导出用户', 'admin/user/export', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (77, 26, '创建用户等级', 'admin/user_level/create', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (78, 26, '更新用户等级', 'admin/user_level/update', 'fa-list', 0, 1000, 'POST');
INSERT INTO `admin_menu` VALUES (79, 26, '用户等级导出', 'admin/user_level/export', 'fa-list', 0, 1000, '不记录');
INSERT INTO `admin_menu` VALUES (80, 0, '测试菜单', 'test/test', '', 1, 1000, '不记录');
COMMIT;

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简介',
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '权限',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台角色';

-- ----------------------------
-- Records of admin_role
-- ----------------------------
BEGIN;
INSERT INTO `admin_role` VALUES (1, '管理员', '后台管理员角色', '1,2,3,4,5,6,55,56,57,58,59,60,61,7,8,9,10,11,62,63,64,65,66,12,13,14,15,67,68,16,17,18,32,49,50,51,52,19,20,21,22,23,24,25,53,54,76,26,27,28,29,30,31,77,78,79,43,47,71,48', 1);
INSERT INTO `admin_role` VALUES (2, '测试01', '测试01', '1,2,18,19,20,21,22,23,24,25,26,27,28,29,30,31', 1);
COMMIT;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'JDJ5JDEwJGdjdHRSODl0bVN3RTlBUDdXVFdDZmVuUThQck5nWWphYWlyekdMNG1uWU8uTC95Z1lHUGZP' COMMENT '密码',
  `nickname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 0：否 1：是',
  `delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='后台用户';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, 'super_admin', 'JDJhJDEwJGdMTC80bkp1T0MzWjhXcFhwVUdCVC40bkliMGV1WW5oeW51bHJsUC5UMk1kZ2l0djRzSlUy', '超级管理员', '/static/uploads/attachment/aecb9fb7-871b-43fc-9414-a4265d0cb72d.png', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL);
INSERT INTO `admin_user` VALUES (2, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (7, '测试账号', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '测试昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2022-01-07 10:46:10');
INSERT INTO `admin_user` VALUES (8, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (9, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (10, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (11, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (12, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (13, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (14, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (15, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (16, 'jack123', 'JDJhJDEwJExtMVZPTVhjTHZXcEJmSEtVSzhLUi4uZlZ5c1dMbnIxdzkvZXR5WTFqdkxLSW9MSC9PNWcu', '昵称', '/storage/attachment/UUcsQTJXYqPfD7rAC97yqLOk1ns8fVUy3ViGYGyS.png', '1,2', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2021-11-20 15:50:03');
INSERT INTO `admin_user` VALUES (17, 'tom', 'JDJhJDEwJFJuc1hRdi5xVTRocGVWVDM5OGJHcGV5ZVhjckQ0UE9aeGQ0U04wTmRuaFdlZEUua1pzL2VT', 'tom', '', '测试', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (18, 'Fred', 'JDJhJDEwJG56RlgwSXBhYlZVWEUuLzBtd0twZk9jbW93Vk5BNUNPREhXTEs1V0JKL1ljTlo3TVAvM2hh', 'Fred', '', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (19, 'Fred', 'JDJhJDEwJGZsMGlJN2hMZEg1c0Z6d294Qy5yMy4uM0p5bDlKQ0xWemkxWGg0M2JNdVp2Zm0yMTdta1B5', 'Fred', '', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (20, 'Fred', 'JDJhJDEwJFdrYThkRDBBMG9UTGxhUE9RdTZ4NU92RXRvRjhCbHdtMVE2dmlwOTloVWhsbFFWM1d6SGxh', 'Fred', '', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (21, 'Fred', 'JDJhJDEwJFNVM2hKTS9Sdy9pTWZoMXRkMzkvenVHd1FERHQwWkRqbXdSaEpUZXcuUjRrOGluLzZNWC9l', 'Fred', '', '1', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (22, 'Fred', 'JDJhJDEwJDBmckNqUWlCNUlvT0s3WWlRS3NyWC4xVDNxNUFmRTBlMVdSMDlkbUxsTkhjZ2JFckw0QzZx', 'Fred', '', '1,2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (23, 'Fred', 'JDJhJDEwJG1GNTZ3TGxrY0dHZTVPREZ3c0RKc3VXajRtTXI2RC8zR0V4Yk50THp3UEE4LjFwYUJ1R2dp', 'Fred', '', '2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (24, 'Fred', 'JDJhJDEwJFg2WWQudXdtTVNRMVowUjNTMDR1ZS5vZmxGNjZZcVNaOGM5T3lnLnRVUWptei4vU3A5UG8y', 'Fred', '', '2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (25, '测试', 'JDJhJDEwJENJMnM2Z2VTLjMzV1MwNGxESVB1R2VhRXFXUkhGYWJZMWt6aGlkWWQ5QWtudDdQSFAuM09L', '测试', '', '1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `admin_user` VALUES (26, '测试', 'JDJhJDEwJFhnLkh0Q1Znby5nbzBwR29RUTdVTGUuUjFXekdFQWh5OWZ5Q2pjRk04UGk2amxFejMvbVBD', '测试', '', '1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
BEGIN;
INSERT INTO `article` VALUES (1, '哈哈', 1);
INSERT INTO `article` VALUES (2, '喜喜', 1);
COMMIT;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '后台用户ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '前台用户ID',
  `original_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '原文件名',
  `save_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '保存文件名',
  `save_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统完整路径',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '系统完整路径',
  `extension` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '后缀',
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型',
  `size` bigint(20) NOT NULL DEFAULT 0 COMMENT '大小',
  `md5` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'MD5',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `delete_time` int(10) NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of attachment
-- ----------------------------
BEGIN;
INSERT INTO `attachment` VALUES (70, 2, 0, '1637206966(1).png', '1cf5c24d-5d55-4969-b9d2-d1ee7927aa2a', 'C:\\go_demo/static/uploads/attachment/', 'C:\\go_demo/static/uploads/attachment/1cf5c24d-5d55-4969-b9d2-d1ee7927aa2a.png', 'png', 'image/png', 68340, '59acd62746fc6d254988a121f2012910', '6d67ee575208cbc173d3f8e6d226dec33809527f', '2021-11-20 13:58:10', '2021-11-20 13:58:10', 0);
INSERT INTO `attachment` VALUES (71, 1, 1, '123.jpg', '34e7d3f4-074d-4886-be08-a99f47045f62', 'C:\\go_demo/static/uploads/attachment/', '/static/uploads/attachment/34e7d3f4-074d-4886-be08-a99f47045f62.jpg', 'jpg', 'image/jpeg', 191789, '31699e44691c1ef43a03361a882f8ab4', '84add41d06add5fefa2270d71fd4666fa9a1d1bd', '2021-12-22 13:54:07', '2021-12-22 13:54:07', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
