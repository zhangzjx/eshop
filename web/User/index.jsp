<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,com.zhang.dom.* "%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="com.zhang.utils.NetWork" %>
<%@ page import="com.zhang.dom.User" %>
<html>
<head>
    <title>商城首页</title>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/topFoot.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <script type="text/javascript" src="js/lunBo.js"></script>
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/toHide.js"></script>
    <script type="application/javascript">
        /******页面根据时间间隔刷新
         function refresh()
         {
            history.go(0);
        }
         setTimeout("refresh()",1000);
         *****/
        /*****加载后页面只刷新一次******/
        function refresh(){
            if(location.href.indexOf("?reload=true")<0){
                location.href+="?reload=true";
            }
        }
        setTimeout("refresh()",500);
        $(document).ready(function(){
            // 页面加载后任何需要执行的js特效
            let name = $("#name").val();
            if(name != null&&name != ""){
                $("#logout").show()
            }else {
                $("#lg").show();
            }
            //显示首页商品
            $.post("${pageContext.request.contextPath}/UserServlet",{
                action:"indexGoods",
            },)
        });
    </script>
    <style type="text/css" >
    </style>
</head>
<body>
<input type="hidden" id="name" value="${name }">
<%//根据IP统计访问人数
    String ip = new NetWork().getIP(request);
    Set<String> set = (Set<String>) application.getAttribute("ips");
    if (set == null) {
        set = new HashSet<>();
    }
    set.add(ip);
    application.setAttribute("ips", set);
%>
<%String data = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());%>
<%//统计在线人数
    ArrayList<User>  userList =  (ArrayList<User>)request.getServletContext().getAttribute("userList");
    if(userList!=null){
        for(User u:userList){
            String iu = u.getFirsttTimeString();
%>
<!--第一次登录时间：<%//=iu %>-->
<%}} %>
<div class="index-top">
    您是第<%=set.size()%>个访问者，访问IP为:<%=ip%>，本次访问时间:<%=data%>
    当前在线人数：${number}
