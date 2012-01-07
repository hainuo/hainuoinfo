<link rel="stylesheet" href="<?php echo base_url() . 'templates/oa/' ?>images/oa.css" />
<div class="headbar">
    <div class="position">
        <span>添加胴体报表</span>
    </div>
</div>
<div class="content_box">
    <div class="content form_content addReport">
        <?php echo validation_errors(); ?>
        <?php if (isset($errormessage))
            echo "<div class='error'>" . $errormessage . "</div>"; ?>
        <?php echo form_open('oa/qianqu/addDongti'); ?>
        <table class="addDongti">
            <tr>
                <td class='text'>日期</td>
                <td><input type='text' id='date' name='date'
                           value='<?php
                           echo set_value('dongtino', date('Y-m-d', time()));
                           ?>'
                           onFocus="WdatePicker({})" /></td>
                <td class="text">臭鸡数</td>
                <td><input type="text" id="choujiNo" value="<?php echo set_value('choujiNo');?>"></td>          
            </tr>
            <tr>
                <td class='text'>车次</td>
                <td><input type='text' name="checi" id='checi' value='<?php echo set_value('checi',1); ?>'></td>
                <td class='text'>车号</td>
                <td><input type='text' name="chehao" id='chehao' value='<?php echo set_value('chehao',0); ?>'></td>
            </tr>
            <tr>
                <td class='text'>胴体重</td>
                <td><input type='text' id='dongti' name='dongti'
                           value='<?php echo set_value('dongti',0)?>'></td>
                <td class='text'>胴体数</td>
                <td><input type='text' name="dongtiNo" id='dongtiNo' value='<?php echo set_value('dongtino',0); ?>'></td>
            </tr>
            <tr>
                <td class='text'>残鸡重</td>
                <td ><input type="text" id='canji' name='canji'  value='<?php echo set_value('canji',0); ?>'></td>
                <td class='text'>残鸡数</td>
                <td ><input type="text" id='canjiNo' name='canjiNo'  value='<?php echo set_value('canjino',0); ?>'></td>
            </tr>
            <tr>
                <td class="text">备注</td>
                <td colspan='3'><textarea cols="40" rows="4" id="beizhu" name='beizhu'><?php echo set_value('beizhu'); ?></textarea></td>
            </tr>
            <tr class="ccc">
                <td colspan='6'><input type="submit" value="提交"> <input type="reset" value="重置"></td>
            </tr>
        </table>
        <script language='javascript' src="<?php echo base_url() . "/templates/oa/js/hyb.js" ?>"></script>
        <?php  echo form_close(); ?>
    </div>
</div>
<script type="text/javascript"
src="<?php echo base_url() . 'admincp/default/js/datepicker' ?>/WdatePicker.js"></script>