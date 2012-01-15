/*
MySQL Backup
Source Server Version: 5.1.50
Source Database: oa
Date: 2012-1-15 13:52:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `ck_pandian`
-- ----------------------------
DROP TABLE IF EXISTS `ck_pandian`;
CREATE TABLE `ck_pandian` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='库存盘点表';

-- ----------------------------
--  Table structure for `ck_rimingxi`
-- ----------------------------
DROP TABLE IF EXISTS `ck_rimingxi`;
CREATE TABLE `ck_rimingxi` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `fahuoshijian` datetime DEFAULT NULL,
  `pihao` varchar(45) DEFAULT NULL,
  `beizhu` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='仓库明细表';

-- ----------------------------
--  Table structure for `cw_liushuizhang`
-- ----------------------------
DROP TABLE IF EXISTS `cw_liushuizhang`;
CREATE TABLE `cw_liushuizhang` (
  `id` int(11) NOT NULL,
  `hyb_mingxi_id` int(11) DEFAULT NULL COMMENT '日毛鸡收购明细表id',
  `ischecked` int(1) DEFAULT NULL COMMENT '是否审核完毕\n0未审核\n1部分人员审核\n2全部审核',
  `check_user_id` varchar(45) DEFAULT NULL COMMENT '审核人员id\n',
  `ischeckout` tinyint(1) DEFAULT NULL COMMENT '是否已支付',
  `leijiweizhifujine` int(11) DEFAULT NULL COMMENT '累计未支付金额，计算 ischeckout!=1且schecked=2的情况',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务科';

-- ----------------------------
--  Table structure for `cw_yuehuizong`
-- ----------------------------
DROP TABLE IF EXISTS `cw_yuehuizong`;
CREATE TABLE `cw_yuehuizong` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `shouzhi` tinyint(1) DEFAULT NULL COMMENT '0为支出\n1为收入',
  `beizhu` varchar(500) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `month` varchar(10) DEFAULT '0000-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务月账目汇总  此表不太清楚需求暂时做简单设计';

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
  `oa_logo` varchar(100) DEFAULT 'images/logo.gif',
  `oa_canjizhesuanlv` tinyint(4) NOT NULL DEFAULT '5'
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `dili_sessions`;
CREATE TABLE `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
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
--  Table structure for `dili_u_c_hyb_diqu`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_c_hyb_diqu`;
CREATE TABLE `dili_u_c_hyb_diqu` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `baodi` int(11) NOT NULL DEFAULT '0',
  `start` int(3) NOT NULL DEFAULT '0',
  `end` int(3) NOT NULL DEFAULT '0',
  `beizhu` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `dili_u_m_hyb_mingxibiao`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_hyb_mingxibiao`;
CREATE TABLE `dili_u_m_hyb_mingxibiao` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `yewuyuan1` varchar(50) NOT NULL DEFAULT '',
  `yewuyuan2` varchar(50) NOT NULL DEFAULT '',
  `yewuyuan3` varchar(50) NOT NULL DEFAULT '',
  `yewuyuan4` varchar(50) NOT NULL DEFAULT '',
  `yewuyuan5` varchar(50) NOT NULL DEFAULT '',
  `qq_dongti_mingxi_id` int(10) NOT NULL DEFAULT '0',
  `date` varchar(12) NOT NULL DEFAULT '',
  `diqu` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
--  Table structure for `dili_u_m_qq_dongti_rimingxi`
-- ----------------------------
DROP TABLE IF EXISTS `dili_u_m_qq_dongti_rimingxi`;
CREATE TABLE `dili_u_m_qq_dongti_rimingxi` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `chehao` varchar(10) NOT NULL DEFAULT '',
  `checi` int(4) NOT NULL DEFAULT '0',
  `date` varchar(12) NOT NULL DEFAULT '',
  `dongti` float NOT NULL DEFAULT '0',
  `dongtino` int(10) NOT NULL DEFAULT '0',
  `canji` int(10) NOT NULL DEFAULT '0',
  `canjino` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `dili_validations`
-- ----------------------------
DROP TABLE IF EXISTS `dili_validations`;
CREATE TABLE `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `hyb_diqu`
-- ----------------------------
DROP TABLE IF EXISTS `hyb_diqu`;
CREATE TABLE `hyb_diqu` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `baodi` varchar(45) DEFAULT NULL,
  `start` smallint(6) DEFAULT NULL COMMENT '吨位下线',
  `end` smallint(6) DEFAULT NULL COMMENT '吨位上线\n',
  `ischangtu` tinyint(1) DEFAULT NULL COMMENT '是不是长途 是长途则只按保底算\n不是长途则按分区算',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `hyb_mingxibiao`
-- ----------------------------
DROP TABLE IF EXISTS `hyb_mingxibiao`;
CREATE TABLE `hyb_mingxibiao` (
  `id` int(11) NOT NULL,
  `yewuyuan1` varchar(45) DEFAULT NULL,
  `yewuyuan2` varchar(45) DEFAULT NULL,
  `yewuyuan3` varchar(45) DEFAULT NULL,
  `yewuyuan4` varchar(45) DEFAULT NULL,
  `yewuyuan5` varchar(45) DEFAULT NULL,
  `qq_dongti_mingxi_id` int(11) DEFAULT NULL,
  `chucheng` float DEFAULT NULL,
  `canjizhesuan` tinyint(4) DEFAULT NULL,
  `diqu` varchar(45) DEFAULT NULL,
  `yangzhihu` varchar(45) DEFAULT NULL,
  `jingxiaoshang` varchar(45) DEFAULT NULL,
  `jiangjia` float DEFAULT NULL,
  `date` date DEFAULT NULL,
  `jingzhong` float DEFAULT NULL,
  `yunfei` int(11) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货源部明细表';

-- ----------------------------
--  Table structure for `hyb_ribaobiao`
-- ----------------------------
DROP TABLE IF EXISTS `hyb_ribaobiao`;
CREATE TABLE `hyb_ribaobiao` (
  `id` int(11) NOT NULL,
  `yunfei` int(11) DEFAULT NULL,
  `dongti` float DEFAULT NULL,
  `canji` float DEFAULT NULL,
  `dongtino` smallint(6) DEFAULT NULL,
  `canjino` smallint(6) DEFAULT NULL,
  `jingzhong` float DEFAULT NULL,
  `canjibi` float DEFAULT NULL COMMENT '残鸡和好鸡胴体的重量比\n',
  `junjia` float DEFAULT NULL COMMENT '平均价格\n',
  `pingjunyunfei` float DEFAULT NULL COMMENT '平均运费\n',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `qq_dongti_mingxi`
-- ----------------------------
DROP TABLE IF EXISTS `qq_dongti_mingxi`;
CREATE TABLE `qq_dongti_mingxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `dongti` float DEFAULT NULL,
  `canji` float DEFAULT NULL,
  `dongtino` smallint(6) DEFAULT NULL,
  `canjino` smallint(6) DEFAULT NULL,
  `choujino` tinyint(4) DEFAULT NULL,
  `chehao` varchar(10) DEFAULT NULL,
  `checi` tinyint(4) DEFAULT NULL,
  `beizhu` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `checi` (`checi`),
  KEY `chehao` (`chehao`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='胴体明细表\n';

-- ----------------------------
--  Table structure for `sc_rimingxi`
-- ----------------------------
DROP TABLE IF EXISTS `sc_rimingxi`;
CREATE TABLE `sc_rimingxi` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '产品名称',
  `chanliang` int(11) DEFAULT NULL COMMENT '数量',
  `date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生产明细表';

-- ----------------------------
--  Table structure for `sc_yuebaobiao`
-- ----------------------------
DROP TABLE IF EXISTS `sc_yuebaobiao`;
CREATE TABLE `sc_yuebaobiao` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `chanliang` int(11) DEFAULT NULL,
  `month` varchar(7) DEFAULT '0000-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='生产月报表';

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `dili_admins` VALUES ('1','admin','7ac0da49ade563342c1c04470fa3426a','dili@cms.com','1');
INSERT INTO `dili_backend_settings` VALUES ('default','zh-cn','1','admin','无棣伊德圆畜牧有限公司管理中心','images/logo.gif');
INSERT INTO `dili_captcha` VALUES ('3','1325915062','119.185.26.171','g7nh');
INSERT INTO `dili_cate_fields` VALUES ('13','end','吨位上线','6','int','3','','60','30','required','','1','1','1','1'), ('12','start','吨位下线','6','int','3','','30','30','required','','1','1','0','1'), ('7','name','oa权限名称','5','input','256','','100','30','required','','0','1','0','1'), ('8','desc','oa用户权限说明','5','textarea','1000','','150','100','required','务必填写相关信息','0','1','1','1'), ('9','act','操作名称字母','5','input','30','','100','30','required','','0','1','2','1'), ('10','name','地区名称','6','input','50','','100','30','required','','1','1','0','1'), ('11','baodi','保底','6','int','11','','50','30','','','0','1','0','1'), ('15','beizhu','备注','6','textarea','1000','','300','50','','','1','1','2','1');
INSERT INTO `dili_cate_models` VALUES ('5','oa_power','oa权限分类','25','0','0','0'), ('6','hyb_diqu','[货源]地区','20','2','1','0');
INSERT INTO `dili_fieldtypes` VALUES ('int','整形(INT)'), ('float','浮点型(FLOAT)'), ('input','单行文本框(VARCHAR)'), ('textarea','文本区域(VARCHAR)'), ('select','下拉菜单(VARCHAR)'), ('select_from_model','下拉菜单(模型数据)(INT)'), ('linked_menu','联动下拉菜单(VARCHAR)'), ('radio','单选按钮(VARCHAR)'), ('radio_from_model','单选按钮(模型数据)(INT)'), ('checkbox','复选框(VARCHAR)'), ('checkbox_from_model','复选框(模型数据)(VARCHAR)'), ('wysiwyg','编辑器(TEXT)'), ('wysiwyg_basic','编辑器(简)(TEXT)'), ('datetime','日期时间(VARCHAR)'), ('colorpicker','颜色选择器(VARCHAR)');
INSERT INTO `dili_hyb_detailreport` VALUES ('1','a:1:{i:0;s:5:\"68933\";}','2011-12-27','8069.4','31.2','10990','7647','0','0','3896','5','73.48','10','109900','a:1:{i:0;s:6:\"胴体\";}','前胡','无任何争议','李元江','a:1:{i:68933;s:3:\"380\";}','埕口'), ('2','a:2:{i:0;s:4:\"5199\";i:1;s:4:\"2821\";}','2011-12-30','14838.8','255.8','20872','7647','0','0','7647','5','71.5','9.14','190770','a:1:{i:0;s:12:\"自送胴体\";}','王书昌','无任何争议','吕元坤','a:2:{i:5199;s:1:\"0\";i:2821;s:1:\"0\";}','天津静海'), ('3','a:2:{i:0;s:5:\"91166\";i:1;s:5:\"95068\";}','2012-01-01','11259.3','177.4','15829','5960','0','0','5960','3','71.5','9.14','144677','a:1:{i:0;s:12:\"自送胴体\";}','周向荣','无任何争议','刘永政','a:2:{i:91166;s:1:\"0\";i:95068;s:1:\"0\";}','河北任丘'), ('4','a:1:{i:0;s:5:\"02821\";}','2012-01-01','15138.2','222.4','21275','0','0','0','7615','5','71.36','0','0','a:0:{}','王书昌 ','无任何争议','王连明','a:1:{s:5:\"02821\";s:1:\"0\";}','黄骅 ');
INSERT INTO `dili_menus` VALUES ('1','system','home','系统','0','0'), ('2','system','home','后台首页','1','1'), ('3','system','home','后台首页','2','2'), ('4','setting','site','系统设置','1','1'), ('5','setting','site','站点设置','2','4'), ('6','setting','backend','后台设置','2','4'), ('7','system','password','修改密码','2','4'), ('8','system','cache','更新缓存','2','4'), ('9','model','view','模型管理','1','1'), ('10','model','view','内容模型管理','2','9'), ('11','category','view','分类模型管理','2','9'), ('12','plugin','view','插件管理','1','1'), ('13','plugin','view','插件管理','2','12'), ('14','role','view','权限管理','1','1'), ('15','role','view','用户组管理','2','14'), ('16','user','view','用户管理','2','14'), ('17','content','view','内容管理','0','0'), ('18','content','view','内容管理','1','17'), ('19','category_content','view','分类管理','1','17'), ('20','module','run','工具','0','0'), ('21','setting','oa','oa设置','2','4');
INSERT INTO `dili_models` VALUES ('4','hyb_mingxibiao','[货源]日明细表','30','1','0'), ('2','oa_users','oa用户表','25','0','0'), ('3','qq_dongti_rimingxi','[前区]胴体明细表','30','1','0');
INSERT INTO `dili_model_fields` VALUES ('22','yewuyuan3','业务员3','4','input','50','','60','30','','如果不存在多个业务员，则不填写','1','1','1','1'), ('21','yewuyuan2','业务员2','4','input','50','','60','30','','非必须填写，如果不存在多个业务员则不填','1','1','1','1'), ('20','yewuyuan1','业务员1','4','input','50','','60','30','required','如果没有业务员则填写胴体或者自送胴体','1','1','1','1'), ('9','name','用户名','2','input','256','','100','30','required','必填','0','1','1','1'), ('10','pass','oa用户密码','2','input','256','','100','30','required','密码必填','0','1','1','1'), ('11','email','用户电子邮箱','2','input','256','','150','30','valid_email','','0','1','2','1'), ('12','power','部门','2','select_from_model','0','oa_power|name','50','30','','','0','1','3','1'), ('13','chehao','车号','3','input','10','','60','30','required','','1','1','0','1'), ('14','checi','车次','3','int','4','','60','30','required','','1','1','1','1'), ('15','date','日期','3','datetime','12','','100','30','required','','0','1','2','0'), ('16','dongti','胴体重','3','float','10','','60','30','required','','1','1','2','1'), ('17','dongtino','胴体只数','3','int','10','','60','30','required','','1','1','2','1'), ('18','canji','残鸡重量','3','int','10','','60','30','required','','1','1','2','1'), ('19','canjino','残鸡只数','3','int','10','','60','30','required','','1','1','2','1'), ('23','yewuyuan4','业务员4','4','input','50','','60','30','','如果不存在多个业务员则不填写','1','1','1','1'), ('24','yewuyuan5','业务员5','4','input','50','','60','30','','','1','1','1','1'), ('25','qq_dongti_mingxi_id','[前区]胴体明细id','4','int','10','','50','30','required','选择胴体明细id','1','1','1','1'), ('26','date','日期','4','datetime','12','','100','30','required','','1','1','0','1'), ('27','diqu','[货源]地区分类id','4','select_from_model','10','hyb_diqu|name','100','30','required','','1','1','0','1');
INSERT INTO `dili_oa_sessions` VALUES ('cbfd619a5bf6dadaa5a3de94f6b6da15','119.185.26.171','Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100','1325926362','a:1:{s:4:\"ouid\";s:1:\"1\";}','2012-01-07 16:52:42');
INSERT INTO `dili_oa_settings` VALUES ('oa','zh-cn','1','oa','办公系统 —— 无棣伊德圆畜牧有限公司','images/logo.gif','5');
INSERT INTO `dili_parameter_variable` VALUES ('5','channel_name','插件','text','网站房产频道固定标题','admin'), ('6','QQ1','888899955566','text','张三QQ999000000000','admin'), ('7','QQ2','558955','text','李四QQ99','admin');
INSERT INTO `dili_plugins` VALUES ('1','dili_diy_variable','1','自定义变量','增加常用的变量,方便使用！','mvc999','http://localhost:8080/plugins/dili_diy_variable/plugin_dili_diy_variable_install.xml','free','0','1'), ('2','helloworld','1','Hello World Plugin','Hello World Plugin','Jeongee','http://www.dilicms.com/','free','0','1'), ('3','dili_wysiwyg','1','随变编辑器','想用什么编辑器，自己做主吧！','Jeongee','http://www.dilicms.com/plugins/dili_wysiwyg','FREE','0','1');
INSERT INTO `dili_rights` VALUES ('1','密码修改','system','password',NULL), ('2','更新缓存','system','cache',NULL), ('3',' 站点设置','setting','site',NULL), ('4','后台设置','setting','backend',NULL), ('5','插件管理[列表]','plugin','view',NULL), ('6','添加插件','plugin','add',NULL), ('7','修改插件','plugin','edit',NULL), ('8','卸载插件','plugin','del',NULL), ('9','导出插件','plugin','export',NULL), ('10','导入插件','plugin','import',NULL), ('11','激活插件','plugin','active',NULL), ('12','禁用插件','plugin','deactive',NULL), ('13','运行插件','module','run',NULL), ('14','内容模型管理[列表]','model','view',NULL), ('15','添加内容模型','model','add',NULL), ('16','修改内容模型','model','edit',NULL), ('17','删除内容模型','model','del',NULL), ('18','内容模型字段管理[列表]','model','fields',NULL), ('19','添加内容模型字段','model','add_filed',NULL), ('20','修改内容模型字段','model','edit_field',NULL), ('21','删除内容模型字段','model','del_field',NULL), ('22','分类模型管理[列表]','category','view',NULL), ('23','添加分类模型','category','add',NULL), ('24','修改分类模型','category','edit',NULL), ('25','删除分类模型','category','del',NULL), ('26','分类模型字段管理[列表]','category','fields',NULL), ('27','添加分类模型字段','category','add_filed',NULL), ('28','修改分类模型字段','category','edit_field',NULL), ('29','删除分类模型字段','category','del_field',NULL), ('30','内容管理[列表]','content','view',NULL), ('31','添加内容[表单]','content','form','add'), ('32','修改内容[表单]','content','form','edit'), ('33','添加内容[动作]','content','save','add'), ('34','修改内容[动作]','content','save','edit'), ('35','删除内容','content','del',NULL), ('36','分类管理[列表]','category_content','view',NULL), ('37','添加分类[表单]','category_content','form','add'), ('38','修改分类[表单]','category_content','form','edit'), ('39','添加分类[动作]','category_content','save','add'), ('40','修改分类[动作]','category_content','save','edit'), ('41','删除分类','category_content','del',NULL), ('42','用户组管理[列表]','role','view',NULL), ('43','添加用户组','role','add',NULL), ('44','修改用户组','role','edit',NULL), ('45','删除用户组','role','del',NULL), ('46','用户管理[列表]','user','view',NULL), ('47','添加用户','user','add',NULL), ('48','修改用户','user','edit',NULL), ('49','删除用户','user','del',NULL);
INSERT INTO `dili_roles` VALUES ('1','root','','','',''), ('2','管理员','1,2,3,4,5,6,7,8,10,11,12,13,30,32,34,35,36,38,40,46,47,48','0','keywords,category','0'), ('3','网站编辑','1,2,30,31,32,33,34,35,37,38,39,40','news','keywords,category','0'), ('4','财务科','1,43,44,46,47,48','0','0','0');
INSERT INTO `dili_sessions` VALUES ('855710931435de35073d0372e0b51808','119.186.16.167','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1;','1325764318','a:1:{s:3:\"uid\";s:1:\"1\";}');
INSERT INTO `dili_site_settings` VALUES ('伊德圆畜牧有限公司','http://oa.hainuo.info','images/logo.gif','','','<script language=\"javascript\" type=\"text/javascript\" src=\"http://js.users.51.la/5980672.js\"></script>\r\n<noscript><a href=\"http://www.51.la/?5980672\" target=\"_blank\"><img alt=\"我要啦&#','<p>伊德圆畜牧有限公司 &nbsp; power&copy; <a href=\"http://hainuo.info\" target=\"_blank\">hainuo.info</a></p><p><br /></p>','0','网站维护升级中......','伊德圆，伊德圆畜牧有限公司','伊德圆畜牧有限公司位于山东无棣是山东省一流的清真食品加工销售公司。现公司主营肉鸡分割产品。','default','attachments','*.jpg;*.gif;*.png','2097152');
INSERT INTO `dili_u_c_oa_power` VALUES ('1','0','1','','总经理','总经理拥有所有权限','zjl'), ('2','0','1','','财务','财务只负责钱数 对账','cw'), ('3','0','1','','采购','采购负责相关采购信息入库。','cg'), ('4','0','1','','保管','负责工厂部分用品库存核发核对','bg'), ('5','0','1','','货源','负责货源部审核','hyb'), ('6','0','1','','生产','生产相关信息','sc'), ('7','0','1','','销售','产品发货人员','xs'), ('8','0','1','','司务','后勤','sw'), ('9','0','1','','机修','机修部','jx'), ('10','0','1','','董事长','董事长','dsz'), ('11','0','1','','root','root','root');
INSERT INTO `dili_u_m_oa_users` VALUES ('1','1323327543','1323327543','admin','admin','admin@hainuo.info','11'), ('2','1323327565','1323327565','刘世增','liushizeng','','5');
INSERT INTO `dili_validations` VALUES ('required','必填'), ('valid_email','E-mail格式');
INSERT INTO `qq_dongti_mingxi` VALUES ('1','2012-01-07','5879','11','3458','10','0','33807','1','无任何争议');