</div>
<!-- 头部栏位 -->
<!--页面顶部-->
<div class="all-header">
    <!--顶部导航-->
    <div style="width: 100%; background-color: #EEE5DE;">
        <div class="top">
            <div class="top-left">
                <ul class="ul-left">
                    <li >青橙欢迎您！</li>
                    <li>
                        <span id = "lg" style="display:none;">请<a href="loginUser.html">登录</a>&nbsp;<a href="register.jsp">注册</a></span>
                        <span id = "logout" style="display:none;"><a href="logout.jsp">退出</a></span>
                    </li>
                </ul>
            </div>
            <div class="top-right">
                <ul class="ul-right">
                    <li ><span><a href="#"  onclick="myOrder()">我的订单</a></span></li>
                    <li><span><a href=""  target="_blank" onclick="myCart()">我的购物车</a></span></li>
                    <li><span><a href="myInf.jsp" target="_blank">我的青橙</a></span></li>
                    <li><span>青橙会员</span></li>
                    <li><span>企业采购</span></li>
                    <li><span>关注青橙</span></li>
                    <li><span><a href="cooperation.html" target="_blank">合作招商</a></span></li>
                    <li ><span><a href="shoplogin.html" target="_blank">商家后台</a></span></li>
                    <li><span>网站导航</span></li>
                </ul>
            </div>
        </div>
    </div>
    <!--头部-->
    <div class="head">
        <a class="logo" title="青橙" href="index.jsp"></a>
        <div class="search">
            <form action="" class="">
                <!--searchAutoComplete-->
                <div class="input-bor">
                    <input type="text" id="autocomplete" class="el-input" />
                    <button class="el-button" type="button">搜索</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="all">
    <!-- 商品分类导航 -->
    <div class="typeGoods" id="typeGoods">
        <!--顶部-->
        <div class="type-top">
            <div class="type-ton-main">
                <div class="type-main" style="width: 200px;">
                    <span>全部商品分类</span>
                </div>
                <div class="type-main">
                    <span>服装城</span>
                </div>
                <div class="type-main">
                    <span>美妆馆</span>
                </div>
                <div class="type-main">
                    <span>全球购</span>
                </div>
            </div>
        </div>
        <!--左部-->
        <div class="type-left">
            <div class="left-item" id="item-1"><span>家用电器</span></div>
            <div class="left-item" id="item-2"><span>手机/运营商/数码</span></div>
            <div class="left-item" id="item-3"><span>电脑/办公</span></div>
            <div class="left-item" id="item-4"><span>男装/女装/童装/内衣</span></div>
            <div class="left-item" id="item-5"><span>美妆/个护清洁/宠物</span></div>
            <div class="left-item" id="item-6"><span>女鞋/男鞋/箱包</span></div>
            <div class="left-item" id="item-7"><span>运动/户外/乐器</span></div>
            <div class="left-item" id="item-8"><span>眼镜/珠宝/钟表</span></div>
            <div class="left-item" id="item-9"><span>美食/生鲜/零食</span></div>
            <div class="left-item" id="item-10"><span>母婴/玩具</span></div>
        </div>
        <!--中部轮播图-->
        <div class="type-center" id="type-center">
            <div class="box">
                <div class="box-1">
                    <ul>
                        <li><img src="img/1.jpg" alt="这里是第一张图片"></img></li>
                        <li><img src="img/2.jpg" alt="这里是第二张图片"></img></li>
                        <li><img src="img/3.jpg" alt="这里是第三张图片"></img></li>
                        <li><img src="img/4.jpg" alt="这里是第四张图片"></img></li>
                        <li><img src="img/5.jpg" alt="这里是第五张图片"></img></li>
                        <li><img src="img/6.jpg" alt="这里是第六张图片"></img></li>
                        <li><img src="img/7.jpg" alt="这里是第七张图片"></img></li>
                    </ul>
                </div>
                <div class="box-2">
                    <ul></ul>
                </div>
                <div class="box-3">
                    <span class="prev"> < </span>
                    <span class="next"> > </span>
                </div>
            </div>
        </div>
        <!--左侧菜单详情-->
        <div class="type-center-2" id="type-center-2">
            <div class="left-item-1" id="left-item-1">
                <div class="item-info">
                    <div class="item-info-list-one">电视&nbsp;&nbsp;></div>
                    <div class="item-info-list">超薄电视</div><div class="item-info-list">全面屏电视</div>
                    <div class="item-info-list">OLED电视</div><div class="item-info-list">4K超清电视</div>
                    <div class="item-info-list">55英寸</div><div class="item-info-list">65英寸</div>
                    <div class="item-info-list">65英寸</div>

                </div>
                <div class="item-info">
                    <div class="item-info-list-one">空调&nbsp;&nbsp;></div>
                    <div class="item-info-list">空调挂机</div><div class="item-info-list">空调柜机</div>
                    <div class="item-info-list">中央空调</div><div class="item-info-list">变频空调</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">洗衣机&nbsp;&nbsp;></div>
                    <div class="item-info-list">滚筒洗衣机</div><div class="item-info-list">洗烘一体机</div>
                    <div class="item-info-list">波轮洗衣机</div><div class="item-info-list">烘干机</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">冰箱&nbsp;&nbsp;></div>
                    <div class="item-info-list">多门</div><div class="item-info-list">对开门</div>
                    <div class="item-info-list">双门</div><div class="item-info-list">三门</div>
                    <div class="item-info-list">冷柜/冰吧</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-2">
                <div class="item-info">
                    <div class="item-info-list-one">手机通信&nbsp;&nbsp;></div>
                    <div class="item-info-list">手机</div><div class="item-info-list">游戏手机</div>
                    <div class="item-info-list">老人机</div><div class="item-info-list">对讲机</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">运营商&nbsp;&nbsp;></div>
                    <div class="item-info-list">中国电信</div><div class="item-info-list">中国移动</div>
                    <div class="item-info-list">中国联通</div><div class="item-info-list">合约机</div>
                    <div class="item-info-list">手机卡</div><div class="item-info-list">宽带</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">手机配件&nbsp;&nbsp;></div>
                    <div class="item-info-list">手机壳</div><div class="item-info-list">贴膜</div>
                    <div class="item-info-list">手机存储卡</div><div class="item-info-list">数据线</div>
                    <div class="item-info-list">充电器</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">摄影摄像&nbsp;&nbsp;></div>
                    <div class="item-info-list">数码相机</div><div class="item-info-list">微单单反</div>
                    <div class="item-info-list">单反相机</div><div class="item-info-list">拍立得</div>
                    <div class="item-info-list">运动相机</div><div class="item-info-list">摄像机</div>
                    <div class="item-info-list">镜头</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-3">
                <div class="item-info">
                    <div class="item-info-list-one">电脑整机&nbsp;&nbsp;></div>
                    <div class="item-info-list">笔记本</div><div class="item-info-list">游戏本</div>
                    <div class="item-info-list">台式机</div><div class="item-info-list">平板电脑</div>
                    <div class="item-info-list">一体机</div><div class="item-info-list">服务器/工作站</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">电脑配件&nbsp;&nbsp;></div>
                    <div class="item-info-list">显示器</div><div class="item-info-list">CPU</div>
                    <div class="item-info-list">主板</div><div class="item-info-list">显卡</div>
                    <div class="item-info-list">硬盘</div><div class="item-info-list">机箱</div>
                    <div class="item-info-list">内存</div><div class="item-info-list">电源</div>
                    <div class="item-info-list">散热器</div><div class="item-info-list">固态硬盘</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">外设产品&nbsp;&nbsp;></div>
                    <div class="item-info-list">网络仪表仪器</div><div class="item-info-list">线缆</div>
                    <div class="item-info-list">键鼠套装</div><div class="item-info-list">U盘</div>
                    <div class="item-info-list">移动硬盘</div><div class="item-info-list">鼠标垫</div>
                    <div class="item-info-list">摄像头</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">网络设备&nbsp;&nbsp;></div>
                    <div class="item-info-list">路由器</div><div class="item-info-list">交换机</div>
                    <div class="item-info-list">网络机顶盒</div><div class="item-info-list">三门</div>
                    <div class="item-info-list">网络存储</div><div class="item-info-list">网卡</div>
                    <div class="item-info-list">网线</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-4">
                <div class="item-info">
                    <div class="item-info-list-one">女装&nbsp;&nbsp;></div>
                    <div class="item-info-list">当季热卖</div><div class="item-info-list">新品推荐</div>
                    <div class="item-info-list">连衣裙</div><div class="item-info-list">羽绒服</div>
                    <div class="item-info-list">针织衫</div><div class="item-info-list">毛呢大衣</div>
                    <div class="item-info-list">牛仔裤</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">男装&nbsp;&nbsp;></div>
                    <div class="item-info-list">空调挂机</div><div class="item-info-list">空调柜机</div>
                    <div class="item-info-list">中央空调</div><div class="item-info-list">变频空调</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-5">
                <div class="item-info">
                    <div class="item-info-list-one">电视&nbsp;&nbsp;></div>
                    <div class="item-info-list">超薄电视</div><div class="item-info-list">全面屏电视</div>
                    <div class="item-info-list">OLED电视</div><div class="item-info-list">4K超清电视</div>
                    <div class="item-info-list">55英寸</div><div class="item-info-list">65英寸</div>
                    <div class="item-info-list">65英寸</div>

                </div>
                <div class="item-info">
                    <div class="item-info-list-one">空调&nbsp;&nbsp;></div>
                    <div class="item-info-list">空调挂机</div><div class="item-info-list">空调柜机</div>
                    <div class="item-info-list">中央空调</div><div class="item-info-list">变频空调</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">洗衣机&nbsp;&nbsp;></div>
                    <div class="item-info-list">滚筒洗衣机</div><div class="item-info-list">洗烘一体机</div>
                    <div class="item-info-list">波轮洗衣机</div><div class="item-info-list">烘干机</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">冰箱&nbsp;&nbsp;></div>
                    <div class="item-info-list">多门</div><div class="item-info-list">对开门</div>
                    <div class="item-info-list">双门</div><div class="item-info-list">三门</div>
                    <div class="item-info-list">冷柜/冰吧</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-6">
                <div class="item-info">
                    <div class="item-info-list-one">手机通信&nbsp;&nbsp;></div>
                    <div class="item-info-list">手机</div><div class="item-info-list">游戏手机</div>
                    <div class="item-info-list">老人机</div><div class="item-info-list">对讲机</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">运营商&nbsp;&nbsp;></div>
                    <div class="item-info-list">中国电信</div><div class="item-info-list">中国移动</div>
                    <div class="item-info-list">中国联通</div><div class="item-info-list">合约机</div>
                    <div class="item-info-list">手机卡</div><div class="item-info-list">宽带</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">手机配件&nbsp;&nbsp;></div>
                    <div class="item-info-list">手机壳</div><div class="item-info-list">贴膜</div>
                    <div class="item-info-list">手机存储卡</div><div class="item-info-list">数据线</div>
                    <div class="item-info-list">充电器</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">摄影摄像&nbsp;&nbsp;></div>
                    <div class="item-info-list">数码相机</div><div class="item-info-list">微单单反</div>
                    <div class="item-info-list">单反相机</div><div class="item-info-list">拍立得</div>
                    <div class="item-info-list">运动相机</div><div class="item-info-list">摄像机</div>
                    <div class="item-info-list">镜头</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-7">
                <div class="item-info">
                    <div class="item-info-list-one">电脑整机&nbsp;&nbsp;></div>
                    <div class="item-info-list">笔记本</div><div class="item-info-list">游戏本</div>
                    <div class="item-info-list">台式机</div><div class="item-info-list">平板电脑</div>
                    <div class="item-info-list">一体机</div><div class="item-info-list">服务器/工作站</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">电脑配件&nbsp;&nbsp;></div>
                    <div class="item-info-list">显示器</div><div class="item-info-list">CPU</div>
                    <div class="item-info-list">主板</div><div class="item-info-list">显卡</div>
                    <div class="item-info-list">硬盘</div><div class="item-info-list">机箱</div>
                    <div class="item-info-list">内存</div><div class="item-info-list">电源</div>
                    <div class="item-info-list">散热器</div><div class="item-info-list">固态硬盘</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">外设产品&nbsp;&nbsp;></div>
                    <div class="item-info-list">网络仪表仪器</div><div class="item-info-list">线缆</div>
                    <div class="item-info-list">键鼠套装</div><div class="item-info-list">U盘</div>
                    <div class="item-info-list">移动硬盘</div><div class="item-info-list">鼠标垫</div>
                    <div class="item-info-list">摄像头</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">网络设备&nbsp;&nbsp;></div>
                    <div class="item-info-list">路由器</div><div class="item-info-list">交换机</div>
                    <div class="item-info-list">网络机顶盒</div><div class="item-info-list">三门</div>
                    <div class="item-info-list">网络存储</div><div class="item-info-list">网卡</div>
                    <div class="item-info-list">网线</div>
                </div>
            </div>
            <div class="left-item-1" id="left-item-8">
                <div class="item-info">
                    <div class="item-info-list-one">女装&nbsp;&nbsp;></div>
                    <div class="item-info-list">当季热卖</div><div class="item-info-list">新品推荐</div>
                    <div class="item-info-list">连衣裙</div><div class="item-info-list">羽绒服</div>
                    <div class="item-info-list">针织衫</div><div class="item-info-list">毛呢大衣</div>
                    <div class="item-info-list">牛仔裤</div>
                </div>
                <div class="item-info">
                    <div class="item-info-list-one">男装&nbsp;&nbsp;></div>
                    <div class="item-info-list">空调挂机</div><div class="item-info-list">空调柜机</div>
                    <div class="item-info-list">中央空调</div><div class="item-info-list">变频空调</div>
                </div>
            </div>
        </div>
        <div class="type-right">
            <div class="right-top">
                <div style="width: 260px;height:30px;margin:0 5px;line-height: 30px;border-bottom: #dfe4ed solid 1px">
                    <span>商城快报</span><a href="#"><span style="margin-left: 110px;">更多</span>&nbsp;></a>
                </div>
                <div style="margin-top: 10px;font-size: 10pt;">
                    <a href="#" ><span style="margin-left: 15px;">【HOT】小米含泪清库存</span><br></a>
                    <a href="#" ><span style="margin-left: 15px;">【热门】iPhone大降价</span><br></a>
                    <a href="#" ><span style="margin-left: 15px;">【推荐】小米含泪清库存</span><br></a>
                    <a href="#" > <span style="margin-left: 15px;">【热评】小米含泪清库存</span><br></a>
                </div>
            </div>
            <div class="right-central">
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/话费.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    话费
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/飞机.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    机票
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/电影票.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    电影票
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/游戏.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    游戏
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/彩票.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    彩票
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/加油站.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    加油站
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/酒店.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    酒店
                </div>
                <div class="right-central-list">
                    <div style="width: 50px;height: 40px;margin:10px 0 0 8px;">
                        <a href="#" ><img src="img/火车票.png" style="width: 35px;height: 35px;"></a>
                    </div>
                    火车票
                </div>
            </div>
            <div class="right-bottom" title="广告">
                <a href="#" ><img src="img/guanggao.jpg" style="width: 236px;height: 98px;"></a>
            </div>
        </div>
    </div>
    ${user.uid }
    <!-- 商品内容 -->
    <div style="width: 100%">
        <!--热门商品-->
        <div class="goods-content">
            <div class="goods-change">
                <div class="change-main" style="margin-left: 422px;">
                    <a href="#">
                        <img src="img/hot.png" style="width: 36px;height: 36px;margin:5px 0 0 17px;">
                        热卖排行</a>
                </div>
                <div class="change-main" >
                    <a href="#">
                        <img src="img/hot.png" style="width: 36px;height: 36px;margin:5px 0 0 17px;">
                        特价排行</a>
                </div>
                <div class="change-main" onclick="allGoods()">
                    <a href="#">
                    <img src="img/hot.png" style="width: 36px;height: 36px;margin:5px 0 0 17px;">
                        新品排行</a>
                </div>
            </div>
            <div class="content-all">
                <c:forEach var="record" items="${myIndex}">
                    <div class="content">
                        <form id="addForm" action="../UserServlet?action=addCart" method="post">
                            <!--查看商品详情-->
                            <input type="hidden" id="uid" name="uid" value=${user.uid}>
                            <input type="hidden" name="id" value=${record.id}>
                            <a href="<c:url value='/UserServlet?action=findOne&id=${record.id}'/>" >
                                <div class="goods-img">
                                    <!--out/artifacts/eshop/WEB-INF/img/ip.jpg-->
                                    <img src="/eshop/web/WEB-INF/img/${record.img}" style="width: 195px;height: 200px;">
                                </div>
                                <div class="goods-inf">
                                    <!--<img src="/img/${record.content}" style="width: 195px;height: 200px;">-->
                                        ${record.content}
                                </div>
                            </a>
                            <div class="goods-bottom">
                                <input type="hidden" name="quantity" value="1">
                                <input type="hidden" name="price" value=${record.price}>
                                <div class="goods-price" ><span>￥</span>${record.price}</div>
                                <input type="submit" class="add-cart" value="" title="加购" >
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!--猜你喜欢-->
        <div class="goods-favorite">
            <div class="favorite-top">
                <h3>猜你喜欢</h3>
            </div>
            <div class="favorite-main">
                <div class="favorite-main-list">
                    ${user}
                </div>
                <div class="favorite-main-list">
                    商品信息
                </div>
                <div class="favorite-main-list">
                    商品信息
                </div>
                <div class="favorite-main-list">
                    商品信息
                </div>
                <div class="favorite-main-list">
                    商品信息
                </div>
                <div class="favorite-main-list">
                    商品信息
                </div>
            </div>
        </div>
    </div>

