<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>设置-个人信息</title>
    <link rel="stylesheet" href="css/order.css">
    <link rel="stylesheet" href="css/topFoot.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <script type="text/javascript" src="js/order.js"></script>
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
            //显示首页商品
            $.post("${pageContext.request.contextPath}/UserServlet",{
                action:"indexGoods",
            },)
            //$("#left-item-1,#left-item-2,#left-item-3,#left-item-4,#left-item-5" +
            //    ",#left-item-6,#left-item-7,#left-item-8,#left-item-9,#left-item-10").hide();
        })
    </script>
<style type="text/css">
    .addressBtn{
        width: 100px;
        height: 40px;
        border: 0;
        float: right;
        margin:5px 5px 0 0;
    }
    .addressBtn:hover{
        background-color:#7cc815;;
        cursor:pointer;
    }
    .addressBtn:active{
        border: 0;
     }
    .address-border{
        border: #D6EAF6 solid 1px;
        text-align: left;
        padding-left: 10px;
    }

</style>
</head>
<body>
<input type="hidden" id="name" value="${name }">
<input type="hidden" id="uid" value="${user.uid }">
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
                    <li ><span><a href="centerOrder.jsp" >我的订单</a></span></li>
                    <li><span><a href=""  target="_blank" onclick="myCart()">我的购物车</a></span></li>
                    <li><span><a href="myInf.jsp" target="_blank">我的青橙</a></span></li>
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
<!--主要内容-->
<div class="main">
    <div class="content-main">
        <!--左侧主内容-->
        <div class="content-left">
            <div class="content-left-top">
                <img src="img/头像.png" alt="头像" style="width: 70px;height: 70px;float: left;">
                <span style=" font-size: 11pt;">name</span><br><br><span style=" font-size: 11pt;">账户安全</span>
            </div>
            <div class="content-left-bottom">
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">订单中心</div>
                <li class="content-left-list"><a onclick="myOrder()" href="centerOrder.jsp">我的订单</a></li>
                <li class="content-left-list"><a onclick="orderPay()" href="centerOrderPay.jsp">待付款</a></li>
                <li class="content-left-list"><a onclick="orderSend()" href="centerOrderSend.jsp">待发货</a></li>
                <li class="content-left-list"><a onclick="orderReceive()" href="centerOrderReceive.jsp">待收货</a></li>
                <li class="content-left-list"><a onclick="orderEvaluate()" href="centerOrderEvaluate.jsp">待评价</a></li>
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">设置</div>
                <li class="content-left-list"><a href="centerOrder.jsp">个人信息</a></li>
                <li class="content-left-list" onclick="allAddress()"><a href="centerSettingAddress.jsp" style="cursor: pointer">地址管理</a></li>
            </div>
        </div>
        <!--右侧主内容-->
        <div class="content-right">
            <div class="right-top" style="height: 50px; line-height: 50px;">
                <div  style="width: 100px;height: 50px;float: left;">地址管理</div>
                <a href="addAddress.jsp"><input type="button" class="addressBtn" value="添加新地址"></a>
            </div>
            <div style="height: 50px"></div>
            <div class="right-main" >
                <div class="right-main-top">
                    <div class="main-top-list address-border" style="width: 100px;">姓名</div>
                    <div class="main-top-list address-border" style="width: 510px">地址</div>
                    <div class="main-top-list address-border" style="width: 150px">联系电话</div>
                    <div class="main-top-list address-border" style="width: 150px">操作</div>
                </div>

                <div class="main-content" >
                    <c:forEach var="record" items="${allAddress}" varStatus="st">
                        <form name="myForm" class="myForm" id="myForm" action="../UserServlet?uid=${user.uid}&status=0" method="post">

                            <input type="hidden" class="action" name="action" value="">
                            <input type="hidden" name="aid" id="aid" value=${record.aid}>
                            <div class="main-top-list address-border" style="width: 100px;">${record.receiver}</div>
                            <div class="main-top-list address-border" style="width: 510px">
                                <input type="text" id="itxt" name="itxt" disabled="true"
                                style="background-color: #fff;width: 400px;height: 30px;margin: 10px 0 10px 10px;border:0px;"
                                       value=${record.address}>
                            </div>
                            <div class="main-top-list address-border" style="width: 150px">${record.aphone}</div>
                            <div class="main-top-list address-border" style="width: 150px">
                                <a id="change" onclick="changeAddress()" style="cursor: pointer;">修改</a>|
                                <a onclick="del()" href="<c:url value='/UserServlet?action=delAddress&aid=${record.aid}'/>" >删除</a>
                              |
                             <input type="submit" onclick="changeDefault()" style="cursor: pointer;background-color:#fff;width: 65px;height: 30px;border: 0;outline: none;" value="设为默认">
                            </div>
                        </form>

                    </c:forEach>
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
<script type="application/javascript">
    setTimeout("refresh()",500);
    $(document).ready(function(){
        // 页面加载后任何需要执行的js特效
        let uid = $("#uid").val();
        //显示首页商品
        $.post("${pageContext.request.contextPath}/UserServlet",{
            action:"findAddress",
            uid:uid,
        },)
    });
    /*****加载后页面只刷新一次******/
    function refresh(){
        if(location.href.indexOf("?reload=true")<0){
            location.href+="?reload=true";
        }
    }
    setTimeout("refresh()",500);

    let switcher = false;
    function changeAddress(){

        if(switcher = !switcher){
            //第一次点击
            $("#itxt").removeAttr("disabled");
            document.getElementById("change").innerHTML = "保存";

        }else{
            //第二次点击
            //修改地址
            $(".action").attr("value","changeAddress");
            let address = $("#itxt").val();
            let aid = $("#aid").val();
            let uid = $("#uid").val();

            $.post("${pageContext.request.contextPath}/UserServlet",{
                action:"changeAddress",
                address:address,
                aid:aid,
                uid:uid,
            },)

            document.getElementById("change").innerHTML = "修改";
            $("#itxt").attr("disabled","true");
        }
    };


  function del(){
      alert("删除成功！");
      /************
        $.post("${pageContext.request.contextPath}/UserServlet",{
            action:"del",
            aid:aid,
        },)
       *************/
    };


  function changeDefault(){
      $(".action").attr("value","changeDefault");
  };


</script>
</html>

