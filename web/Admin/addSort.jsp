<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加分类</title>

    <link rel="stylesheet" href="css/goodsManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <style type="text/css">
        /*************公用样式*************/
        a:link {color: #000000;
            text-transform:none;
            /**清除下划线*/
            text-decoration:none;}
        a:hover {color: #7cc815; text-decoration:none;}
        a:visited {text-decoration:none;}
        a:active {text-decoration:underline;}
        *{
            font-family: 微软雅黑;
        }
        .main-top{
            width: 1100px;
            height: 50px;
            font-size: 16px;
            line-height:50px;
            margin: 0 auto;
            border: solid 1px #dddddd;
            background-color: #d2d2d2;
        }
        .goods-main{
            width: 1100px;
            margin: 30px auto 100px;
        }
        /*************商品分类*************/
        .goods-main-top{
            width: 1100px;
            height: 50px;
            font-size: 10pt;
            line-height: 50px;
            background-color: rgba(222,209,165,0.45);
        }

        /****主要内容***goods-mainInf*/
        .sortInf{
            width: 1100px;
            height: 400px;
            font-size: 10pt;
            margin: 0 auto;
            border: #d4d4d4 solid 1px;
        }
        .account-img{
            width: 150px;
            height: 150px;
            position: absolute;
            margin: 70px 0 0 475px;
            border: cornflowerblue solid 1px;
        }
        .account-left{
            width: 150px;
            height: 300px;
            text-align: right;
            margin-left: 250px;
            float: left;
        }
        .account-right{
            width: 430px;
            height: 300px;
            padding-left: 20px;

            float: left;
        }
        .left-list{
            height: 50px;
            line-height: 50px;
        }
        .right-list{
            width: 300px;
            height: 30px;
            line-height: 30px;
            margin: 10px 0;
        }

    </style>
</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">添加分类</span></div>
<!--主要内容-->
<div class="goods-main">
    <!--顶部-->
    <div class="goods-main-top">
        <span style="margin-left: 10px;float: left;">添加分类</span>
    </div>
    <div class="sortInf" style="">
        <div style="margin-top: 100px">
            <div class="account-left">
                <div class="left-list">*分类名称</div>
                <div class="left-list">*上级分类</div>
                <div class="left-list" style="margin-top: 16px">*选择模板</div>
            </div>
            <div class="account-right">
                <input type="text" name="name" class="right-list"/>
                <select class="right-list" >
                    <c:forEach var="record" items="${sort}">
                        <option value="${record.sort_id}">${record.sort_name}</option>
                    </c:forEach>
                </select >
                <br>
                不选择分类默认为顶级分类
                <select class="right-list">
                    <option value=""></option>
                </select >
                <br>
                <input type="submit" value="提交" >
            </div>
        </div>
    </div>

</div>

</body>
</html>
