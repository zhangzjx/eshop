/*********order界面**********/
/******我的订单*******/
function myOrder(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderPay&uid="+uid;
    /*******8
    $.post("${pageContext.request.contextPath}/UserServlet",{
        action:"myOrder",
        uid:uid,
    },)
     ***********/
}
/******待付款*******/
function orderPay(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderPay&status=1&uid="+uid;
    /******
    $.post("${pageContext.request.contextPath}/UserServlet",{
        action:"orderEvaluate",
        uid:uid,
        status:4,
    },)
     ***********/

}
/******代发货*******/
function orderSend(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderPay&status=2&uid="+uid;
}
/******待收货*******/
function orderReceive(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderPay&status=3&uid="+uid;
}
/******待评价*******/
function orderEvaluate(){
    let uid = $("#uid").val();
    document.location = "../UserServlet?action=orderPay&status=4&uid="+uid;
}
/******地址管理*******/
//Web小功能1——jquery实现一个按钮两个功能（触发不同事件）

function allAddress() {
    let uid = $("#uid").val();
    $.post("${pageContext.request.contextPath}/UserServlet",{
        action:"findAddress",
        uid:uid,
    },)
};