</div>
<!--底部内容-->
<div class="bottom-foot">
    <div class="bottom">
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">购物指南</div><br>
            <div class="bottom-main-list">购物流程</div>
            <div class="bottom-main-list">会员介绍</div>
            <div class="bottom-main-list">生活旅行/团购</div>
            <div class="bottom-main-list">常见问题</div>
            <div class="bottom-main-list">购物指南</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">配送方式</div><br>
            <div class="bottom-main-list">上门自提</div>
            <div class="bottom-main-list">211限时达</div>
            <div class="bottom-main-list">配送服务查询</div>
            <div class="bottom-main-list">配送费收取标准</div>
            <div class="bottom-main-list">海外配送</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">支付方式</div><br>
            <div class="bottom-main-list">货到付款</div>
            <div class="bottom-main-list">在线支付</div>
            <div class="bottom-main-list">分期付款</div>
            <div class="bottom-main-list">邮局汇款</div>
            <div class="bottom-main-list">公司转账</div>

        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">售后服务</div><br>
            <div class="bottom-main-list">售后政策</div>
            <div class="bottom-main-list">价格保护</div>
            <div class="bottom-main-list">退款说明</div>
            <div class="bottom-main-list">返修/退换货</div>
            <div class="bottom-main-list">取消订单</div>
        </div>
        <div class="bottom-main">
            <div class="bottom-main-list" style="font-size: 13pt;font-weight: bold;">特色服务</div><br>
            <div class="bottom-main-list">夺宝岛</div>
            <div class="bottom-main-list">DIY装机</div>
            <div class="bottom-main-list">延保服务</div>
            <div class="bottom-main-list">品优购E卡</div>
            <div class="bottom-main-list">品优购通信</div>
        </div>
    </div>
    <div class="foot">
        <ul>
            <li>关于我们</li>
            <li>联系我们</li>
            <li>联系客服</li>
            <li>商家入驻</li>
            <li>营销中心</li>
            <li>手机品优购</li>
            <li>销售联盟</li>
            <li>品优购社区</li>
        </ul>
        <div >地址：北京市昌平区 邮编：100096 电话：400-400-4000 传真：010-82935100</div>
        <div >京ICP备08001421号京公网安备110108007702
        </div>
    </div>
</div>
<script type="application/javascript">

    $(".add-cart").click(function () {
        alert("已加入购物车");
        $("#addForm").submit();
    });
    function allGoods() {
        //把id传入后台调用servlet
        document.location = "../UserServlet?action=allGoods&sort=desc&sortKey=price";
    }
</script>
</html>