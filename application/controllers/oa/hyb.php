<?php
define ( 'CHUCHENGBI', '3' );
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
	
	function detailReport() { //汇总日报表
		$this->_dailyReport_post ();
	}
	
	function _detailReport_post() {
		$data = array ();
		$date = $this->input->post ( 'date' );
		if (! $date)
			$date = date ( 'Y-m-d' );
		$date = date ( 'Y-m-d', strtotime ( $date ) );
		$data ['reportDate'] = $date;
		//var_dump($data);
		$data ['list'] = $this->hyb_mdl->getDailyReport ( $date );
		$this->_template ( 'hyb/showDetailReport', $data );
	}
	
	function addReport() //填写报表明细
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
			$this->hyb_mdl->insertDetailReport ( $data );
			$this->_message ( '信息录入成功!' );
		}
	}
	
	//创建报表开始
	function creatReport() { //创建报表页面
		$data ['month'] = date ( 'Y-m', strtotime ( '-1 month' ) );
		$data ['daily'] = date ( 'Y-m-d', strtotime ( '-1 day' ) );
		$data ['list'] ['month'] = $this->hyb_mdl->getMonthReport ( $data ['month'] ); //获取最近一次的月报表
		$data ['list'] ['daily'] = $this->hyb_mdl->getDailyReport ( $data ['daily'] ); //获取最近一次的月报表
		$this->_template ( 'hyb/creatReport', $data );
	}
	
	function _creatDailyReport_post() {
		$date = $this->input->post ( 'date' );
		$data ['dongti'] = 0;
		$data ['canji'] = 0;
		$data ['dongtino'] = 0;
		$data ['canjino'] = 0;
		$data ['choujino'] = 0;
		$data ['number'] = 0;
		$data ['jingzhong'] = 0;
		$data ['jine'] = 0;
		$data ['yunfei'] = 0;
		$data ['date'] = $date;
		if (! $date)
			$date = date ( 'Y-m-d', strtotime ( "-1 day" ) );
		$result = $this->hyb_mdl->getDailyReport ( $date );
		var_dump($data);
		if ($result) { //检查数据库如果存在则跳出 不存在则继续
			$this->_message ( date ( 'Y年m月d日', strtotime($data ['date']) ) . '报表已经存在，取消生成操作!' );
			return TRUE;
		}
		$details = $this->hyb_mdl->getDetailReportByDate ( $date );
		foreach ( $details as $detail ) {
			$data ['dongti'] += $detail->dongti;
			$data ['canji'] += $detail->canji;
			$data ['dongtino'] += $detail->dongtino;
			$data ['canjino'] += $detail->canjino;
			$data ['choujino'] += $detail->choujino;
			$data ['number'] += $detail->number;
			$data ['jingzhong'] += $detail->jingzhong;
			$data ['jine'] += $detail->jine;
			$yunfei = unserialize ( $val->yunfei );
			if ($yunfei)
				foreach ( $yunfei as $v ) {
					$data ['yunfei'] += $v;
				}
			$data ['chucheng'] = round ( ($data ['dongti'] + $data ['canji'] / CHUCHENGBI) / $data ['jingzhong'] * 100, 3 );
			$data ['pingjunjiage'] = round ( $data ['jine'] / $data ['jingzhong'], 3 );
			$data ['pingjunyunfei'] = round ( $data ['yunfei'] / $data ['jingzhong'], 3 );
			
			if (!empty ( $data ['date'] )) {
				$result = $this->hyb_mdl->insertDailyReport ( $data );
				$this->_message ( date ( 'Y年m月d日', strtotime($data ['date']) ) . '报表生成成功', 'hyb/showDailyReport' );
			} else
				$this->_message ( date ( 'Y年m月d日', strtotime($data ['date']) ) . '报表生成失败' );
		}
	}
	
	function _creatMonthReport_post() { //创建月报表
		$month = $this->input->post ( 'month' );
		$data ['dongti'] = 0;
		$data ['canji'] = 0;
		$data ['dongtino'] = 0;
		$data ['canjino'] = 0;
		$data ['choujino'] = 0;
		$data ['number'] = 0;
		$data ['jingzhong'] = 0;
		$data ['jine'] = 0;
		$data ['yunfei'] = 0;
		$data ['days'] = 0;
		if (! $month)
			$month = date ( 'Y-m', strtotime ( "-1 month" ) );
		
		//TODO先判断是否已经存在该月份的日报表 若存在则返回显示
		$result = $this->hyb_mdl->getMonthReport ( $month );
		if (! empty ( $result )) {
			$this->_message ( date ( 'Y年m月', strtotime($data ['month'])) . '报表已存在，取消声称操作！' );
			return TRUE;
		}
		
		$result = $this->hyb_mdl->getDailyReportByMonth ( $month );
		//var_dump ( $result );
		foreach ( $result as $val ) { //操作数据自动生成相关数据
			$data ['dongti'] += $val->dongti;
			$data ['canji'] += $val->canji;
			$data ['dongtino'] += $val->dongtino;
			$data ['canjino'] += $val->canjino;
			$data ['choujino'] += $val->choujino;
			$data ['number'] += $val->number;
			$data ['jingzhong'] += $val->jingzhong;
			$data ['jine'] += $val->jine;
			$data ['days'] += 1; //正常生产天数
			$data ['yunfei'] += $val->yunfei;
			$data ['pingjunjiage'] = round ( $data ['jine'] / $data ['jingzhong'], 3 );
			$data ['pingjunyunfei'] = round ( $data ['yunfei'] / $data ['jingzhong'], 3 );
			$data ['canjibi'] = round ( $data ['canji'] / $data ['dongti'] * 100, 3 );
			$data ['chucheng'] = round ( ($data ['dongti'] + $data ['canji'] / CHUCHENGBI) / $data ['jingzhong'] * 100, 3 );
			$data ['month'] = $month;
			$data ['ripingjunchanliang'] = round ( $data ['jingzhong'] / $data ['days'], 3 );
		}
		//var_dump ( $data );
		if (isset ( $data ['month'] )) {
			$this->hyb_mdl->insertMonthReport ( $data );
			$this->_message ( date ( 'Y年m月', strtotime($data ['month'])) ) . '报表生成成功', 'hyb/showMonthReport' );
		} else
			$this->_message ( date ( 'Y年m月', strtotime($data ['month']) ) . '报表生成失败' );
	}
	
	//创建报表结束
	

	//查看报表开始
	function showMonthReport() {
		$this->_showMontReport_post ();
	}
	
	function _showMontReport_post() {
		$data = array ();
		$month = $this->input->post ( 'month' );
		if (! $month)
			$month = date ( 'Y-m' );
		$month = date ( 'Y-m', strtotime ( $month ) ); //数据过滤 可以不用此步骤但是为保险确保数据格式增加此操作
		$data ['month'] = $month;
		$data ['list'] = $this->hyb_mdl->getMonthReport ( $month );
		$this->_template ( 'hyb/showMonthReport', $data );
	}
}