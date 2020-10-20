/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : 106.75.57.171:53306
 Source Schema         : ezlinker

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 19/10/2020 23:38:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ez_aliyun_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_aliyun_config`;
CREATE TABLE `ez_aliyun_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `access_key` varchar(64) DEFAULT NULL COMMENT '阿里云访问Key',
  `secret` varchar(200) DEFAULT NULL COMMENT '阿里云密钥',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='阿里云密钥配置表';

-- ----------------------------
-- Table structure for ez_aliyun_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_aliyun_sms_config`;
CREATE TABLE `ez_aliyun_sms_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `region_id` varchar(64) DEFAULT NULL COMMENT '区域',
  `account_name` varchar(200) DEFAULT NULL COMMENT '账户名',
  `from` varchar(200) DEFAULT NULL COMMENT '发信人(自己)',
  `address_type` varchar(200) DEFAULT NULL COMMENT '地址类型(默认为1)',
  `tag_name` varchar(200) DEFAULT NULL COMMENT '标签,平台申请以后会发',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='阿里云短信参数配置表';

-- ----------------------------
-- Table structure for ez_cloud_app
-- ----------------------------
DROP TABLE IF EXISTS `ez_cloud_app`;
CREATE TABLE `ez_cloud_app` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT 'User ID',
  `name` varchar(20) NOT NULL COMMENT 'UI显示的标签',
  `description` varchar(200) DEFAULT NULL,
  `record_version` int NOT NULL DEFAULT '0',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='云APP';

-- ----------------------------
-- Table structure for ez_cloud_function
-- ----------------------------
DROP TABLE IF EXISTS `ez_cloud_function`;
CREATE TABLE `ez_cloud_function` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `cloud_app_id` int DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL COMMENT 'TOKEN',
  `user_id` int DEFAULT NULL COMMENT 'User ID',
  `label` varchar(20) NOT NULL COMMENT 'UI显示的标签',
  `enable` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `description` varchar(200) DEFAULT NULL COMMENT 'Commet',
  `script` text NOT NULL COMMENT 'Script content',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='云函数';

-- ----------------------------
-- Table structure for ez_device
-- ----------------------------
DROP TABLE IF EXISTS `ez_device`;
CREATE TABLE `ez_device` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int NOT NULL COMMENT '项目',
  `product_id` int NOT NULL COMMENT '产品',
  `name` varchar(20) NOT NULL COMMENT '名称',
  `logo` varchar(200) NOT NULL COMMENT 'Logo',
  `location` varchar(20) DEFAULT NULL COMMENT '地理位置',
  `model` varchar(20) DEFAULT NULL COMMENT '型号',
  `industry` varchar(50) DEFAULT NULL COMMENT '厂家',
  `sn` varchar(64) NOT NULL COMMENT '序列号',
  `last_active` datetime DEFAULT NULL,
  `state` int DEFAULT NULL COMMENT '1:在线;2:离线;3未激活',
  `username` varchar(200) DEFAULT NULL COMMENT 'MQTT用户名',
  `client_id` varchar(200) DEFAULT NULL COMMENT 'MQTT ClientID',
  `password` varchar(200) DEFAULT NULL COMMENT 'MQTT密码',
  `is_superuser` int DEFAULT NULL COMMENT '是否超级权限',
  `token` varchar(255) DEFAULT NULL COMMENT '认证token',
  `field_params` json DEFAULT NULL COMMENT '参数',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='实际设备，是产品的一个实例。在EMQX中扮演 的是USER,支持两种认证形式:clientId和Username\\password.';

-- ----------------------------
-- Records of ez_device
-- ----------------------------
BEGIN;
INSERT INTO `ez_device` VALUES (1, 0, 0, 'EZLINKER-C1', 'EZLINKER-C1', 'EZLINKER-C1', 'EZLINKER-C1', 'EZLINKER-C1', 'EZLINKER-C1', NULL, NULL, 'EZLINKER', 'EZLINKER-C1', 'EZLINKER', 1, 'EZLINKER-C1_TOKEN', '[]', 'EZLINKER-C1', 0, 0, '2020-09-15 21:33:29');
INSERT INTO `ez_device` VALUES (2, 0, 0, 'EZLINKER-C2', 'EZLINKER-C2', 'EZLINKER-C2', 'EZLINKER-C2', 'EZLINKER-C2', 'EZLINKER-C2', NULL, NULL, 'EZLINKER', 'EZLINKER-C2', 'EZLINKER', 1, 'EZLINKER-C2_TOKEN', '[]', 'EZLINKER-C2', 0, 0, '2020-09-15 21:33:29');
COMMIT;

