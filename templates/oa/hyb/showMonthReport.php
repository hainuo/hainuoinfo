<link rel="stylesheet" href="<?php echo base_url() . 'templates/oa/' ?>images/oa.css" />
<div class="headbar">
	<div class="position">
		<span>查看月报表</span>
	</div>
</div>
<div class="content_box">
	<div class="content form_content">
	<?php echo validation_errors(); ?>
	<?php echo form_open('oa/hyb/showMonthReport'); ?>
		<table>
			<tr>
				<th>开始月份</th>
				<td><input type="text" name="monthStart" id="monthStart"
					value="<?php echo date('Y-m', strtotime('-12 months')) ?>"
					onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM',maxDate:'<?php echo date('Y-m') ?>'})" /></td>
     <th>结束月份</th><td><input type="text" name="monthEnd" id="monthEnd"
					value="<?php echo date('Y-m', strtotime('-1 month')) ?>"
					onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM',maxDate:'<?php echo date('Y-m') ?>'})" /></td>
				<td><input type="submit" value="查看报表" /></td>
			</tr>
		</table>
		</form>
		<table class="list_table">
        <tbody>
			<tr>
                <td>月份</th>
				<td>运费</td>
                <td>平均运费</td>
				<td>胴体重</td>
				<td>残鸡重</td>
                <td>残鸡比</td>
				<td>胴体只数</td>
				<td>残鸡只数</td>
				<td>臭鸡只数</td>
				<td>出成率</td>
				<td>单价</td>
				<td>金额</td>
			</tr>
<?php
$i=1;
if ($list)
    foreach ($list as $val)
    { ?>
			<tr>
				<td><?php echo $val->month ?></td>
				<td><?php echo $val->yunfei; ?></td>
                <td><?php echo $val->pingjunyunfei; ?></td>
				<td><?php echo $val->dongti; ?></td>
				<td><?php echo $val->canji; ?></td>
                <td><?php echo $val->canjibi; ?></td>
				<td><?php echo $val->dongtino; ?></td>
				<td><?php echo $val->canjino; ?></td>
				<td><?php echo $val->choujino; ?></td>
				<td class="red"><?php echo $val->chucheng; ?></td>
				<td><?php echo $val->pingjunjiage; ?></td>
				<td><?php echo $val->jine; ?></td>
			</tr>
<?php }
else
    echo '<tr><td colspan="12">暂无数据</td></tr>' ?>
	       </tbody>
    	</table>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url() . 'admincp/default/js/datepicker' ?>/WdatePicker.js"></script>