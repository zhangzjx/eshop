<% Object Request = null; %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/7
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String cat = request.getParameter("categories");
    String catTwo = request.getParameter("categories_two");
    String brand = request.getParameter("brand");

%>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/SecondaryLinkage.js"></script>
    <style type="text/css">
        .w-e-text-container {
            height: 120px !important; /*!important是重点，因为原div是行内样式设置的高度300px*/
        }
        form{
            height: 450px;
            border: solid 1px #d2d2d2;
            text-align:center;
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
            width: 20%;
            height: 245px;
            text-align: right;
            margin-left: 25%;
            margin-right: 5%;
            float: left;
        }
        #table_b{
            width: 30%;
            height: 245px;
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
            height: 30px;
            margin-top: 5px;
            line-height:30px;
        }
        .el-input{
            width: 50%;
            height: 35px;
            margin-top: 7px;
        }
        .go-button{
            width: 60px;
            height: 30px;
            background: url(img/u445.png);
            margin-top: 10px;
        }
    </style>

</head>
<body onLoad="init()">

<div style="margin: 0px 20px;">
    <div class="main-top"><span style="margin-left: 10px">添加商品</span></div>
    <p style="font-size:20px;text-align:center;">添加商品信息</p>
    <form  id="myForm" action="../ProductServlet?action=addGoods" method="post" name="creator">

        <input type="hidden" name="categories" value=<%=cat%>>
        <input type="hidden" name="categories_two" value=<%=catTwo%>>
        <input type="hidden" name="bid" value=<%=brand%>>
        <div style="width: 100%;">
        <div id="table_a">
            <div class="table_a_1" >商品名称:</div>
            <div class="table_a_1" >商品单价:</div>
            <div class="table_a_1" >关键词:</div>
            <div class="table_a_1" >SKU库存:</div>
            <div class="table_a_1" >商品介绍:</div>

        </div>
        <div id="table_b">
            <div class="table_b_1" ><input type="text" id="goods_name" name="goods_name" class="el-input"/> </div>
            <div class="table_b_1" ><input type="text" id="price" name="price" class="el-input"/> </div>
            <div class="table_b_1" ><input type="text" id="skey" name="skey" class="el-input"/> </div>
            <div class="table_b_1" ><input type="text" id="sku" name="sku" class="el-input"/> </div>

        </div>
        </div>
        <div id="div1" style="width: 55%; margin:0 auto; ">
        </div>
        <input type="hidden" name="content" id="editor_txt">
        <div class="table_a_3" >
            <input type="button" value="添加" class="go-button"  onclick="go()"/>
        </div>

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

    //验证表单合法性
    function go(){
        const goodsName = $("#goods_name").val();
        const price = $("#price").val();
        const skey = $("#skey").val();
        const sku = $("#sku").val();
        if(goodsName==""||goodsName==null||price==""||price==null||
            skey==""||skey==null||sku==""||sku==null){
            alert("表单内容不完整");
            $(this).next('input').focus();
            return false;
        }
        $("#myForm").submit();
    }
</script>
</html>
