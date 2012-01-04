<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['models']['hyb_rimingxi']=array (
  'id' => '3',
  'name' => 'hyb_rimingxi',
  'description' => '[货源部]日明细表',
  'perpage' => '30',
  'hasattach' => '1',
  'built_in' => '0',
  'fields' => 
  array (
    13 => 
    array (
      'id' => '13',
      'name' => 'chehao',
      'description' => '车号',
      'model' => '3',
      'type' => 'input',
      'length' => '10',
      'values' => '',
      'width' => '60',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
    14 => 
    array (
      'id' => '14',
      'name' => 'checi',
      'description' => '车次',
      'model' => '3',
      'type' => 'int',
      'length' => '4',
      'values' => '',
      'width' => '60',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '13',
    1 => '14',
  ),
  'searchable' => 
  array (
    0 => '13',
    1 => '14',
  ),
);