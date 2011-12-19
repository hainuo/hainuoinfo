<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['cate_models']['oa_power']=array (
  'id' => '5',
  'name' => 'oa_power',
  'description' => 'oa权限分类',
  'perpage' => '25',
  'level' => '0',
  'hasattach' => '0',
  'built_in' => '0',
  'fields' => 
  array (
    7 => 
    array (
      'id' => '7',
      'name' => 'name',
      'description' => 'oa权限名称',
      'model' => '5',
      'type' => 'input',
      'length' => '256',
      'values' => '',
      'width' => '100',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
    8 => 
    array (
      'id' => '8',
      'name' => 'desc',
      'description' => 'oa用户权限说明',
      'model' => '5',
      'type' => 'textarea',
      'length' => '1000',
      'values' => '',
      'width' => '150',
      'height' => '100',
      'rules' => 'required',
      'ruledescription' => '务必填写相关信息',
      'searchable' => '0',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
    9 => 
    array (
      'id' => '9',
      'name' => 'act',
      'description' => '操作名称字母',
      'model' => '5',
      'type' => 'input',
      'length' => '30',
      'values' => '',
      'width' => '100',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '2',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '7',
    1 => '8',
    2 => '9',
  ),
  'searchable' => 
  array (
  ),
);