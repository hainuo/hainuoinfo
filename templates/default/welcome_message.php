<head>
	<meta charset="utf-8">
	<title><?php echo setting('site_name')?></title>

	<style type="text/css">

	::selection{ background-color: #E13300; color: white; }
	::moz-selection{ background-color: #E13300; color: white; }
	::webkit-selection{ background-color: #E13300; color: white; }

	body {
		background-color: #fff;
		margin: 40px;
		font: 13px/20px normal Helvetica, Arial, sans-serif;
		color: #4F5155;
	}

	a {
		color: #003399;
		background-color: transparent;
		font-weight: normal;
	}

	h1 {
		color: #444;
		background-color: transparent;
		border-bottom: 1px solid #D0D0D0;
		font-size: 19px;
		font-weight: normal;
		margin: 0 0 14px 0;
		padding: 14px 15px 10px 15px;
	}

	code {
		font-family: Consolas, Monaco, Courier New, Courier, monospace;
		font-size: 12px;
		background-color: #f9f9f9;
		border: 1px solid #D0D0D0;
		color: #002166;
		display: block;
		margin: 14px 0 14px 0;
		padding: 12px 10px 12px 10px;
	}

	#body{
		margin: 0 15px 0 15px;
	}
	
	p.footer{
		text-align: right;
		font-size: 11px;
		border-top: 1px solid #D0D0D0;
		line-height: 32px;
		padding: 0 10px 0 10px;
		margin: 20px 0 0 0;
	}
	
	#container{
		margin: 10px;
		border: 1px solid #D0D0D0;
		-webkit-box-shadow: 0 0 8px #D0D0D0;
	}
	
	.red {color:red;font-weight:bold}
	.border{border:1px solid red;margin:5px 10px;}
	a.border{color:red;padding:2px;text-decoration:none;}
	</style>
</head>
<body>

<div id="container">
	<h1>伊德圆畜牧有限公司欢迎您！</h1>
<div style="min_height:50px;padding:2px;text-align:center;">
<img src="<?php echo 'templates/'.setting('site_theme')."/image/homepage/frontpage.jpg";?>" border=0 style="margin:0px auto;">
<div style="margin:10px auto;">
<a href="<?php echo site_url('oa');?>" target="_blank" class='border'>办公系统</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class='border' href="<?php echo site_url('admin')?>" target="_blank">网络管理</a>
</div>
</div>
	<p class="footer">Powered by <a href="http://hainuo.info" target="_blank">hainuo</a> version<b><?php echo DiliCMS_VERSION; ?></b></p>
</div>

</body>
</html>