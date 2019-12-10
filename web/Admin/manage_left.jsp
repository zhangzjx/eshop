<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
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
<title>menu</title>
	<link rel="stylesheet" href="css/link.css" type="text/css"></link>
	<link rel="stylesheet" href="css/left.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

</head>
<body style="background:#FAEBD7;">
         <%    
	    if(role!=null){
	         if(role.equals("管理员")){%>
               <div id="a">
				   <div style="font-size: 12pt;text-align: center;margin-bottom: 15px;">商品管理</div>
				   <div class="left-a">
					   <li><a href="addNewBrand.jsp" target="right">添加新品牌</a></li>
				   </div>
				   <div class="left-a">
					   <!--<li><a href="<c:url value='/ProductServlet?action=findBrand'/>"
					   target="right">添加商品</a></li>-->
					   <li><a href="addGoodsLink.jsp" target="right">添加商品</a></li>
				   </div>
				   <div class="left-a">
					   <li><a href="<c:url value='/ProductServlet?action=findAllGoods'/>" target="right">商品列表</a></li>
				   </div>

				   <div class="left-a">
					   <li><a href="<c:url value='/AdminServlet?action=findAllTea'/>" target="right">商品审核</a></li>
				   </div>
				   <div class="left-a">
					   <li><a href="../Manage/editstudent.jsp" target="right">商品回收站</a></li>
				   </div>

				   <div style="font-size: 12pt;text-align: center;margin: 15px 0px">添加配置</div>
				   <div class="left-a">
					   <li><a href="Main/file_upload.jsp" target="right">商品分类</a></li>
				   </div>
				   <div class="left-a">
                       <li><a href="<c:url value='/ProductServlet?action=findAllBrand'/>" target="right">品牌管理</a></li>
				   </div>
				   <div class="left-a">
					   <li><a href="Main/video_upload.jsp" target="right">规格参数</a></li>
				   </div>
				   <div class="left-a">
					   <li><a href="<c:url value='/ProductServlet?action=findAllVideo'/>" target="right">图片库管理</a></li>
				   </div>
                 </div>
         <% }}%>

		 <div class="a">
			 <%String time=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());out.print(time); %>
		 </div>
</body>
</html>