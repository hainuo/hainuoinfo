<?php
if (!defined('IN_DiliCMS'))
    exit('No direct script access allowed');

class Hyb_mdl extends CI_Model {

    function __construct() { //初始化模型
        parent::__construct(); //自动调用父类初始化方法
    }

    function insertDetailReport($data) { //添加明细
        $this->db->insert('dili_hyb_detailreport', $data);
    }

    function editDetailReport($filedname, $val, $id) {
        if ($filedname && $val) {
            $data = array($filedname => $val);
            $this->db->where('id', $id);
            $result = $this->db->get('dili_hyb_detailreport')->row();

            if ($val != $result->$filedname) {
                $this->db->update('dili_hyb_detailreport', $data);
                $result=TRUE;
            } else {
                $result = FALSE;
            }
        } else {
            $result = FALSE;
        }
        return $result;
    }

    function getDetailReportByDate($date) { //获取日明细表
        if (!$date)
            $date = date('Y-m-d', time());
        $query = $this->db->where('date', $date)->order_by('id', 'desc')->get('dili_hyb_detailreport');
        return $query->result();
    }

    function insertDailyReport($data) { //添加日报表
        $this->db->insert('dili_hyb_ribaobiao', $data);
    }

    function getDailyReport($date = '') { //获取日报表
        if (!$date)
            $date = date('Y-m-d', time());
        return $this->db->where('date', $date)->get('dili_hyb_ribaobiao')->row();
    }

    function getDailyReportOfDays($dateStart='', $dateEnd='') {//得到多天的日报表信息
        if ($dateStart && $dateEnd) {
            $query = $this->db->where('date >=', $dateStart);
            $query = $this->db->where('date <=', $dateEnd);
            $query = $this->db->from('dili_hyb_ribaobiao');
            return $query->get()->result();
        }else
            return false;
    }

    function getDailyReportByMonth($month) { //得到一个月内每天的总报表
        if (!$month)
            $month = date('Y-m', strtotime("-1 month")); //如果未指定那么需要将月份定义为当前月份的上一个月
        $sql = "SELECT * FROM `dili_hyb_ribaobiao` where DATE_FORMAT(date,'%Y-%m')='" . $month . "'";
        $query = $this->db->query($sql);
        return $query->result();
    }

    function insertMonthReport($data) { //添加月报表
        $this->db->insert('dili_hyb_yuebaobiao', $data);
    }

    function getMonthReport($month) { //获取指定月份的月报表
        if (!$month)
            $month = date('Y-m', strtotime('-1 month')); //默认为当年
        return $this->db->where('month', $month)->get('dili_hyb_yuebaobiao')->row();
    }

    function getMonthReportByYear($year) {//获取指定年的月明细表
        if (!$year)
            $year = date('Y');
        $sql = "SELECT * FROM `dili_hyb_ribaobiao` where DATE_FORMAT(date,'%Y')='" . $year . "'";
        $query = $this->db->query($sql);
        return $query->result();
    }

    function getMonthReportOfMonths($monthStart, $monthEnd) {
        if ($monthStart && $monthEnd) {
            $query = $this->db->where('month >=', $monthStart);
            $query = $this->db->where('month <=', $monthEnd);
            $query = $this->db->from('dili_hyb_yuebaobiao');
            return $query->get()->result();
        }else
            return false;
    }

    //TODO 需要做的是年报表体系暂时不做
}