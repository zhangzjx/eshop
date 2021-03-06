<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>BrandList</title>
    <link rel="stylesheet" href="css/goodsManage.css">
    <link rel="stylesheet" href="./Admin/css/goodsManage.css">
    <!--<link  rel="stylesheet" href="css/brandList.css" type="text/css"  charset="utf-8"/>-->
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <style type="text/css">
        .top-item-4{
            width: 15.7%;
            height: 60px;
            line-height:60px;
            text-align: center;
            font-family: 微软雅黑;
            font-size: 10pt;
            border-bottom: solid 1px #dddddd;
            border-left: solid 1px #dddddd;
            float: left;
            /**对超出容器的部分强制截取，高度不确定则换行*/
            overflow: hidden;
            /**显示省略符号来代表被修剪的文本。*/
            text-overflow: ellipsis;
            /**禁止换行*/
            white-space: nowrap;
        }
        .brandImg{
            width: 60px;
            height: 60px;
        }
    </style>

</head>
<body>

<div class="main-top"><span style="margin-left: 10px">品牌管理</span></div>
<!--商品品牌列表-->
<div class="goods-main">
    <div class="serach_1">
        <form  action="<c:url value='/ProductServlet'/>" method="post">
            <div class="serach_2"><span style="margin-left: 10px;float: left;">筛选查询</span>
                <input type="submit" class="le-button" value="查 询" style="  margin-left: 810px;">
                <input type="button" class="le-button" value="批量删除" onclick="delAll()">
            </div>
            <div class="serach_3">
                <span style="font-size: 12pt">输入搜索：</span>
                <input type="text" id="gid" name="gid" class="el-input" placeholder="品牌名称/关键词">
                <input type="hidden" name="action" value="searchGo"/>
            </div>
            <div class="serach_3">
                <span style="font-size: 12pt">条件：</span>
                <select id="sKey" name="sKey" class="el-select">
                    <option value="gid">商品货号</option>
                    <option value="goods_name">商品名称</option>
                    <option value="Categories_two">分类</option>
                </select>
            </div>
        </form>
    </div>
    <div id="brand-list-top" >
        <div class="top-item-3" style="width: 9.1%;">
            <span>批量操作</span>
        </div>
        <div class="top-item-3">编号</div>
        <div class="top-item-3" style="width: 27.5%;">品牌名称</div>
        <div class="top-item-3">品牌首字母</div>
        <div class="top-item-3">LOGO</div>
        <div class="top-item-3">操作</div>

        <c:forEach var="record" items="${myBrand.list}">
            <div class="top-item-4" style="width: 9.1%;">
                <input style="width: 60%;height: 20px;margin-top: 10px;" type="checkbox" name="course" value=${record.id} >
            </div>
            <div class="top-item-4">${record.id}</div>
            <div class="top-item-4" style="width: 27.5%;">${record.name}</div>
            <div class="top-item-4">${record.first}</div>
            <div class="top-item-4" title=${record.imgname}>
                <img src="/uploadImg/${record.imgname}" class="brandImg"></div>

            <div class="top-item-4">
                <a href="<c:url value='/ProductServlet?action=updateBeforeBr&id=${record.id}'/>">修改</a>|
                <a onclick="javascript:return del()" href="<c:url value='/ProductServlet?action=deleteBr&id=${record.id}'/>" >删除</a>
            </div>
        </c:forEach>
    </div>

    <div class="pagination">
        <div style="width: 70%;text-align: left;margin-left: 20px;float: left">
            共找到${myBrand.totalSize}条记录，每页${myBrand.pageSize}条，共${myBrand.totalPage }页，当前第${myBrand.currentPage }页
        </div>
        <div style="float: left;width: 15%;">
            <!-- 首页 -->
            <c:choose>
                <c:when test="${myBrand.currentPage==1 }">首页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllBrand&currentPage=${myBrand.currentPage != 1 }'/>">首页</a>
                </c:otherwise>
            </c:choose>
            <!-- 上一页 -->
            <c:choose>
                <c:when test="${myBrand.currentPage==1 }">上一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllBrand&currentPage=${myBrand.currentPage-1 }'/>">上一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 下一页 -->
            <c:choose>
                <c:when test="${myBrand.currentPage==myBrand.totalPage }">下一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllBrand&currentPage=${myBrand.currentPage+1 }'/>">下一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 尾页 -->
            <c:choose>
                <c:when test="${myBrand.currentPage == myBrand.totalPage }">尾页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllBrand&currentPage=${myBrand.totalPage }'/>">尾页</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div style="float: left">
            跳至<input  type="text" id="num" name="currentPage" style="height: 20px;width: 30px;">页
            <a href="#" onclick="gk()" >确定</a>
        </div>
    </div>
</div>

</div>
</body>
<script type="application/javascript">

    function gk() {
        const num = document.getElementById("num").value;
        document.location = "ProductServlet?action=findAllGoods&currentPage="+num;
    }
    function del() {
        const msg = "确定要删除吗？\n请确认！";
        if (confirm(msg)==true){
            alert("删除成功");
            return true;
        }else{
            return false;
        }
    }
    function delAll() {
        //获取所有名字为ck的编号组件
        const ck = document.getElementsByName("course");
        //ids字符串
        let s = "";
        //循环ck数组
        for(let i = 0 ; i < ck.length ; i ++)
        {   //如果被选择的选中
            if(ck[i].checked) {
                //编号字符串累加
                s+=ck[i].value+",";
            }
        }
        if (s==""){
            alert("请至少选择一条数据");
            return false;
        }
        //确认选项
        let ok = window.confirm("确定要删除["+s+"] 记录吗？");
        //如果确认选择
        if(ok) {
            alert("删除成功");
            //把ids传入后台调用servlet
            document.location = "ProductServlet?action=delBrMor&ids="+s;
        }
    }
</script>
</html>
