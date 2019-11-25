<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<%
    String role=(String)session.getAttribute("role");
    String url="";
    if(role!=null){
        if(!role.equals("管理员")){
            response.sendRedirect("../login.jsp");
            return;
        }
    }else{
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页面</title>
</head>

<frameset rows="10%,*" frameborder="no" border="0" framespacing="0">
    <frame src="Main/top.jsp" name="top" noresize="noresize"/>
    <frameset cols="14%,86%" frameborder="no" border="0" framespacing="0" >
        <frame src="Main/manageLeftFirst.jsp" noresize="noresize" name="left"/>
        <frame src="Main/main.jsp" noresize="noresize" name="right"/>
    </frameset>
</frameset>

</html>
