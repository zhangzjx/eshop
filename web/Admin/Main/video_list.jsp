<%@ page language="java" import="java.util.*,com.zhang.Utils.JDBCUtils" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 学生界面的留言 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>视频列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	
	#table_a{
		width: 100%;		
		border: solid 1px;
		border-top: solid 2px;
		border-right: solid 2px;
		float: left;	
	}
	.table_a_1{
		width: 14.9%;
		height: 30px;
		line-height:30px;
		text-align: center;
		border-bottom: solid 1px;
		border-left: solid 1px;
		float: left;
		}
	.table_a_2{
		width: 39.9%;
		height: 30px;
		line-height:30px;
		text-align: center;
		border-bottom: solid 1px;
		border-left: solid 1px;
		float: left;
		}
	.table_a_3{
		width: 100%;
		height: 30px;
		line-height:30px;
		}		
	</style>
  </head>
  <body>
  <p style="font-size:28px;text-align:center;">试题列表</p>
     <div id="table_a">
     <div class="table_a_1">id</div>
     <div class="table_a_1">上传者</div>
     <div class="table_a_2">文件名</div>
     <div class="table_a_1">上传时间</div>
     <div class="table_a_1">操作</div>
     
      <c:forEach var="record" items="${video_list}">                 
      <div class="table_a_1">${record.id}</div>
      <div class="table_a_1">${record.author}</div>
      <div class="table_a_2">${record.filename}</div>
      <div class="table_a_1">${record.filetime}</div>
      <div class="table_a_1">
      <a href="<c:url value='/videoServlet?action=look&filename=${record.filename}'/>">播放</a>|
      <a href="<c:url value='/downServlet?action=downFile&filename=${record.filename}'/>">下载</a></div>
           </c:forEach>
     </div>
  </body>
</html>