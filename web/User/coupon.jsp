
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>优惠券</title>
    <link rel="stylesheet" href="css/topFoot.css">
    <link rel="stylesheet" href="css/myInf.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="application/javascript">
        $(document).ready(function(){
            // 页面加载后任何需要执行的js特效
            let name = $("#name").val();
            if(name != null&&name != ""){
                $("#logout").show()
            }else {
                $("#lg").show();
            }
        });
    </script>
    <style type="text/css">
        /****红包*****/
        .other-right{
            width: 960px;
            height: 700px;
            margin-left: 35px;
            font-size: 10pt;
            border:  #d4d4d4 solid 1px;
            float: left;
        }
        .tab-pane{
            display:none;
        }
        .active{
            display:block;
        }
        .other-right-top{
            width: 930px;
            height: 50px;
            line-height: 50px;

            padding-left: 30px;
        }
        .other-right-top-1{
            width: 960px;
            height: 50px;
            line-height: 50px;
        }
        .other-left{
            width: 200px;
            height: 50px;
            float: left;
            text-align: center;
            border: rgba(222,209,165,0.45);;
        }
        .change-border{
            border: #7cc816 solid 1px;
        }
        .bonus-main{
            width: 960px;
            height: 400px;
            margin-top: 2px;
        }
        .bonus-item{
            width: 200px;
            height: 60px;
            line-height: 60px;
            text-align: center;
            float: left;
        }
    </style>
</head>
<body>
<input type="hidden" id="name" value="${name }">
<input type="hidden" id="uid" value="${user.uid }">
<!-- 头部栏位 -->
<!--页面顶部-->
<div class="all-header">
    <!--顶部导航-->
    <div style="width: 100%; background-color: #EEE5DE;">
        <div class="top">
            <div class="top-left">
                <ul class="ul-left">
                    <li >青橙欢迎您！</li>
                    <li>
                        <span id = "lg" style="display:none;">请<a href="loginUser.html">登录</a>&nbsp;<a href="register.jsp">注册</a></span>
                        <span id = "logout" style="display:none;"><a href="logout.jsp">退出</a></span>
                    </li>
                </ul>
            </div>
            <div class="top-right">
                <ul class="ul-right">
                    <li ><span><a href="#" onclick="myOrder()">我的订单</a></span></li>
                    <li><span><a href="#"  onclick="myCart()">我的购物车</a></span></li>
                    <li><span><a href="myInf.jsp"  >个人信息</a></span></li>
                    <li><span>企业采购</span></li>
                    <li><span><a href="cooperation.html" target="_blank">合作招商</a></span></li>
                    <li ><span><a href="shoplogin.html" target="_blank">商家后台</a></span></li>
                    <li><span>网站导航</span></li>
                </ul>
            </div>
        </div>
    </div>
    <!--头部-->
    <div class="head">
        <a class="logo" title="青橙" href="index.jsp"></a>
        <div class="search">
            <form action="" class="">
                <!--searchAutoComplete-->
                <div class="input-bor">
                    <input type="text" id="autocomplete" class="el-input" />
                    <button class="el-button" type="button">搜索</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--主要内容-->
