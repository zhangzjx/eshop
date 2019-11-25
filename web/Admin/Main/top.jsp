<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>

      <link rel="stylesheet" href="css/top.css" type="text/css"></link>
      <link rel="stylesheet" href="css/link.css" type="text/css"></link>
      <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
      <script type="text/javascript" src="../js/topHide.js"></script>

    <style type="text/css">
		html{border-bottom: solid 2px;border-color: #fff;}
        body{background:#1AA094;}

	</style>
 </head>
  <body>
  <div id="head-1">
      <div class="head-3" >
          <span style="font-size: 14pt">青橙</span>
      </div>
      <div class="head-3">
          <a href="manageLeftFirst.jsp" target="left">首页</a>
      </div>
      <div class="head-3">
          <a href="manage_left.jsp" target="left">商品</a>
      </div>
      <div class="head-3">
          <a href="manageLeftOrder.jsp" target="left">订单</a>
      </div>
      <div class="head-3">
          <a href="">库存</a>
      </div>
      <div class="head-3">
          <a href="">用户</a>
      </div>
      <div class="head-3">
          <a href="">统计</a>
      </div>
      <div class="head-3">
          <a href="">设置</a>
      </div>
  </div>

  <div id="head-2">
      <div class ="head-4" title="账户信息" style="margin-left: 30%;">
          <img id="u1378_img" class="img" src="images/top-1.png"/>
      </div>
      <div style="height: 40px;width: 32px;float: left;">
          <img src="images/top-6.png"/>
      </div>
      <div class ="head-4"  title="系统首页">
          <a href=""><img id="top-2" src="images/top-2.png"/></a>
      </div>
      <div style="height: 40px;width: 32px;float: left;">
          <img src="images/top-6.png"/>
      </div>
      <div id = "top-3" class = "head-4" title="常用菜单"  >
          <img id = "top-31" src="images/top-3.png"/>
      </div>
      <div style="height: 40px;width: 32px;float: left;">
          <img src="images/top-6.png"/>
      </div>
      <div class = "head-4" title="订单提示"  >
          <img src="images/top-4.png"/>
      </div>
      <div style="height: 40px;width: 32px;float: left;">
          <img src="images/top-6.png"/>
      </div>
      <div class ="head-4"  title="退出" >
          <a href="/eshop/logout.jsp" target="_top"><img src="images/top-5.png"/></a>
      </div>
  </div>
  <div id="top-43">
      <div class="top-431">
          <h4>常用菜单</h4>
          <ul>
              <li><a href="">商品列表</a></li><br>
              <li><a href="">添加商品</a></li><br>
              <li><a href="">订单列表</a></li><br>
              <li><a href="">用户管理</a></li><br>
          </ul>
      </div>
  </div>

  </body>
</html>
