<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>goodList</title>
    <link rel="stylesheet" href="css/goodsManage.css">
    <link rel="stylesheet" href="./Admin/css/goodsManage.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="css/link.css" charset="utf-8">

</head>
<body>

<div class="main-top"><span style="margin-left: 10px">商品列表</span></div>
<!--商品列表-->
<div class="goods-main">
    <div class="serach_1">
        <form  action="<c:url value='/ProductServlet?action=searchGo'/>" method="post">
            <div class="serach_2"><span style="margin-left: 10px;float: left;">筛选查询</span>
                <input type="submit" class="le-button" value="查 询" style="  margin-left: 810px;">
                <input type="button" class="le-button" value="批量删除" onclick="delAll()">
            </div>
            <div class="serach_3">
                <span style="font-size: 12pt">输入搜索：</span>
                <input type="text" id="sValue" name="sValue" class="el-input" placeholder="商品名称/商品货号">
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
    <div id="goods-list-top" >
        <div class="top-item" style="width: 9%;">
            <span>批量操作</span>
        </div>
        <div class="top-item">编号</div>
        <div class="top-item">商品名称</div>
        <div class="top-item">价格/货号</div>
        <div class="top-item">分类</div>
        <div class="top-item">品牌</div>
        <div class="top-item">SKU库存</div>
        <div class="top-item">销量</div>
        <div class="top-item">审核状态</div>
        <div class="top-item">操作</div>

        <c:forEach var="record" items="${myList.list}">
            <div class="top-item-2" style="width: 9%;">
                <input style="width: 60%;height: 20px;margin-top: 10px;" type="checkbox" name="course" value=${record.id} >
            </div>
            <div class="top-item-2">${record.gid}</div>
            <div class="top-item-2" title=${record.goods_name}>${record.goods_name}</div>
            <div class="top-item-2">${record.price}</div>
            <div class="top-item-2">${record.Categories_two}</div>
            <div class="top-item-2">${record.name}</div>
            <div class="top-item-2">${record.sku}</div>
            <div class="top-item-2">${record.sales}</div>
            <div class="top-item-2" style="line-height:25px">待审核<br><a href="">审核详情</a></div>
            <div class="top-item-2">
                <a href="<c:url value='/ProductServlet?action=findOne&id=${record.id}'/>" >查看</a>|
                <a href="<c:url value='/ProductServlet?action=updateBeforeGo&id=${record.id}'/>">修改</a>|
                <a onclick="javascript:return del()" href="<c:url value='/ProductServlet?action=deleteGo&id=${record.id}'/>" >删除</a>
            </div>
        </c:forEach>
    </div>

    <div class="pagination">
        <div style="width: 70%;text-align: left;margin-left: 20px;float: left">
            共找到${myList.totalSize}条记录，每页${myList.pageSize}条，共${myList.totalPage }页，当前第${myList.currentPage }页
        </div>
        <div style="float: left;width: 15%;">
            <!-- 首页 -->
            <c:choose>
                <c:when test="${myList.currentPage==1 }">首页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllGoods&currentPage=${myList.currentPage != 1 }'/>">首页</a>
                </c:otherwise>
            </c:choose>
            <!-- 上一页 -->
            <c:choose>
                <c:when test="${myList.currentPage==1 }">上一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllGoods&currentPage=${myList.currentPage-1 }'/>">上一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 下一页 -->
            <c:choose>
                <c:when test="${myList.currentPage==myList.totalPage }">下一页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllGoods&currentPage=${myList.currentPage+1 }'/>">下一页</a>
                </c:otherwise>
            </c:choose>
            <!-- 尾页 -->
            <c:choose>
                <c:when test="${myList.currentPage == myList.totalPage }">尾页
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/ProductServlet?action=findAllGoods&currentPage=${myList.totalPage }'/>">尾页</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div style="float: left">
            跳至<input  type="text" id="num" name="currentPage" style="height: 20px;width: 30px;">页
            <a href="#" onclick="gk()" >确定</a>
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
            if(ck[i].checked)
            {//编号字符串累加
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
            document.location = "ProductServlet?action=delGoMor&ids="+s;
        }
        //$("#delForm").submit().;
    }
</script>
</html>