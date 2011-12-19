<?php  if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
	class Oa_User_mdl extends CI_Model{
		
		function __construct()
		{
			parent::__construct();	
		}
		
		function get_full_user_by_username( $username = '' )
		{
			return $this->db->select('dili_u_m_oa_users.id , dili_u_m_oa_users.pass , dili_u_m_oa_users.power , dili_u_c_oa_power.name')
								  ->from('dili_u_m_oa_users')
								  ->join('dili_u_c_oa_power','dili_u_c_oa_power.classid = dili_u_m_oa_users.power')
								  ->where('dili_u_m_oa_users.name' , $username)
								  ->get()
								  ->row();
		}
		
		function get_user_by_uid($uid = 0)
		{
			return $this->db->where('id',$uid)->get('dili_u_m_oa_users')->row();
		}
		
		function get_user_by_name($name)
		{
			return $this->db->where('name',$name)->get('dili_u_m_oa_users')->row();
		}
		
		function update_user_password()
		{
			$data['pass'] = md5($this->input->post('new_pass'));
			$this->db->where('id',$this->session->userdata('ouid'))->update('dili_u_m_oa_users', $data);		
		}
		
		function get_roles()
		{
			$roles = array();
			foreach($this->db->select('id,name')->where('id <>',1)->get('dili_u_c_oa_power')->result_array() as $v)
			{
				$roles[$v['id']] = $v['name'];	
			}
			return $roles;
		}
		function get_users($role_id = 0)
		{
			$this->db->where('dili_u_m_oa_users.id <>',1);
			if($role_id){$this->db->where('dili_u_m_oa_users.power',$role_id);}
			return $this->db->from('dili_u_m_oa_users')
							->join('dili_u_c_oa_power','dili_u_c_oa_power.id = dili_u_m_oa_users.power')
							->get()
							->result();
		}
		
		function add_user($data)
		{
			$this->db->insert('dili_u_m_oa_users',$data);
		}
		
		function edit_user($uid,$data)
		{
			$this->db->where('uid',$uid)->update('dili_u_m_oa_users',$data);	
		}
		
		function del_user($uid)
		{
			$this->db->where('uid',$uid)->delete('dili_u_m_oa_users');
		}
		function creatCaptcha(){
			$this->load->helper('captcha');
			$vals = array(
						'img_path' => FCPATH.'/captcha/',
						'img_url' => base_url().'/captcha/',
						//'word'=>'',
						'img_width' => '50',
						'img_height' => '20',
						 'expiration' => 60
						);
			$cap = create_captcha($vals);//生成验证图片
			$data = array(
						'captcha_time' => $cap['time'],
						'ip_address' => $this->input->ip_address(),
						'word' => $cap['word']
						);//准备数据插入数据库
			$query = $this->db->insert_string('dili_captcha', $data);
			$this->db->query($query);
			return $cap['image'];
		}
		
		function checkCaptcha($data){
			//检查验证码清理数据库
			$expiration = time()-300; // 6分钟限制
			$this->db->query("DELETE FROM dili_captcha WHERE captcha_time < ".$expiration); //删除所有过期验证码
			
			$sql = "SELECT COUNT(*) AS count FROM dili_captcha WHERE word = ? AND ip_address = ? AND captcha_time > ?";
			$binds = array($data, $this->input->ip_address(), $expiration);
			$query = $this->db->query($sql, $binds);
			$row = $query->row();

			if ($row->count == 0)
			{
				return false;
			}else{
				return true;
			}
		}
		
	}