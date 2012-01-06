<?php

define('CHUCHENGBI', '3');

class Qianqu extends Oa_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('oa/dongti_mdl');
        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
        $this->form_validation->set_error_delimiters('<div class="error">', '</div>');
    }

    function Index() { //索引页
        echo '这是首页，正在加载中....';
    }

    function addReport(){
        $this->_template('qianqu/addreport');
    }
    
}