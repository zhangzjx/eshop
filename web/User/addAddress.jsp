<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加地址</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/topFoot.css">

</head>
<body>
<input type="hidden" id="name" value="${name }">

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

<div style="width: 1200px;margin: 0 auto;">
    <fieldset>
        <legend style="padding-left: 200px;padding-right: 220px ">添加地址</legend>
        <form id="myForm" action="../UserServlet?action=addAddress&status=1" method="post">
            <input type="hidden" name="uid" id="uid" value=${user.uid }>
            <label for="addr-show">您选择的是：
                <input type="text"  name="a" value="" id="addr-show">
                <input type="hidden"  value="" id="addr-show2">
            </label>
            <br/>

            <!--省份选择-->
            <select id="prov" onchange="showCity(this)">
                <option>=请选择省份=</option>

            </select>

            <!--城市选择-->
            <select id="city" onchange="showCountry(this)">
                <option>=请选择城市=</option>
            </select>

            <!--县区选择-->
            <select id="country" onchange="selecCountry(this)">
                <option>=请选择县区=</option>
            </select>

            <!--详细地址及电话-->
            <div style="margin: 10px 0;"><span style="width: 100px; ">详细地址</span>
                <input type="text" name="b" style="width: 200px;height: 25px;margin:0 0 10px 20px;">
            </div>
            <div style="margin: 10px 0;">收件人姓名
                <input type="text" name="receiver"  style="width: 200px;height: 25px;margin:0 0 10px 4px;">
            </div>
            <div style="margin: 10px 0;">联系电话
                <input type="text" name="phone" style="width: 200px;height: 25px;margin:0 0 10px 20px;">
            </div>
            <button type="button" class="btn met1" onClick="showAddr()" style="margin-left: 150px">确定</button>
            <button type="button" class="btn met1" onclick="go()">提交</button>
        </form>
    </fieldset>
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

<script src="js/city.js"></script>

<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/method01.js"></script>
<script type="text/javascript" src="js/topHeader.js"></script>

<script type="application/javascript">
    $(document).ready(function(){
        // 页面加载后任何需要执行的js特效
        let name = $("#name").val();
        if(name != null&&name != ""){
            $("#logout").show()
        }else {
            $("#lg").show();
        }
    })
    function go(){
        const a = document.getElementsByName("a").value;
        const b = document.getElementsByName("b").value;
        const  receiver = document.getElementsByName("receiver").value;
        const phone = document.getElementsByName("phone").value;
        if(phone==""||phone==null||a==""||a==null||
            b==""||b==null||receiver=="" ||receiver==null){
            alert("请填写完整内容");
            $(this).next('input').focus();
            return false;
        }
        $("#myForm").submit();
    }
</script>

</body>
</html>