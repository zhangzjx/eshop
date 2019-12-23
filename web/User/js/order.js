/*********order界面**********/
/******我的订单*******/
function myOrder(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=findAllOrder&uid="+uid;
    /*******
    $.post("${pageContext.request.contextPath}/UserServlet",{
        action:"myOrder",
        uid:uid,
    },)
     ***********/
}
/******待付款*******/
function orderPay(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderStatus&status=1&uid="+uid;
}
/******代发货*******/
function orderSend(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderStatus&status=2&uid="+uid;
}
/******待收货*******/
function orderReceive(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderStatus&status=3&uid="+uid;
}
/******待评价*******/
function orderEvaluate(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderStatus&status=4&uid="+uid;
}
/******地址管理*******/
//Web小功能1——jquery实现一个按钮两个功能（触发不同事件）

function allAddress() {
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=findAddress&uid="+uid;
};