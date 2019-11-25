$(document).ready(function() {
    $("#head-43").hide();
    $("#top-3,#top-31").mouseout(function () {
        $("#top-43").hide();
    });
    /**
    $("#top-3,#top-31").mouseover(function () {
        $("#top-43").show();
    });
*/
    $("#box-12 p").hide();
    $("#box-12").mouseover(function(){
        $("#box-12 p").show();
    });
    $("#box-12").mouseout(function(){
        $("#box-12 p").hide();
    });

    $("#box-13 p").hide();
    $("#box-13").mouseover(function(){
        $("#box-13 p").show();
    });
    $("#box-13").mouseout(function(){
        $("#box-13 p").hide();
    });

    $("#an").click(function(){
        $("#video").show();
    });

    $("#fotter a").css("color","white");

    $("#image").hide(4000);
    $("#image-1").show(2000);
    $("#cb").slideDown(4000);

});