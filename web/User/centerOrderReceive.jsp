<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>待收货</title>
    <link rel="stylesheet" href="css/order.css">
    <link rel="stylesheet" href="css/topFoot.css">
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
        })
    </script>
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
    <div class="content-main">
        <!--左侧主内容-->
        <div class="content-left">
            <div class="content-left-top">
                <img src="img/头像.png" alt="头像" style="width: 70px;height: 70px;float: left;">
                <span style=" font-size: 11pt;">name</span><br><br><span style=" font-size: 11pt;">账户安全</span>
            </div>
            <div class="content-left-bottom">
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">订单中心</div>
                <li class="content-left-list"><a onclick="myOrder()" href="#">我的订单</a></li>
                <li class="content-left-list"><a onclick="orderPay()" href="#">待付款</a></li>
                <li class="content-left-list"><a onclick="orderSend()" href="#">待发货</a></li>
                <li class="content-left-list"><a onclick="orderReceive()" href="#">待收货</a></li>
                <li class="content-left-list"><a onclick="orderEvaluate()" href="#">待评价</a></li>
                <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">设置</div>
                <li class="content-left-list"><a href="centerOrder.jsp">个人信息</a></li>
                <li class="content-left-list" onclick="allAddress()"><a href="#" style="cursor: pointer">地址管理</a></li>
            </div>
        </div>
        <!--右侧主内容-->
        <div class="content-right">
            <div class="right-top">
                <div class="right-top-list" style="width: 350px">宝贝</div>
                <div class="right-top-list" >单价</div>
                <div class="right-top-list" >数量</div>
                <div class="right-top-list" >商品操作</div>
                <div class="right-top-list" >实付款</div>
                <div class="right-top-list" >交易状态</div>
                <div class="right-top-list" >交易操作</div>
            </div>

            <div class="right-main" >
                <c:forEach var="record" items="${order.list }">
                    <div class="right-main-top">
                        <div class="main-top-list">订单时间：${record.ordertime}</div>
                        <div class="main-top-list">订单编号：${record.oid}</div>
                        <div class="main-top-list">店铺</div>
                    </div>
                    <div class="main-content" >
                        <div class="main-content-list" title="${record.content}" style="width: 346px">${record.content}</div>
                        <div class="main-content-list">
                                ${record.price}
                        </div>
                        <div class="main-content-list">
                                ${record.buycount}
                        </div>
                        <div class="main-content-list" style="line-height: 35px">
                            待收货<br>
                            <a href="#">退货/退款</a>
                        </div>
                        <div class="main-content-list">
                                ${record.totalprice}
                        </div>
                        <div class="main-content-list">
                            待收货
                        </div>
                        <div class="main-content-list">
                            <a href="#">确认收货</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!--分页 -->
            <div class="pagination">
                <div style="width: 68%;text-align: left;margin-left: 20px;float: left">
                    共找到${order.totalSize}条记录，每页${order.pageSize}条，共${order.totalPage }页，当前第${order.currentPage }页
                </div>
                <div style="float: left;width: 17%;">
                    <!-- 首页 -->
                    <c:choose>
                        <c:when test="${order.currentPage==1 }">首页
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/UserServlet?action=findAllOrder&uid=${user.uid }&currentPage=${order.currentPage != 1 }'/>">首页</a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 上一页 -->
                    <c:choose>
                        <c:when test="${order.currentPage==1 }">上一页
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/UserServlet?action=findAllOrder&uid=${user.uid }&currentPage=${order.currentPage-1 }'/>">上一页</a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 下一页 -->
                    <c:choose>
                        <c:when test="${order.currentPage==order.totalPage }">下一页
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/UserServlet?action=findAllOrder&uid=${user.uid }&currentPage=${order.currentPage+1 }'/>">下一页</a>
                        </c:otherwise>
                    </c:choose>
                    <!-- 尾页 -->
                    <c:choose>
                        <c:when test="${order.currentPage == order.totalPage }">尾页
                        </c:when>
                        <c:otherwise>
                            <a href="<c:url value='/UserServlet?action=findAllOrder&uid=${user.uid }&currentPage=${order.totalPage }'/>">尾页</a>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div style="float: left">
                    跳至<input  type="text" id="num" name="currentPage" style="height: 20px;width: 30px;margin: 0 5px;">页
                    <input type="button" onclick="gk()" style="border: none;background-color: #fff" value="确定">
                </div>
            </div>
        </div>
    </div>
    <!--底部内容-->
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
    const uid = document.getElementById("uid").value;
    function gk() {
        const num = document.getElementById("num").value;
        document.location = "../UserServlet?action=findAllOrder&uid="+uid+"&currentPage="+num;
    }
    /*****加载后页面只刷新一次******/
    function refresh(){
        if(location.href.indexOf("?reload=true")<0){
            location.href+="?reload=true";
        }
    }
    setTimeout("refresh()",50);
</script>
</html>
