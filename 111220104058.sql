/*
MySQL Backup
Source Server Version: 5.1.50
Source Database: oa
Date: 2011-12-20 16:57:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `dili_admins`
-- ----------------------------
DROP TABLE IF EXISTS `dili_admins`;
CREATE TABLE `dili_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_attachments`
-- ----------------------------
DROP TABLE IF EXISTS `dili_attachments`;
CREATE TABLE `dili_attachments` (
  `aid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` smallint(10) NOT NULL DEFAULT '0',
  `model` mediumint(10) DEFAULT '0',
  `from` tinyint(1) DEFAULT '0' COMMENT '0:content model,1:cate model',
  `content` int(10) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `folder` varchar(15) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `posttime` int(11) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_backend_settings`
-- ----------------------------
DROP TABLE IF EXISTS `dili_backend_settings`;
CREATE TABLE `dili_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `dili_captcha`;
CREATE TABLE `dili_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM AUTO_INCREMENT=533 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_cate_fields`
-- ----------------------------
DROP TABLE IF EXISTS `dili_cate_fields`;
CREATE TABLE `dili_cate_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `model` smallint(10) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext,
  `width` smallint(10) DEFAULT NULL,
  `height` smallint(10) DEFAULT NULL,
  `rules` tinytext,
  `ruledescription` tinytext,
  `searchable` tinyint(1) unsigned DEFAULT NULL,
  `listable` tinyint(1) unsigned DEFAULT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_cate_models`
-- ----------------------------
DROP TABLE IF EXISTS `dili_cate_models`;
CREATE TABLE `dili_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_fieldtypes`
-- ----------------------------
DROP TABLE IF EXISTS `dili_fieldtypes`;
CREATE TABLE `dili_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_hyb_detailreport`
-- ----------------------------
DROP TABLE IF EXISTS `dili_hyb_detailreport`;
CREATE TABLE `dili_hyb_detailreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carno` varchar(256) DEFAULT '' COMMENT '车号 数组',
  `date` date NOT NULL COMMENT '日期',
  `dongti` float DEFAULT NULL COMMENT '胴体重',
  `canji` float DEFAULT NULL COMMENT '残鸡重',
  `jingzhong` float DEFAULT NULL COMMENT '毛鸡净重',
  `dongtino` smallint(6) DEFAULT NULL COMMENT '胴体数量',
  `choujino` smallint(6) DEFAULT NULL COMMENT '臭鸡只数',
  `canjino` smallint(6) DEFAULT NULL COMMENT '残鸡数量',
  `number` smallint(6) DEFAULT '0' COMMENT '毛鸡总只数',
  `canjizhesuan` tinyint(3) DEFAULT NULL COMMENT '残鸡折算比率',
  `chucheng` float DEFAULT NULL COMMENT '出成率',
  `danjia` float DEFAULT NULL COMMENT '单价',
  `jine` int(11) DEFAULT NULL COMMENT '金额',
  `yewuyuan` varchar(1000) DEFAULT NULL COMMENT '业务员 数组',
  `jingxiaoshang` varchar(100) DEFAULT NULL COMMENT '经销商',
  `beizhu` varchar(10000) DEFAULT NULL COMMENT '备注',
  `yangzhihu` varchar(256) DEFAULT NULL COMMENT '养殖户名称',
  `yunfei` varchar(1000) DEFAULT NULL COMMENT '运费 数组',
  `diqu` varchar(256) DEFAULT NULL COMMENT '所属地区',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_hyb_ribaobiao`
-- ----------------------------
DROP TABLE IF EXISTS `dili_hyb_ribaobiao`;
CREATE TABLE `dili_hyb_ribaobiao` (
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '年月 默认为2011-11-11类似',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dongti` float DEFAULT NULL COMMENT '本月胴体重',
  `canji` float DEFAULT NULL COMMENT '本月残鸡重',
  `pingjunjiage` float DEFAULT NULL COMMENT '月平均价格',
  `dongtino` smallint(6) DEFAULT NULL COMMENT '胴体数量',
  `number` int(11) DEFAULT NULL COMMENT '月总只数',
  `canjino` smallint(6) DEFAULT NULL COMMENT '残鸡数量',
  `choujino` smallint(6) DEFAULT NULL COMMENT '臭鸡数量',
  `canjibi` float DEFAULT NULL COMMENT '残鸡比好鸡胴体重量比',
  `jingzhong` float DEFAULT NULL COMMENT '总净重',
  `jine` int(11) DEFAULT NULL COMMENT '总金额',
  `yunfei` int(11) DEFAULT NULL COMMENT '总运费',
  `pingjunyunfei` float DEFAULT NULL COMMENT '月平均运费',
  `chucheng` float DEFAULT NULL COMMENT '月出成率',
  `ripingjunchanliang` float DEFAULT NULL COMMENT '日平均产量',
  `days` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_hyb_yuebaobiao`
-- ----------------------------
DROP TABLE IF EXISTS `dili_hyb_yuebaobiao`;
CREATE TABLE `dili_hyb_yuebaobiao` (
  `month` varchar(7) NOT NULL DEFAULT '0000-00' COMMENT '年月 默认为2011-11类似',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `dongti` float DEFAULT NULL COMMENT '本月胴体重',
  `canji` float DEFAULT NULL COMMENT '本月残鸡重',
  `pingjunjiage` float DEFAULT NULL COMMENT '月平均价格',
  `dongtino` smallint(6) DEFAULT NULL COMMENT '胴体数量',
  `number` int(11) DEFAULT NULL COMMENT '月总只数',
  `canjino` smallint(6) DEFAULT NULL COMMENT '残鸡数量',
  `choujino` smallint(6) DEFAULT NULL COMMENT '臭鸡数量',
  `canjibi` float DEFAULT NULL COMMENT '残鸡比好鸡胴体重量比',
  `jingzhong` float DEFAULT NULL COMMENT '总净重',
  `jine` int(11) DEFAULT NULL COMMENT '总金额',
  `yunfei` int(11) DEFAULT NULL COMMENT '总运费',
  `pingjunyunfei` float DEFAULT NULL COMMENT '月平均运费',
  `chucheng` float DEFAULT NULL COMMENT '月出成率',
  `ripingjunchanliang` float DEFAULT NULL COMMENT '日平均产量',
  `days` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_menus`
-- ----------------------------
DROP TABLE IF EXISTS `dili_menus`;
CREATE TABLE `dili_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_models`
-- ----------------------------
DROP TABLE IF EXISTS `dili_models`;
CREATE TABLE `dili_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_model_fields`
-- ----------------------------
DROP TABLE IF EXISTS `dili_model_fields`;
CREATE TABLE `dili_model_fields` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `model` smallint(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `length` smallint(10) unsigned DEFAULT NULL,
  `values` tinytext NOT NULL,
  `width` smallint(10) unsigned NOT NULL,
  `height` smallint(10) unsigned NOT NULL,
  `rules` tinytext NOT NULL,
  `ruledescription` tinytext NOT NULL,
  `searchable` tinyint(1) unsigned NOT NULL,
  `listable` tinyint(1) unsigned NOT NULL,
  `order` int(5) unsigned DEFAULT NULL,
  `editable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`model`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_oa_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `dili_oa_sessions`;
CREATE TABLE `dili_oa_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_oa_settings`
-- ----------------------------
DROP TABLE IF EXISTS `dili_oa_settings`;
CREATE TABLE `dili_oa_settings` (
  `oa_theme` varchar(15) DEFAULT NULL,
  `oa_lang` varchar(10) DEFAULT NULL,
  `oa_root_access` tinyint(1) unsigned DEFAULT '1',
  `oa_access_point` varchar(20) DEFAULT 'admin',
  `oa_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `oa_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_parameter_variable`
-- ----------------------------
DROP TABLE IF EXISTS `dili_parameter_variable`;
CREATE TABLE `dili_parameter_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arr_k` varchar(255) CHARACTER SET utf8 NOT NULL,
  `arr_v` varchar(255) CHARACTER SET utf8 NOT NULL,
  `arr_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `arr_name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `arr_user` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `dili_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `dili_plugins`;
CREATE TABLE `dili_plugins` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `version` varchar(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `author` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `copyrights` varchar(100) NOT NULL,
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_rights`
-- ----------------------------
DROP TABLE IF EXISTS `dili_rights`;
CREATE TABLE `dili_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_roles`
-- ----------------------------
DROP TABLE IF EXISTS `dili_roles`;
CREATE TABLE `dili_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `dili_sessions`;
CREATE TABLE `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_site_settings`
-- ----------------------------
DROP TABLE IF EXISTS `dili_site_settings`;
CREATE TABLE `dili_site_settings` (
  `site_name` varchar(50) DEFAULT NULL,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_logo` varchar(50) DEFAULT NULL,
  `site_icp` varchar(50) DEFAULT NULL,
  `site_terms` text,
  `site_stats` varchar(200) DEFAULT NULL,
  `site_footer` varchar(500) DEFAULT NULL,
  `site_status` tinyint(1) DEFAULT '1',
  `site_close_reason` varchar(200) DEFAULT NULL,
  `site_keyword` varchar(200) DEFAULT NULL,
  `site_description` varchar(200) DEFAULT NULL,
  `site_theme` varchar(20) DEFAULT NULL,
  `attachment_dir` varchar(20) DEFAULT NULL,
  `attachment_type` varchar(50) DEFAULT NULL,
  `attachment_maxupload` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_u_c_news`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_c_news`;
CREATE TABLE `dili_u_c_news` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `uri` varchar(100) NOT NULL DEFAULT '',
  `dec` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_u_c_oa_power`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_c_oa_power`;
CREATE TABLE `dili_u_c_oa_power` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `desc` varchar(1000) NOT NULL DEFAULT '',
  `act` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_u_m_news`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_news`;
CREATE TABLE `dili_u_m_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `stitle` varchar(256) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `scontent` text NOT NULL,
  `author` varchar(120) NOT NULL DEFAULT '',
  `keywords` varchar(256) NOT NULL DEFAULT '',
  `classid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_u_m_oa_users`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_oa_users`;
CREATE TABLE `dili_u_m_oa_users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `pass` varchar(256) NOT NULL DEFAULT '',
  `email` varchar(256) NOT NULL DEFAULT '',
  `power` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_validations`
-- ----------------------------
DROP TABLE IF EXISTS `dili_validations`;
CREATE TABLE `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `dili_admins` VALUES ('1','admin','7ac0da49ade563342c1c04470fa3426a','dili@cms.com','1');
INSERT INTO `dili_backend_settings` VALUES ('default','zh-cn','1','admin','无棣伊德圆畜牧有限公司管理中心','images/logo.gif');
INSERT INTO `dili_captcha` VALUES ('532','1324366684','221.2.177.154','q1Sn'), ('531','1324344758','221.2.177.154','6T8J'), ('530','1324276012','221.2.177.154','4bK1'), ('529','1324262024','127.0.0.1','Y3Iv'), ('528','1324261334','127.0.0.1','WSrC'), ('527','1324255367','221.2.177.154','gFXF'), ('526','1324255367','221.2.177.154','kvBm'), ('525','1324255367','221.2.177.154','uajA'), ('524','1324255367','221.2.177.154','zFdx'), ('523','1324255367','221.2.177.154','tBeU'), ('522','1324255367','221.2.177.154','kDcK'), ('521','1324255367','221.2.177.154','ll8S'), ('520','1324255367','221.2.177.154','1V2S'), ('519','1324255367','221.2.177.154','oi2k'), ('518','1324255367','221.2.177.154','OsHY'), ('517','1324255367','221.2.177.154','TcFV'), ('516','1324255367','221.2.177.154','8YLi'), ('515','1324255367','221.2.177.154','J4ff'), ('514','1324255367','221.2.177.154','z3Bu'), ('513','1324255367','221.2.177.154','u5z0'), ('512','1324255366','221.2.177.154','oVS9'), ('511','1324255366','221.2.177.154','MqP3'), ('510','1324255366','221.2.177.154','9kVz'), ('509','1324253412','221.2.177.154','29Sg'), ('508','1324253406','221.2.177.154','Tnlj'), ('507','1324253406','221.2.177.154','xfco'), ('506','1324253406','221.2.177.154','vIHM'), ('505','1324253406','221.2.177.154','qsJr'), ('504','1324253406','221.2.177.154','Wt00'), ('503','1324253406','221.2.177.154','W7xC'), ('502','1324253406','221.2.177.154','coKK'), ('501','1324253406','221.2.177.154','5azb'), ('500','1324253406','221.2.177.154','e9VY'), ('499','1324253406','221.2.177.154','kfjV'), ('498','1324253406','221.2.177.154','dYTy'), ('497','1324253406','221.2.177.154','6AOj'), ('496','1324253405','221.2.177.154','fVsv'), ('495','1324253405','221.2.177.154','95Nz'), ('494','1324253405','221.2.177.154','hf6C'), ('493','1324253405','221.2.177.154','wgTs'), ('492','1324253405','221.2.177.154','aQoS'), ('491','1324253405','221.2.177.154','joq4'), ('490','1324253405','221.2.177.154','rkCD'), ('489','1324253405','221.2.177.154','UFUP'), ('488','1324253405','221.2.177.154','NDJS'), ('487','1324253405','221.2.177.154','qrhD'), ('486','1324253404','221.2.177.154','V03x'), ('485','1324253404','221.2.177.154','pmeA'), ('484','1324253404','221.2.177.154','h66Y'), ('483','1324253404','221.2.177.154','GSdZ'), ('482','1324253404','221.2.177.154','IM1m'), ('481','1324253404','221.2.177.154','PTC2'), ('480','1324253404','221.2.177.154','32bi'), ('479','1324253404','221.2.177.154','nPS1'), ('478','1324253404','221.2.177.154','Ur3C'), ('477','1324253404','221.2.177.154','5754'), ('476','1324253403','221.2.177.154','v9nk'), ('475','1324253403','221.2.177.154','ONat'), ('474','1324253403','221.2.177.154','7MWB'), ('473','1324253403','221.2.177.154','8a08'), ('472','1324253403','221.2.177.154','6Ee6'), ('471','1324253403','221.2.177.154','wxtC'), ('470','1324253403','221.2.177.154','B22U'), ('469','1324253403','221.2.177.154','1PW6'), ('468','1324253403','221.2.177.154','M8Gz'), ('467','1324253403','221.2.177.154','9BWb'), ('466','1324253403','221.2.177.154','yjjC'), ('465','1324253403','221.2.177.154','CdgH'), ('464','1324253403','221.2.177.154','vsoN'), ('463','1324253403','221.2.177.154','35j5'), ('462','1324253402','221.2.177.154','fWrg'), ('461','1324253402','221.2.177.154','1e3K'), ('460','1324253402','221.2.177.154','qc0u'), ('459','1324253402','221.2.177.154','tU0t'), ('458','1324253402','221.2.177.154','NyV3'), ('457','1324253402','221.2.177.154','KvPs'), ('456','1324253402','221.2.177.154','ne94'), ('455','1324253402','221.2.177.154','HvMm'), ('454','1324253401','221.2.177.154','Bfcx'), ('453','1324253401','221.2.177.154','e1Pb'), ('452','1324253401','221.2.177.154','H3ww'), ('451','1324253401','221.2.177.154','eBbY'), ('450','1324253401','221.2.177.154','F1Y1'), ('449','1324253401','221.2.177.154','7mAS'), ('448','1324253401','221.2.177.154','lJm9'), ('447','1324253401','221.2.177.154','YLa9'), ('446','1324253401','221.2.177.154','iidO'), ('445','1324253401','221.2.177.154','6OwR'), ('444','1324253401','221.2.177.154','WDNQ'), ('443','1324253400','221.2.177.154','TV6m'), ('442','1324253400','221.2.177.154','kdtj'), ('441','1324253400','221.2.177.154','xwKK'), ('440','1324253400','221.2.177.154','8iX0'), ('439','1324253400','221.2.177.154','SNHy'), ('438','1324253400','221.2.177.154','1qn3'), ('437','1324253400','221.2.177.154','ILgh'), ('436','1324253400','221.2.177.154','XxQv'), ('435','1324253400','221.2.177.154','wEvc'), ('434','1324253400','221.2.177.154','XkCK'), ('433','1324253400','221.2.177.154','uPgn');
INSERT INTO `dili_captcha` VALUES ('432','1324253400','221.2.177.154','H63Y'), ('431','1324253400','221.2.177.154','qfO1'), ('430','1324253400','221.2.177.154','Tbpk'), ('429','1324253399','221.2.177.154','Zpbm'), ('428','1324253399','221.2.177.154','oQ3W'), ('427','1324253399','221.2.177.154','dcsz'), ('426','1324253399','221.2.177.154','czzu'), ('425','1324253399','221.2.177.154','rL4i'), ('424','1324253399','221.2.177.154','9TRG'), ('423','1324253399','221.2.177.154','AJey'), ('422','1324253399','221.2.177.154','oEmq'), ('421','1324253399','221.2.177.154','xHGg'), ('420','1324253399','221.2.177.154','mRWq'), ('419','1324253398','221.2.177.154','Bq0o'), ('418','1324253398','221.2.177.154','AnoO'), ('417','1324253398','221.2.177.154','utSX'), ('416','1324253398','221.2.177.154','M9Sl'), ('415','1324253398','221.2.177.154','HS97'), ('414','1324253398','221.2.177.154','LxZ5'), ('413','1324253398','221.2.177.154','1JLP'), ('412','1324253398','221.2.177.154','1rJF'), ('411','1324253398','221.2.177.154','dKQi'), ('410','1324253398','221.2.177.154','sEAv'), ('409','1324253398','221.2.177.154','WZeh'), ('408','1324253398','221.2.177.154','46Rk'), ('407','1324253398','221.2.177.154','r6L3'), ('406','1324253398','221.2.177.154','tKyg'), ('405','1324253397','221.2.177.154','sXk1'), ('404','1324253397','221.2.177.154','t9VW'), ('403','1324253397','221.2.177.154','3hmu'), ('402','1324253397','221.2.177.154','y46l'), ('401','1324253397','221.2.177.154','AX13'), ('400','1324253397','221.2.177.154','35Am'), ('399','1324253397','221.2.177.154','O8rq'), ('398','1324253397','221.2.177.154','IJCL'), ('397','1324253397','221.2.177.154','ieSR'), ('396','1324253397','221.2.177.154','q2WE'), ('395','1324253397','221.2.177.154','aRAv'), ('394','1324253397','221.2.177.154','Delw'), ('393','1324253397','221.2.177.154','UNPY'), ('392','1324253397','221.2.177.154','Bi2V'), ('391','1324253397','221.2.177.154','styD'), ('390','1324253397','221.2.177.154','TadU'), ('389','1324253396','221.2.177.154','pPyO'), ('388','1324253396','221.2.177.154','8fud'), ('387','1324253396','221.2.177.154','R1e6'), ('386','1324253396','221.2.177.154','6ekA'), ('385','1324253396','221.2.177.154','XUct'), ('384','1324253396','221.2.177.154','BNOo'), ('383','1324253396','221.2.177.154','KBh9'), ('382','1324253396','221.2.177.154','Fn2g'), ('381','1324253395','221.2.177.154','rJVL'), ('380','1324253395','221.2.177.154','IyrD'), ('379','1324253395','221.2.177.154','3ZHg'), ('378','1324253395','221.2.177.154','HYQU'), ('377','1324253395','221.2.177.154','j0c9'), ('376','1324253395','221.2.177.154','0uFU'), ('375','1324253395','221.2.177.154','sSoT'), ('374','1324253395','221.2.177.154','zN5O'), ('373','1324253395','221.2.177.154','Rzis'), ('372','1324253395','221.2.177.154','71c0'), ('371','1324253395','221.2.177.154','ZATU'), ('370','1324253395','221.2.177.154','QARi'), ('369','1324253395','221.2.177.154','tOAt'), ('368','1324253395','221.2.177.154','ls4c'), ('367','1324253395','221.2.177.154','R7oU'), ('366','1324253395','221.2.177.154','XMWX'), ('365','1324253394','221.2.177.154','emqv'), ('364','1324253393','221.2.177.154','LF2y'), ('363','1324253393','221.2.177.154','3T8N'), ('362','1324253393','221.2.177.154','1uCl'), ('361','1324253393','221.2.177.154','7nnO'), ('360','1324253393','221.2.177.154','yjtS'), ('359','1324253393','221.2.177.154','BWmc'), ('358','1324253393','221.2.177.154','hpj6'), ('357','1324253393','221.2.177.154','PZZT'), ('356','1324253393','221.2.177.154','EKZU'), ('355','1324253393','221.2.177.154','SG7G'), ('354','1324253393','221.2.177.154','TUbp'), ('353','1324253393','221.2.177.154','HTa0'), ('352','1324253393','221.2.177.154','2gxJ'), ('351','1324253393','221.2.177.154','pqyb'), ('350','1324253393','221.2.177.154','URF5'), ('349','1324253392','221.2.177.154','QRt3'), ('348','1324253392','221.2.177.154','h0mK'), ('347','1324253392','221.2.177.154','ro42'), ('346','1324253392','221.2.177.154','fMwm'), ('345','1324253392','221.2.177.154','EDiS'), ('344','1324253392','221.2.177.154','S6q8'), ('343','1324253392','221.2.177.154','tkN7'), ('342','1324253391','221.2.177.154','Agak'), ('341','1324253391','221.2.177.154','oXZz'), ('340','1324253391','221.2.177.154','vwwg'), ('339','1324253391','221.2.177.154','IHM9'), ('338','1324253391','221.2.177.154','FA33'), ('337','1324197363','221.2.177.154','C9Cj'), ('336','1324197187','221.2.177.154','IXN9'), ('335','1324194109','221.2.177.154','6BK3'), ('334','1324190430','221.2.177.154','fwTM'), ('333','1324185704','221.2.177.154','yl10');
INSERT INTO `dili_captcha` VALUES ('332','1324171608','221.2.177.154','m0co'), ('331','1324171602','221.2.177.154','oUR1'), ('330','1324171561','221.2.177.154','NRWi'), ('329','1324171529','221.2.177.154','z0mb'), ('328','1324171499','221.2.177.154','9fJB'), ('327','1324085978','222.134.30.32','fIem'), ('326','1324035828','60.215.42.198','bdb9'), ('325','1324026424','60.215.42.198','thE1'), ('324','1324011870','60.215.42.198','qSC8'), ('323','1324002931','60.215.42.198','jhYk'), ('322','1323932184','222.134.30.32','Se8L'), ('321','1323932095','222.134.30.32','t528'), ('320','1323917585','221.2.176.181','Nveg'), ('319','1323915859','221.2.176.181','QXoP'), ('318','1323915017','221.2.176.181','Dfy9'), ('317','1323912554','221.2.176.181','AQm8'), ('316','1323911866','221.2.176.181','xnN9'), ('315','1323911864','221.2.176.181','Fbr8'), ('314','1323911446','221.2.176.181','u4D3'), ('313','1323911076','221.2.176.181','WWCf'), ('312','1323910647','221.2.176.181','Ndcn'), ('311','1323909584','221.2.176.181','bBzS'), ('310','1323909463','221.2.176.181','vDKL'), ('309','1323908969','221.2.176.181','jSBo'), ('308','1323908704','221.2.176.181','eIhh'), ('307','1323869996','221.2.176.181','uyCg'), ('306','1323869884','221.2.176.181','aHGW'), ('305','1323869759','221.2.176.181','kxwF'), ('304','1323869754','221.2.176.181','WqjL'), ('303','1323740347','112.245.179.69','rIke'), ('302','1323681140','112.245.179.69','3nzX'), ('301','1323493532','112.245.179.69','cX7X'), ('300','1323484161','112.245.179.69','bxpi'), ('299','1323477841','112.245.179.69','s9LH'), ('298','1323476641','112.245.179.69','DmTh'), ('297','1323476583','112.245.179.69','hORw'), ('296','1323476519','112.245.179.69','DDC2'), ('295','1323476503','112.245.179.69','O3Yh'), ('294','1323476472','112.245.179.69','rl03'), ('293','1323476471','112.245.179.69','GRdl'), ('292','1323476467','112.245.179.69','V42T'), ('291','1323475154','112.245.179.69','trYm'), ('290','1323434458','112.245.179.69','gMAe'), ('289','1323433786','112.245.179.69','Bcf2'), ('288','1323433114','112.245.179.69','okGY'), ('287','1323432401','112.245.179.69','Zl1a'), ('286','1323431634','112.245.179.69','JPdf'), ('285','1323431623','112.245.179.69','ENtK'), ('284','1323430947','112.245.179.69','R2Pp'), ('283','1323429010','112.245.179.69','bxzt'), ('282','1323413321','112.245.179.69','dHwx'), ('281','1323412575','112.245.179.69','fNms'), ('280','1323411736','112.245.179.69','RgK7'), ('279','1323411697','112.245.179.69','8BBk'), ('278','1323411689','112.245.179.69','GTHw'), ('277','1323411571','112.245.179.69','BToC'), ('276','1323411361','112.245.179.69','Wxso'), ('275','1323411317','112.245.179.69','07Gc'), ('274','1323411249','112.245.179.69','JNre'), ('273','1323411134','112.245.179.69','MvHE');
INSERT INTO `dili_cate_fields` VALUES ('6','dec','说明','4','textarea','256','','300','100','','','0','0','1','0'), ('4','name','新闻分类名称','4','input','256','','100','30','required','','0','1','0','1'), ('5','uri','URL别名','4','input','100','','50','30','required','','0','1','0','1'), ('7','name','oa权限名称','5','input','256','','100','30','required','','0','1','0','1'), ('8','desc','oa用户权限说明','5','textarea','1000','','150','100','required','务必填写相关信息','0','1','1','1'), ('9','act','操作名称字母','5','input','30','','100','30','required','','0','1','2','1');
INSERT INTO `dili_cate_models` VALUES ('4','news','新闻分类','25','2','0','0'), ('5','oa_power','oa权限分类','25','0','0','0');
INSERT INTO `dili_fieldtypes` VALUES ('int','整形(INT)'), ('float','浮点型(FLOAT)'), ('input','单行文本框(VARCHAR)'), ('textarea','文本区域(VARCHAR)'), ('select','下拉菜单(VARCHAR)'), ('select_from_model','下拉菜单(模型数据)(INT)'), ('linked_menu','联动下拉菜单(VARCHAR)'), ('radio','单选按钮(VARCHAR)'), ('radio_from_model','单选按钮(模型数据)(INT)'), ('checkbox','复选框(VARCHAR)'), ('checkbox_from_model','复选框(模型数据)(VARCHAR)'), ('wysiwyg','编辑器(TEXT)'), ('wysiwyg_basic','编辑器(简)(TEXT)'), ('datetime','日期时间(VARCHAR)'), ('colorpicker','颜色选择器(VARCHAR)');
INSERT INTO `dili_hyb_detailreport` VALUES ('1','a:5:{i:0;s:4:\"2821\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}','2011-11-18','7589','182','10678','0','10','0','4130','5','71.4','9.86','105285','a:1:{i:0;s:6:\"胴体\";}','王书昌','无任何争议','吕元坤','a:1:{i:2821;s:1:\"0\";}','石家庄'), ('2','a:5:{i:0;s:5:\"51673\";i:1;s:5:\"09797\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}','2011-11-19','11201.8','90.6','14620','2100','5','43','2143','5','76.74','9.6','140352','a:2:{i:0;s:9:\"徐立君\";i:1;s:9:\"李长平\";}','罗松伟','无任何争议','黄海','a:2:{i:51673;s:3:\"900\";s:5:\"09797\";s:4:\"1119\";}','天津静海'), ('3','a:5:{i:0;s:5:\"68933\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";}','2011-12-17','7859.2','107.1','10540','3450','25','62','3512','5','74.77','9.6','101184','a:1:{i:0;s:9:\"宋喜辉\";}','罗松伟','无任何争议','马秀丽','a:1:{i:68933;s:4:\"1997\";}','河北霸州');
INSERT INTO `dili_hyb_yuebaobiao` VALUES ('2011-10','2','18790.8','272.6','9.71','2100','6273','43',NULL,'1.45','25298','245637','2019','0.08','74.637',NULL,NULL), ('2011-9','3','18790.8','272.6','9.71','2100','6273','43',NULL,'1.45','25298','245637','2019','0.08','74.637',NULL,NULL), ('2011-8','4','26650','379.7','9.677','5550','9785','105','40','1.42','35838','346821','4016','0.112','74.72','11946','3'), ('2011-7','5','26650','379.7','9.677','5550','9785','105','40','1.42','35838','346821','4016','0.112','74.72','11946','3'), ('2011-11','6','18790.8','272.6','9.71','2100','6273','43','15','1.45','25298','245637','2019','0.08','74.64','12649','2');
INSERT INTO `dili_menus` VALUES ('1','system','home','系统','0','0'), ('2','system','home','后台首页','1','1'), ('3','system','home','后台首页','2','2'), ('4','setting','site','系统设置','1','1'), ('5','setting','site','站点设置','2','4'), ('6','setting','backend','后台设置','2','4'), ('7','system','password','修改密码','2','4'), ('8','system','cache','更新缓存','2','4'), ('9','model','view','模型管理','1','1'), ('10','model','view','内容模型管理','2','9'), ('11','category','view','分类模型管理','2','9'), ('12','plugin','view','插件管理','1','1'), ('13','plugin','view','插件管理','2','12'), ('14','role','view','权限管理','1','1'), ('15','role','view','用户组管理','2','14'), ('16','user','view','用户管理','2','14'), ('17','content','view','内容管理','0','0'), ('18','content','view','内容管理','1','17'), ('19','category_content','view','分类管理','1','17'), ('20','module','run','工具','0','0'), ('21','setting','oa','oa设置','2','4');
INSERT INTO `dili_models` VALUES ('1','news','新闻中心','20','1','0'), ('2','oa_users','oa用户表','25','0','0');
INSERT INTO `dili_model_fields` VALUES ('1','title','标题','1','input','256','','256','22','required','is  not null','1','1','1','1'), ('2','stitle','简短标题','1','input','256','','100','20','','','0','1','1','1'), ('3','content','内容','1','wysiwyg','0','','300','300','','','1','0','1','1'), ('4','scontent','文章概要','1','wysiwyg_basic','0','','300','100','','','1','0','1','1'), ('5','author','作者','1','input','120','','60','20','','','1','0','2','0'), ('6','keywords','关键词','1','input','256','','0','0','','','1','0','3','1'), ('8','classid','分类名称','1','select_from_model','10','news|name','50','30','','','0','1','0','1'), ('9','name','用户名','2','input','256','','100','30','required','必填','0','1','1','1'), ('10','pass','oa用户密码','2','input','256','','100','30','required','密码必填','0','1','1','1'), ('11','email','用户电子邮箱','2','input','256','','150','30','valid_email','','0','1','2','1'), ('12','power','部门','2','select_from_model','0','oa_power|name','50','30','','','0','1','3','1');
INSERT INTO `dili_oa_sessions` VALUES ('ee1b72f0db268a105dc279020ce31a74','221.2.177.154','Mozilla/5.0 (Windows NT 5.1; rv:8.0.1) Gecko/20100','1324350887','a:1:{s:4:\"ouid\";s:1:\"1\";}','2011-12-20 11:14:47'), ('c7c1950f3c015dec7a42b794f80cfe37','221.2.177.154','Mozilla/5.0 (Windows NT 5.1; rv:8.0.1) Gecko/20100','1324371352','a:1:{s:4:\"ouid\";s:1:\"1\";}','2011-12-20 16:55:52');
INSERT INTO `dili_oa_settings` VALUES ('oa','zh-cn','0','oa','办公系统 —— 无棣伊德圆畜牧有限公司','images/logo.gif');
INSERT INTO `dili_parameter_variable` VALUES ('5','channel_name','插件','text','网站房产频道固定标题','admin'), ('6','QQ1','888899955566','text','张三QQ999000000000','admin'), ('7','QQ2','558955','text','李四QQ99','admin');
INSERT INTO `dili_plugins` VALUES ('1','dili_diy_variable','1','自定义变量','增加常用的变量,方便使用！','mvc999','http://localhost:8080/plugins/dili_diy_variable/plugin_dili_diy_variable_install.xml','free','0','1');
INSERT INTO `dili_rights` VALUES ('1','密码修改','system','password',NULL), ('2','更新缓存','system','cache',NULL), ('3',' 站点设置','setting','site',NULL), ('4','后台设置','setting','backend',NULL), ('5','插件管理[列表]','plugin','view',NULL), ('6','添加插件','plugin','add',NULL), ('7','修改插件','plugin','edit',NULL), ('8','卸载插件','plugin','del',NULL), ('9','导出插件','plugin','export',NULL), ('10','导入插件','plugin','import',NULL), ('11','激活插件','plugin','active',NULL), ('12','禁用插件','plugin','deactive',NULL), ('13','运行插件','module','run',NULL), ('14','内容模型管理[列表]','model','view',NULL), ('15','添加内容模型','model','add',NULL), ('16','修改内容模型','model','edit',NULL), ('17','删除内容模型','model','del',NULL), ('18','内容模型字段管理[列表]','model','fields',NULL), ('19','添加内容模型字段','model','add_filed',NULL), ('20','修改内容模型字段','model','edit_field',NULL), ('21','删除内容模型字段','model','del_field',NULL), ('22','分类模型管理[列表]','category','view',NULL), ('23','添加分类模型','category','add',NULL), ('24','修改分类模型','category','edit',NULL), ('25','删除分类模型','category','del',NULL), ('26','分类模型字段管理[列表]','category','fields',NULL), ('27','添加分类模型字段','category','add_filed',NULL), ('28','修改分类模型字段','category','edit_field',NULL), ('29','删除分类模型字段','category','del_field',NULL), ('30','内容管理[列表]','content','view',NULL), ('31','添加内容[表单]','content','form','add'), ('32','修改内容[表单]','content','form','edit'), ('33','添加内容[动作]','content','save','add'), ('34','修改内容[动作]','content','save','edit'), ('35','删除内容','content','del',NULL), ('36','分类管理[列表]','category_content','view',NULL), ('37','添加分类[表单]','category_content','form','add'), ('38','修改分类[表单]','category_content','form','edit'), ('39','添加分类[动作]','category_content','save','add'), ('40','修改分类[动作]','category_content','save','edit'), ('41','删除分类','category_content','del',NULL), ('42','用户组管理[列表]','role','view',NULL), ('43','添加用户组','role','add',NULL), ('44','修改用户组','role','edit',NULL), ('45','删除用户组','role','del',NULL), ('46','用户管理[列表]','user','view',NULL), ('47','添加用户','user','add',NULL), ('48','修改用户','user','edit',NULL), ('49','删除用户','user','del',NULL);
INSERT INTO `dili_roles` VALUES ('1','root','','','',''), ('2','管理员','1,2,3,4,5,6,7,8,10,11,12,13,30,32,34,35,36,38,40,46,47,48','0','keywords,category','0'), ('3','网站编辑','1,2,30,31,32,33,34,35,37,38,39,40','news','keywords,category','0');
INSERT INTO `dili_sessions` VALUES ('d2557ebc7986504082e1b49b095567bd','112.245.179.69','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KH','1323486122','a:1:{s:3:\"uid\";s:1:\"1\";}'), ('ad2450941ec539dff853c2959da22a83','221.2.176.181','Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KH','1323912566','');
INSERT INTO `dili_site_settings` VALUES ('伊德圆畜牧有限公司','http://oa.hainuo.info','images/logo.gif','','','<script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/5980672.js\"></script>\r\n<noscript><a href=\"http://www.51.la/?5980672\" target=\"_blank\"><img alt=\"我要啦&#','<p>伊德圆畜牧有限公司 &nbsp; power&copy; <a href=\"http://hainuo.info\" target=\"_blank\">hainuo.info</a></p><p><br /></p>','0','网站维护升级中......','伊德圆，伊德圆畜牧有限公司','伊德圆畜牧有限公司位于山东无棣是山东省一流的清真食品加工销售公司。现公司主营肉鸡分割产品。','default','attachments','*.jpg;*.gif;*.png','2097152');
INSERT INTO `dili_u_c_news` VALUES ('1','0','1','','站点公告','alarm',''), ('3','0','1','','伊德圆公告','gonggao',''), ('4','1','2','0,1,0','wudi','1',''), ('5','3','2','0,3,0','box','2','');
INSERT INTO `dili_u_c_oa_power` VALUES ('1','0','1','','总经理','总经理拥有所有权限','zjl'), ('2','0','1','','财务','财务只负责钱数 对账','cw'), ('3','0','1','','采购','采购负责相关采购信息入库。','cg'), ('4','0','1','','保管','负责工厂部分用品库存核发核对','bg'), ('5','0','1','','货源','负责货源部审核','hyb'), ('6','0','1','','生产','生产相关信息','sc'), ('7','0','1','','销售','产品发货人员','xs'), ('8','0','1','','司务','后勤','sw'), ('9','0','1','','机修','机修部','jx'), ('10','0','1','','董事长','董事长','dsz'), ('11','0','1','','root','root','root');
INSERT INTO `dili_u_m_oa_users` VALUES ('1','1323327543','1323327543','admin','admin','admin@hainuo.info','11'), ('2','1323327565','1323327565','刘世增','liushizeng','','5');
INSERT INTO `dili_validations` VALUES ('required','必填'), ('valid_email','E-mail格式');
