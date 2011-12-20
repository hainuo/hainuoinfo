<link rel="stylesheet"
	href="<?php echo base_url().'templates/oa/'?>images/oa.css" />




<div class="headbar">
	<div class="position">
		<span>伊德圆畜牧有限公司报表生产系统</span>
	</div>
</div>
<div class="content_box">
	<div class="content form_content">
	<?php echo validation_errors(); ?>
		<?php echo form_open('oa/hyb/creatMonthReport'); ?>
		<table>
		<?php if($list){?>
			<tr>
				<td><span><?php echo date('Y年m月',strtotime($month));?> 毛鸡收购月报表</span></td>
			</tr>
			<tr>
				<th><?php var_dump(' 胴体',$list->dongti)?></th>
			</tr>
			<?php }else{?>
			<tr>
				<td colspan='3'><span><?php echo date('Y年m月',strtotime($month));?> 毛鸡收购月报表</span>
					还没有生成<br>请点击下面按钮生成报表</td>
			</tr>
			<tr>
				<th>日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m',strtotime('-1 month'))?>"
					onFocus="WdatePicker({dateFmt:'yyyy年M月',minDate:'2011-10',maxDate:'<?php echo date('Y-m',strtotime('-1 month'))?>'})"></td>
				<td><input type="submit" value="生成报表"></td>
			</tr>
			<?php }?>
		</table>
		</form>
		<?php echo form_open('oa/hyb/creatMonthReport'); ?>
		<table>
		<?php if($list){?>
			<tr>
				<td><span><?php echo date('Y年m月d日',strtotime($date));?> 毛鸡收购月报表</span></td>
			</tr>
			<tr>
				<th><?php var_dump(' 胴体',$list->dongti)?></th>
			</tr>
			<?php }else{?>
			<tr>
				<td colspan='3'><span><?php echo date('Y年m月',strtotime($date));?> 毛鸡收购月报表</span>
					还没有生成<br>请点击下面按钮生成报表</td>
			</tr>
			<tr>
				<th>日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m',strtotime('-1 month'))?>"
					onFocus="WdatePicker({dateFmt:'yyyy年M月',minDate:'2011-10',maxDate:'<?php echo date('Y-m',strtotime('-1 month'))?>'})"></td>
				<td><input type="submit" value="生成报表"></td>
			</tr>
			<?php }?>
		</table>
		</form>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>