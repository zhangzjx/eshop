<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的信息</title>
    <link rel="stylesheet" href="css/topFoot.css">
    <link rel="stylesheet" href="css/myInf.css">
    <script type="text/javascript" src="js/order.js"></script>
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
    <style type="text/css" >
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
                    <li class="content-left-list"><a  href="coupon.jsp">优惠券</a></li>
                    <li class="content-left-list"><a  href="bonus.jsp">红包</a></li>
                    <li class="content-left-list"><a onclick="orderEvaluate()" href="">礼品卡</a></li>
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">账户设置</div>
                    <li class="content-left-list"><a href="centerOrder.jsp">个人信息</a></li>
                    <li class="content-left-list"><a href="centerSettingAddress.jsp">地址管理</a></li>
            </div>
        </div>
        <!--右侧主内容-->
        <div class="content-right">
            <!--右侧顶部-->
            <div class="right-top">
                <div class="right-top-left">
                    <div style="width: 220px;height: 130px;padding-top: 30px">
                        <img src="img/头像.png" alt="头像" style="width: 70px;height: 70px;">
                        <br>
                        <span style=" font-size: 11pt; ">name</span>
                    </div>
                    <div style="width: 220px;height: 60px;text-align: left; ">
                        <div style="width:120px;height:50px;font-size: 8pt;margin:5px 5px 0;float: left">
                            <span style="font-size: 10pt;">开通PLUS会员尊享</span>
                            <span>全年360元运费券礼包</span>
                        </div>
                        <div style="width:80px;height:50px;line-height:50px;font-size: 12pt;margin:5px 5px 0;float: left">
                            <a href="">立即开通</a>
                        </div>
                    </div>
                </div>
                <div class="right-top-right">
                    <div class="top-right-header">
                        我的钱包
                    </div>
                    <div class="top-right-main">
                        <br>
                        <a href="coupon.jsp"><strong style="font-size: 15pt;">5</strong></a><br>
                        <span>优惠券</span><br><br>
                        <a href="">领券</a>
                    </div>
                    <div class="top-right-main">
                        <br>
                        <a href=""><strong style="font-size: 15pt;">654</strong></a><br>
                        <span>积分</span><br><br>
                        <a href="">兑换礼品</a>
                    </div>
                    <div class="top-right-main">
                        <br>
                        <a href=""><strong style="font-size: 15pt;">0.00</strong></a><br>
                        <span>余额</span><br><br>
                        <a href="">充值</a>
                    </div>
                    <div class="top-right-main">
                        <br>
                        <a href=""><strong style="font-size: 15pt;">0.00</strong></a><br>
                        <span>礼品卡余额</span><br><br>
                        <a href="">充值</a>
                    </div>

                </div>
            </div>
            <!--右侧中部-->
            <div class="right-central-left">
                <div class="central-left-header">
                    我的订单
                </div>
                <div class="central-left-change">
                    <div class="change-item" onclick="orderPay()">
                        <img src="img/待付款.png" class="item-img" title="待付款">
                        待付款
                    </div>
                    <div class="change-item" onclick="orderReceive()">
                        <img src="img/待收货.png" class="item-img" title="待收货">
                        待收货
                    </div>
                    <div class="change-item" onclick="orderEvaluate()">
                        <img src="img/待评价.png" class="item-img" title="待评价">
                        待评价
                    </div>
                    <div class="change-item">
                        <img src="img/退货售后.png" class="item-img" title="退换/售后">
                        退换/售后
                    </div>
                    <div class="change-item" onclick="myOrder()">
                        <img src="img/更多.png" class="item-img" title="全部订单">
                        全部订单
                    </div>
                </div>
                <div class="central-left-main">
                    <img src="ip.jpg" style="width: 70px;height: 70px;float: left;">
                    <div style="width: 300px;height: 70px;float: left;">物流信息</div>
                    <div style="width: 70px;height: 70px;float: left;margin-left:200px;">
                        <a href="">查看详情</a>
                    </div>
                </div>
                <div class="central-left-main">
                    <img src="ip.jpg" style="width: 70px;height: 70px;float: left;">
                    <div style="width: 300px;height: 70px;float: left;">物流信息</div>
                    <div style="width: 70px;height: 70px;float: left;margin-left:200px;">
                        <a href="">查看详情</a>
                    </div>
                </div>
                <div class="central-left-main">
                    <img src="ip.jpg" style="width: 70px;height: 70px;float: left;">
                    <div style="width: 300px;height: 70px;float: left;">物流信息</div>
                    <div style="width: 70px;height: 70px;float: left;margin-left:200px;">
                        <a href="">查看详情</a>
                    </div>
                </div>
            </div>
            <!--右部-->
            <div class="right-central-right">
                <!--我的关注-->
                <div class="myConcern">
                    <div class="central-right-header">
                        我的关注
                    </div>
                    <div class="central-right-main">
                        <br>
                        <a href=""><span style="font-size: 15pt;">5</span><br><br>
                            商品关注</a>
                    </div>
                    <div class="central-right-main">
                        <br>
                        <a href=""><span style="font-size: 15pt;">0</span><br><br>
                            店铺关注</a>
                    </div>
                    <div class="central-right-main">
                        <br>
                        <a href=""><span style="font-size: 15pt;">1</span><br><br>
                            收藏内容</a>
                    </div>
                </div>
                <!--浏览记录-->
                <div class="myConcern" style="margin-top: 20px">
                    <div class="central-right-header">
                        浏览记录
                    </div>
                    <div class="myBrowse">
                        轮播图
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
</html>
