<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单列表</title>

    <link rel="stylesheet" href="css/orderManage.css">
    <link rel="stylesheet" href="./Admin/css/orderManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">订单列表</span></div>
<!--主要内容-->
<div class="order-main">
    <div class="order-main-top">
        <div id="1" class="order-item" onclick="gkd()">
            全部订单
        </div>
        <div id="2" class="order-item" onclick="gkd2()">
            待付款
        </div>
        <div id="3" class="order-item" onclick="gkd3()">
            待发货
        </div>
        <div id="4" class="order-item" onclick="gkd4()">
            已发货
        </div>
        <div id="5" class="order-item" onclick="gkd5()">
            已完成
        </div>
        <div id="6" class="order-item">
            已关闭
        </div>

    </div>
    <!--搜索-->
    <div class="serach">
        <form  action="<c:url value='/ProductServlet?action=searchOrder'/>" method="post">
            <div class="serach_2"><span style="margin-left: 10px;float: left;">筛选查询</span>
                <input type="submit" class="el-button" value="查 询">
            </div>
            <div class="serach_3">
                <span style="font-size: 12pt">输入搜索：</span>
                <input type="text" id="sValue" name="sValue" class="el-input" placeholder="请输入查询条件">
            </div>
            <div class="serach_3">
                <span style="font-size: 12pt">条件：</span>
                <select id="sKey" name="sKey" class="el-select">
                    <option value="oid">订单编号</option>
                    <option value="id">商品货号</option>
                    <option value="receiver">收货人姓名</option>
                    <option value="aphone">收货人电话</option>
                </select>
            </div>
        </form>
    </div>
    <!--主要内容-->
    <div class="order-mainInf" >
        <div class="main-item" style="width: 77px;font-weight: bold;">
            <span>批量操作</span>
        </div>
        <div class="main-item" style="font-weight: bold;">订单编号</div>
        <div class="main-item" style="width: 175px; font-weight: bold;">提交时间</div>
        <div class="main-item" style="font-weight: bold;">用户账号</div>
        <div class="main-item" style="font-weight: bold;">订单金额</div>
        <div class="main-item" style="font-weight: bold;">订单状态</div>
        <div class="main-item" style="font-weight: bold;">支付方式</div>
        <div class="main-item" style="font-weight: bold;">操作</div>

        <c:forEach var="record" items="${myOrder.list}">
            <div class="main-item" style="width:77px;">
                <input style="width: 60%;height: 20px;margin-top: 10px;" type="checkbox" name="course" value=${record.oid} >
            </div>
            <div class="main-item">${record.oid}</div>
            <div class="main-item"  style="width: 175px"  title=${record.ordertime} >${record.ordertime}</div>
            <div class="main-item">${record.uid}</div>
            <div class="main-item">${record.totalprice}</div>
            <div class="main-item" >
                <c:choose>
                    <c:when test="${record.status == '1'}"><!-- 如果 -->
                        待支付
                    </c:when>
                    <c:when test="${record.status == '2'}"><!-- 如果 -->
                        待发货
                    </c:when>
                    <c:when test="${record.status == '3'}"><!-- 如果 -->
                        已收货
                    </c:when>
                    <c:when test="${record.status == '4'}"><!-- 如果 -->
                        待评价
                    </c:when>
                    <c:otherwise> <!-- 否则 -->
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="main-item">支付宝</div>
            <div class="main-item">
                <a href="<c:url value='/ProductServlet?action=findOneOrder&oid=${record.oid}'/>" >查看订单</a>|
                <a onclick="javascript:return del()" href="<c:url value='/ProductServlet?action=deleteGo&oid=${record.oid}'/>" >关闭订单</a>
            </div>
        </c:forEach>
    </div>
    <!--分页-->
    <div class="pagination">
        <div style="width: 70%;text-align: left;margin-left: 20px;float: left">
            共找到${myOrder.totalSize}条记录，每页${myOrder.pageSize}条，共${myOrder.totalPage }页，当前第${myOrder.currentPage }页
        </div>
        <div style="float: left;width: 15%;">
            <!-- 首页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==1 }">首页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllOrder&currentPage=${myOrder.currentPage != 1 }'/>">首页</a>
                </c:otherwise>
            </c:choose>
            <!-- 上一页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==1 }">上一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllOrder&currentPage=${myOrder.currentPage-1 }'/>">上一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 下一页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==myList.totalPage }">下一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllOrder&currentPage=${myOrder.currentPage+1 }'/>">下一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 尾页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage == myList.totalPage }">尾页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllOrder&currentPage=${myOrder.totalPage }'/>">尾页</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div style="float: left">
            跳至<input  type="text" id="num" name="currentPage" style="height: 20px;width: 30px;margin: 0 5px;">页
            <input type="button" onclick="gk()" style="border: none;background-color: #fff" value="确定">
        </div>
    </div>
</div>

</body>
<script type="application/javascript">
    function gkd() {
        document.location = "ProductServlet?action=findAllOrder";
    };
    function gkd2() {
        document.location = "ProductServlet?action=orderStatus&status=1";
    };
    function gkd3() {
        document.location = "ProductServlet?action=orderStatus&status=2";
    };
    function gkd4() {
        document.location = "ProductServlet?action=orderStatus&status=3";
    };
    function gkd5() {
        document.location = "ProductServlet?action=orderStatus&status=4";
    };


    function del() {
        const msg = "确定要删除吗？\n请确认！";
        if (confirm(msg)==true){
            alert("删除成功");
            return true;
        }else{
            return false;
        }
    }
    function gk() {
        const num = document.getElementById("num").value;
        document.location = "ProductServlet?action=findAllOrder&currentPage="+num;
    }
</script>
</html>
