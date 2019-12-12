<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品分类</title>

    <link rel="stylesheet" href="css/goodsManage.css">
    <link rel="stylesheet" href="./Admin/css/orderManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">商品分类</span></div>
<!--主要内容-->
<div class="goods-main">
    <!--顶部-->
    <div class="goods-main-top">
        <span style="margin-left: 10px;float: left;">筛选查询</span>
        <input type="submit" class="el-button" value="添 加">
    </div>
    <!--数据-->
    <div class="goods-mainInf">
        <div class="mainInf-item">编号</div>
        <div class="mainInf-item">分类名称 </div>
        <div class="mainInf-item">级别</div>
        <div class="mainInf-item">数量单位</div>
        <div class="mainInf-item" style="width: 244px">设置</div>
        <div class="mainInf-item">操作</div>

        <c:forEach var="record" items="${myOrder.list}">
            <div class="mainInf-item">编号</div>
            <div class="mainInf-item">分类名称 </div>
            <div class="mainInf-item">级别</div>
            <div class="mainInf-item">数量单位</div>
            <div class="mainInf-item" style="width: 244px">设置</div>
            <div class="mainInf-item">操作</div>
        </c:forEach>

    </div>
    <!--分页功能-->
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
</html>
