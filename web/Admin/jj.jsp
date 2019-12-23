<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/14
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/xtiper.css">
    <script type="text/javascript" src="js/xtiper.js"></script>
</head>
<body>
<button class="xbutton" onclick="xtip.msg('这是一个短消息')">短消息</button>
<button class="xbutton" onclick="xtip.msg('The world!',{times:4})">停顿4秒</button>
<button class="xbutton" onclick="xtip.msg('顶部消息',{pos:'t'})">顶部消息</button>
<button class="xbutton" onclick="xtip.msg('底部消息',{pos:'b'})">底部消息</button>
<button class="xbutton" onclick="xtip.msg('带图标',{icon:'s'})">带图标</button>
<button class="xbutton" onclick="xtip.msg('白色风格',{icon:'e',type:'w'})">白色风格</button>
<button class="xbutton" onclick="xtip.msg('自定义图标',{icon:'css/img.png',type:'w'})">自定义图标</button>
</body>
</html>
