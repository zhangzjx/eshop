<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>系统首页</title>
    <link rel="stylesheet" href="css/manageHome.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

</head>
<body >
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">系统首页</span></div>
<!--主要内容-->
<div class="manage-main" >
    <div class="home-top">
        <div class="top_item">

            <img src="img/home-1.png" class="item-img">
            <span class="item-inf">今日订单总数</span><br><br>
            <strong class="item-num">200</strong>
        </div>
        <div class="top_item">
            <img src="img/home-2.png" class="item-img">
            <span class="item-inf">今日销售总额</span><br><br>
            <strong class="item-num">￥5000</strong>
        </div>
        <div class="top_item">
            <img src="img/home-3.png" class="item-img">
            <span class="item-inf">昨日销售总额</span><br><br>
            <strong class="item-num">￥5200</strong>
        </div>
        <div class="top_item">
            <img src="img/home-4.png" class="item-img">
            <span class="item-inf">近7天销售总额</span><br><br>
            <strong class="item-num">￥56400</strong>
        </div>
    </div>
    <!--待处理事务-->
    <div class="home-pending">
        <div class="pending-top">
            <span style="margin-left: 25px">待处理事务</span>
        </div>

        <li class="pending-item">
            <a href="<c:url value='/ProductServlet?action=orderStatus&status=1'/>">
                <span style="float: left">待付款订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="<c:url value='/ProductServlet?action=orderStatus&status=4'/>">
                <span style="float: left">已完成订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="#">
                <span style="float: left">待确认退货订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="<c:url value='/ProductServlet?action=orderStatus&status=2'/>">
                <span style="float: left">待发货订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="#">
                <span style="float: left">新缺货登记</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="#">
                <span style="float: left">待处理退款申请</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="<c:url value='/ProductServlet?action=orderStatus&status=3'/>">
                <span style="float: left">已发货订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="#">
                <span style="float: left">待处理退货订单</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
        <li class="pending-item">
            <a href="#">
                <span style="float: left">广告位即将到期</span>
                <span style="float: right">(10)</span>
            </a>
        </li>
    </div>
    <!--运营快捷入口-->
    <div class="home-operation">
        <div class="pending-top">
            <span style="margin-left: 25px">运营快捷入口</span>
        </div>
        <li class="operation-item">
            <a href="addGoodsLink.jsp">
                <img src="img/home-5.png" class="operation-img">
                <span>添加商品</span>
            </a>
        </li>
        <li class="operation-item">
            <a href="<c:url value='/ProductServlet?action=findAllOrder'/>">
                <img src="img/home-6.png" class="operation-img">
                <span>订单列表</span>
            </a>
        </li>
        <li class="operation-item">
            <img src="img/home-7.png" class="operation-img">
            <span>用户管理</span>
        </li>
        <li class="operation-item">
            <img src="img/home-8.png" class="operation-img">
            <span>交易统计</span>
        </li>
        <li class="operation-item">
            <img src="img/home-9.png" class="operation-img">
            <span>广告管理</span>
        </li>
        <li class="operation-item">
            <img src="img/home-10.png" class="operation-img">
            <span>短信营销</span>
        </li>
        <li class="operation-item">
            <img src="img/home-11.png" class="operation-img">
            <span>秒杀管理</span>
        </li>
    </div>
    <!--商品及用户总览-->
    <div class="home-overview">
        <div class="overview-goods">
            <div class="overview-top">
                <span style="margin-left: 25px">商品总览</span>
            </div>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >已上架</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >已下架</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >库存紧张</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >全部商品</span>
            </li>
        </div>
        <div class="overview-goods" style="margin-left: 16px">
            <div class="overview-top">
                <span style="margin-left: 25px">用户总览</span>
            </div>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >今日新增</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >昨日新增</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >本月新增</span>
            </li>
            <li class="overview-item">
                <span style="font-size: 13pt;">100</span><br>
                <span >会员总数</span>
            </li>
        </div>
    </div>
    <!--订单统计-->
    <div class="home-count">
        <div class="pending-top">
            <span style="margin-left: 25px">订单统计</span>
        </div>
        <div class="count-left">
            <span style="font-size: 8pt">本月订单总数</span> <br>
            <span style="font-size: 20pt">10000</span> <br>
            <br> <br>
            <span style="font-size: 8pt">本周订单数量</span>
            <span style="font-size: 20pt">1000</span> <br>
        </div>
        <div class="count-right">
            <div class="count-right-top">
                <span style="float: left;">近一周订单统计</span>
                <span style="margin-left: 600px;float: left;">今日</span>
                <span style="margin-left: 20px;float: left;">本周</span>
                <span style="margin-left: 20px;float: left;">本月</span>
            </div>
            <div class="count-right-main">图表</div>

        </div>
    </div>

</div>

</body>
<script>

</script>
</html>
