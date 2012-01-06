<?php

	class extra_field_test
	{
		public $k = 'test';
		public $v = '测试字段(VARCHAR)';
		
		function __construct()
		{
			//nothing to do !
		}
		
		function on_form($field, $default = '' , $has_tip = true)
		{
			echo '<input name="'.$field['name'].'" value="'.$default.'" />';	
		}
		
		function on_list($field ,  $value)
		{
			echo $value->$field['name'];	
		}
		
		function on_search($field , $default)
		{
			echo '<input name="'.$field['name'].'" value="'.$default.'" />';
		}
		
		function on_do_search($field , & $condition , & $where ,& $suffix)
		{
			if(isset($_REQUEST[$field['name']]) && $keyword = $_REQUEST[$field['name']])
			{
				$condition[$field['name'].' LIKE'] = $keyword;
				$where[$field['name']] = $keyword;
				$suffix .= '&'.$field['name'].'='.$keyword;
			}
		}
		
		function on_info($data)
		{
			return $field = array('type' => 'VARCHAR','constraint' => $data['length'] ? $data['length'] : 100 ,'default' => '') ;	
		}
		
	}