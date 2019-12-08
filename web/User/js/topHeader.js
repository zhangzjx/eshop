/******顶部js代码******/
function myCart() {
    let uid=$("#uid").val();
    //把id传入后台调用servlet
    if (uid==null||uid==""){
        alert("请先登录")
    }else {
        document.location = "../UserServlet?action=myCart&uid="+uid;
    }
};
function myOrder() {
    let uid=$("#uid").val();
    //把id传入后台调用servlet
    if (uid==null||uid==""){
        alert("请先登录")
    }else {
        document.location = "../UserServlet?action=findAllOrder&uid="+uid;
    }
};