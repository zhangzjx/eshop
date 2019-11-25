<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    session.invalidate();
    response.sendRedirect("loginUser.html");
%>

