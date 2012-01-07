<link rel="stylesheet"
	href="<?php echo base_url().'templates/oa/'?>images/oa.css" />
<div class="headbar">
	<div class="position">
		<span>伊德圆畜牧有限公司报表生成系统</span>
	</div>
</div>
<div class="content_box">
	<div class="content form_content">
<?php
	echo validation_errors (); //显示报表错误
	echo form_open ( 'oa/hyb/creatMonthReport' ); //生成 form
?>
		<!-- 填写日报表生成最近一天的日报表  -->
		<table>
			<tr>
				<td>选择月份</td>
				<td><input type="text" name="month" id="month"
					value="<?php echo date('Y-m',strtotime('-1 month'));?>"
					onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-M',maxDate:'<?php echo date('Y-m')?>'})"></td>
				<td><input type="submit" value="生成所选月份报表"></td>
			</tr>
		</table>
		</form>
	<?php echo form_open ( 'oa/hyb/creatDailyReport' ); //生成 form  ?>
		<!-- 填写日报表生成最近一天的日报表  -->
		<table>
			<tr>
				<td>选择日期</td>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m-d',strtotime('-1 day'));?>"
					onFocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-M-d',maxDate:'<?php echo date('Y-m-d')?>'})"></td>
				<td><input type="submit" value="生成所选日期报表"></td>
			</tr>
		</table>
		</form>
		<?php

		if ($list) {
			$monthList = $list ['month'];
			$dailyList = $list ['daily'];
			if ($monthList) {
				?>
		<table>
			<tr>
				<th colspan='15'><?php echo date('Y年m月',strtotime($month));?> 毛鸡收购月报表</th>
			</tr>
			<tr>
				<th>总运费</th>
				<th>平均运费</th>
				<th>胴体重</th>
				<th>残鸡重</th>
				<th>胴体只数</th>
				<th>残鸡只数</th>
				<th>臭鸡只数</th>
				<th>总只数</th>
				<th>月产量</th>
				<th>出成率</th>
				<th>平均价格</th>
				<th>总金额</th>
				<th>残疾比</th>
				<th>日平均产量</th>
				<th>生产天数</th>
			</tr>
			<tr>
				<td><?php echo $monthList->yunfei;?></td>
				<td><?php echo $monthList->pingjunyunfei;?></td>
				<td><?php echo $monthList->dongti;?></td>
				<td><?php echo $monthList->canji;?></td>
				<td><?php echo $monthList->dongtino;?></td>
				<td><?php echo $monthList->canjino;?></td>
				<td><?php echo $monthList->choujino;?></td>
				<td><?php echo $monthList->number;?></td>
				<td><?php echo $monthList->jingzhong;?></td>
				<td><?php echo $monthList->chucheng;?></td>
				<td><?php echo $monthList->pingjunjiage;?></td>
				<td><?php echo $monthList->jine;?></td>
				<td><?php echo $monthList->canjibi;?></td>
				<td><?php echo $monthList->ripingjunchanliang;?></td>
				<td><?php echo $monthList->days;?></td>
			</tr>
		</table>
		<?php

			} else
				echo '<div class="error">' . date ( 'Y年m月d日', strtotime ( $daily ) ) . '日报表没有生成!</div>';
			if ($dailyList) {
				?>
		<table>
			<tr>
				<th colspan='15'><?php echo date('Y年m月d日',strtotime($daily));?> 毛鸡收购日报表</th>
			</tr>
			<tr>
				<th>总运费</th>
				<th>平均运费</th>
				<th>胴体重</th>
				<th>残鸡重</th>
				<th>胴体只数</th>
				<th>残鸡只数</th>
				<th>臭鸡只数</th>
				<th>总只数</th>
				<th>日产量</th>
				<th>出成率</th>
				<th>平均价格</th>
				<th>总金额</th>
				<th>残鸡比</th>
			</tr>
			<tr>
				<td><?php echo $dailyList->yunfei;?></td>
				<td><?php echo $dailyList->pingjunyunfei;?></td>
				<td><?php echo $dailyList->dongti;?></td>
				<td><?php echo $dailyList->canji;?></td>
				<td><?php echo $dailyList->dongtino;?></td>
				<td><?php echo $dailyList->canjino;?></td>
				<td><?php echo $dailyList->choujino;?></td>
				<td><?php echo $dailyList->number;?></td>
				<td><?php echo $dailyList->jingzhong;?></td>
				<td><?php echo $dailyList->chucheng;?></td>
				<td><?php echo $dailyList->pingjunjiage;?></td>
				<td><?php echo $dailyList->jine;?></td>
				<td><?php echo $dailyList->canjibi;?></td>
			</tr>
		</table>
		<?php

			} else
				echo '<div class="error">' . date ( 'Y年m月d日', strtotime ( $daily ) ) . '日报表没有生成!</div>';
			?>
<?php }?>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>