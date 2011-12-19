<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
.diy-edit{font-size:12px;line-height:1.7em;}
</style>
</head>
<body>
<div class="diy-edit">
<form method='post' action='<?php echo $plugin_url;?>' >
<?php foreach($diy_edit as $row) : ?>
<input type="hidden" name="edit_id" value='<?php echo $row->id; ?>' />
变量备注:<input type="text" name="edit_arr_name" value='<?php echo $row->arr_name; ?>' /><br/>
变量名称:<input type="text" name="edit_arr_k" value='<?php echo $row->arr_k; ?>' /><br/>
变量的值:<input type="text" name="edit_arr_v" value='<?php echo $row->arr_v; ?>' /><br/>

<input type="submit" value="修改" />
<?php endforeach; ?>
发布者:<?php echo $row->arr_user; ?> 修改者 <?php echo $plugin_user; ?>
</form>

</div>
</body>
</html>