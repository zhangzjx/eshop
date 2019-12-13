<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>退货申请处理</title>
    <link rel="stylesheet" href="css/orderManage.css">
    <link rel="stylesheet" href="./Admin/css/orderManage.css">
    <style type="text/css">
        .returns-item{
            width: 120px;
            height: 40px;
            line-height:40px;
            text-align: center;
            border-bottom: solid 1px #dddddd;
            border-right: solid 1px #dddddd;
            background-color: rgba(222,209,165,0.45);
            float: left;
        }
    </style>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">订单列表</span></div>
<!--主要内容-->
<div class="order-main">
    <div class="order-main-top">
        <div  class="order-item" onclick="gkd()">
            全部申请
        </div>
        <div class="order-item" onclick="gkd2()">
            待处理
        </div>
        <div class="order-item" onclick="gkd3()">
            退货中
        </div>
        <div class="order-item">
            已完成
        </div>
        <div class="order-item">
            已拒绝
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
        <div class="returns-item" style="width: 77px;font-weight: bold;">
            <span>批量操作</span>
        </div>
        <div class="returns-item" style="font-weight: bold;">订单编号</div>
        <div class="returns-item" style="width: 174px; font-weight: bold;">申请时间</div>
        <div class="returns-item" style="font-weight: bold;">用户账号</div>
        <div class="returns-item" style="font-weight: bold;">退款金额</div>
        <div class="returns-item" style="font-weight: bold;">联系人</div>
        <div class="returns-item" style="font-weight: bold;">申请状态</div>
        <div class="returns-item" style="font-weight: bold;">处理时间</div>
        <div class="returns-item" style="font-weight: bold;">操作</div>

        <c:forEach var="record" items="${myOrder.list}">
            <div class="returns-item" style="width:77px;">
                <input style="width: 60%;height: 20px;margin-top: 10px;" type="checkbox" name="course" value=${record.oid} >
            </div>
            <div class="returns-item">${record.oid}</div>
            <div class="returns-item"  style="width: 174px"  title=${record.ordertime} >${record.ordertime}</div>
            <div class="returns-item">${record.uid}</div>
            <div class="returns-item">${record.aphone}</div>
            <div class="returns-item">支付宝</div>
            <div class="returns-item" >
                <c:choose>
                    <c:when test="${record.status == '1'}"><!-- 如果 -->
                        待处理
                    </c:when>
                    <c:when test="${record.status == '2'}"><!-- 如果 -->
                        退货中
                    </c:when>
                    <c:when test="${record.status == '3'}"><!-- 如果 -->
                        已完成
                    </c:when>
                    <c:when test="${record.status == '4'}"><!-- 如果 -->
                        已拒绝
                    </c:when>
                    <c:otherwise> <!-- 否则 -->
                        &nbsp;
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="returns-item">支付宝</div>
            <div class="returns-item">
                <a href="<c:url value='/ProductServlet?action=findOne&id=${record.oid}'/>" >查看订单</a>
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
    };    function gkd3() {
        document.location = "ProductServlet?action=orderStatus&status=2";
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
