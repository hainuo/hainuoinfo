<?php

if (! defined ( 'BASEPATH' ))
	exit ( 'No direct script access allowed' );

define ( 'IN_DiliCMS', TRUE );
define ( 'DiliCMS_VERSION', 'H2.0.0' ); //hainuo对版本做了修改故此版本号V2.0.0更改为H2.0.0
define ( 'DiliCMS_BUILDTIME', '2011年11月16日 20:01:37' );
//CI从2.0.3开始放弃该常量，这里做个兼容
if (! defined ( 'EXT' )) {
	define ( 'EXT', '.php' );
}

abstract class Dili_Controller extends CI_Controller {
	
	function __construct() {
		parent::__construct ();
		$this->load->library ( 'dili/platform' );
		$this->load->library ( 'dili/settings' );
		$this->load->helper ( 'url' );
	}

}

//前台控制器扩展例子
abstract class Front_Controller extends Dili_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->switch_theme ( 'on', setting ( 'site_theme' ) ); //将系统前台的views目录更改为/templates/default/文件夹
	}
	
	function _template($template, $data = array()) {
		$data ['tpl'] = $template;
		$this->load->view ( 'default', $data ); //调用templates
	}

}

//后台控制器扩展，如果您不了解其作用，请不要随意更改此处
abstract class Admin_Controller extends Dili_Controller {
	
	function __construct() {
		parent::__construct ();
		date_default_timezone_set ( 'PRC' ); //强制时区为PRC,以后可增加配置变量
		$this->settings->load ( 'backend' );
		$this->load->switch_theme ( 'on', setting ( 'backend_theme' ), 'admincp/' );
		//设置session参数
		$this->config->set_item ( 'sess_cookie_name', 'dili_session' );
		$this->config->set_item ( 'sess_expiration', 7200 );
		$this->config->set_item ( 'sess_expire_on_close', FALSE );
		$this->config->set_item ( 'sess_encrypt_cookie', FALSE );
		$this->config->set_item ( 'sess_use_database', TRUE );
		$this->config->set_item ( 'sess_table_name', 'dili_sessions' );
		$this->config->set_item ( 'sess_match_ip', FALSE );
		$this->config->set_item ( 'sess_match_useragent', TRUE );
		$this->config->set_item ( 'sess_time_to_update', 300 );
		//
		$this->load->database ();
		$this->load->library ( 'session' );
		$this->_check_login ();
		$this->load->library ( 'dili/acl' );
		$this->load->library ( 'dili/plugin_manager' );
	
	}
	
	function _check_login() {
		if (! $this->session->userdata ( 'uid' )) {
			redirect ( setting ( 'backend_access_point' ) . '/login' );
		} else {
			$this->_admin = $this->db->select ( 'dili_admins.uid , dili_admins.username, dili_admins.role , dili_roles.name' )->from ( 'dili_admins' )->join ( 'dili_roles', 'dili_roles.id = dili_admins.role' )->where ( 'dili_admins.uid', $this->session->userdata ( 'uid' ) )->get ()->row ();
		}
	}
	
	function _template($template, $data = array()) {
		$data ['tpl'] = $template;
		$this->load->view ( 'sys_entry', $data );
	}
	
	function _check_permit($action = '') {
		if (! $this->acl->permit ( $action )) {
			$this->_message ( '对不起，你没有访问这里的权限！', '', false );
		}
	}
	
	function _message($msg, $goto = '', $auto = true, $fix = '') {
		if ($goto == '') {
			$goto = isset ( $_SERVER ['HTTP_REFERER'] ) ? $_SERVER ['HTTP_REFERER'] : site_url ();
		} else {
			$goto = strpos ( $goto, 'http' ) !== false ? $goto : backend_url ( $goto );
		}
		$goto .= $fix;
		$this->_template ( 'sys_message', array ('msg' => $msg, 'goto' => $goto, 'auto' => $auto ) );
		echo $this->output->get_output ();
		exit ();
	}
}

//后台URI生成函数
function backend_url($uri, $qs = '') {
	return site_url ( setting ( 'backend_access_point' ) . '/' . $uri ) . ($qs == '' ? '' : '?' . $qs);
}

//oa控制器扩展，如果您不了解其作用，请不要随意更改此处
abstract class Oa_Controller extends Dili_Controller {
	function __construct() {
		parent::__construct ();
		date_default_timezone_set ( 'PRC' ); //强制时区为PRC,以后可增加配置变量
		$this->settings->load ( 'oa' );
		$this->load->switch_theme ( 'on', setting ( 'oa_theme' ), 'templates/' );
		//设置session参数
		$this->config->set_item ( 'sess_cookie_name', 'dili_oa_session' );
		$this->config->set_item ( 'sess_expiration', 7200 );
		$this->config->set_item ( 'sess_expire_on_close', FALSE );
		$this->config->set_item ( 'sess_encrypt_cookie', FALSE );
		$this->config->set_item ( 'sess_use_database', TRUE );
		$this->config->set_item ( 'sess_table_name', 'dili_oa_sessions' );
		$this->config->set_item ( 'sess_match_ip', FALSE );
		$this->config->set_item ( 'sess_match_useragent', TRUE );
		$this->config->set_item ( 'sess_time_to_update', 300 );
		//
		$this->load->database ();
		$this->load->library ( 'session' );
		$this->_check_oa_login ();
		$this->_getGroup ();
	}
	
	function _check_oa_login() {
		if (! $this->session->userdata ( 'ouid' )) {
			redirect ( setting ( 'oa_access_point' ) . '/login' );
		} else {
			$this->_admin = $this->db->select ( 'dili_u_m_oa_users.id , dili_u_m_oa_users.name as username, dili_u_m_oa_users.power , dili_u_c_oa_power.name , dili_u_c_oa_power.act' )->from ( 'dili_u_m_oa_users' )->join ( 'dili_u_c_oa_power', 'dili_u_c_oa_power.classid = dili_u_m_oa_users.power' )->where ( 'dili_u_m_oa_users.id', $this->session->userdata ( 'ouid' ) )->get ()->row ();
		}
	}
	
	function _check_oa_permit() {
		if (isset ( $this->_group [$this->_admin->power] )) {
			$this->_message ( '对不起，你没有访问这里的权限！', '', false );
		}
	}
	function _message($msg, $goto = '', $auto = true, $fix = '') {
		if ($goto == '') {
			$goto = isset ( $_SERVER ['HTTP_REFERER'] ) ? $_SERVER ['HTTP_REFERER'] : site_url ();
		} else {
			$goto = strpos ( $goto, 'http' ) !== false ? $goto : oa_url ( $goto );
		}
		$goto .= $fix;
		$this->_template ( 'sys_message', array ('msg' => $msg, 'goto' => $goto, 'auto' => $auto ) );
		echo $this->output->get_output ();
		exit ();
	}
	function _getGroup() {
		$result = $this->db->select ( 'name ,classid,desc' )->from ( 'dili_u_c_oa_power' )->get ();
		$this->_group = array ();
		foreach ( $result->result () as $val ) {
			$this->_group [$val->classid] = $val;
		}
	
		//	var_dump($this->_group);
	}
	function _template($template, $data = array()) {
		$data ['tpl'] = $template;
		$this->load->view ( 'sys_entry', $data );
	}
}
//oa URI生成函数
function oa_url($uri, $qs = '') {
	return site_url ( setting ( 'oa_access_point' ) . '/' . $uri ) . ($qs == '' ? '' : '?' . $qs);
}	