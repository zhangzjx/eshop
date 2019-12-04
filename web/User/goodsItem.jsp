<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情页</title>
    <link  rel="stylesheet" href="css/goodsItem.css">
    <link rel="stylesheet" href="css/topFoot.css">
    <script type="text/javascript" src="js/topHeader.js"></script>
    <link rel="stylesheet" type="text/css" href="css/magnifier.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <style type="text/css">

    </style>
</head>
<body>
<input type="hidden" id="name" value="${name }">
<input type="hidden" id="uid" value="${user.uid }">
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
                    <li ><span><a href="centerOrder.jsp" >我的订单</a></span></li>
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
<div class="body-main">

    <!--图片及参数-->
    <div class="main-top">
        <div class="main-top-left">
            <!--放大镜效果-->
        </div>
        <div class="main-top-right">
            <div class="top-right-item" style="font-family: 微软雅黑">${map.goods_name}</div>
            <div class="top-right-item"><span>价格￥</span>${map.price}</div>
            <div class="top-right-item"><span>价格￥</span></div>
            <div class="top-right-item"><span>价格￥</span></div>
            <div class="top-right-item"><span>价格￥</span></div>
            <div class="top-right-item"><span>加入购物车</span></div>
        </div>
    </div>

    <!--商品详情及参数，评价，推荐-->
    <div class="main-inf">
        <div class="main-inf-left">
            <div id="change-left" class="change-left"  style="font-size: 10pt;text-align: center">
                <a href="javascript:void(0)" >
                    <h5>相关分类</h5>
                </a>
            </div>
            <div id="change-right" class="change-right" style="font-size: 10pt;text-align: center">
                <a href="javascript:void(0)" >
                    <h5>品牌推荐</h5>
                </a>
            </div>
            <div id="sort" class="tab-pane  active">
                <div class="part-list">
                    <li><a href="#">手机</a></li>
                    <li><a href="#">手机壳</a></li>
                    <li><a href="#">内存卡</a></li>
                    <li><a href="#">Iphone配件</a></li>
                    <li><a href="#">贴膜</a></li>
                    <li><a href="#">手机耳机</a></li>
                    <li><a href="#">移动电源</a></li>
                    <li><a href="#">平板电脑</a></li>
                </div>
                <div class="part-item">
                    <div class="item-list">
                        <div class="p-img">
                            <img style="width: 200px;height: 100px;" src="img/part01.png" />
                        </div>
                        <div class="attr">
                            <em>Apple苹果iPhone 6s (A1699)</em>
                        </div>
                        <div class="price">
                            <strong>
                                <em>¥</em>
                                <i>6088.00</i>
                            </strong>
                        </div>
                        <div class="operate">
                            <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                        </div>
                    </div>
                </div>
            </div>
            <div id="recommend" class="tab-pane">
                推荐品牌
            </div>
        </div>
        <div class="main-inf-right">
            <div class="change-inf">
                <div id="change-first" class="inf-item"  style="font-size: 10pt;text-align: center">
                    <a href="javascript:void(0)" >
                        <h5>商品介绍</h5>
                    </a>
                </div>
                <div id="change-two" class="inf-item"  style="font-size: 10pt;text-align: center">
                    <a href="javascript:void(0)" >
                        <h5>规格与包装</h5>
                    </a>
                </div>
                <div id="change-three" class="inf-item"  style="font-size: 10pt;text-align: center">
                    <a href="javascript:void(0)" >
                        <h5>商品评价</h5>
                    </a>
                </div>
            </div>
            <div id="one" class="tab-pane active">
                <div  class="change-inf-main">
                    <ul class="goods-intro">
                        <li>分辨率：1920*1080(FHD)</li>
                        <li>后置摄像头：1200万像素</li>
                        <li>前置摄像头：500万像素</li>
                        <li>核 数：其他</li>
                        <li>频 率：以官网信息为准</li>
                        <li>品牌： Apple</li>
                        <li>商品名称：APPLEiPhone 6s Plus</li>
                        <li>商品编号：1861098</li>
                        <li>商品毛重：0.51kg</li>
                        <li>商品产地：中国大陆</li>
                        <li>热点：指纹识别，Apple Pay，金属机身，拍照神器</li>
                        <li>系统：苹果（IOS）</li>
                        <li>像素：1000-1600万</li>
                        <li>机身内存：64GB</li>
                    </ul>
                    <div class="intro-detail">
                        <img style="width: 960px" src="img/intro01.png" />
                        <img style="width: 960px" src="img/intro02.png" />
                        <img style="width: 960px" src="img/intro03.png" />
                    </div>
                </div>
            </div>
            <div id="two" class="tab-pane">
                <h5>规格与包装</h5>
            </div>
            <div id="three" class="tab-pane">
                <h5>售后评价</h5>
            </div>

        </div>
    </div>

    <!--占位-->
<div style="height: 500px;width: 1200px;"></div>

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


</body>
<script type="text/javascript" src="js/magnifier.js"></script>
<script type="text/javascript">
    $(".change-left").click(function () {
        document.getElementById('recommend').className = "tab-pane";
        document.getElementById('sort').className = "tab-pane active";
        document.getElementById('change-left').className = "change-borderTlr";
        document.getElementById('change-right').className = "change-borderAll";
    });
    $(".change-right").click(function () {
        document.getElementById('sort').className = "tab-pane";
        document.getElementById('recommend').className = "tab-pane active";
        document.getElementById('change-right').className = "change-borderTlr";
        document.getElementById('change-left').className = "change-borderAll";
    });

    $("#change-first").click(function () {
        document.getElementById('two').className = "tab-pane";
        document.getElementById('three').className = "tab-pane";
        document.getElementById('one').className = "tab-pane active";
    });
    $("#change-two").click(function () {
        document.getElementById('one').className = "tab-pane";
        document.getElementById('three').className = "tab-pane";
        document.getElementById('two').className = "tab-pane active";

    });
    $("#change-three").click(function () {
        document.getElementById('one').className = "tab-pane";
        document.getElementById('two').className = "tab-pane";
        document.getElementById('three').className = "tab-pane active";
    });

</script>
</html>
