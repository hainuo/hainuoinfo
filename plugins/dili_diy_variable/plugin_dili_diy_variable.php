<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
 *---------------------------------------------------------------
 * 作者: mvc999
 *---------------------------------------------------------------
 * 适用于dilicms2.0系类，暂不支持新浪sae平台
 * http://codeigniter.org.cn/forums/space-uid-13871.html
 */
class plugin_dili_diy_variable extends Dili_plugin
{
	public function __construct($name)
	{
		parent::__construct($name);
		$this->_ci->load->database();
		$this->_ci->load->helper('url');
  		$this->_ci->load->library('dili/settings');
	}
	//菜单
	public function register_navigation()
	{
		echo '<a href="'.backend_url('module/run','plugin=dili_diy_variable&action=diy_list').'" class="selected"><span>自定义变量</span></a>';
	}
	public function register_left_menu()
	{
		return array('menu_name' => '自定义变量',
							'sub_menus' => array( 0=>array('class_name'=>$this->_name,'method_name'=>'diy_list','menu_name'=>'自定义变量')
							 )
						  );	
	}
	//列表
	public function diy_list()
	{
		$piugin_arr=array();
		$this->update_cache();
		$data['v']=$this->get_arr_text(4);
		$this->_ci->settings->load('arrcx');
		$data['arr']=$this->_ci->piugin_arr=setting('arr');
		return $this->_template('views/diy_list',array('arrs' => $data),false);
	}
	//添加
	public function arr_add()
	{
		$this->_arr_add_post();
	}
	public function _arr_add_post()
	{
		$data = array(
				   'arr_name' => $this->_ci->input->get_post('arr_name'),
				   'arr_k' =>	 $this->_ci->input->get_post('arr_k'),
				   'arr_v' =>	 $this->_ci->input->get_post('arr_v'),
				   'arr_type' => $this->_ci->input->get_post('arr_type'),
				   'arr_user' => $this->_ci->_admin->username
				);
		$this->_ci->db->insert('dili_parameter_variable', $data); 
		$this->update_cache();
		$this->_ci->_message('自定义变量添加成功！','',true);
	}
	//缓存
	public function update_cache()
	{
		$data = $this->_ci->db->get('dili_parameter_variable')->result_array();
		file_put_contents(FCPATH.'settings/arrcx'.EXT,$this->made_arrayeval("setting['arr']",$data));

	}
	//删除
	public function delete_diy_arr()
	{
		$this->_delete_diy_arr_post();
	}
	public function _delete_diy_arr_post()
	{
		$diyid=$this->_ci->input->get_post('diyid');
		$this->_ci->db->delete('dili_parameter_variable', array('id' => $diyid));
		$this->update_cache();
		$this->_ci->_message('删除成功！','',true);
	}
	//编辑
	public function edit_diy()
	{
		$this->_edit_diy_post();
	}
	public function _edit_diy_post()
	{
		$this->_ci->load->switch_theme('on','views','plugins/'.$this->_name.'/');
		$this->_ci->db->get('dili_parameter_variable');
		$data['diy_edit']=$this->_ci->db->where('id',$this->_ci->input->get_post('pageid'))->get('dili_parameter_variable')->result();
		$data['plugin_url']=$this->_url('update_edit');
		$data['plugin_user']=$this->_ci->_admin->username;
		$this->_ci->load->view('diy_edit',$data);
	}
	//更新
	public function update_edit()
	{
		$this->_update_edit_post();
	}
	public function _update_edit_post(){
		$this->_ci->load->switch_theme('on','views','plugins/'.$this->_name.'/');
		$data = array(
				'id'=>			$this->_ci->input->get_post('edit_id'),
                'arr_name' =>	$this->_ci->input->get_post('edit_arr_name'),
                'arr_k' =>		$this->_ci->input->get_post('edit_arr_k'),
                'arr_v' =>		$this->_ci->input->get_post('edit_arr_v'),
				'arr_user' =>	$this->_ci->_admin->username
            );
		$this->_ci->db->where('id', $this->_ci->input->get_post('edit_id'));
		$this->_ci->db->update('dili_parameter_variable', $data);
		$this->update_cache();
		$this->_ci->load->view('diy_edit_go');
	}
	//文本框表单
	public function arr_input($fieldname,$default)
	{
		return '<input  name="'.$fieldname.'" value="'.$default.'" type="text" />';
	}
	//文本区表单
	public function arr_textarea($fieldname,$default)
	{
		return '<textarea  name="'.$fieldname.'">'.$default.'</textarea>';
	}
	//生成
	public function made_arrayeval($name, $array)
	{
		return '<?php '.PHP_EOL . '$' . $name . '=' . var_export($array,true).';'; 
	}
	//获取自定义变量,可以删除本方法
	public function get_arr_text($diy_id='0')
	{
		$piugin_arr=array();
		$this->_ci->settings->load('arrcx');
		$arraycs=$this->_ci->piugin_arr=setting('arr');
		return @$arraycs[$diy_id]['arr_v'];
	}
}