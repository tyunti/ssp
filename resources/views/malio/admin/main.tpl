<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
    <meta name="theme-color" content="#4285f4">
    <title>{$config["appName"]}</title>


    <!-- css -->
    <link href="/theme/material/css/base.min.css" rel="stylesheet">
    <link href="/theme/material/css/project.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/material-design-lite@1.1.0/dist/material.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/DataTables/DataTables@1.10.19/media/css/dataTables.material.min.css"
          rel="stylesheet">

    <!-- js -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.2.1"></script>
    <!-- favicon -->
    <!-- ... -->
    <style>
        body {
            position: relative;
        }

        .table-responsive {
            background: white;
        }

        .dropdown-menu.dropdown-menu-right a {
            color: #212121;
        }

        a[href='#ui_menu'] {
            color: #212121;
        }
    </style>
</head>

<body class="page-brand">
<header class="header header-red header-transparent header-waterfall ui-header">
    <ul class="nav nav-list pull-left">
        <div>
            <a data-toggle="menu" href="#ui_menu">
                <span class="icon icon-lg">menu</span>
            </a>
        </div>
    </ul>

    <ul class="nav nav-list pull-right">
        <div class="dropdown margin-right">
            <a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown">
                {if $user->isLogin}
                <span class="access-hide">{$user->user_name}</span>
                <span class="avatar avatar-sm"><img src="{$user->gravatar}"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li>
                    <a class="waves-attach" href="/user/"><span class="icon icon-lg margin-right">account_box</span>用户中心</a>
                </li>
                <li>
                    <a class="waves-attach" href="/user/logout"><span
                                class="icon icon-lg margin-right">exit_to_app</span>登出</a>
                </li>
            </ul>
            {else}
            <span class="access-hide">未登录</span>
            <span class="avatar avatar-sm"><img src="/theme/material/images/users/avatar-001.jpg"></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li>
                    <a class="waves-attach" href="/auth/login"><span
                                class="icon icon-lg margin-right">account_box</span>登录</a>
                </li>
                <li>
                    <a class="waves-attach" href="/auth/register"><span
                                class="icon icon-lg margin-right">pregnant_woman</span>注册</a>
                </li>
            </ul>
            {/if}

        </div>
    </ul>
