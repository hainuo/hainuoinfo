<link rel="stylesheet" href="<?php echo base_url() . 'templates/oa/' ?>images/oa.css" />
<script language="javascript" src="<?php echo base_url() . "/templates/oa/js/transport.js" ?>"></script>
<script language="javascript" src="<?php echo base_url() . "/templates/oa/js/utils.js" ?>"></script>
<script language="javascript" src="<?php echo base_url() . "/templates/oa/js/listtable.js" ?>"></script>
<!-- 以上三条会跟jquery冲突  所以会造成在填写报表时jquery代码不执行的错误 为避免放置于此处 -->
<!-- TODO 将上面三个js删掉重新编写代码使用jquery方式提交数据 -->
<link rel="stylesheet" href="<?php echo base_url() . 'templates/oa/' ?>images/oa.css" />
<div class="headbar">
    <div class="position">
        <span><?php echo date('Y年m月d日', strtotime($date)); ?> 毛鸡收购日报表</span>
    </div>
</div>
<div class="content_box">
    <div class="content form_content" style="overflow:auto;">
        <?php echo validation_errors(); ?>
        <?php echo form_open('oa/hyb/showDetailReport'); ?>
        <table>
            <tr>
                <th>选择日期</th>
                <td><input type="text" name="date" id="date"
                           value="<?php echo date('Y-m-d', strtotime('-1 day')) ?>"
                           onFocus="WdatePicker({skin:'whyGreen',maxDate:'<?php echo date('Y-m-d') ?>'})"></td>
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
                if ($list)
                    foreach ($list as $val) {
                        ?>
                        <tr>
                            <td><?php
                if ($val->yunfei) {
                    foreach (unserialize($val->yunfei) as $k => $v) {
                        if ($k) {
                            echo '<div class="car">' . $k . "(<span class='yunfei'>" . $v . "</span>)</div>";
                        }
                    }
                }
                        ?></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_diqu', <?php echo $val->id; ?>)"><?php echo $val->diqu; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_yangzhihu', <?php echo $val->id; ?>)"><?php echo $val->yangzhihu; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_dongti', <?php echo $val->id; ?>)"><?php echo $val->dongti; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_canji', <?php echo $val->id; ?>)"><?php echo $val->canji; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_dongtino', <?php echo $val->id; ?>)"><?php echo $val->dongtino; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_canjino', <?php echo $val->id; ?>)"><?php echo $val->canjino; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_choujino', <?php echo $val->id; ?>)"><?php echo $val->choujino; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_chucheng', <?php echo $val->id; ?>)"><?php echo $val->chucheng; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_danjia', <?php echo $val->id; ?>)"><?php echo $val->danjia; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_jine', <?php echo $val->id; ?>)"><?php echo $val->jine; ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_yewuyuan', <?php echo $val->id; ?>)"  title="业务员名之间必须使用英文格式下的','间隔否则自动生成奖罚的时候会出现错误判断" ><?php
                        $yewuyuan = unserialize($val->yewuyuan);
                        $yewuyuan = implode(',', $yewuyuan);
                        echo trim($yewuyuan);
                        ?></span></td>
                            <td><span onclick="javascript:listTable.edit(this, 'edit_jingxiaoshang', <?php echo $val->id; ?>)"><?php echo $val->jingxiaoshang; ?></span></td>
                        </tr>
                    <?php }else
                    echo '<tr><td colspan="13">暂无数据</td></tr>' ?>
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
                <?php if ($report) { ?>
                    <tr class="red">
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
                    </tr>
                    <?php
                } else {
                    echo '<tr><td colspan="11">该数据尚未生成，请生成后在操作!</td></tr>';
                }
                ?>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="<?php echo base_url() . 'admincp/default/js/datepicker' ?>/WdatePicker.js"></script>
<script type="text/javascript">
    var process_request='数据正在处理中...';
</script>