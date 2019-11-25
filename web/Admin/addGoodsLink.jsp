<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/7
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/SecondaryLinkage.js"></script>
    <style type="text/css">
        .main-top{
            width: 100%;
            height: 60px;
            font-size: 16px;
            line-height:50px;
            border: solid 1px #dddddd;
            background-color: #d2d2d2;
            float: left;
        }
        form{
            height: 450px;
            border: solid 1px #d2d2d2;
            text-align:center;
        }
        input,select{margin-top:2px;}
        #table_a{
            width: 20%;
            height: 120px;
            text-align: right;
            margin-left: 25%;
            margin-right: 5%;
            float: left;
        }
        #table_b{
            width: 30%;
            height: 120px;
            text-align: left;
            float: left;
        }
        .table_a_1{
            width: 100%;
            height: 45px;
            line-height:45px;
        }
        .table_b_1{
            width: 100%;
            height: 45px;
            line-height:45px;
        }
        .table_a_3{
            width: 100%;
            height: 10px;
            margin-top: 20%;
            line-height:30px;
        }
        .el-input{
            width: 50%;
            height: 35px;
            margin-top: 5px;
        }
        .go-button{
            width: 160px;
            height: 30px;
            background: url(img/u44.png);
            margin-top: 10px;
        }
    </style>
    <script type="application/javascript">
        //验证表单合法性
        function go(){
            const categories = $("#categories").val();
            const categoriesTwo = $("#categories_two").val();

            if(categories==""||categories==null|| categoriesTwo==""||categoriesTwo==null){
                alert("表单内容不完整");
                $(this).next('input').focus();
                return false;
            }
            $("#myForm").submit();
        }
    </script>

</head>
<body onLoad="init()">

<div style="margin: 0 20px;">
    <div class="main-top"><span style="margin-left: 10px">添加商品</span></div>
    <p style="font-size:20px;text-align:center;">选择商品分类</p>
    <form id="myForm" action="addGoodsInf.jsp" method="post" name="creator">

        <div style="width: 100%;">
            <div id="table_a">
                <div class="table_a_1" >商品一级分类:</div>
                <div class="table_a_1" >商品二级分类:</div>
                <div class="table_a_1" >商品品牌:</div>
            </div>
            <div id="table_b">
                <div class="table_b_1" ><select  id="categories" name="categories"
                                                 onChange="select()" class="el-input" ></select>
                </div>
                <div class="table_b_1" ><select  id="categories_two" name="categories_two"
                                                 onChange="select()" class="el-input" ></select>
                </div>
                <div class="table_b_1" >
                    <select  id="brand" name="brand" class="el-input" >
                        <option value="1">Apple</option>
                        <option value="2">三星</option>
                        <option value="3">小米</option>
                        <option value="4">微软</option>
                        <option value="5">华为</option>
                        <option value="6">OPPO</option>
                        <option value="7">飞利浦</option>
                        <option value="8">格力</option>
                        <option value="9">海尔</option>

                </select>
                </div>
            </div>
        </div>
        <div class="table_a_3" >
            <a target="right"><input class="go-button" type="button" value="下一步，填写商品信息" onclick="go()"/></a>
        </div>
    </form>
</div>
</body>

</html>
