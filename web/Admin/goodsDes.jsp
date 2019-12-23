<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/6
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    System.out.println("输出内容"+request.getAttribute("map"));
%>
<html>
<head>
    <title>Title</title>

    <style type="text/css">
        .main-top{
            width: 1100px;
            height: 50px;
            font-size: 16px;
            line-height:50px;
            margin: 0 auto;
            border: solid 1px #dddddd;
            background-color: #d2d2d2;
        }
        form{
            width: 100%;
            height: 390px;
            text-align:center;
            float: left;
        }
        input,select{margin-top:2px;}
        #table_b{
            width: 100%;
            border: solid 1px #dddddd;
            margin-top: 20px;
            float: left;
        }
        .table_b_1{
            width: 99%;
            height: 40px;
            line-height:40px;
            text-align: center;
            font-family: 微软雅黑;
            font-size: 10pt;
            border-bottom: solid 1px #dddddd;
            border-left: solid 1px #dddddd;
            background-color: rgba(222,209,165,0.45);

        }
        .table_b_2{
            width: 99%;
            height: 40px;
            line-height:40px;
            text-align: center;
            font-family: 微软雅黑;
            font-size: 10pt;
            border: solid 1px #dddddd;
            /**对超出容器的部分强制截取，高度不确定则换行*/
            overflow: hidden;
            /**显示省略符号来代表被修剪的文本。*/
            text-overflow: ellipsis;
            /**禁止换行*/
            white-space: nowrap;
        }

        .table_b_3{
            width: 100%;
            height: 400px;
            margin: 30px 0 100px 0;
        }
        .res-button{
            width: 60px;
            height: 30px;
        }
        .desImg{
            width: 300px;
            height: 300px;
            border: #1aa5fb solid 1px;
            margin: 30px 400px;
        }

    </style>
</head>
<body >
    <div class="main-top"><span style="margin-left: 10px">商品详情</span></div>
    <div style="width: 1100px;margin: 30px auto 800px;">
        <p style="font-size:20px;text-align:center;">商品详情</p>
        <form  id="myForm" action="ProductServlet?action=updateBeforeGo" method="post" name="creator">
            <input type="hidden" name="id" value=${map.id}>
            <div id="table_b" >
                <div style="float: left;width: 15%;margin-left: 30%">
                    <div class="table_b_1" >商品编号:</div>
                    <div class="table_b_1" >商品名称:</div>
                    <div class="table_b_1" >商品分类:</div>
                    <div class="table_b_1" >商品单价:</div>
                    <div class="table_b_1" >关键词:</div>
                    <div class="table_b_1" >SKU库存:</div>
                </div>
                <div style="float: left;width: 25%;">
                    <div class="table_b_2">${map.gid}</div>
                    <div class="table_b_2" title=${map.goods_name}>${map.goods_name}</div>
                    <div class="table_b_2">${map.Categories_two}</div>
                    <div class="table_b_2">${map.price}</div>
                    <div class="table_b_2">${map.skey}</div>
                    <div class="table_b_2">${map.sku}</div>
                </div>
            </div>
            <div class="table_b_3" >
                <img src="/uploadImg/${map.img}" title="图片" class="desImg"/>
                <br>

                <input type="submit" value="修改" class="res-button"/>
            </div>
        </form>
    </div>
</body>
<script>

</script>
</html>
