<link rel="stylesheet"
	href="<?php echo base_url().'templates/oa/'?>images/oa.css" />
<div class="headbar">
	<div class="position">
		<span><?php echo date('Y年m月d日',strtotime($date));?> 毛鸡收购日报表</span>
	</div>
</div>
<div class="content_box">
	<div class="content form_content">
	<?php echo validation_errors(); ?>
	<?php echo form_open('oa/hyb/showDetailReport'); ?>
		<table>
			<tr>
				<th>选择日期</th>
				<td><input type="text" name="date" id="date"
					value="<?php echo date('Y-m-d',strtotime('-1 day'))?>"
					onFocus="WdatePicker({skin:'whyGreen',maxDate:'<?php echo date('Y-m-d')?>'})"></td>
				<td><input type="submit" value="查看当日明细" /></td>
			</tr>
		</table>
		</form>
		<table class="list_table">
            <tbody>
			<tr>
				<td>车号（运费）</td>
				<td>地区</td>
				<td>养殖户</td>
				<td>胴体重</td>
				<td>残鸡重</td>
				<td>胴体只数</td>
				<td>残鸡只数</td>
				<td>臭鸡只数</td>
				<td>出成率</td>
				<td>单价</td>
				<td>金额</td>
				<td>业务员</td>
				<td>经销商</td>
			</tr>
<?php
if($list)
	foreach ($list as $val){?>
			<tr>
				<td><?php
			 	 if($val->yunfei){
			 	 	foreach (unserialize($val->yunfei) as $k=>$v){
			 	 		if($k){
			 	 		    echo '<div class="car">'.$k."(<span class='yunfei'>".$v."</span>)</div>";
                        }
			 	 	}
			 	 }
			 	?></td>
				<td><?php echo $val->diqu;?></td>
				<td><?php echo $val->yangzhihu;?></td>
				<td><?php echo $val->dongti;?></td>
				<td><?php echo $val->canji;?></td>
				<td><?php echo $val->dongtino;?></td>
				<td><?php echo $val->canjino;?></td>
				<td><?php echo $val->choujino;?></td>
				<td><?php echo $val->chucheng;?></td>
				<td><?php echo $val->danjia;?></td>
				<td><?php echo $val->jine;?></td>
				<td><?php
			 foreach ( unserialize($val->yewuyuan) as $v){
			 	if($v) echo $v;
			 }

			 ?></td>
				<td><?php echo $val->jingxiaoshang;?></td>
			</tr>
<?php }else echo '<tr><td colspan="13">暂无数据</td></tr>'?>
        </tbody>
		</table>
        <table class="list_table">
            <tbody>
                <tr>
               	    <td>总运费</td>
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
                if($report){
                ?>
               	    <td><?php echo $report->yunfei ?></td>
                    <td><?php echo $report->pingjunyunfei ?></td>
    				<td><?php echo $report->dongti ?></td>
    				<td><?php echo $report->canji ?></td>
                    <td><?php echo $report->canjibi ?></td>
    				<td><?php echo $report->dongtino ?></td>
    				<td><?php echo $report->canjino ?></td>
    				<td><?php echo $report->choujino ?></td>
    				<td><?php echo $report->chucheng ?></td>
    				<td><?php echo $report->pingjunjiage ?></td>
    				<td><?php echo $report->jine ?></td>
                <?php
                }else{

                    echo '<td colspan="11">该数据尚未生成，请生成后在操作!</td>'
                }
                ?>
            </tbody>
        </table>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>