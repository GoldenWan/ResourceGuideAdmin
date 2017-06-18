/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_guide

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-18 10:34:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES ('1', 'java', null, null, '0');
INSERT INTO `t_category` VALUES ('2', 'js', null, null, '0');
INSERT INTO `t_category` VALUES ('3', 'css+html5', null, null, '0');
INSERT INTO `t_category` VALUES ('4', 'jquery', null, null, '0');

-- ----------------------------
-- Table structure for t_experience
-- ----------------------------
DROP TABLE IF EXISTS `t_experience`;
CREATE TABLE `t_experience` (
  `id` varchar(20) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `operatortime` datetime DEFAULT NULL,
  `failreason` varchar(200) DEFAULT NULL,
  `categoryid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_23` (`categoryid`),
  KEY `FK_Reference_6` (`userid`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`categoryid`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_experience
-- ----------------------------

-- ----------------------------
-- Table structure for t_experiencelike
-- ----------------------------
DROP TABLE IF EXISTS `t_experiencelike`;
CREATE TABLE `t_experiencelike` (
  `id` varchar(20) DEFAULT NULL,
  `experienceid` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  KEY `FK_Reference_16` (`experienceid`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`experienceid`) REFERENCES `t_experience` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_experiencelike
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `ID` varchar(40) NOT NULL,
  `userid` varchar(20) NOT NULL,
  `CONTENT` text NOT NULL COMMENT '反馈内容',
  `TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '反馈时间',
  PRIMARY KEY (`ID`),
  KEY `FK_Reference_21` (`userid`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` varchar(20) NOT NULL,
  `filename` varchar(20) DEFAULT NULL,
  `smark` varchar(200) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `filepath` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `categoryid` varchar(20) DEFAULT NULL,
  `failreason` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_22` (`categoryid`),
  KEY `FK_Reference_7` (`userid`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`categoryid`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_file
-- ----------------------------

-- ----------------------------
-- Table structure for t_filelike
-- ----------------------------
DROP TABLE IF EXISTS `t_filelike`;
CREATE TABLE `t_filelike` (
  `id` varchar(20) NOT NULL,
  `fileid` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_25` (`fileid`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`fileid`) REFERENCES `t_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_filelike
-- ----------------------------

-- ----------------------------
-- Table structure for t_function
-- ----------------------------
DROP TABLE IF EXISTS `t_function`;
CREATE TABLE `t_function` (
  `id` varchar(20) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_function
-- ----------------------------
INSERT INTO `t_function` VALUES ('1', 'add', '增加', '0', null);
INSERT INTO `t_function` VALUES ('2', 'delete', '删除', '0', null);
INSERT INTO `t_function` VALUES ('3', 'update', '修改', '0', null);
INSERT INTO `t_function` VALUES ('4', 'select', '查询', '0', null);
INSERT INTO `t_function` VALUES ('5', 'power', '赋权', '0', null);
INSERT INTO `t_function` VALUES ('6', 'check', '审核', '0', null);

-- ----------------------------
-- Table structure for t_functionrole
-- ----------------------------
DROP TABLE IF EXISTS `t_functionrole`;
CREATE TABLE `t_functionrole` (
  `id` varchar(200) NOT NULL,
  `functionid` varchar(200) DEFAULT NULL,
  `roleid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_13` (`roleid`),
  KEY `FK_Reference_14` (`functionid`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`functionid`) REFERENCES `t_function` (`id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_functionrole
-- ----------------------------
INSERT INTO `t_functionrole` VALUES ('1', '1', '1');
INSERT INTO `t_functionrole` VALUES ('10', '4', '3');
INSERT INTO `t_functionrole` VALUES ('11', '5', '3');
INSERT INTO `t_functionrole` VALUES ('12', '1', '4');
INSERT INTO `t_functionrole` VALUES ('13', '1', '4');
INSERT INTO `t_functionrole` VALUES ('14', '2', '4');
INSERT INTO `t_functionrole` VALUES ('15', '3', '4');
INSERT INTO `t_functionrole` VALUES ('16', '4', '4');
INSERT INTO `t_functionrole` VALUES ('17', '5', '4');
INSERT INTO `t_functionrole` VALUES ('18', '6', '4');
INSERT INTO `t_functionrole` VALUES ('2', '2', '1');
INSERT INTO `t_functionrole` VALUES ('3', '1', '2');
INSERT INTO `t_functionrole` VALUES ('4', '2', '2');
INSERT INTO `t_functionrole` VALUES ('5', '3', '2');
INSERT INTO `t_functionrole` VALUES ('6', '4', '2');
INSERT INTO `t_functionrole` VALUES ('7', '1', '3');
INSERT INTO `t_functionrole` VALUES ('8', '2', '3');
INSERT INTO `t_functionrole` VALUES ('9', '3', '3');

-- ----------------------------
-- Table structure for t_loginfo
-- ----------------------------
DROP TABLE IF EXISTS `t_loginfo`;
CREATE TABLE `t_loginfo` (
  `id` varchar(200) NOT NULL,
  `exceptionmsg` varchar(200) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  `operator` varchar(200) DEFAULT NULL,
  `operatortime` datetime DEFAULT NULL,
  `operatorip` varchar(200) DEFAULT NULL,
  `state` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of t_loginfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_logininfo
-- ----------------------------
DROP TABLE IF EXISTS `t_logininfo`;
CREATE TABLE `t_logininfo` (
  `id` varchar(20) NOT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `operatorip` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `loginarea` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_15` (`userid`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logininfo
-- ----------------------------
INSERT INTO `t_logininfo` VALUES ('1', 'root', '2017-06-08 23:26:04', '192.26.35.2', '1', '甘肃');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` varchar(20) NOT NULL DEFAULT '0',
  `author` varchar(20) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `content` text,
  `submittime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `failreason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`userid`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题';

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', 'root', 'javaee指的是？', '我想了解javaee', '2017-06-07 09:59:09', '0', '1', '1', '');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` varchar(20) NOT NULL,
  `url` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`userid`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_response
-- ----------------------------
DROP TABLE IF EXISTS `t_response`;
CREATE TABLE `t_response` (
  `id` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `answercontent` text,
  `submittime` datetime NOT NULL,
  `questionid` varchar(20) DEFAULT NULL,
  `failreason` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_18` (`questionid`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`questionid`) REFERENCES `t_question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_response
-- ----------------------------
INSERT INTO `t_response` VALUES ('1', 'wk', '包括ejb', '2017-06-14 10:00:36', '1', null, '1');
INSERT INTO `t_response` VALUES ('2', 'ww', '还不包括javaweb', '2017-06-15 10:01:10', '1', null, '1');

-- ----------------------------
-- Table structure for t_responselike
-- ----------------------------
DROP TABLE IF EXISTS `t_responselike`;
CREATE TABLE `t_responselike` (
  `id` varchar(20) NOT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  `responseid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_24` (`responseid`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`responseid`) REFERENCES `t_response` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_responselike
-- ----------------------------
INSERT INTO `t_responselike` VALUES ('1', '1', '2017-06-21 10:13:37', '1');
INSERT INTO `t_responselike` VALUES ('2', '2', '2017-06-14 10:16:17', '1');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'common', '普通用户：增加，删除，修改，查询，自己的checked==0', '0', '2017-05-31 09:27:57');
INSERT INTO `t_role` VALUES ('2', 'primary ', '初级管理员：增加，删除，修改，查询', '1', '2017-06-06 09:29:32');
INSERT INTO `t_role` VALUES ('3', 'middle', '中级管理员：审核', '2', '2017-06-14 09:31:40');
INSERT INTO `t_role` VALUES ('4', 'senior', '高级管理员', '3', '2017-06-07 09:31:45');

-- ----------------------------
-- Table structure for t_scorerecord
-- ----------------------------
DROP TABLE IF EXISTS `t_scorerecord`;
CREATE TABLE `t_scorerecord` (
  `id` varchar(20) NOT NULL,
  `yunbandownload` varchar(20) DEFAULT NULL,
  `fileupload` varchar(20) DEFAULT NULL,
  `experience` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_27` (`userid`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scorerecord
-- ----------------------------

-- ----------------------------
-- Table structure for t_scorestandard
-- ----------------------------
DROP TABLE IF EXISTS `t_scorestandard`;
CREATE TABLE `t_scorestandard` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_scorestandard
-- ----------------------------
INSERT INTO `t_scorestandard` VALUES ('1', 'responselike', '10', '2017-06-14 10:18:38');
INSERT INTO `t_scorestandard` VALUES ('2', 'experiencelike', '50', '2017-05-31 10:18:34');
INSERT INTO `t_scorestandard` VALUES ('3', 'filelike', '100', '2017-06-21 10:19:21');
INSERT INTO `t_scorestandard` VALUES ('4', 'yunpanlike', '60', '2017-06-07 10:20:05');

-- ----------------------------
-- Table structure for t_system
-- ----------------------------
DROP TABLE IF EXISTS `t_system`;
CREATE TABLE `t_system` (
  `ID` int(11) NOT NULL,
  `ABOUT_US` text COMMENT '支持纯文本和html',
  `VERSION` varchar(10) DEFAULT NULL,
  `DOWNLOAD` int(11) DEFAULT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `INSTRUCTION` text,
  `captain` char(10) DEFAULT NULL,
  `declaration` char(10) DEFAULT NULL,
  `support` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `weixin` varchar(20) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `identitynumber` int(18) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `registertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registerip` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `alias` varchar(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'root', 'root', '1111', '222', '3333', '4444', '555', '0', '2017-06-17 23:25:30', '127.2.2.2', '小强', '男', 'x先生', '1000');
INSERT INTO `t_user` VALUES ('2', 'ww', 'ww', null, null, null, null, null, null, '2017-06-18 10:31:51', null, null, null, null, null);

-- ----------------------------
-- Table structure for t_userrole
-- ----------------------------
DROP TABLE IF EXISTS `t_userrole`;
CREATE TABLE `t_userrole` (
  `id` varchar(200) NOT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `roleid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`roleid`),
  KEY `FK_Reference_12` (`userid`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`roleid`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userrole
-- ----------------------------
INSERT INTO `t_userrole` VALUES ('1', '1', '4');
INSERT INTO `t_userrole` VALUES ('2', '2', '1');

-- ----------------------------
-- Table structure for t_yunpan
-- ----------------------------
DROP TABLE IF EXISTS `t_yunpan`;
CREATE TABLE `t_yunpan` (
  `id` varchar(20) NOT NULL,
  `url` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  `checked` int(11) DEFAULT NULL,
  `categoryid` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `failreason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`userid`),
  KEY `FK_Reference_20` (`categoryid`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`userid`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`categoryid`) REFERENCES `t_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_yunpan
-- ----------------------------

-- ----------------------------
-- Table structure for t_yunpanlike
-- ----------------------------
DROP TABLE IF EXISTS `t_yunpanlike`;
CREATE TABLE `t_yunpanlike` (
  `id` varchar(20) NOT NULL,
  `yunpanid` varchar(20) DEFAULT NULL,
  `userid` varchar(20) DEFAULT NULL,
  `submittime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_26` (`yunpanid`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`yunpanid`) REFERENCES `t_yunpan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_yunpanlike
-- ----------------------------
