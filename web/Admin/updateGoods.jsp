<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/31
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/updateGoods.css" charset="utf-8">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/SecondaryLinkage.js"></script>
    <style type="text/css">
        .w-e-text-container {
            height: 120px !important; /*!important是重点，因为原div是行内样式设置的高度300px*/
        }
        form{
            width: 100%;

            text-align:center;
            float: left;
        }
        input,select{margin-top:2px;}
        .main-top{
            width: 100%;
            height: 60px;
            font-size: 16px;
            line-height:50px;
            border: solid 1px #dddddd;
            background-color: #d2d2d2;
            float: left;
        }
        #table_a{
            width: 100%;
            height: 365px;
            float: left;
        }
        .table_a_1{
            width: 29.8%;
            height: 45px;
            line-height:45px;
            border-bottom: solid 1px;
            border-left: solid 1px;
            float: left;
        }
        .table_a_2{
            width: 70%;
            height: 45px;
            line-height:45px;
            border-bottom: solid 1px;
            border-left: solid 1px;
            float: left;
        }
        .table_a_3{
            width: 100%;
            height: 30px;
            margin-top: 30px;
            line-height:30px;
        }
        .el-input{
            width: 50%;
            height: 35px;
            margin-top: 5px;
        }

        .go-button{
            width: 60px;
            height: 30px;
            background: url(img/u445.png);
        }
    </style>
    <script type="application/javascript">
        $("#text1").hide();
        //验证表单合法性
        function go(){
            const price = $("#price").val();
            const key = $("#skey").val();
            const sku = $("#sku").val();
            if(price==""||price==null||
                key==""||key==null||sku==""||sku==null){
                alert("表单内容不完整");
                $(this).next('input').focus();
                return false;
            }
            //$("#myForm").submit();
        }
    </script>
</head>
<body onLoad="init()">

<div style="margin: 0px 20px;">
    <div class="main-top"><span style="margin-left: 10px">修改商品</span></div>
    <p style="font-size:20px;text-align:center;">修改商品</p>
    <form  id="myForm" action="<c:url value='/ProductServlet?action=updateGo'/>" method="post" >

        <input type="hidden" name="id" value=${before.id}>
        <div id="table_a" style="border:1px solid;">
            <div class="table_a_1" >商品品牌:</div>
            <div class="table_a_2" >
                <input  type="text" name="name" readonly="readonly"
                        class="el-input" value=${before.name}>
            </div>
            <div class="table_a_1" >商品名称:</div>
            <div class="table_a_2" >
                <input  type="text"  name="goods_name" readonly="readonly"
                        class="el-input" value=${before.goods_name}>
            </div>
            <div class="table_a_1" >商品一级分类:</div>
            <div class="table_a_2" >
                <input  type="text" name="categories" readonly="readonly"
                        class="el-input" value=${before.Categories}>
            </div>
            <div class="table_a_1" >商品二级分类:</div>
            <div class="table_a_2" >
                <input  type="text" name="categories_two" readonly="readonly"
                        class="el-input" value=${before.Categories_two}>
            </div>
            <div class="table_a_1" >商品单价:</div>
            <div class="table_a_2" >
                <input type="text" name="price" class="el-input" value=${before.price}>
            </div>
            <div class="table_a_1" >关键词:</div>
            <div class="table_a_2" >
                <input type="text"  name="skey" class="el-input" value=${before.skey}>
            </div>
            <div class="table_a_1" >SKU库存:</div>
            <div class="table_a_2" >
                <input type="text" name="sku" class="el-input" value=${before.sku}>
            </div>
            <div class="table_a_3" >商品详情:</div>
        </div>

        <div id="div1" style="width: 55%; margin:10px auto; ">
            ${before.content}
        </div>
        <div class="table_a_3" >
            <input type="submit" value="修改" class="go-button" onclick="go()"/>
        </div>
        <input type="hidden" name="content" id="editor_txt">
    </form>
</div>
</body>
<script type="text/javascript" src="js/wangEditor.js"></script>
<script type="text/javascript">
    const E = window.wangEditor;
    const editor = new E('#div1');
    const $editor_txt = $('#editor_txt');
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $editor_txt.val(html)
    }

    editor.customConfig.menus=[
        'head', // 标题
        'bold', // 粗体 
        'fontSize', // 字号
        'fontName', // 字体
        'italic', // 斜体
        'underline', // 下划线 
        'strikeThrough', // 删除线
        //'foreColor', // 文字颜色
        //'backColor', // 背景颜色
        'link', // 插入链接 
        'list', // 列表 
        'justify', // 对齐方式
        //'quote', // 引用
        'emoticon', // 表情
        'image', // 插入图片 
        //'table', // 表格
        'video', // 插入视频 
        'code', // 插入代码 
        'undo', // 撤销
        'redo' // 重复
    ]

    editor.create()
    // 初始化 textarea 的值
    $editor_txt.val(editor.txt.html())
</script>
</html>
