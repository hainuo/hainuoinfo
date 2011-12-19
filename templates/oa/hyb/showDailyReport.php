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
	<?php echo form_open('oa/hyb/dailyReport'); ?>
		<table>
			<tr>
				<th>日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m-d')?>"
					onFocus="WdatePicker({skin:'whyGreen',maxDate:'<?php echo date('Y-m-d')?>'})"></td>
				<td><input type="submit" value="查看报表"></td>
			</tr>
		</table>
		</form>
		<table>
			<tr>
				<th>车号（运费）</th>
				<th>地区</th>
				<th>养殖户</th>
				<th>胴体重</th>
				<th>残鸡重</th>
				<th>胴体只数</th>
				<th>残鸡只数</th>
				<th>臭鸡只数</th>
				<th>出成率</th>
				<th>单价</th>
				<th>金额</th>
				<th>业务员</th>
				<th>经销商</th>
			</tr>
<?php  
if($list) 
	foreach ($list as $val){?>
			<tr>
				<th><?php
			 	 if($val->yunfei){
			 	 	foreach (unserialize($val->yunfei) as $k=>$v){
			 	 		if($k)	echo '<div class="car">'.$k."(<span class='yunfei'>".$v."</span>)</div>";
			 	 	} 
			 	 }
			 	?></th>
				<th><?php echo $val->diqu;?></th>
				<th><?php echo $val->yangzhihu;?></th>
				<th><?php echo $val->dongti;?></th>
				<th><?php echo $val->canji;?></th>
				<th><?php echo $val->dongtino;?></th>
				<th><?php echo $val->canjino;?></th>
				<th><?php echo $val->choujino;?></th>
				<th><?php echo $val->chucheng;?></th>
				<th><?php echo $val->danjia;?></th>
				<th><?php echo $val->jine;?></th>
				<th><?php
			 foreach ( unserialize($val->yewuyuan) as $v){
			 	if($v) echo $v;
			 }
			 		
			 ?></th>
				<th><?php echo $val->jingxiaoshang;?></th>
			</tr>
<?php }else echo '<tr><td colspan="13">暂无数据</td></tr>'?>
		</table>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>