-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1:3306
-- 生成日期: 2011 年 12 月 10 日 01:07
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `oa`
--

-- --------------------------------------------------------

--
-- 表的结构 `dili_admins`
--

CREATE TABLE IF NOT EXISTS `dili_admins` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `group` (`role`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `dili_admins`
--

INSERT INTO `dili_admins` (`uid`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', '7ac0da49ade563342c1c04470fa3426a', 'dili@cms.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_attachments`
--

CREATE TABLE IF NOT EXISTS `dili_attachments` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `dili_attachments`
--


-- --------------------------------------------------------

--
-- 表的结构 `dili_backend_settings`
--

CREATE TABLE IF NOT EXISTS `dili_backend_settings` (
  `backend_theme` varchar(15) DEFAULT NULL,
  `backend_lang` varchar(10) DEFAULT NULL,
  `backend_root_access` tinyint(1) unsigned DEFAULT '1',
  `backend_access_point` varchar(20) DEFAULT 'admin',
  `backend_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `backend_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_backend_settings`
--

INSERT INTO `dili_backend_settings` (`backend_theme`, `backend_lang`, `backend_root_access`, `backend_access_point`, `backend_title`, `backend_logo`) VALUES
('default', 'zh-cn', 1, 'admin', '无棣伊德圆畜牧有限公司管理中心', 'images/logo.gif');

-- --------------------------------------------------------

--
-- 表的结构 `dili_captcha`
--

CREATE TABLE IF NOT EXISTS `dili_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=300 ;

--
-- 导出表中的数据 `dili_captcha`
--

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_fields`
--

CREATE TABLE IF NOT EXISTS `dili_cate_fields` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 导出表中的数据 `dili_cate_fields`
--

INSERT INTO `dili_cate_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(6, 'dec', '说明', 4, 'textarea', 256, '', 300, 100, '', '', 0, 0, 1, 0),
(4, 'name', '新闻分类名称', 4, 'input', 256, '', 100, 30, 'required', '', 0, 1, 0, 1),
(5, 'uri', 'URL别名', 4, 'input', 100, '', 50, 30, 'required', '', 0, 1, 0, 1),
(7, 'name', 'oa权限名称', 5, 'input', 256, '', 100, 30, 'required', '', 0, 1, 0, 1),
(8, 'desc', 'oa用户权限说明', 5, 'textarea', 1000, '', 150, 100, 'required', '务必填写相关信息', 0, 1, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_cate_models`
--

CREATE TABLE IF NOT EXISTS `dili_cate_models` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(40) NOT NULL,
  `perpage` varchar(2) NOT NULL,
  `level` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `hasattach` tinyint(1) NOT NULL DEFAULT '0',
  `built_in` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `dili_cate_models`
--

INSERT INTO `dili_cate_models` (`id`, `name`, `description`, `perpage`, `level`, `hasattach`, `built_in`) VALUES
(4, 'news', '新闻分类', '25', 2, 0, 0),
(5, 'oa_power', 'oa权限分类', '25', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dili_fieldtypes`
--

CREATE TABLE IF NOT EXISTS `dili_fieldtypes` (
  `k` varchar(20) NOT NULL,
  `v` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_fieldtypes`
--

INSERT INTO `dili_fieldtypes` (`k`, `v`) VALUES
('int', '整形(INT)'),
('float', '浮点型(FLOAT)'),
('input', '单行文本框(VARCHAR)'),
('textarea', '文本区域(VARCHAR)'),
('select', '下拉菜单(VARCHAR)'),
('select_from_model', '下拉菜单(模型数据)(INT)'),
('linked_menu', '联动下拉菜单(VARCHAR)'),
('radio', '单选按钮(VARCHAR)'),
('radio_from_model', '单选按钮(模型数据)(INT)'),
('checkbox', '复选框(VARCHAR)'),
('checkbox_from_model', '复选框(模型数据)(VARCHAR)'),
('wysiwyg', '编辑器(TEXT)'),
('wysiwyg_basic', '编辑器(简)(TEXT)'),
('datetime', '日期时间(VARCHAR)'),
('colorpicker', '颜色选择器(VARCHAR)');

-- --------------------------------------------------------

--
-- 表的结构 `dili_menus`
--

CREATE TABLE IF NOT EXISTS `dili_menus` (
  `menu_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(20) NOT NULL,
  `method_name` varchar(30) NOT NULL,
  `menu_name` varchar(20) NOT NULL,
  `menu_level` tinyint(2) unsigned DEFAULT '0',
  `menu_parent` tinyint(10) unsigned DEFAULT '0',
  PRIMARY KEY (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 导出表中的数据 `dili_menus`
--

INSERT INTO `dili_menus` (`menu_id`, `class_name`, `method_name`, `menu_name`, `menu_level`, `menu_parent`) VALUES
(1, 'system', 'home', '系统', 0, 0),
(2, 'system', 'home', '后台首页', 1, 1),
(3, 'system', 'home', '后台首页', 2, 2),
(4, 'setting', 'site', '系统设置', 1, 1),
(5, 'setting', 'site', '站点设置', 2, 4),
(6, 'setting', 'backend', '后台设置', 2, 4),
(7, 'system', 'password', '修改密码', 2, 4),
(8, 'system', 'cache', '更新缓存', 2, 4),
(9, 'model', 'view', '模型管理', 1, 1),
(10, 'model', 'view', '内容模型管理', 2, 9),
(11, 'category', 'view', '分类模型管理', 2, 9),
(12, 'plugin', 'view', '插件管理', 1, 1),
(13, 'plugin', 'view', '插件管理', 2, 12),
(14, 'role', 'view', '权限管理', 1, 1),
(15, 'role', 'view', '用户组管理', 2, 14),
(16, 'user', 'view', '用户管理', 2, 14),
(17, 'content', 'view', '内容管理', 0, 0),
(18, 'content', 'view', '内容管理', 1, 17),
(19, 'category_content', 'view', '分类管理', 1, 17),
(20, 'module', 'run', '工具', 0, 0),
(21, 'setting', 'oa', 'oa设置', 2, 4);

-- --------------------------------------------------------

--
-- 表的结构 `dili_models`
--

CREATE TABLE IF NOT EXISTS `dili_models` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `perpage` varchar(2) NOT NULL DEFAULT '10',
  `hasattach` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `built_in` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `dili_models`
--

INSERT INTO `dili_models` (`id`, `name`, `description`, `perpage`, `hasattach`, `built_in`) VALUES
(1, 'news', '新闻中心', '20', 1, 0),
(2, 'oa_users', 'oa用户表', '25', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dili_model_fields`
--

CREATE TABLE IF NOT EXISTS `dili_model_fields` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 导出表中的数据 `dili_model_fields`
--

INSERT INTO `dili_model_fields` (`id`, `name`, `description`, `model`, `type`, `length`, `values`, `width`, `height`, `rules`, `ruledescription`, `searchable`, `listable`, `order`, `editable`) VALUES
(1, 'title', '标题', 1, 'input', 256, '', 256, 22, 'required', 'is  not null', 1, 1, 1, 1),
(2, 'stitle', '简短标题', 1, 'input', 256, '', 100, 20, '', '', 0, 1, 1, 1),
(3, 'content', '内容', 1, 'wysiwyg', 0, '', 300, 300, '', '', 1, 0, 1, 1),
(4, 'scontent', '文章概要', 1, 'wysiwyg_basic', 0, '', 300, 100, '', '', 1, 0, 1, 1),
(5, 'author', '作者', 1, 'input', 120, '', 60, 20, '', '', 1, 0, 2, 0),
(6, 'keywords', '关键词', 1, 'input', 256, '', 0, 0, '', '', 1, 0, 3, 1),
(8, 'classid', '分类名称', 1, 'select_from_model', 10, 'news|name', 50, 30, '', '', 0, 1, 0, 1),
(9, 'name', '用户名', 2, 'input', 256, '', 100, 30, 'required', '必填', 0, 1, 1, 1),
(10, 'pass', 'oa用户密码', 2, 'input', 256, '', 100, 30, 'required', '密码必填', 0, 1, 1, 1),
(11, 'email', '用户电子邮箱', 2, 'input', 256, '', 150, 30, 'valid_email', '', 0, 1, 2, 1),
(12, 'power', '部门', 2, 'select_from_model', 0, 'oa_power|name', 50, 30, '', '', 0, 1, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_oa_sessions`
--

CREATE TABLE IF NOT EXISTS `dili_oa_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_oa_sessions`
--

INSERT INTO `dili_oa_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('4d7692dd49abd5c4ac5103b2c4d0b61e', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;', 1323478999, 'a:1:{s:4:"ouid";s:1:"1";}'),
('350dd6b30e06a0e6056a2e52b27706f4', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;', 1323476519, ''),
('4b8c38e6f7acbc68c429a3f960ca2417', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;', 1323476502, 'a:1:{s:4:"ouid";s:1:"1";}'),
('fe5100d20787830502d8eb4b4bfd1470', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;', 1323476471, 'a:1:{s:4:"ouid";s:1:"1";}'),
('11d0739234acd8b2a8151a165a7084f8', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;', 1323476470, ''),
('68bd15ba159552eb7cc66b6e978270aa', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1;', 1323476467, ''),
('72f47d64a6576c3d9b5a199a136cf516', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;', 1323475153, 'a:1:{s:4:"ouid";s:1:"1";}'),
('fc156a103774dcace131a83ee5b677b6', '112.245.179.69', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KH', 1323479078, 'a:1:{s:4:"ouid";s:1:"1";}');

-- --------------------------------------------------------

--
-- 表的结构 `dili_oa_settings`
--

CREATE TABLE IF NOT EXISTS `dili_oa_settings` (
  `oa_theme` varchar(15) DEFAULT NULL,
  `oa_lang` varchar(10) DEFAULT NULL,
  `oa_root_access` tinyint(1) unsigned DEFAULT '1',
  `oa_access_point` varchar(20) DEFAULT 'admin',
  `oa_title` varchar(100) DEFAULT 'DiliCMS后台管理',
  `oa_logo` varchar(100) DEFAULT 'images/logo.gif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_oa_settings`
--

INSERT INTO `dili_oa_settings` (`oa_theme`, `oa_lang`, `oa_root_access`, `oa_access_point`, `oa_title`, `oa_logo`) VALUES
('oa', 'zh-cn', 0, 'oa', '办公系统 —— 无棣伊德圆畜牧有限公司', 'images/logo.gif');

-- --------------------------------------------------------

--
-- 表的结构 `dili_parameter_variable`
--

CREATE TABLE IF NOT EXISTS `dili_parameter_variable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arr_k` varchar(255) CHARACTER SET utf8 NOT NULL,
  `arr_v` varchar(255) CHARACTER SET utf8 NOT NULL,
  `arr_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `arr_name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `arr_user` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- 导出表中的数据 `dili_parameter_variable`
--

INSERT INTO `dili_parameter_variable` (`id`, `arr_k`, `arr_v`, `arr_type`, `arr_name`, `arr_user`) VALUES
(5, 'channel_name', '插件', 'text', '网站房产频道固定标题', 'admin'),
(6, 'QQ1', '888899955566', 'text', '张三QQ999000000000', 'admin'),
(7, 'QQ2', '558955', 'text', '李四QQ99', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `dili_plugins`
--

CREATE TABLE IF NOT EXISTS `dili_plugins` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `dili_plugins`
--

INSERT INTO `dili_plugins` (`id`, `name`, `version`, `title`, `description`, `author`, `link`, `copyrights`, `access`, `active`) VALUES
(1, 'dili_diy_variable', '1', '自定义变量', '增加常用的变量,方便使用！', 'mvc999', 'http://localhost:8080/plugins/dili_diy_variable/plugin_dili_diy_variable_install.xml', 'free', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dili_rights`
--

CREATE TABLE IF NOT EXISTS `dili_rights` (
  `right_id` tinyint(10) unsigned NOT NULL AUTO_INCREMENT,
  `right_name` varchar(30) DEFAULT NULL,
  `right_class` varchar(30) DEFAULT NULL,
  `right_method` varchar(30) DEFAULT NULL,
  `right_detail` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`right_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 导出表中的数据 `dili_rights`
--

INSERT INTO `dili_rights` (`right_id`, `right_name`, `right_class`, `right_method`, `right_detail`) VALUES
(1, '密码修改', 'system', 'password', NULL),
(2, '更新缓存', 'system', 'cache', NULL),
(3, ' 站点设置', 'setting', 'site', NULL),
(4, '后台设置', 'setting', 'backend', NULL),
(5, '插件管理[列表]', 'plugin', 'view', NULL),
(6, '添加插件', 'plugin', 'add', NULL),
(7, '修改插件', 'plugin', 'edit', NULL),
(8, '卸载插件', 'plugin', 'del', NULL),
(9, '导出插件', 'plugin', 'export', NULL),
(10, '导入插件', 'plugin', 'import', NULL),
(11, '激活插件', 'plugin', 'active', NULL),
(12, '禁用插件', 'plugin', 'deactive', NULL),
(13, '运行插件', 'module', 'run', NULL),
(14, '内容模型管理[列表]', 'model', 'view', NULL),
(15, '添加内容模型', 'model', 'add', NULL),
(16, '修改内容模型', 'model', 'edit', NULL),
(17, '删除内容模型', 'model', 'del', NULL),
(18, '内容模型字段管理[列表]', 'model', 'fields', NULL),
(19, '添加内容模型字段', 'model', 'add_filed', NULL),
(20, '修改内容模型字段', 'model', 'edit_field', NULL),
(21, '删除内容模型字段', 'model', 'del_field', NULL),
(22, '分类模型管理[列表]', 'category', 'view', NULL),
(23, '添加分类模型', 'category', 'add', NULL),
(24, '修改分类模型', 'category', 'edit', NULL),
(25, '删除分类模型', 'category', 'del', NULL),
(26, '分类模型字段管理[列表]', 'category', 'fields', NULL),
(27, '添加分类模型字段', 'category', 'add_filed', NULL),
(28, '修改分类模型字段', 'category', 'edit_field', NULL),
(29, '删除分类模型字段', 'category', 'del_field', NULL),
(30, '内容管理[列表]', 'content', 'view', NULL),
(31, '添加内容[表单]', 'content', 'form', 'add'),
(32, '修改内容[表单]', 'content', 'form', 'edit'),
(33, '添加内容[动作]', 'content', 'save', 'add'),
(34, '修改内容[动作]', 'content', 'save', 'edit'),
(35, '删除内容', 'content', 'del', NULL),
(36, '分类管理[列表]', 'category_content', 'view', NULL),
(37, '添加分类[表单]', 'category_content', 'form', 'add'),
(38, '修改分类[表单]', 'category_content', 'form', 'edit'),
(39, '添加分类[动作]', 'category_content', 'save', 'add'),
(40, '修改分类[动作]', 'category_content', 'save', 'edit'),
(41, '删除分类', 'category_content', 'del', NULL),
(42, '用户组管理[列表]', 'role', 'view', NULL),
(43, '添加用户组', 'role', 'add', NULL),
(44, '修改用户组', 'role', 'edit', NULL),
(45, '删除用户组', 'role', 'del', NULL),
(46, '用户管理[列表]', 'user', 'view', NULL),
(47, '添加用户', 'user', 'add', NULL),
(48, '修改用户', 'user', 'edit', NULL),
(49, '删除用户', 'user', 'del', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dili_roles`
--

CREATE TABLE IF NOT EXISTS `dili_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `rights` varchar(255) NOT NULL,
  `models` varchar(255) NOT NULL,
  `category_models` varchar(255) NOT NULL,
  `plugins` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `dili_roles`
--

INSERT INTO `dili_roles` (`id`, `name`, `rights`, `models`, `category_models`, `plugins`) VALUES
(1, 'root', '', '', '', ''),
(2, '管理员', '1,2,3,4,5,6,7,8,10,11,12,13,30,32,34,35,36,38,40,46,47,48', '0', 'keywords,category', '0'),
(3, '网站编辑', '1,2,30,31,32,33,34,35,37,38,39,40', 'news', 'keywords,category', '0');

-- --------------------------------------------------------

--
-- 表的结构 `dili_sessions`
--

CREATE TABLE IF NOT EXISTS `dili_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_sessions`
--

INSERT INTO `dili_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('d15a9e0013803e925c67a9b1b686a872', '112.245.179.69', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KH', 1323432831, ''),
('4147036a7c4804e368381084c4770a6a', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1;', 1323430580, 'a:1:{s:3:"uid";s:1:"1";}'),
('7483f8673834d65c8e67ce9a9f1af15c', '112.245.179.69', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1;', 1323435439, ''),
('796247a12a946e205acc068a2a7f4cbc', '112.245.179.69', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.2 (KH', 1323476657, '');

-- --------------------------------------------------------

--
-- 表的结构 `dili_site_settings`
--

CREATE TABLE IF NOT EXISTS `dili_site_settings` (
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

--
-- 导出表中的数据 `dili_site_settings`
--

INSERT INTO `dili_site_settings` (`site_name`, `site_domain`, `site_logo`, `site_icp`, `site_terms`, `site_stats`, `site_footer`, `site_status`, `site_close_reason`, `site_keyword`, `site_description`, `site_theme`, `attachment_dir`, `attachment_type`, `attachment_maxupload`) VALUES
('伊德圆畜牧有限公司', 'http://oa.hainuo.info', 'images/logo.gif', '', '', '<script language="javascript" type="text/javascript" src="http://js.users.51.la/5980672.js"></script>\r\n<noscript><a href="http://www.51.la/?5980672" target="_blank"><img alt="我要啦&#', '<p>伊德圆畜牧有限公司 &nbsp; power&copy; <a href="http://hainuo.info" target="_blank">hainuo.info</a></p><p><br /></p>', 0, '网站维护升级中......', '伊德圆，伊德圆畜牧有限公司', '伊德圆畜牧有限公司位于山东无棣是山东省一流的清真食品加工销售公司。现公司主营肉鸡分割产品。', 'default', 'attachments', '*.jpg;*.gif;*.png', '2097152');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_c_news`
--

CREATE TABLE IF NOT EXISTS `dili_u_c_news` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `uri` varchar(100) NOT NULL DEFAULT '',
  `dec` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `dili_u_c_news`
--

INSERT INTO `dili_u_c_news` (`classid`, `parentid`, `level`, `path`, `name`, `uri`, `dec`) VALUES
(1, 0, 1, '', '站点公告', 'alarm', ''),
(3, 0, 1, '', '伊德圆公告', 'gonggao', ''),
(4, 1, 2, '0,1,0', 'wudi', '1', ''),
(5, 3, 2, '0,3,0', 'box', '2', '');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_c_oa_power`
--

CREATE TABLE IF NOT EXISTS `dili_u_c_oa_power` (
  `classid` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(5) unsigned NOT NULL DEFAULT '0',
  `level` int(2) unsigned NOT NULL DEFAULT '1',
  `path` varchar(50) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `desc` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`classid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 导出表中的数据 `dili_u_c_oa_power`
--

INSERT INTO `dili_u_c_oa_power` (`classid`, `parentid`, `level`, `path`, `name`, `desc`) VALUES
(1, 0, 1, '', '总经理', '总经理拥有所有权限'),
(2, 0, 1, '', '财务', '财务只负责钱数 对账'),
(3, 0, 1, '', '采购', '采购负责相关采购信息入库。'),
(4, 0, 1, '', '保管', '负责工厂部分用品库存核发核对'),
(5, 0, 1, '', '货源', '负责货源部审核'),
(6, 0, 1, '', '生产', '生产相关信息'),
(7, 0, 1, '', '发货', '产品发货人员'),
(8, 0, 1, '', '司务', '后勤'),
(9, 0, 1, '', '机修', '机修部'),
(10, 0, 1, '', '董事长', '董事长'),
(11, 0, 1, '', 'root', 'root');

-- --------------------------------------------------------

--
-- 表的结构 `dili_u_m_news`
--

CREATE TABLE IF NOT EXISTS `dili_u_m_news` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `dili_u_m_news`
--


-- --------------------------------------------------------

--
-- 表的结构 `dili_u_m_oa_users`
--

CREATE TABLE IF NOT EXISTS `dili_u_m_oa_users` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL,
  `update_time` int(10) unsigned NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `pass` varchar(256) NOT NULL DEFAULT '',
  `email` varchar(256) NOT NULL DEFAULT '',
  `power` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `dili_u_m_oa_users`
--

INSERT INTO `dili_u_m_oa_users` (`id`, `create_time`, `update_time`, `name`, `pass`, `email`, `power`) VALUES
(1, 1323327543, 1323327543, 'admin', 'admin', 'admin@hainuo.info', 11),
(2, 1323327565, 1323327565, '刘世增', 'liushizeng', '', 5);

-- --------------------------------------------------------

--
-- 表的结构 `dili_validations`
--

CREATE TABLE IF NOT EXISTS `dili_validations` (
  `k` varchar(20) DEFAULT NULL,
  `v` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `dili_validations`
--

INSERT INTO `dili_validations` (`k`, `v`) VALUES
('required', '必填'),
('valid_email', 'E-mail格式');
