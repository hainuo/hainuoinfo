<?php
class Hyb extends Oa_Controller {
	function __construct() {
		parent::__construct ();
		$this->load->model ( 'oa/hyb_mdl' );
		$this->load->helper ( array ('form', 'url' ) );
		$this->load->library ( 'form_validation' );
		$this->form_validation->set_error_delimiters ( '<div class="error">', '</div>' );
	}
	
	function Index() { //索引页
		$act = $this->input->post ( 'act' );
	}
	
	function dailyReport() { //汇总日报表
		$this->_dailyReport_post ();
	}
	
	function _dailyReport_post() {
		$data = array ();
		$date = $this->input->post ( 'date' );
		if (! $date)
			$date = date ( 'Y-m-d' );
		$date = date ( 'Y-m-d', strtotime ( $date ) );
		$data ['reportDate'] = $date;
		//var_dump($data);
		$data ['list'] = $this->hyb_mdl->getDailyReport ( $date );
		$this->_template ( 'hyb/showDailyReport', $data );
	}
	
	function addReport() //填写报表
{
		$this->_template ( 'hyb/addreport' );
	}
	
	function _addReport_post() //写入数据库
{
		$config = array (array ('field' => 'yangzhihu', 'label' => '养殖户', 'rules' => 'trim' ), array ('field' => 'diqu', 'label' => '地区', 'rules' => 'required' ), array ('field' => 'carNo[]', 'label' => '车号', 'rules' => 'trim' ), array ('field' => 'yunfei[]', 'label' => '运费', 'rules' => 'trim' ), array ('field' => 'dongti', 'label' => '胴体重量', 'rules' => 'required|numeric' ), array ('field' => 'canji', 'label' => '残疾重量', 'rules' => 'required|numeric' ), array ('field' => 'jingzhong', 'label' => '净重', 'rules' => 'required|numeric' ), array ('field' => 'dongtiNo', 'label' => '胴体只数', 'rules' => 'required|is_natural' ), array ('field' => 'canjiNo', 'label' => '残鸡只数', 'rules' => 'required|is_natural' ), array ('field' => 'jingxiaoshang', 'label' => '经销商', 'rules' => 'required' ), array ('field' => 'canjizhesuan', 'label' => '残鸡折算率', 'rules' => 'required|is_natural_no_zero' ), array ('field' => 'number', 'label' => '总只数', 'rules' => 'required|integer' ), array ('field' => 'chucheng', 'label' => '出成率', 'rules' => 'required|numeric' ), array ('field' => 'jine', 'label' => '金额', 'rules' => 'required|integer' ), array ('field' => 'danjia', 'label' => '单价', 'rules' => 'required|numeric' ), array ('field' => 'beizhu', 'label' => '备注', 'rules' => 'required' ) );
		$this->form_validation->set_rules ( $config );
		$carno = implode ( '', $this->input->post ( 'carNo' ) );
		if ($this->form_validation->run () == FALSE || empty ( $carno ) == TRUE) {
			if (empty ( $carno ) == TRUE)
				$data ['errormessage'] = '至少要填写一个车号';
			else
				$data = '';
			$this->_template ( 'hyb/addreport', $data );
		} else {
			$this->load->model ( 'oa/hyb_mdl' );
			$data ['date'] = $this->input->post ( 'date' );
			$carno = $this->input->post ( 'carNo' );
			$data ['dongti'] = $this->input->post ( 'dongti' );
			$data ['canji'] = $this->input->post ( 'canji' );
			$data ['jingzhong'] = $this->input->post ( 'jingzhong' );
			$data ['dongtino'] = $this->input->post ( 'dongtiNo' );
			$data ['canjino'] = $this->input->post ( 'canjiNo' );
			$data ['number'] = $this->input->post ( 'number' );
			$data ['chucheng'] = $this->input->post ( 'chucheng' );
			$data ['canjizhesuan'] = $this->input->post ( 'canjizhesuan' );
			$data ['danjia'] = $this->input->post ( 'danjia' );
			$data ['jine'] = $this->input->post ( 'jine' );
			$yewuyuan = $this->input->post ( 'yewuyuan' );
			$data ['jingxiaoshang'] = $this->input->post ( 'jingxiaoshang' );
			$data ['beizhu'] = $this->input->post ( 'beizhu' );
			$yf = $this->input->post ( 'yunfei' );
			$data ['yangzhihu'] = $this->input->post ( 'yangzhihu' );
			$data ['diqu'] = $this->input->post ( 'diqu' );
			$data ['choujino'] = $this->input->post ( 'choujiNo' );
			foreach ( $carno as $key => $val ) {
				if ($val)
					$yunfei [$val] = $yf [$key];
			}
			foreach ( $yewuyuan as $val ) {
				if ($val)
					$ywy [] = $val;
			}
			$data ['carno'] = serialize ( $carno );
			$data ['yunfei'] = serialize ( $yunfei );
			$data ['yewuyuan'] = serialize ( $ywy );
			//var_dump($data);
			//TODO业务员为空时候需要对业务员数组赋值为胴体
			$this->hyb_mdl->insertReport ( $data );
			$this->_message ( '信息录入成功!' );
		
		//$this->_template('hyb/addreport');				
		}
	}
	
	function creatReport() { //创建报表
		$this->_creatReport_post ();
	}
	
	function _creatReport_post() {
		$month = $this->input->post ( 'month' );
		if (! $month)
			$month = date ( 'Y-m', strtotime ( "-1 month" ) );
		$result = $this->hyb_mdl->getMonthReport ( $month );
		//var_dump($result);
		foreach ($result as $val)
		{ //操作数据
			$dongti += $val->dongti;
			$canji += $val->canji;
			$dongtiNo += $val->dongtino;
			$canjiNo += $val->canji;
		}
	}
}