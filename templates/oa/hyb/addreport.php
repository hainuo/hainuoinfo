<link rel="stylesheet" href="<?php echo base_url().'templates/oa/'?>images/oa.css" />
<div class="headbar">
	<div class="position">
		<span>添加新报表</span>
	</div>
</div>
<div class="content_box">
	<div class="content form_content addReport">
	<?php echo validation_errors(); ?>
	<?php if(isset($errormessage)) echo "<div class='error'>".$errormessage."</div>";?>
		<?php echo form_open('oa/hyb/addReport'); ?>
			<table class="addReport">
				<tr>
					<td class='text'>日期</td>
					<td><input type='text' id='date' name='date'
						value='<?php echo date('Y-m-d',time());?>'
						onFocus="WdatePicker({})" /></td>
					<td class='text'>养殖户</td>
					<td><input type='text' name="yangzhihu" id='yangzhihu' value='<?php echo set_value('yangzhihu'); ?>'></td>
					<td class='text'>地区</td>
					<td><input type="text" name="diqu" id="diqu" value="<?php echo set_value('diqu'); ?>"></td>
				</tr>
				<tr>
					<td class='text'>车号</td>
					<td class='text'><input type="text" id='carNo' name='carNo[]'
						value='<?php echo set_value('carNo[]'); ?>'></td>
					<td class='text'><input type="text" id='carNo' name='carNo[]'
						value='<?php echo set_value('carNo[]'); ?>'></td>
					<td class='text'><input type="text" id='carNo' name='carNo[]'
						value='<?php echo set_value('carNo[]'); ?>'></td>
					<td class='text'><input type="text" id='carNo' name='carNo[]'
						value='<?php echo set_value('carNo[]'); ?>'></td>
					<td class='text'><input type="text" id='carNo' name='carNo[]'
						value='<?php echo set_value('carNo[]'); ?>'></td>
				</tr>
				<tr>
					<td class='text'>运费</td>
					<td class='text'><input type="text" id='yunfei' name='yunfei[]'
						value='<?php echo set_value('yunfei[]'); ?>'></td>
					<td class='text'><input type="text" id='yunfei' name='yunfei[]'
						value='<?php echo set_value('yunfei[]'); ?>'></td>
					<td class='text'><input type="text" id='yunfei' name='yunfei[]'
						value='<?php echo set_value('yunfei[]'); ?>'></td>
					<td class='text'><input type="text" id='yunfei' name='yunfei[]'
						value='<?php echo set_value('yunfei[]'); ?>'></td>
					<td class='text'><input type="text" id='yunfei' name='yunfei[]'
						value='<?php echo set_value('yunfei[]'); ?>'></td>
				</tr>
				<tr>
					<td class='text'>胴体重</td>
					<td><input type="text" id='dongti' name='dongti' value='<?php echo set_value('dongti'); ?>'></td>
					<td class='text'>残鸡重</td>
					<td><input type="text" id='canji' name='canji' value='<?php echo set_value('canji'); ?>'></td>
					<td class='text'>净重</td>
					<td><input type="text" id='jingzhong' name='jingzhong' value='<?php echo set_value('jingzhong'); ?>'></td>
				</tr>
				<tr>
					<td class='text'>胴体只数</td>
					<td><input type="text" id='dongtiNo' name='dongtiNo' value='<?php echo set_value('dongtiNo'); ?>'></td>
					<td class='text'>残鸡只数</td>
					<td><input type="text" id='canjiNo' name='canjiNo' value='<?php echo set_value('canjiNo'); ?>'></td>
					<td class='text'>臭鸡只数</td>
					<td class='text'><input type="text" id='choujiNo' name='choujiNo'
						value='<?php echo set_value('choujiNo'); ?>'></td>
				</tr>
				<tr>

					<td class='text'>总只数</td>
					<td class='text'><input type="text" id='number' name='number'
						value='<?php echo set_value('number'); ?>' readonly></td>
				</tr>
				<tr>
					<td class='text'>均重</td>
					<td><input type="text" value='<?php echo set_value('junzhong'); ?>' name='junzhong' id='junzhong'
						readonly></td>
					<td class='text'>出成率</td>
					<td><input type="text" id='chucheng' name='chucheng' value='<?php echo set_value('chucheng'); ?>'
						readonly>%</td>
					<td class='text'>残鸡折算比率</td>
					<td><input type="text" id='canjizhesuan' name='canjizhesuan' readonly
						value='<?php echo set_value('canjizhesuan'); ?>'></td>
				</tr>
				<tr>
					<td class='text'>净重</td>
					<td><input type="text" name='jingzhong1' id='jingzhong1' value='<?php echo set_value('jingzhong'); ?>'
						readonly></td>
					<td class='text'>单价</td>
					<td><input type="text" id='danjia' name='danjia' value='<?php echo set_value('danjia'); ?>'>元/公斤</td>
					<td class='text'>金额</td>
					<td><input type="text" id='jine' name='jine' value='<?php echo set_value('jine'); ?>' readonly>元</td>
				</tr>
				<tr>
					<td class='text'>业务员</td>
					<td><input type="text" class='yewuyuan' name='yewuyuan[]' value='<?php echo set_value('yewuyuan[]'); ?>'></td>
					<td><input type="text" class='yewuyuan' name='yewuyuan[]' value='<?php echo set_value('yewuyuan[]'); ?>'></td>
					<td><input type="text" class='yewuyuan' name='yewuyuan[]' value='<?php echo set_value('yewuyuan[]'); ?>'></td>
					<td><input type="text" class='yewuyuan' name='yewuyuan[]' value='<?php echo set_value('yewuyuan[]'); ?>'></td>
					<td><input type="text" class='yewuyuan' name='yewuyuan[]' value='<?php echo set_value('yewuyuan[]'); ?>'></td>
				</tr>
				<tr>
					<td class='text'>经销商</td>
					<td><input type="text" id='jingxiaoshang' name='jingxiaoshang'
						value='<?php echo set_value('jingxiaoshang'); ?>'></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan='2'>备注扣钱数量原因<br>或者其他信息。
					</td>
					<td colspan='4'><textarea cols="60" rows="4" id="beizhu" name='beizhu'><?php echo set_value('beizhu'); ?></textarea></td>
				</tr>
				<tr class="ccc">
					<td colspan='6'><input type="submit" value="提交"> <input
						type="reset" value="重置"></td>
				</tr>
			</table>
			<script language='javascript' src="<?php echo base_url()."/templates/oa/js/hyb.js"?>"></script>
		</form>
	</div>
</div>
<script type="text/javascript"
	src="<?php echo base_url().'admincp/default/js/datepicker'?>/WdatePicker.js"></script>