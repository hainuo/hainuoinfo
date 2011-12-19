<link rel="stylesheet"
	href="<?php echo base_url().'templates/oa/'?>images/oa.css" />
<div class="headbar">
	<div class="position">
		<span><?php echo date('Y年m月d日',strtotime($reportDate));?> 毛鸡收购日报表</span>
	</div>
</div>
<?php 
//定义常量 为写入日报表数据库做准备
$number=0;
$jine=0;
$chucheng=0;
$dongti=0;
$canji=0;
$totalyunfei=0;
?>
<div class="content_box">
	<div class="content form_content">
	<?php echo validation_errors(); ?>
	<?php echo form_open('oa/hyb/creatReport'); ?>
		<table>
			<tr>
				<th>日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m-d')?>"
					onFocus="WdatePicker({skin:'whyGreen',maxDate:'<?php echo date('Y-m-d')?>'})"></td>
				<td><input type="submit" value="查看报表"></td>
			</tr>
			<tr>
				<th>日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m-d')?>"
					onFocus="WdatePicker({skin:'whyGreen',maxDate:'<?php echo date('Y-m-d')?>'})"></td>
				<td><input type="submit" value="查看报表"></td>
			</tr>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>