<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/28
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>支付</title>
    <link rel="stylesheet" href="css/pay.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="index-header">
    <!--顶部导航-->
    <div style="width: 100%; background-color: #EEE5DE;">
        <div class="index-top">
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
                    <li ><span><a href="centerOrder.jsp" >我的订单</a></span></li>
                    <li><span><a href=""  target="_blank" onclick="myCart()">我的购物车</a></span></li>
                    <li><span><a href="home.html" target="_blank">我的青橙</a></span></li>
                    <li><span>青橙会员</span></li>
                    <li><span>企业采购</span></li>
                    <li><span>关注青橙</span></li>
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
<div style="width: 1200px;margin:0 auto;">
    <!--主内容-->
    <div class="pay">
        <div class="checkout-tit">
            <h4 class="tit-txt"><span class="success-icon"></span><span>订单提交成功，请您及时付款，以便尽快为您发货~~</span></h4>
            <div class="paymark">
                <span class="fl">请您在提交订单<em class="orange time">4小时</em>之内完成支付，超时订单会自动取消。订单号：<em>145687</em></span>
                <span class="fr"><em>应付金额：</em><em  class="orange money">￥17,654</em></span>
            </div>
        </div>

        <div class="check-info">
            <h4>重要说明：</h4>
            <ol>
                <li>品优购商城支付平台目前支持<span class="zfb">支付宝</span>支付方式。</li>
                <li>其它支付渠道正在调试中，敬请期待。</li>
                <li>为了保证您的购物支付流程顺利完成，请保存以下支付宝信息。</li>
            </ol>
        </div>

        <div class="checkout-steps">
            <!--收件人信息-->
            <h5>支付平台</h5>
            <div class="step-cont">
                <ul class="payType">
                    <li><img src="img/pay1.jpg"></li>
                    <li><img src="img/pay2.jpg"></li>
                    <li><img src="img/pay3.jpg"></li>
                    <li><img src="img/pay4.jpg"></li>
                </ul>
            </div>

            <div class="submit">
                <a class="sui-btn" href="paySuccess.jsp" target="_blank">立即支付</a>
            </div>

        </div>
    </div>
</div>
<!--底部内容-->
<div class="bottom-foot">
    <div class="order-bottom">
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
    <div class="order-foot">
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
