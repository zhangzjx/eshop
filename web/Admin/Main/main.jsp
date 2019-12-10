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
    <base href="">
    
    <title>body</title>
    <style type="text/css">
    body {background:url("images/00.jpg")  no-repeat;background-size:100% 100%;}</style>
    </head>
  
  <body >
    <h5>你好，${username }！</h5>
  </body>
</html>
