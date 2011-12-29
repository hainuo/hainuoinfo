<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['cate_models']['news']=array (
  'id' => '4',
  'name' => 'news',
  'description' => '新闻分类',
  'perpage' => '25',
  'level' => '2',
  'hasattach' => '0',
  'built_in' => '0',
  'fields' => 
  array (
    4 => 
    array (
      'id' => '4',
      'name' => 'name',
      'description' => '新闻分类名称',
      'model' => '4',
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
    5 => 
    array (
      'id' => '5',
      'name' => 'uri',
      'description' => 'URL别名',
      'model' => '4',
      'type' => 'input',
      'length' => '100',
      'values' => '',
      'width' => '50',
      'height' => '30',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '0',
      'editable' => '1',
    ),
    6 => 
    array (
      'id' => '6',
      'name' => 'dec',
      'description' => '说明',
      'model' => '4',
      'type' => 'textarea',
      'length' => '256',
      'values' => '',
      'width' => '300',
      'height' => '100',
      'rules' => '',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '0',
      'order' => '1',
      'editable' => '0',
    ),
  ),
  'listable' => 
  array (
    0 => '4',
    1 => '5',
  ),
  'searchable' => 
  array (
  ),
);