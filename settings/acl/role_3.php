<?php if ( ! defined('IN_DiliCMS')) exit('No direct script access allowed');
$setting['current_role']=array (
  'id' => '3',
  'name' => '网站编辑',
  'rights' => 
  array (
    0 => 'system@password',
    1 => 'system@cache',
    2 => 'content@view',
    3 => 'content@form@add',
    4 => 'content@form@edit',
    5 => 'content@save@add',
    6 => 'content@save@edit',
    7 => 'content@del',
    8 => 'category_content@form@add',
    9 => 'category_content@form@edit',
    10 => 'category_content@save@add',
    11 => 'category_content@save@edit',
  ),
  'models' => 
  array (
    0 => 'news',
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