-- ----------------------------
-- Table structure for ez_dictionary_key
-- ----------------------------
DROP TABLE IF EXISTS `ez_dictionary_key`;
CREATE TABLE `ez_dictionary_key` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `label` varchar(200) DEFAULT NULL COMMENT '显示的文本',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典的项';

-- ----------------------------
-- Table structure for ez_dictionary_value
-- ----------------------------
DROP TABLE IF EXISTS `ez_dictionary_value`;
CREATE TABLE `ez_dictionary_value` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `key_id` int DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL COMMENT '名称',
  `label` varchar(255) DEFAULT NULL COMMENT '显示的文本',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='字典的值';

-- ----------------------------
-- Table structure for ez_emqx_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_emqx_config`;
CREATE TABLE `ez_emqx_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `ip` varchar(16) DEFAULT NULL COMMENT 'EMQX IP地址',
  `app_id` varchar(200) DEFAULT NULL COMMENT 'HTTP接口的ID',
  `secret` varchar(200) DEFAULT NULL COMMENT 'APP接口密钥',
  `api_port` int DEFAULT NULL COMMENT 'HTTP接口端口',
  `mqtt_port` int DEFAULT NULL COMMENT 'Mqtt端口',
  `node_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
  `state` int DEFAULT NULL COMMENT '0:离线;1:在线',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='EMQX配置表';

-- ----------------------------
-- Records of ez_emqx_config
-- ----------------------------
BEGIN;
INSERT INTO `ez_emqx_config` VALUES (1, 'node1.emqx.io', 'admin', 'public', 8081, 1883, 'emqx@node1.emqx.io', 1, '默认节点1', 0, 0, '2020-03-06 13:56:13');
INSERT INTO `ez_emqx_config` VALUES (2, 'node2.emqx.io', 'admin', 'public', 8081, 1883, 'emqx@node2.emqx.io', 1, '默认节点2', 0, 0, '2020-03-06 13:56:13');
COMMIT;

-- ----------------------------
-- Table structure for ez_mqtt_topic
-- ----------------------------
DROP TABLE IF EXISTS `ez_mqtt_topic`;
CREATE TABLE `ez_mqtt_topic` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int DEFAULT NULL COMMENT '设备',
  `client_id` varchar(64) DEFAULT NULL COMMENT 'MQTT客户端ID',
  `allow` int DEFAULT '1' COMMENT '是否允许连接: 0=拒绝1=允许',
  `type` tinyint DEFAULT '0' COMMENT '类型 1：S2C；2：C2S；3：STATUS；4：GROUP',
  `access` int DEFAULT '1' COMMENT '行为类型: 1=订阅2=发布3=订阅+发布',
  `ip` varchar(16) DEFAULT NULL COMMENT 'IP',
  `username` varchar(255) DEFAULT NULL COMMENT 'MQTT用户名',
  `topic` varchar(200) DEFAULT NULL COMMENT '路由',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='MQTT的TOPIC记录';

-- ----------------------------
-- Table structure for ez_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_permission`;
CREATE TABLE `ez_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `sort` int unsigned DEFAULT '0' COMMENT '排序值',
  `type` int NOT NULL COMMENT '类型：1目录，2动作',
  `visible` tinyint unsigned DEFAULT '0' COMMENT '是否显示在UI上',
  `label` varchar(20) NOT NULL COMMENT 'UI显示的标签',
  `name` varchar(20) NOT NULL COMMENT '名称（英文）',
  `resource` varchar(60) NOT NULL COMMENT '请求路径',
  `parent` int NOT NULL COMMENT '父资源，如果是0则为顶级',
  `description` varchar(200) DEFAULT NULL,
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户权限';

-- ----------------------------
-- Table structure for ez_product
-- ----------------------------
DROP TABLE IF EXISTS `ez_product`;
CREATE TABLE `ez_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `project_id` int NOT NULL COMMENT '项目ID',
  `name` varchar(20) NOT NULL COMMENT '产品名称',
  `logo` varchar(200) NOT NULL COMMENT '产品logo',
  `type` varchar(4) DEFAULT NULL COMMENT '类型',
  `field_params` json DEFAULT NULL COMMENT '参数',
  `description` varchar(200) DEFAULT NULL COMMENT '描述文字',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill NOT NULL COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='产品（设备的抽象模板）';

