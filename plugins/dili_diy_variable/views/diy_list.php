<script type="text/javascript" src="<?php echo base_url().'plugins/dili_diy_variable/js/lhgdialog.min.js';?>"></script>
<div class="headbar">
	<div class="position"><span>自定义变量</span><span>></span><span>变量列表</span></div>
</div>
<div class="content">
	<table border='1' width='99%' cellspacing="0" cellpadding="5" class="border_table_org">
	<tr><td>
	<form action='<?php echo $this->_url('arr_add'); ?>' method='post' >
	<label>备注: <input type='text' size='12' name='arr_name'  />&nbsp; (* 功能介绍)</label>
	<label>变量名: <input type='text' size='12' name='arr_k' />&nbsp; (* 英文下划线)</label><label>变量值: <input type='text' size='12' name='arr_v' /> (* 根据情况)</label><label> 类型: <input type='radio' name='arr_type' value='text' checked='checked' />文本框 <input type='radio' name='arr_type' value='textarea' />文本区</label> <button class="submit" type='submit'><span>添加</span></button>
	</form>
	</td></tr>
	</table>

	<table class="list_table">
	<thead>
<tr><th>调用编号</th><th>作用备注</th><th>变量名称</th><th>变量的值</th><th>发布者</th><th>操作</th></tr></thead>

	<?php
		foreach($arrs['arr'] as $key=>$v)
		{ 
			
			echo "<tr><td>".$key."</td><td>".$v['arr_name']."</td><td>".$v['arr_k']."</td><td>";
			if($v['arr_type']=='text')
			{
				$arr_eidit_v="arr_eidit_v".$v['id'];
				echo $typetext=$this->arr_input($arr_eidit_v,$v['arr_v']);
			}else{
				$arr_eidit_v="arr_eidit_v".$v['id'];
				echo $typetext=$this->arr_textarea($arr_eidit_v,$v['arr_v']);
			}
			echo "</td><td>".$v['arr_user']."</td><td><input id='diy_".$v['id']."' type='hidden' value='".$v['id']."' /> <a href='".$this->_url('delete_diy_arr','&diyid='.$v['id'])."'><button class='submit' type='submit'><span>删除</span></button></a><button class='submit' type='submit' onclick=showlog(document.getElementById('diy_".$v['id']."').value);><span>修改</span></button></td></tr>";
		}
	?>
	<tr>
    <td colspan="6">获取自定义变量方法: get_arr_text([调用ID]) 例如: get_arr_text(4) //输出 <?php echo $arrs['v'] ?> <a onclick=showlog(document.getElementById('diy_20').value)>修改</a></td>
  </tr>
</table>
</div>
<script type="text/javascript">
	function showlog(id)
	{
		var baseURL='<?php echo $this->_url('edit_diy');?>';
		var pageid=baseURL+"&pageid="+id;
		var dg = new $.dialog({ id:id,title:'信息提示',onCancel:function(){},cancelBtnTxt:'确定', page:pageid});
		dg.ShowDialog();
	}
</script>