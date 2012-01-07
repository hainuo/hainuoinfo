<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');

	class Login extends Dili_Controller
	{
		function __construct()
		{
			parent::__construct();
			$this->settings->load('oa');
			//设置session参数
			$this->config->set_item('sess_cookie_name' ,'dili_oa_session');
			$this->config->set_item('sess_expiration' , 7200);
			$this->config->set_item('sess_expire_on_close' ,FALSE);
			$this->config->set_item('sess_encrypt_cookie' ,FALSE);
			$this->config->set_item('sess_use_database' ,TRUE);
			$this->config->set_item('sess_table_name' ,'dili_oa_sessions')	;
			$this->config->set_item('sess_match_ip' ,FALSE)	;
			$this->config->set_item('sess_match_useragent' ,TRUE)	;
			$this->config->set_item('sess_time_to_update' ,300)	;
			$this->load->library('session');
			$this->load->switch_theme('on',setting('oa_theme'),'templates/');
			$this->load->database();
			$this->load->model('dili/oa_user_mdl');
		}
		
		function index()
		{
			if( $this->session->userdata('uid') )
			{
				redirect(setting('oa_access_point').'/system/home');
			}
			else
			{
				$data['image']=$this->oa_user_mdl->creatCaptcha();
				$this->load->view('sys_login',$data);	
			}
		}
		
		function quit()
		{
			$this->session->sess_destroy();
			redirect(setting('oa_access_point').'/login');
		}
		
		function _do_post()
		{
			$username = $this->input->post('name',true);
			$password = $this->input->post('pass',true);
			$verify=$this->input->post('verify',true);
			if(!$this->oa_user_mdl->checkCaptcha($verify)){
				$this->session->set_flashdata('error', "验证码错误，请重新填写验证码!");
				redirect(setting('oa_access_point').'/login');	
			}
			if($username && $password)
			{
				$admin = $this->oa_user_mdl->get_full_user_by_username( $username );
				if($admin)
				{
					if( $admin->pass == $password )//需要增加md5判断
					{
						if($admin->power == 11 && !setting('oa_root_access'))
						{
							$this->session->set_flashdata('error', "系统限制了ROOT用户登录,请联系管理员!");
							redirect(setting('oa_access_point').'/login');	
						}
						else
						{
							$this->session->set_userdata('ouid',$admin->id);
							redirect(setting('oa_access_point').'/system/home');
						}
					}
					else
					{
						$this->session->set_flashdata('error', "密码不正确!");
						redirect(setting('oa_access_point').'/login');
					}
				}
				else
				{
					$this->session->set_flashdata('error', '不存在的用户!');
					redirect(setting('oa_access_point').'/login');	
				}
			}
			else
			{
				$this->session->set_flashdata('error', '用户名和密码不能为空!');
				redirect(setting('oa_access_point').'/login');
			}
			
		}
		
	}