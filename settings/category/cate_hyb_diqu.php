<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['cate_models']['hyb_diqu']=array (
  'id' => '6',
  'name' => 'hyb_diqu',
  'description' => '[货源]地区',
  'perpage' => '20',
  'level' => '2',
  'hasattach' => '1',
  'built_in' => '0',
  'fields' => 
  array (
    10 => 
    array (
      'id' => '10',
      'name' => 'name',
      'description' => '地区名称',
      'model' => '6',
      'type' => 'input',
      'length' => '50',
      'values' => '',
      'width' => '100',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '1',
      'listable' => '0',
      'order' => '0',
      'editable' => '0',
    ),
    11 => 
    array (
      'id' => '11',
      'name' => 'baodi',
      'description' => '保底',
      'model' => '6',
      'type' => 'int',
      'length' => '11',
      'values' => '',
      'width' => '50',
      'height' => '30',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '0',
      'editable' => '0',
    ),
  ),
  'listable' => 
  array (
    0 => '11',
  ),
  'searchable' => 
  array (
    0 => '10',
  ),
);