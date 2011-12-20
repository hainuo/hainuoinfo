﻿<?php

if (! defined ( 'IN_DiliCMS' ))
	exit ( 'No direct script access allowed' );
class Hyb_mdl extends CI_Model
{
	
	function __construct() //初始化模型
{
		parent::__construct (); //自动调用父类初始化方法
	}
	
	function insertReport($data) {
		$this->db->insert ( 'dili_hyb_ribaobiao', $data );
	}
	
	function getDailyReport($date = '') { //通过日期获取日报表
		if (! $date)
			$date = date ( 'Y-m-d', time () );
		$query = $this->db->get_where ( 'dili_hyb_ribaobiao', array ('date' => $date ) );
		return $query->result ();
	}
	function getDailyReportByMonth($month) {
		if (! $month)
			$month = date ( 'Y-m', strtotime ( "-1 month" ) ); //如果未指定那么需要将月份定义为当前月份的上一个月
		$sql = "SELECT * FROM `dili_hyb_ribaobiao` where DATE_FORMAT(date,'%Y-%m')='" . $month . "'";
		$query = $this->db->query ( $sql );
		return $query->result ();
	}
	function addMonthReport($data) {//写入月报表
		$this->db->insert ( 'dili_hyb_yuebaobiao', $data );
	}
	function getLastMonthReport() { //
		$month = date ( 'Y-m', strtotime ( "-1 month" ) ); //防止重复操作直接定义为上一个月的报表
		$data ['reportDate'] = $month;
		$data ['list'] = $this->getMonthReport ( $month );
		return $data;
	}
	
	function getMonthReport($month){
		if(!$month)
			$month = date ( 'Y-m', strtotime ( "-1 month" ) );//默认当前月份的上一个月
		return $this->db->where('month',$month)->get('dili_hyb_yuebaobiao')->row();
	}

}