<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
		
	class Dili_Loader extends CI_Loader
	{
		
		function __construct()
		{
			parent::__construct();
		}
		
		function switch_theme($switcher = 'on' , $theme = 'default' ,$path = 'templates/'){
			if($switcher == 'on')
			{
				$this->_ci_view_paths = array(FCPATH.$path.$theme.'/'	=> TRUE);//默认将模板文件夹更改问templates下的default文件夹中
			}
		}
			
	}
	