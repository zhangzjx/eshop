/*********order界面**********/
/*********地址管理**********/
    //Web小功能1——jquery实现一个按钮两个功能（触发不同事件）

function change(){
    let switcher = false;
    if(switcher = !switcher){
        //第一次点击
        $("#itxt").removeAttr("disabled");
        document.getElementById("change").innerHTML = "保存";
    }else{
        //第二次点击
        let address = $("#itxt").val();
        let aid = $("#aid").val();
        let uid = $("#uid").val();
        //修改地址
        $.post("${pageContext.request.contextPath}/UserServlet",{
            action:"changeAddress",
            address:address,
            aid:aid,
            uid:uid,
        },)
        document.getElementById("change").innerHTML = "修改";
        $("#itxt").attr("disabled","true");
    }
};
function allAddress() {
    let uid = $("#uid").val();
    $.post("${pageContext.request.contextPath}/UserServlet",{
        action:"findAddress",
        uid:uid,
    },)
};