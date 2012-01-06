<script src="js/xheditor/xheditor-zh-cn.min.js" type="text/javascript"></script>
<div class="headbar">
    <div class="position"><span>系统</span><span>></span><span>系统设置</span><span>></span><span>后台设置</span></div>
</div>
<div class="content_box">
    <div class="content form_content">
        <form action="<?php echo backend_url('setting/oa'); ?>"  method="post">
            <!--基本设置!-->
            <table class="form_table dili_tabs" id="site_basic" >
                <col width="150px" />
                <col />
                <tr>
                    <th> 后台主题：</th>
                    <td><input type='text' name="oa_theme" class='normal' value="<?php echo $oa->oa_theme; ?>" disabled="disabled" autocomplete="off" /><label>暂不开放</label></td>
                </tr>
                <tr>
                    <th> 后台语言：</th>
                    <td><input type='text' class='normal' name="oa_lang"  value="<?php echo $oa->oa_lang; ?>" disabled="disabled" autocomplete="off" /><label>暂不开放</label></td>
                </tr>
                <tr>
                    <th> 后台入口：</th>
                    <td><input type='text' class='normal' name="oa_access_point" value="<?php echo $oa->oa_access_point; ?>" autocomplete="off" /><label>若改变，请务必相应的地方如文件夹名称等.</label></td>
                </tr>
                <tr>
                    <th> 后台网页标题：</th>
                    <td><input type='text' class='normal' name="oa_title" value="<?php echo $oa->oa_title; ?>" autocomplete="off" /><label>用于显示网页标题</label></td>
                </tr>
                <tr>
                    <th> 后台LOGO：</th>
                    <td><input type='text' class='normal' name="oa_logo" value="<?php echo $oa->oa_logo; ?>" autocomplete="off" /><label>左上角LOGO自定义路径</label></td>
                </tr>
                <tr>
                    <th> 是否允许root用户登录：</th>
                    <td>
                        <input type="radio" name="oa_root_access" <?php echo $oa->oa_root_access ? 'checked="checked"' : ''; ?> value="1" >开启
                        <input type="radio" name="oa_root_access" value="0" <?php echo!$oa->oa_root_access ? 'checked="checked"' : ''; ?> >关闭
                    </td>
                </tr>
                <tr>
                    <th> 其他设置：</th>
                    <td>
                        <input type='text' class='normal' name="oa_canjizhesuanlv" value="<?php echo $oa->oa_canjizhesuanlv; ?>" autocomplete="off" /><label>用于胴体出成率计算时默认的残鸡折算比率</label>
                    </td>
                </tr>                
                <tr>
                    <th></th>
                    <td>
                        <button class="submit" type='submit'><span>保存后台设置</span></button>
                    </td>
                </tr>
            </table>
        </form>

    </div>
</div>