<?php
if (!defined('IN_DiliCMS'))
    exit('No direct script access allowed');

class Dongti_mdl extends CI_Model {

    function __construct() { //初始化模型
        parent::__construct(); //自动调用父类初始化方法
    }
    function insertDongti($data){
        $this->db->insert('qq_dongti_mingxi',$data);
    }
    
}