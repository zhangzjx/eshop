<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账户设置</title>
    <link rel="stylesheet" href="css/manageHome.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">账户设置</span></div>
<!--主要内容-->
<div class="manage-main">
    <div class="account-top">
        <span style="margin-left: 25px">账户设置</span>
    </div>
    <div class="account-main">
        <img src="img/" class="account-img">
        <div style="margin-top: 240px">
            <div class="account-left">
                <div class="left-list">*用户名</div>
                <div class="left-list">*Email</div>
                <div class="left-list">*旧密码</div>
                <div class="left-list">*新密码</div>
                <div class="left-list">*确认密码</div>
            </div>loginInformation
            <div class="account-right">
                <input type="text" name="name" class="right-list"/>
                <input type="text" name="email" class="right-list"/>
                <input type="password" name="oldPwd" class="right-list"/>
                <input type="password" name="newPwd" class="right-list"/>
                <input type="password" name="confirmPwd" class="right-list"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
