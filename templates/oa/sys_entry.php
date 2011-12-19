<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo setting('oa_title'); ?>----Powered By DiliCMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<?php echo base_url().'admincp/default/'?>images/admin.css" />

<script language="javascript" src="<?php echo base_url().'admincp/default/'?>js/jquery.js"></script>
<script language="javascript" src="<?php echo base_url().'admincp/default/'?>js/admin.js"></script>
</head>
<body>
<div class="container">
	<div id="header">
		<div class="logo">
			<img src="<?php echo base_url().'/admincp/default/'.setting('oa_logo');  ?>" />
		</div>
		<div id="menu">
			<ul name="menu"><?php $this->load->view('sys_top'); ?></ul>
		</div>
		<p>
        	<a href="<?php echo oa_url('login/quit'); ?>">退出管理</a>
            <a href="<?php echo oa_url('system/home'); ?>">后台首页</a>
            <a href="<?php echo base_url(); ?>" target='_blank'>站点首页</a>
            <span>您好 <label class='bold'><?php echo $this->_admin->username; ?></label>，
            当前身份 <label class='bold'><?php echo $this->_admin->name; ?></label></span>
        </p>
	</div>
	<div id="info_bar">
    <span class="nav_sec">    	
        <?php $this->load->view('sys_link'); ?>
	</span></div>
	<div id="admin_left">
		<ul class="submenu">
            <?php $this->load->view('sys_left'); ?>
        </ul>
	</div>
	<div id="admin_right">
    	<?php if($this->uri->rsegment(1) != 'module'): ?>
    	<?php $this->load->view(isset($tpl) && $tpl ? $tpl : 'sys_default'); ?>
        <?php else: ?>
        <?php if(!isset($msg)){echo $content;}else{$this->load->view($tpl);} ?>
        <?php endif; ?>
	</div>
	<div id="separator"></div>
</div>
<script type='text/javascript'>
	//隔行换色
	$(".list_table tr::nth-child(even)").addClass('even');
	$(".list_table tr").hover(
		function () {
			$(this).addClass("sel");
		},
		function () {
			$(this).removeClass("sel");
		}
	);
</script>
</body>
</html>
