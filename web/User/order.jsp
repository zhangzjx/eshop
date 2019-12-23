<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("utf-8");
    String cid = request.getParameter("cid");
    //System.out.println("购物车id为"+cid);

%>
<html>
<head>
    <title>确认订单信息</title>
    <link rel="stylesheet" href="css/orderTwo.css">
    <link rel="stylesheet" href="css/topFoot.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

    <style type="text/css">
        .t3-item{
            width: 200px;
            height: 80px;
            float: left;
            text-align: center;
            line-height:80px;
        }
    </style>
</head>
<body>
<input type="hidden" id="name" value="${name }">
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
<!--所有商品-->
<div class="order">
    <div class="all-order">
        <h4>填写并核对订单信息</h4>

        <c:forEach var="record" items="${order }">
            <form id="myForm" action="../UserServlet?action=subOrder" method="post" >
                <input type="hidden" id="uid" name="uid" value=${user.uid}>
                <input type="hidden" id="cid" name="cid" value=${record.cid}>
                <input type="hidden" id="aphone" name="aphone" value=${record.aphone}>
                <input type="hidden" id="address" name="address" value=${record.address}>
                <input type="hidden" id="receiver" name="receiver" value=${record.receiver}>
                <input type="hidden" id="totalPrice" name="totalPrice" value=${price }>
                <input type="hidden" id="status" name="status" value=1>
                <input type="hidden" id="id" name="id" value=${record.id}>
                <input type="hidden" id="quantity" name="quantity" value=${record.quantity}>
                <input type="hidden" id="goodsname" name="goodsname" value=${record.goods_name}>
                <input type="hidden" id="danjia" name="danjia" value=${record.price}>

                <input type="hidden" id="aid" value=${record.aid}>
                <div class="order-main">
                    <div class="main-list">
                        <span>收件人信息</span><br>
                        <!--从数据库获取收货地址信息，把信息存入数组，根据数组下标设置点击事件，改变样式-->

                        <div id="1" class="main-list-item check-box" style="cursor:pointer;width: 120px;text-align: center;border: #d3d4d6 solid 1px;">${record.receiver}</div>
                        <div class="main-list-item" >
                            <input type="text" id="itxt" readonly="readonly" style="width: 400px;height: 30px;margin-left: 10px;border:0px;"
                                   value=${record.address}>
                        </div>
                        <div class="main-list-item" style="width: 150px;">
                            电话${record.aphone}
                        </div>
                        <div class="main-list-item" style="width: 100px;">
                            默认地址
                        </div>
                        <div class="main-list-item" style="width: 100px;">
                            <input type="button" id="change" style="height: 30px;width: 60px;background-color: cornflowerblue;" value="修改">
                        </div>
                        <div class="main-list-item" style="width: 100px;">
                            删除
                        </div>
                        <!--
                        <br><br>
                        <div id="2" class="main-list-item" style="cursor:pointer;width: 120px;text-align: center;border: #d3d4d6 solid 1px;">张角</div>
                        <div class="main-list-item" style="width: 400px;margin-left: 10px;">
                            北京市海淀区三环内中关村软件园9号楼 15932223201
                        </div>
                        -->
                    </div>
                    <div class="main-list">
                        <span>支付方式</span><br><!--鼠标悬浮标手指形状-->
                        <div id="xianshang" class="main-list-item check-box" style="cursor:pointer;width: 120px;text-align: center;border: #d3d4d6 solid 1px;">
                            在线支付</div>
                        <div id="xianxia" class="main-list-item" style="cursor:pointer;width: 120px;text-align: center;border: #d3d4d6 solid 1px;">
                            货到付款</div>
                    </div>
                    <div class="main-list">
                        <span>送货清单</span><br>
                        <div class="t3" style="height: 80px;border: #d4d4d4 solid 1px;margin-top: 30px">
                            <div class="t3-item">
                                <img src="/uploadImg/${record.img}" style="width: 80px;height: 80px">
                            </div>
                        <div class="t3-item" >${record.goods_name}</div>
                        <div class="t3-item">${record.price}</div>
                        <div class="t3-item">${record.quantity}</div>

                        </div>
                    </div>
                </div>
                <div class="order-base">
                    <div class="base-item">
                        <br>
                        应付金额：￥<span class="total_text">${price }</span><br>
                        寄送至：<span>${record.address}</span>
                    </div>
                    <input type="submit" class="base-item-sub el-button" value="提交订单">
                </div>
            </form>
        </c:forEach>
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
    $(document).ready(function(){
        // 页面加载后任何需要执行的js特效
        let name = $("#name").val();
        if(name != null&&name != ""){
            $("#logout").show()
        }else {
            $("#lg").show();
        }

        //Web小功能1——jquery实现一个按钮两个功能（触发不同事件）
        let switcher = false;
        $("#change").click(function(){
            if(switcher = !switcher){
                $("#itxt").removeAttr("readonly");
                $("#itxt").css("border","#7EC0EE solid 1px");
                $("#change").val("保存");
            }else{
                $("#itxt").attr("readonly","readonly");
                $("#itxt").css("border","0px");
                const uid = document.getElementById("uid").value;
                const aid = document.getElementById("aid").value;
                const address = document.getElementById("itxt").value;

                document.location = "../UserServlet?action=changeAddress&uid=${user.uid}&aid="+aid+"&address="+address;

            }
        });

        $("#xianshang").click(function(){
            $(this).addClass('check-box')
            $("#xianxia").removeClass('check-box');
        });
        $("#xianxia").click(function(){
            $(this).addClass('check-box')
            $("#xianshang").removeClass('check-box');
        });
        $("#1").click(function(){
            $(this).addClass('check-box')
            $("#2").removeClass('check-box');
        });
        $("#2").click(function(){
            $(this).addClass('check-box')
            $("#1").removeClass('check-box');
        });

    })
</script>
</html>