-- ----------------------------
-- Table structure for ez_project
-- ----------------------------
DROP TABLE IF EXISTS `ez_project`;
CREATE TABLE `ez_project` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `type` int NOT NULL COMMENT '类型',
  `state` int DEFAULT NULL COMMENT '状态',
  `description` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='项目';

-- ----------------------------
-- Table structure for ez_relation_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_role_permission`;
CREATE TABLE `ez_relation_role_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `permission_value` int DEFAULT NULL COMMENT '权限值',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='角色和权限关联表';


-- ----------------------------
-- Table structure for ez_relation_user_permission
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_permission`;
CREATE TABLE `ez_relation_user_permission` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int NOT NULL COMMENT '用户ID',
  `permission_id` int NOT NULL COMMENT '资源路径ID',
  `record_version` int NOT NULL DEFAULT '0',
  `x` tinyint(1) unsigned zerofill NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和资源路径关系表';

-- ----------------------------
-- Table structure for ez_relation_user_project
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_project`;
CREATE TABLE `ez_relation_user_project` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int NOT NULL COMMENT '用户ID',
  `project_id` int NOT NULL COMMENT '项目ID',
  `record_version` int NOT NULL DEFAULT '0',
  `x` tinyint(1) unsigned zerofill NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户和项目关联表，用来给用户授权具体项目';

-- ----------------------------
-- Table structure for ez_relation_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_role`;
CREATE TABLE `ez_relation_user_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户-角色关联';

-- ----------------------------
-- Table structure for ez_relation_user_subuser
-- ----------------------------
DROP TABLE IF EXISTS `ez_relation_user_subuser`;
CREATE TABLE `ez_relation_user_subuser` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `user_id` int NOT NULL,
  `sub_user_id` int NOT NULL,
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint(1) unsigned zerofill NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户-子用户关联';

-- ----------------------------
-- Table structure for ez_resource_authorize
-- ----------------------------
DROP TABLE IF EXISTS `ez_resource_authorize`;
CREATE TABLE `ez_resource_authorize` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `master_id` varchar(255) NOT NULL COMMENT '作用者',
  `master_table` varchar(255) DEFAULT NULL COMMENT '作用者表名',
  `slaver_id` int NOT NULL COMMENT '被作用的对象',
  `slaver_table` varchar(255) DEFAULT NULL COMMENT '被作用者的表名',
  `authorize_value` int NOT NULL COMMENT '授权值',
  `x` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除',
  `record_version` int unsigned NOT NULL DEFAULT '0' COMMENT '版本',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='资源授权表,记录所有存在权限关系的双方';

-- ----------------------------
-- Table structure for ez_rewrite_engine
-- ----------------------------
DROP TABLE IF EXISTS `ez_rewrite_engine`;
CREATE TABLE `ez_rewrite_engine` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT 'User ID',
  `name` varchar(20) NOT NULL COMMENT 'UI显示的标签',
  `description` varchar(200) DEFAULT NULL,
  `script` text,
  `record_version` int NOT NULL DEFAULT '0',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='脚本';

-- ----------------------------
-- Table structure for ez_role
-- ----------------------------
DROP TABLE IF EXISTS `ez_role`;
CREATE TABLE `ez_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `label` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `parent` int NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户角色';

-- ----------------------------
-- Table structure for ez_schedule_info
-- ----------------------------
DROP TABLE IF EXISTS `ez_schedule_info`;
CREATE TABLE `ez_schedule_info` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `device_id` int DEFAULT NULL COMMENT '作用方ID',
  `job_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务组名称',
  `trigger_name` varchar(500) DEFAULT NULL COMMENT '触发器名称',
  `trigger_group` varchar(500) DEFAULT NULL COMMENT '触发器组',
  `cron_expression` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '表达式',
  `execute_class` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目标执行类类名',
  `is_start` tinyint(1) DEFAULT NULL COMMENT '是否启动',
  `status` varchar(100) DEFAULT NULL COMMENT '0:停止,1:暂停:2:启动',
  `points` json DEFAULT NULL COMMENT '作用的设备列表',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务描述',
  `schedule_data` json DEFAULT NULL COMMENT '指令内容',
  `record_version` int DEFAULT NULL,
  `x` tinyint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='实际的定时任务';

