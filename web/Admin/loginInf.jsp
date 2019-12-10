<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录信息</title>
    <link rel="stylesheet" href="css/manageHome.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body >
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">登录日志</span></div>
<!--主要内容-->
<div class="manage-main" style="border: #d4d4d4 solid 1px;">
    <div class="loginInf-top">
        <span style="margin-left: 25px">数据列表</span>
    </div>
    <div class="loginInf-head">
        <div class="head-item">
            <strong>时间</strong>
        </div>
        <div class="head-item">
            <strong>IP</strong>
        </div>
        <div class="head-item">
            <strong>地址</strong>
        </div>
        <div class="head-item">
            <strong>浏览器</strong>
        </div>
    </div>
    <c:forEach var="record" items="${myBrand.list}">
        <div class="loginInf-head">
            <div class="head-item">
                <strong>时间</strong>
            </div>
            <div class="head-item">
                <strong>IP</strong>
            </div>
            <div class="head-item">
                <strong>地址</strong>
            </div>
            <div class="head-item">
                <strong>浏览器</strong>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
