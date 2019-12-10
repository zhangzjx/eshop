<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
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
    <title>订单</title>
    <link rel="stylesheet" href="css/link.css" type="text/css"></link>
    <link rel="stylesheet" href="css/left.css" type="text/css"></link>
    <script type="application/javascript">
        $(document).ready(function(){
            //页面加载的时候，内容框默认显示 a.html
            $('#right').load("main.jsp");
            //单击 a 链接，加载 a.html
            $("#firstOne").click(function(){
                $('#right').load('updateGoods.jsp');
            });
            $("#firstTwo").click(function(){
                $('#right').load('manageLeftGoods.jsp');
            });
            $("#firstThree").click(function(){
                $('#right').load('manageLeftGoods.jsp');
            });
            $("#firstFour").click(function(){
                $('#right').load('manageLeftGoods.jsp');
            });
            //单击 b 链接，加载 b.html
            $("#topTwo").click(function(){
                $('#left').load('manageLeftGoods.jsp');
            });
            $("#topThree").click(function(){
                $('#left').load('manageLeftGoods.jsp');
            });
        })
    </script>
</head>

<body style="background:#FAEBD7;">
<%
    if(role!=null){
        if(role.equals("管理员")){%>
<div id="a">
    <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">订单管理</div>
    <div class="left-a">
        <li><a href="updateGoods.jsp" target="right">订单列表</a></li>
    </div>
    <div style="font-size: 12pt;text-align: center;margin: 15px 0px">退款及退货</div>
    <div class="left-a">
        <li><a href="updateGoods.jsp" target="right">退货申请处理</a></li>
    </div>
    <div class="left-a">
        <li><a href="<c:url value='/AdminServlet?action=findAllGoods'/>" target="right">退款申请处理</a></li>
    </div>

</div>
<% }}%>

<div class="a">
    <%String time=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());out.print(time); %>
</div>
</body>