<div class="main">
    <!--第一部分-->
    <div class="content-main">
        <!--左侧主内容-->
        <div class="content-left">

            <div class="content-left-main">
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">订单中心</div>
                <li class="content-left-list"><a href="#" onclick="myOrder()">我的订单</a></li>
                <li class="content-left-list"><a onclick="orderEvaluate()" href="">待评价</a></li>
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">我的钱包</div>
                <li class="content-left-list"><a href="coupon.jsp">优惠券</a></li>
                <li class="content-left-list"><a href="bonus.jsp">红包</a></li>
                <li class="content-left-list"><a onclick="orderEvaluate()" href="">礼品卡</a></li>
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">账户设置</div>
                <li class="content-left-list"><a href="centerOrder.jsp">个人信息</a></li>
                <li class="content-left-list"><a href="centerSettingAddress.jsp">地址管理</a></li>
            </div>
        </div>
        <!--右侧主内容-->
        <div class="other-right">
            <!--右侧顶部-->
            <div class="other-right-top">
                <span>优惠券</span>
            </div>
            <div class="other-right-top-1" style="background-color: rgba(222,209,165,0.45);">
                <div id="other-left" class="other-left">
                    <a href="#">可用优惠券</a>
                </div>
                <div  id="other-right" class="other-left">
                    <a href="#" >已用/过期优惠券</a>
                </div>
            </div>
            <div class="bonus-main">
                <div id="left" class="tab-pane active">
                    <div class="bonus-left ">
                       <div class="bonus-item" style="width: 354px">来源
                       </div>
                        <div class="bonus-item">剩余金额
                        </div>
                        <div class="bonus-item">有效期
                        </div>
                        <div class="bonus-item">使用状态
                        </div>
                        <div class="bonus-item" style="width: 354px;line-height: 30px">
                            蓝胖子赠与<br>
                            红包初始面额：¥50.00元
                        </div>
                        <div class="bonus-item">还剩0.00元 </div>
                            <div class="bonus-item">有效期 2015.12.26-2016.2.1</div>
                            <div class="bonus-item">已用完</div>
                    </div>

                </div>
                <div id="right" class="tab-pane">
                    <div class="bonus-left ">
                        <div class="bonus-item" style="width: 354px">来源
                        </div>
                        <div class="bonus-item">剩余金额
                        </div>
                        <div class="bonus-item">有效期
                        </div>
                        <div class="bonus-item">使用状态
                        </div>
                        <div class="bonus-item" style="width: 354px;line-height: 30px">
                            蓝胖子赠与<br>
                            红包初始面额：¥50.00元
                        </div>
                        <div class="bonus-item">还剩0.00元 </div>
                        <div class="bonus-item">有效期 2015.12.26-2016.2.1</div>
                        <div class="bonus-item">已过期</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--底部内容-->
<div class="bottom-foot">
    <div class="bottom">
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">购物指南</div><br>
            <div class="bottom-main-list">购物流程</div>
            <div class="bottom-main-list">会员介绍</div>
            <div class="bottom-main-list">生活旅行/团购</div>
            <div class="bottom-main-list">常见问题</div>
            <div class="bottom-main-list">购物指南</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">配送方式</div><br>
            <div class="bottom-main-list">上门自提</div>
            <div class="bottom-main-list">211限时达</div>
            <div class="bottom-main-list">配送服务查询</div>
            <div class="bottom-main-list">配送费收取标准</div>
            <div class="bottom-main-list">海外配送</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">支付方式</div><br>
            <div class="bottom-main-list">货到付款</div>
            <div class="bottom-main-list">在线支付</div>
            <div class="bottom-main-list">分期付款</div>
            <div class="bottom-main-list">邮局汇款</div>
            <div class="bottom-main-list">公司转账</div>

        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">售后服务</div><br>
            <div class="bottom-main-list">售后政策</div>
            <div class="bottom-main-list">价格保护</div>
            <div class="bottom-main-list">退款说明</div>
            <div class="bottom-main-list">返修/退换货</div>
            <div class="bottom-main-list">取消订单</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">特色服务</div><br>
            <div class="bottom-main-list">夺宝岛</div>
            <div class="bottom-main-list">DIY装机</div>
            <div class="bottom-main-list">延保服务</div>
            <div class="bottom-main-list">品优购E卡</div>
            <div class="bottom-main-list">品优购通信</div>
        </div>
    </div>
    <div class="foot">
        <ul>
            <li>关于我们</li>
            <li>联系我们</li>
            <li>联系客服</li>
            <li>商家入驻</li>
            <li>营销中心</li>
            <li>手机品优购</li>
            <li>销售联盟</li>
            <li>品优购社区</li>
        </ul>
        <div >地址：北京市昌平区 邮编：100096 电话：400-400-4000 传真：010-82935100</div>
        <div >京ICP备08001421号京公网安备110108007702
        </div>
    </div>
</div>
</body>
<script>
    $("#other-left").click(function () {
        document.getElementById('right').className = "tab-pane";
        document.getElementById('left').className = "tab-pane active";
        $(this).addClass('change-border')
        $("#other-right").removeClass('change-border');
    });
    $("#other-right").click(function () {
        $(this).addClass('change-border')
        $("#other-left").removeClass('change-border');
        document.getElementById('left').className = "tab-pane";
        document.getElementById('right').className = "tab-pane active";

    });
</script>
</html>
