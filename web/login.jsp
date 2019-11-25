<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/31
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <title>青橙</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 引入样式 -->
    <link rel="stylesheet" href="Admin/css/theme-chalk.css">
    <link rel="stylesheet" href="Admin/css/login_style.css">

</head>

<body class="mainBg">
<div id="app">
    <form  id="myForm" action="AdminServlet" method="post" class="loginForm clear" >
        <input type="hidden" name="action" value="login"/>
        <input type="hidden" id="role" name="role" value = "管理员"/>
        <div class="loginMain">
            <div class="loginlogo"></div>
            <div class="loginCon">
              <span class="el-form-item">
                <span class="userIcon"></span>
                <span class="el-input">
                   ${unerror}
                  <input id="username" name="username" class="el-input__inner" placeholder="管理员账号">
                </span>
              </span>
                <span class="el-form-item">
                <span class="pwdIcon"></span>
                <span class="el-input">
                  <input type="password" id="password" name="password" class="el-input__inner"  placeholder="密码">
                </span>
              </span>
            </div>
            <div class="loginBtn">
                <input type="submit" class="el-button el-button--primary" value="登录" onclick="login()">
            </div>
        </div>
    </form>

</div>
</body>
<!-- 引入组件库
<script src="js/vue.js"></script>
<script src="js/elementui.js"></script>-->
<script type="text/javascript">
    function login(){
        const username = document.getElementById("username").value;
        if(username==""|| username == null){
            alert("请输入登录名");
            username.focus;
            return false;
        }
        const password = document.getElementById("password").value;
        if(password==""||password==null){
            alert("请输入密码");
            password.focus;
            return false;
        }
    }
</script>
</html>