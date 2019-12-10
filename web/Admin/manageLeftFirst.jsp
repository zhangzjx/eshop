<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/1
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String role=(String)session.getAttribute("role");
    String url="";
    if(role!=null){
        if(!role.equals("管理员")){
            response.sendRedirect("../../login.jsp");
            return;
        }
    }else{
        response.sendRedirect("../../login.jsp");
        return;
    }
%>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="css/link.css" type="text/css"></link>
    <link rel="stylesheet" href="css/left.css" type="text/css"></link>
</head>

<body style="background:#FAEBD7;">

<%
    if(role!=null){
        if(role.equals("管理员")){%>
<div id="a">
    <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">系统首页</div>
    <div class="left-a">
        <li><a href="manageHome.jsp" target="right">系统首页</a></li>
    </div>
    <div class="left-a">
        <li><a href="accountSettings.jsp" target="right">账户设置</a></li>
    </div>
    <div class="left-a">
        <li><a href="../Manage/editteacher.jsp" target="right">系统信息</a></li>
    </div>
    <div class="left-a">

        <li><a href="loginInf.jsp" target="right">登录日志</a></li>
        <!--<li><a href="<c:url value='/AdminServlet?action=findAllTea'/>" target="right">登录日志</a></li>
    -->
    </div>
</div>
<% }}%>

<div class="a">
    <%String time=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());out.print(time); %>
</div>
</body>
</html>