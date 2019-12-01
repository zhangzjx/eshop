<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/allGoods.css">
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
            //显示所有商品
            //$.post("${pageContext.request.contextPath}/UserServlet",{
             //   action:"allGoods",
            //},)
        });
    </script>
</head>
<body>
<input type="hidden" id="name" value="${name }">
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
<div style="width: 1200px;height:auto;margin:0 auto;">
    <div class="allGoods-top">
        <div id="it-1" class="top-item red" style="margin-left: 20px;">
            <a><span style="float: left;margin-left: 15px;">综合</span><img src="img/下降.png" class="item-img"></a>
        </div>
        <div id="it-2" class="top-item">
            <a><span style="float: left;margin-left: 15px;">销量</span><img src="img/下降.png" class="item-img"></a>
        </div>
        <div id="it-3" class="top-item">
            <a><span style="float: left;margin-left: 15px;">价格升序</span></a>
        </div>
        <div id="it-4" class="top-item">
            <a><span style="float: left;margin-left: 15px;">价格降序</span></a>
        </div>
        <div id="it-5" class="top-item">
            <a><span>上架时间</span></a>
        </div>
    </div>
    <div class="allGoods-content">
        <c:forEach var="record" items="${allGoods.list}">

            <div class="content-item">
                <form id="addForm" action="../UserServlet?action=addCart" method="post">
                    <input type="hidden" id="uid" name="uid" value=${user.uid}>
                    <input type="hidden" name="id" value=${record.id}>
                    <img src="${record.img}" style="width: 238px;height: 200px;border: chocolate solid 1px;">
                    <div class="item-inf">
                            ${record.content}
                    </div>
                    <div class="item-bottom">
                        <input type="hidden" name="quantity" value="1">
                        <input type="hidden" name="price" value=${record.price}>
                        <div class="goods-price" ><span>￥</span>${record.price}</div>
                        <input type="submit" class="add-cart" value="" title="加购" >
                    </div>
                </form>
            </div>
        </c:forEach>
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
<script type="application/javascript">

    $("#it-1").click(function () {
        $("#it-1").addClass("red")
        $("#it-2,#it-3,#it-4,#it-5").removeClass("red")
        document.location = "../UserServlet?action=desc&sortKey=desc";
        /**********
        $.post("${pageContext.request.contextPath}/UserServlet",{
            action:"allGoods",
        },)
         ***********/
    });
    $("#it-2").click(function () {
        $("#it-2").addClass("red")
        $("#it-1,#it-3,#it-4,#it-5").removeClass("red")
        document.location = "../UserServlet?action=desc&sort=desc&sortKey=price";

    });

    $("#it-3").click(function () {
        $("#it-3").addClass("red");
        $("#it-1,#it-2,#it-4,#it-5").removeClass("red");
        document.location = "../UserServlet?action=asc&sort=asc&sortKey=price";
    });
    $("#it-4").click(function () {
        $("#it-4").addClass("red");
        $("#it-1,#it-2,#it-3,#it-5").removeClass("red");
        document.location = "../UserServlet?action=desc&sort=desc&sortKey=price";
    });
    $("#it-5").click(function () {
        $("#it-5").addClass("red");
        $("#it-1,#it-2,#it-3,#it-4").removeClass("red");
        document.location = "../UserServlet?action=desc&sort=desc&sortKey=time";
    });
    function myCart() {
        //把id传入后台调用servlet
        document.location = "../UserServlet?action=myCart";
    };
    $(".add-cart").click(function () {
        document.location = "../UserServlet?action=addCart";
    });
</script>
</html>
