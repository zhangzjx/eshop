<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商品分类</title>

    <link rel="stylesheet" href="css/goodsManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">商品分类</span></div>
<!--主要内容-->
<div class="goods-main">
    <!--顶部-->
    <div class="goods-main-top">
        <span style="margin-left: 10px;float: left;">数据列表</span>
        <input type="button" onclick="gkd()" class="el-button" value="添 加">
    </div>
    <!--数据-->
    <div class="goods-mainInf">
        <div class="mainInf-item">编号</div>
        <div class="mainInf-item">分类名称 </div>
        <div class="mainInf-item">级别</div>
        <div class="mainInf-item">数量单位</div>
        <div class="mainInf-item" style="width: 244px">设置</div>
        <div class="mainInf-item">操作</div>

        <c:forEach var="record" items="${sort.list}">
            <div class="mainInf-item">${record.sort_id}</div>
            <div class="mainInf-item">${record.sort_name} </div>
            <div class="mainInf-item">${record.sort_level}</div>
            <div class="mainInf-item">件</div>
            <div class="mainInf-item" style="width: 244px">
                <a href="#" onclick="gkd()"  style="float: left;margin: 0 0 0 30px">新增下级</a>
                <a  style="float: left;margin: 0 0 0 10px"
                    href="<c:url value='/ProductServlet?action=findAllSort&sort_level=2&id=${record.sort_id}'/>">查看下级</a>
                <a href="#" style="float: left;margin: 0 0 0 10px">转移商品</a>
            </div>
            <div class="mainInf-item">操作</div>
        </c:forEach>

    </div>
    <!--分页功能-->
    <div class="pagination">
        <div style="width: 70%;text-align: left;margin-left: 20px;float: left">
            共找到${sort.totalSize}条记录，每页${sort.pageSize}条，共${sort.totalPage }页，当前第${sort.currentPage }页
        </div>
        <div style="float: left;width: 15%;">
            <!-- 首页 -->
            <c:choose>
                <c:when test="${sort.currentPage==1 }">首页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllSort&sort_level=1&currentPage=${sort.currentPage != 1 }'/>">首页</a>
                </c:otherwise>
            </c:choose>
            <!-- 上一页 -->
            <c:choose>
                <c:when test="${sort.currentPage==1 }">上一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllSort&sort_level=1&currentPage=${sort.currentPage-1 }'/>">上一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 下一页 -->
            <c:choose>
                <c:when test="${sort.currentPage==sort.totalPage }">下一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllSort&sort_level=1&currentPage=${sort.currentPage+1 }'/>">下一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 尾页 -->
            <c:choose>
                <c:when test="${sort.currentPage == sort.totalPage }">尾页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllSort&sort_level=1&currentPage=${sort.totalPage }'/>">尾页</a>
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
<script>
    function gk() {
        const num = document.getElementById("num").value;
        document.location = "../ProductServlet?action=findAllSort&sort_level=1&currentPage="+num;
    }
    function gkd() {
        document.location = "../ProductServlet?action=findSort";
    };

</script>
</html>
