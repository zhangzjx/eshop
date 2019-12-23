<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单详情-已完成</title>

    <link rel="stylesheet" href="css/orderManage.css">
    <link rel="stylesheet" href="./Admin/css/orderManage.css">

</head>
<body>
<!--系统首页-->
<div class="main-top"><span style="margin-left: 30px">订单详情</span></div>
<!--主要内容-->
<div class="order-main">
    <!--订单状态-->
    <div class="details-top">
        <div class="details-top-item item-margin-right">
            <img src="img/已完成.png" class="details-top-img" title="这是一张照片"><br><br>
            <strong>提交订单</strong>
        </div>
        <div class="details-top-border"></div>
        <div class="details-top-item item-margin-right">
            <img src="img/已完成.png" class="details-top-img" title="这是一张照片"><br><br>
            <strong>支付订单</strong>
        </div>
        <div class="details-top-border"></div>
        <div class="details-top-item  item-margin-right">
            <img src="img/已完成.png" class="details-top-img" title="这是一张照片"><br><br>
            <strong>平台发货</strong>
        </div>
        <div class="details-top-border"></div>
        <div class="details-top-item">
            <img src="img/已完成.png" class="details-top-img" title="这是一张照片"><br><br>
            <strong>确认收货</strong>
        </div>
        <div class="details-top-border"></div>
        <div class="details-top-item">
            <img src="img/已完成.png" class="details-top-img" title="这是一张照片"><br><br>
            <strong>完成评价</strong>
        </div>

    </div>
    <!--订单信息-->
    <div class="order-details">
        <div class="details-1"><span style="margin-left: 10px;float: left;">当前订单状态：已完成</span>
            <div  class="details-item" style="margin-left: 601px" onclick="gkd()">
                订单追踪
            </div>
            <div  class="details-item">
                发送站内信
            </div>
            <div class="details-item">
                备注订单
            </div>
        </div>
        <!--基本信息-->
        <div class="details-2">
            基本信息<br>
            <div  class="details-item-2 font-details top-border left-border">订单编号</div>
            <div  class="details-item-2 font-details top-border">发货单流水号</div>
            <div  class="details-item-2 font-details top-border">用户账号</div>
            <div  class="details-item-2 font-details top-border">支付方式</div>
            <div  class="details-item-2 font-details top-border">订单类型</div>
            <div  class="details-item-2 font-details top-border">配送方式</div>
            <div  class="details-item-2 left-border">${map.oid}</div>
            <div  class="details-item-2">未发货</div>
            <div  class="details-item-2">${map.phone}</div>
            <div  class="details-item-2">支付宝</div>
            <div  class="details-item-2">普通订单</div>
            <div  class="details-item-2">未发货</div>
            <!--******************-->
            <div  class="details-item-2 font-details left-border">物流单号</div>
            <div  class="details-item-2 font-details ">自动确认收货时间</div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2 left-border" >未发货</div>
            <div  class="details-item-2">15天</div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
            <div  class="details-item-2"></div>
        </div>
        <!--收货人信息-->
        <div class="details-3">
            收货人信息<br>
            <div class="details-item-3 font-details left-border top-border">收货人</div>
            <div class="details-item-3 font-details top-border">手机号码</div>
            <div class="details-item-3 font-details top-border">收货地址</div>
            <div class="details-item-3 left-border">${map.receiver}</div>
            <div class="details-item-3">${map.aphone}</div>
            <div class="details-item-3">${map.addressname}</div>
        </div>
        <!--商品信息-->
        <div class="details-4">
            商品信息<br>
            <div class="details-item-4 font-details left-border top-border">商品图片</div>
            <div class="details-item-4 font-details top-border" style="width: 242px">商品名称</div>
            <div class="details-item-4 font-details top-border">价格/货号</div>
            <div class="details-item-4 font-details top-border">属性</div>
            <div class="details-item-4 font-details top-border">数量</div>
            <div class="details-item-4 font-details top-border">小计</div>
            <div class="details-item-4 left-border">商品图片</div>
            <div class="details-item-4" style="width: 242px">${map.goods_name}</div>
            <div class="details-item-4">${map.id}</div>
            <div class="details-item-4">属性</div>
            <div class="details-item-4 ">${map.buycount}</div>
            <div class="details-item-4">${map.total}</div>
        </div>
        <!--费用信息-->
        <div class="details-5">
            费用信息<br>
            <div  class="details-item-2 font-details top-border left-border">商品合计
            </div>
            <div  class="details-item-2 font-details top-border">运费</div>
            <div  class="details-item-2 font-details top-border">优惠券</div>
            <div  class="details-item-2 font-details top-border">活动优惠</div>
            <div  class="details-item-2 font-details top-border">订单总金额</div>
            <div  class="details-item-2 font-details top-border">应付款金额</div>
            <div  class="details-item-2 left-border">${map.totalprice}</div>
            <div  class="details-item-2">0</div>
            <div  class="details-item-2">0</div>
            <div  class="details-item-2">0</div>
            <div  class="details-item-2">${map.totalprice}</div>
            <div  class="details-item-2">${map.totalprice}</div>
        </div>
    </div>

</div>
</body>
</html>
