<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['current_role']=array (
  'id' => '2',
  'name' => '管理员',
  'rights' => 
  array (
    0 => 'system@password',
    1 => 'system@cache',
    2 => 'setting@site',
    3 => 'setting@backend',
    4 => 'plugin@view',
    5 => 'plugin@add',
    6 => 'plugin@edit',
    7 => 'plugin@del',
    8 => 'plugin@import',
    9 => 'plugin@active',
    10 => 'plugin@deactive',
    11 => 'module@run',
    12 => 'content@view',
    13 => 'content@form@edit',
    14 => 'content@save@edit',
    15 => 'content@del',
    16 => 'category_content@view',
    17 => 'category_content@form@edit',
    18 => 'category_content@save@edit',
    19 => 'user@view',
    20 => 'user@add',
    21 => 'user@edit',
  ),
  'models' => 
  array (
    0 => '0',
  ),
  'category_models' => 
  array (
    0 => 'keywords',
    1 => 'category',
  ),
  'plugins' => 
  array (
    0 => '0',
  ),
);