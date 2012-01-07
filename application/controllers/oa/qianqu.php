<?php
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

    function addDongti(){
        $this->_template('qianqu/adddongti');
    }
    function _addDongti_post(){
        $data['checi']=  $this->input->post('checi');
        $data['chehao']=  $this->input->post('chehao');
        $data['dongti']=  $this->input->post('dongti');
        $data['dongtino']=  $this->input->post('dongtiNo');
        $data['canji']=  $this->input->post('canji');
        $data['canjino']=  $this->input->post('canjiNo');
        $data['choujino']=  $this->input->post('choujiNo');
        $data['date']=  $this->input->post('date');
        $data['beizhu']=  $this->input->post('beizhu');
        
        $this->dongti_mdl->insertDongti($data);
    }
    
}