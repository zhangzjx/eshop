$(document).ready(function() {

    $("#item-1,#left-item-1").mouseover(function () {
        $("#left-item-1").show();
        //隐藏后仍然占有空间，显示空白
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-1,#left-item-1").mouseout(function () {
        $("#left-item-1").hide();
        //显示DIV
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-2,#left-item-2").mouseover(function () {
        $("#left-item-2").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-2,#left-item-2").mouseout(function () {
        $("#left-item-2").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-3,#left-item-3").mouseover(function () {
        $("#left-item-3").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-3,#left-item-3").mouseout(function () {
        $("#left-item-3").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-4,#left-item-4").mouseover(function () {
        $("#left-item-4").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-4,#left-item-4").mouseout(function () {
        $("#left-item-4").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-5,#left-item-5").mouseover(function () {
        $("#left-item-5").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-5,#left-item-5").mouseout(function () {
        $("#left-item-5").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-6,#left-item-6").mouseover(function () {
        $("#left-item-6").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-6,#left-item-6").mouseout(function () {
        $("#left-item-6").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });
    
    $("#item-7,#left-item-7").mouseover(function () {
        $("#left-item-7").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-7,#left-item-7").mouseout(function () {
        $("#left-item-7").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

    $("#item-8,#left-item-8").mouseover(function () {
        $("#left-item-8").show();
        document.getElementById("type-center").style.visibility = "hidden";
    });
    $("#item-8,#left-item-8").mouseout(function () {
        $("#left-item-8").hide();
        document.getElementById("type-center").style.visibility = "visible";
    });

})