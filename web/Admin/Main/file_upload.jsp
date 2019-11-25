<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <style type="text/css">
	  #table_a{weith:500px;height:107px;margin-left:300px;margin-top:30px;border-top: solid 1px;border-right: solid 1px;float: left;}
	 .table_a_1{width: 150px;height: 35px;line-height:35px;border-bottom: solid 1px;border-left: solid 1px;float: left;}
	 .table_a_2{width: 349px;height: 35px;line-height:35px;border-bottom: solid 1px;border-left: solid 1px;float: left;}
	 .table_a_3{width: 499px;height: 70px;line-height:70px;border-bottom: solid 1px;border-left: solid 1px;}
  </style>
  </head>
  <body>
  <p style="font-size:28px;text-align:center;">文件上传</p>
    <form method="post" action="uploadtxtServlet" enctype="multipart/form-data">
    <input type="hidden" name="action" value="uploadFile"/>
    <div id="table_a"> 
            <div class="table_a_1">上传者：</div>
            <div class="table_a_2"><input type="text" name="author" value="${username}" style="margin-left:90;margin-top:6px;"/></div><br/>
            <div class="table_a_1">上传文件：</div>
            <div class="table_a_2"><input type="file" name="myfile"  style="margin-left:90;margin-top:6px;"/></div><br/>	    
    	    <div class="table_a_3"><input type="submit" value="提交" style="margin-left:243;margin-top:6px;"/></div>
    </div>
    	
</form>
  </body>
</html>
