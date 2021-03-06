<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>订单状态列表</title>

    <link rel="stylesheet" href="css/orderManage.css">
    <link rel="stylesheet" href="./Admin/css/orderManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">订单列表</span></div>
<!--主要内容-->
<div class="order-main">
    <div class="order-main-top">
                <div  class="order-item" onclick="gkd()">
                    全部订单
                </div>
                <div  class="order-item" onclick="gkd2()">
                    待支付
                </div>
                <div  class="order-item" onclick="gkd3()">
                    待发货
                </div>
                <div  class="order-item" onclick="gkd4()">
                    已发货
                </div>
                <div class="order-item" onclick="gkd5()">
                    已完成
                </div>
                <div class="order-item">
                    已关闭
                </div>

                <div id="1" class="order-item" onclick="gkd()">
                    全部申请
                </div>
                <div id="2" class="order-item" onclick="gkd2()">
                    待处理
                </div>
                <div id="3" class="order-item" onclick="gkd3()">
                    已处理
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
        <div class="main-item" style="width: 77px;font-weight: bold;background-color: rgba(222,209,165,0.45);">
            <span>批量操作</span>
        </div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">订单编号</div>
        <div class="main-item" style="width: 175px; font-weight: bold;background-color: rgba(222,209,165,0.45);">提交时间</div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">用户账号</div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">订单金额</div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">订单状态</div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">支付方式</div>
        <div class="main-item" style="font-weight: bold;background-color: rgba(222,209,165,0.45);">操作</div>

        <c:forEach var="record" items="${myOrder.list}">
            <input type="hidden" id="status" value=${record.status}>
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
                        已发货
                    </c:when>
                    <c:when test="${record.status == '4'}"><!-- 如果 -->
                        待评价
                    </c:when>
                    <c:when test="${record.status == '6'}"><!-- 如果 -->
                        退货处理中
                    </c:when>
                    <c:when test="${record.status == '7'}"><!-- 如果 -->
                        退款处理中
                    </c:when>
                    <c:otherwise> <!-- 否则 -->
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="main-item">支付宝</div>
            <div class="main-item">
                <a href="<c:url value='/ProductServlet?action=findOneOrder&oid=${record.oid}&status=${record.status}'/>" >查看订单</a>|
                <a onclick="javascript:return del()" href="<c:url value='/ProductServlet?action=deleteGo&oid=${record.oid}'/>" >关闭订单</a>
            </div>
        </c:forEach>
    </div>
    <!--分页功能-->
    <div class="pagination">
        <div style="width: 70%;text-align: left;margin-left: 20px;float: left">
            共找到${myOrder.totalSize}条记录，每页${myOrder.pageSize}条，共${myOrder.totalPage }页，当前第${myOrder.currentPage }页
            <input type="hidden" id="currentPage" value=${myOrder.currentPage }>
            <input type="hidden" id="totalPage" value=${myOrder.totalPage }>
        </div>
        <div style="float: left;width: 15%;">
            <!-- 首页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==1 }">首页
                </c:when>
                <c:otherwise>
                    <a onclick="q()" href="#">首页</a>
                </c:otherwise>
            </c:choose>
            <!-- 上一页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==1 }">上一页
                </c:when>
                <c:otherwise>
                    <a  onclick="w()" href="#">上一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 下一页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage==myOrder.totalPage }">下一页
                </c:when>
                <c:otherwise>
                    <a onclick="e()" href="#">下一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 尾页 -->
            <c:choose>
                <c:when test="${myOrder.currentPage == myOrder.totalPage }">尾页
                </c:when>
                <c:otherwise>
                    <a  onclick="r()" href="#">尾页</a>
                    <!--<a href="<c:url value='/ProductServlet?action=findAllSort&sort_level=2&id=1&currentPage=${sort.totalPage }'/>">尾页</a>-->
                </c:otherwise>
            </c:choose>
        </div>
        <div style="float: left">
            跳至<input  type="text" id="num" name="currentPage" style="height: 20px;width: 30px;margin: 0 5px;">页
            <a href="#" onclick="gk()" >确定</a>
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

/******分页********/
    const c = parseInt(document.getElementById("currentPage").value);
    let status = document.getElementById("status").value;
    function q() {
        let currentPage = 1;
        document.location = "ProductServlet?action=orderStatus&currentPage="+currentPage+"&status="+status;
    }
    function w() {
        let currentPage = c-1;
        document.location = "ProductServlet?action=orderStatus&currentPage="+currentPage+"&status="+status;
    }
    function e() {
        let currentPage = c+1;
        document.location = "ProductServlet?action=orderStatus&currentPage="+currentPage+"&status="+status;
    }
    function r() {
        const totalPage = parseInt(document.getElementById("totalPage").value);
        document.location = "ProductServlet?action=orderStatus&currentPage="+totalPage+"&status="+status;
        //document.location = "../ProductServlet?action=findAllSort&sort_level=2&currentPage="+totalPage+"&id="+sort_id;
    }

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
        document.location = "ProductServlet?action=orderStatus&currentPage="+num;
    }
</script>
</html>
