<?php

if (! defined ( 'IN_DiliCMS' ))
	exit ( 'No direct script access allowed' );
class Hyb_mdl extends CI_Model {
	
	function __construct() //初始化模型
{
		parent::__construct (); //自动调用父类初始化方法
	}
	
	function insertDetailReport($data) { //添加明细
		$this->db->insert ( 'dilic_hyb_detailReport', $data );
	}
	function getDetailReportByDate($date) { //获取日明细表
		if (! $date)
			$date = date ( 'Y-m-d', time () );
		$query = $this->db->where ( 'date', $date )->order_by ( 'id', 'desc' )->get ( 'dilic_hyb_detailReport' );
		return $query->result ();
	}
	function insertDailyReport($data) { //添加日报表
		$this->db->insert ( 'dili_hyb_dailyReport', $data );
	}
	function getDailyReport($date = '') { //获取日报表
		if (! $date)
			$date = date ( 'Y-m-d', time () );
		$query = $this->db->get_where ( 'dili_hyb_ribaobiao', array ('date' => $date ) );
		return $query->result ()->row();
	}
	function getDailyReportByMonth($month) { //得到月明细表 每天的明细
		if (! $month)
			$month = date ( 'Y-m', strtotime ( "-1 month" ) ); //如果未指定那么需要将月份定义为当前月份的上一个月
		$sql = "SELECT * FROM `dili_hyb_ribaobiao` where DATE_FORMAT(date,'%Y-%m')='" . $month . "'";
		$query = $this->db->query ( $sql );
		return $query->result ();
	}
	
	function addMonthReport($data) { //添加月报表
		$this->db->insert ( 'dili_hyb_yuebaobiao', $data );
	}
	function getMonthReport($month) { //获取月报表
		if (! $month)
			$month = date ( 'Y-m',strtotime('-1 month') ); //默认为当年
		return $this->db->where ( 'month', $month )->get ( 'dili_hyb_yuebaobiao' )->row ();
	}
	function getMonthReportByYear($year){//获取月明细表
		if(!$year)
			$year=date('Y');
		$sql="SELECT * FROM `dili_hyb_ribaobiao` where DATE_FORMAT(date,'%Y')='" . $year . "'";
		$query=$this->db->query($sql);
		return $query->result();
	}
	
	//TODO 需要做的是年报表体系暂时不做
}