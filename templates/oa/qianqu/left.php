<li><span>前区首页</span>
    <ul name="menu">
        <li class=""><a href="<?php echo oa_url('hyb') ?>">前区首页</a></li>
        <li class="<?php if ($this->uri->rsegment(2) == 'addDongti')
    echo 'selected'; ?>"> <a  href="<?php echo oa_url('qianqu/addDongti') ?>">填写胴体明细表</a>
        </li>
        <li class="<?php if ($this->uri->rsegment(2) == 'listDongti')
    echo 'selected'; ?>"> <a  href="<?php echo oa_url('qianqu/listDongti') ?>">胴体明细表</a>
        </li>
    </ul>
</li>