</header>
<nav aria-hidden="true" class="menu menu-left nav-drawer nav-drawer-md" id="ui_menu" tabindex="-1">
    <div class="menu-scroll">
        <div class="menu-content">
            <a class="menu-logo" href="/"><i class="icon icon-lg">person_pin</i>&nbsp;
                {if $user->id==1}管理员面板{else}代理面板{/if} #{$user->id}</a>

            <ul class="nav">
                <li>
                    {if in_array($user->id,$config['developer'])}
                        <a class="waves-attach" data-toggle="collapse">#{$user->id} {$user->email}</a>
                    {/if}
                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_me">我的</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_me">
                        {if $user->id==1}
                        <li><a href="/admin"><i class="icon icon-lg">business_center</i>&nbsp;系统概览</a></li>
                        {/if}
                        <li><a href="/admin/config"><i class="icon icon-lg">face</i>&nbsp;站点设置</a></li>
                        {if $user->id!=1}
                        <li><a href="/admin/user"><i class="icon icon-lg">supervisor_account</i>&nbsp;用户列表</a></li>
                            <li><a href="/admin/help"><i class="icon icon-lg">help</i>&nbsp;帮助中心</a></li>
                        {/if}
                        {if $user->id==1}
                        <li><a href="/admin/announcement"><i class="icon icon-lg">announcement</i>&nbsp;公告管理</a></li>
                        <li><a href="/admin/ticket"><i class="icon icon-lg">question_answer</i>&nbsp;工单管理</a></li>
                        <li><a href="/admin/auto"><i class="icon icon-lg">flash_auto</i>&nbsp;下发命令</a></li>
                        {/if}
                    </ul>

                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_agent">代理</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_agent">
                        <li><a href="/admin/agent/lists"><i class="icon icon-lg">list</i>&nbsp;代理列表</a></li>
                        <li><a href="/admin/agent/type"><i class="icon icon-lg">bluetooth_disabled</i>&nbsp;等级管理</a></li>
                        {if $user->id!=1}
                            <li><a href="/admin/shop"><i class="icon icon-lg">shop</i>&nbsp;套餐定价</a></li>
                        {/if}
                            <li><a href="/admin/km"><i class="icon icon-lg">credit_card</i>&nbsp;生成卡密</a></li>

                    </ul>

                        <a class="waves-attach" data-toggle="collapse" href="#ui_menu_money">金钱</a>
                        <ul class="menu-collapse collapse in" id="ui_menu_agent">
                            <li><a href="/admin/agent/income"><i class="icon icon-lg">attach_money</i>&nbsp;收益记录</a></li>
                            <li><a href="/admin/agent/cash"><i class="icon icon-lg">attachment</i>&nbsp;余额提现</a></li>
                            <li><a href="/admin/detailed"><i class="icon icon-lg">blur_circular</i>&nbsp;余额明细</a></li>

                            {if $user->id==1}
                            <li><a href="/admin/agent/cash_log"><i class="icon icon-lg">settings_remote</i>&nbsp;提现管理</a></li>
                            {/if}
                        </ul>



                    {if $user->id==1}
                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_node">节点</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_node">
                        <li><a href="/admin/node"><i class="icon icon-lg">router</i>&nbsp;节点列表</a></li>
                        <li><a href="/admin/trafficlog"><i class="icon icon-lg">traffic</i>&nbsp;流量记录</a></li>
                        <li><a href="/admin/block"><i class="icon icon-lg">dialer_sip</i>&nbsp;已封禁IP</a></li>
                        <li><a href="/admin/unblock"><i class="icon icon-lg">dialer_sip</i>&nbsp;已解封IP</a></li>
                    </ul>
                    {/if}

                    {if $user->id==1}
                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_user">用户</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_user">
                        <li><a href="/admin/user"><i class="icon icon-lg">supervisor_account</i>&nbsp;用户列表</a></li>
                        <li><a href="/admin/relay"><i class="icon icon-lg">compare_arrows</i>&nbsp;中转规则</a></li>
                        <li><a href="/admin/invite"><i class="icon icon-lg">loyalty</i>&nbsp;邀请与返利</a></li>
                        <li><a href="/admin/login"><i class="icon icon-lg">text_fields</i>&nbsp;登录记录</a></li>
                        <li><a href="/admin/alive"><i class="icon icon-lg">important_devices</i>&nbsp;在线IP</a></li>
                    </ul>
                    {/if}

                    {if $user->id==1}
                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_detect">审计</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_detect">
                        <li><a href="/admin/detect"><i class="icon icon-lg">account_balance</i>&nbsp;审计规则</a></li>
                        <li><a href="/admin/detect/log"><i class="icon icon-lg">assignment_late</i>&nbsp;审计记录</a></li>
                        <li><a href="/admin/help"><i class="icon icon-lg">help</i>&nbsp;帮助中心</a></li>
                    </ul>
                    {/if}

                    {if $user->id==1}
                    <a class="waves-attach" data-toggle="collapse" href="#ui_menu_trade">交易</a>
                    <ul class="menu-collapse collapse in" id="ui_menu_trade">
                        <li><a href="/admin/code">
                                <i class="icon icon-lg">code</i>
                                &nbsp;{if $config['enable_donate']=='true'}充值与捐赠记录{else}充值记录{/if}</a>
                        </li>
                        <li><a href="/admin/shop"><i class="icon icon-lg">shop</i>&nbsp;商品</a></li>
                        <li><a href="/admin/coupon"><i class="icon icon-lg">card_giftcard</i>&nbsp;优惠码</a></li>
                        <li><a href="/admin/bought"><i class="icon icon-lg">shopping_cart</i>&nbsp;购买记录</a></li>
                        {if $config['payment_system']=='chenAlipay'}
                            <li><a href="/admin/editConfig"><i class="icon icon-lg">shopping_cart</i>&nbsp;支付设置</a></li>
                        {/if}
                    </ul>
                {/if}



                <li><a href="/user"><i class="icon icon-lg">person</i>&nbsp;用户中心</a></li>
            </ul>
        </div>
    </div>
</nav>
