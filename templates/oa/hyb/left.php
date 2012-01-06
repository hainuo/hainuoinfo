<li><span>货源部首页</span>
    <ul name="menu">
        <li class=""><a href="<?php echo oa_url('hyb') ?>">货源部首页</a></li>
        <li            class="<?php if ($this->uri->rsegment(2) == 'addReport')
    echo 'selected'; ?>"><a
                href="<?php echo oa_url('hyb/addReport') ?>">填写报表</a></li>
        <li
            class="<?php if ($this->uri->rsegment(2) == 'dailyReport')
                           echo 'selected'; ?>"><a
                href="<?php echo oa_url('hyb/showDetailReport') ?>">日明细表</a></li>
        <li
            class="<?php if ($this->uri->rsegment(2) == 'dailyReport')
                echo 'selected'; ?>"><a
                href="<?php echo oa_url('hyb/showDailyReport') ?>">日报表</a></li>
        <li
            class="<?php if ($this->uri->rsegment(2) == 'monthReport')
                echo 'selected'; ?>"><a
                href="<?php echo oa_url('hyb/showMonthReport') ?>">月报表</a></li>
        <li
            class="<?php if ($this->uri->rsegment(2) == 'creatReport')
                echo 'selected'; ?>"><a
                href="<?php echo oa_url('hyb/creatReport') ?>">生成报表</a></li>
    </ul>
</li>