-- ----------------------------
-- Table structure for ez_schedule_template
-- ----------------------------
DROP TABLE IF EXISTS `ez_schedule_template`;
CREATE TABLE `ez_schedule_template` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL COMMENT '定时任务作用的产品',
  `task_name` varchar(500) DEFAULT NULL COMMENT '任务名称',
  `schedule_data` json DEFAULT NULL COMMENT '指令内容',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'CRON',
  `task_description` varchar(500) DEFAULT NULL COMMENT '任务描述',
  `record_version` int DEFAULT NULL,
  `x` tinyint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务模板';

-- ----------------------------
-- Table structure for ez_shared_device
-- ----------------------------
DROP TABLE IF EXISTS `ez_shared_device`;
CREATE TABLE `ez_shared_device` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `user_id` int NOT NULL COMMENT '用户ID',
  `device_id` int NOT NULL COMMENT '设备ID',
  `record_version` int NOT NULL DEFAULT '0',
  `x` tinyint(1) unsigned zerofill NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='共享设备记录表';

-- ----------------------------
-- Table structure for ez_stream_integration
-- ----------------------------
DROP TABLE IF EXISTS `ez_stream_integration`;
CREATE TABLE `ez_stream_integration` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `module_id` int unsigned NOT NULL COMMENT '设备ID',
  `token` varchar(100) DEFAULT NULL COMMENT '令牌',
  `secret` varchar(100) DEFAULT NULL COMMENT '密钥',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='流媒体推送密钥';

-- ----------------------------
-- Table structure for ez_user
-- ----------------------------
DROP TABLE IF EXISTS `ez_user`;
CREATE TABLE `ez_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `avatar` varchar(10) DEFAULT NULL COMMENT '头像地址,是一个数字，标记一个PNG图片',
  `phone` varchar(11) NOT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(20) DEFAULT NULL COMMENT '实名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `user_type` int DEFAULT NULL COMMENT '用户类型：普通用户【1】，企业用户【2】，VIP用户【3】',
  `status` int DEFAULT NULL COMMENT '账户状态：正常【1】，冻结【2】，过期【3】',
  `user_profile_id` int NOT NULL COMMENT '扩展信息',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登陆时间',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '上次登录IP',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `record_version` int unsigned NOT NULL COMMENT '记录版本',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='系统用户';

-- ----------------------------
-- Records of ez_user
-- ----------------------------
BEGIN;
INSERT INTO `ez_user` VALUES (1, 'ezlinker', '5F4DCC3B5AA765D61D8327DEB882CF99', '1', '18059150204', 'ezlinker@ez.com.cn', 'EZLinker官方', 'EZLINKER-OfficialA', 1, 1, 0, '2020-10-18 19:12:57', '127.0.0.1', 0, 386, '2019-11-11 22:23:02');
COMMIT;

-- ----------------------------
-- Table structure for ez_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `ez_user_profile`;
CREATE TABLE `ez_user_profile` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `region` varchar(30) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `personal_remark` varchar(200) DEFAULT NULL,
  `certification` varchar(255) DEFAULT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `wechat` varchar(15) DEFAULT NULL,
  `x` tinyint unsigned DEFAULT '0',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='用户的详情';

-- ----------------------------
-- Records of ez_user_profile
-- ----------------------------
BEGIN;
INSERT INTO `ez_user_profile` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-12-19 21:28:56');
COMMIT;

-- ----------------------------
-- Table structure for ez_wx_app_config
-- ----------------------------
DROP TABLE IF EXISTS `ez_wx_app_config`;
CREATE TABLE `ez_wx_app_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(64) DEFAULT NULL COMMENT 'EZLINKER授权密钥名称',
  `token` varchar(200) DEFAULT NULL COMMENT 'EZLINKER授权密钥',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `record_version` int NOT NULL DEFAULT '0' COMMENT '记录版本',
  `x` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='微信小程序密钥配置表';

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('schedulerFactoryBean', 'TRIGGER=>TID:-DID:1', 'TestGroup', '0/1 * * * * ? ', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE,
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
