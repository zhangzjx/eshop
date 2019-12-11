<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/4
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/addBrand.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="js/SecondaryLinkage.js"></script>
    <style type="text/css">

        #imgPreview {
            width: 160px;
            height: 160px;
            margin: 10px auto 0px 0;
            border: 1px dashed black;
            text-align: center;
        }
        #prompt {
            width: 100%;
            height: 160px;
            text-align: center;
            position: relative;
        }
        #imgSpan {
            position: absolute;
            top: 60px;
            left: 50px;
        }
        .filepath {
            width: 100%;
            height: 100%;
            opacity: 0;
        }
        #img {
            height: 100%;
            width: 100%;
            display: none;
        }
        .go-button {
            width: 60px;
            height: 30px;
            margin: 180px 100px 0 0;
            background: url(img/u445.png);

        }
    </style>
    <script type="application/javascript">
        //验证表单合法性
        function go(){
            const brandName = $("#brand_name").val();
            const brandFirst = $("#brand_name").val();

            if(brandName==""||brandName==null||brandFirst==""||brandFirst==null){
                alert("表单内容不完整");
                $(this).next('input').focus();
                return false;
            }
            $("#myForm").submit();
        }
    </script>
</head>
<body onLoad="init()">

<div style="margin: 0px 20px;">
    <div class="main-top"><span style="margin-left: 10px">添加新品牌</span></div>

    <form  id="myForm" action="../PhotoServlet" method="post" enctype="multipart/form-data">

        <div id="table_a" >
            <div class="table_a_1" >*品牌名称：</div>
            <div class="table_a_2" ><input type="text" id="brand_name" name="brand_name" class="el-input"/></div>
            <div class="table_a_1" >品牌首字母：</div>
            <div class="table_a_2" ><input type="text" id="brand_first" name="brand_first" class="el-input"/> </div>
            <div class="table_a_1" >*品牌LOGO：</div>
            <div class="table_a_2">
                <span style="margin-right: 190px">仅支持上传JPG，JPEG，PNG格式图片</span>
                <div id="imgPreview">
                    <div id="prompt">
                        <span id="imgSpan">点击上传	</span>
                        <input  type="file" id="photo" name="photo" class="filepath" onchange="changePic(this)"
                                accept="image/jpg,image/jpeg,image/png"/>
                        <!--当vaule值改变时执行changepic函数，规定上传的文件只能是图片-->
                    </div>
                    <img src="#" id="img" />
                </div>
            </div>

            <div class="table_a_3" >
                <input type="submit" value="添加" class="go-button" /></div>
        </div>
    </form>
</div>
</body>
<script type="application/javascript">
    function changePic() {
        $("#prompt").css("display", "none");
        const reads = new FileReader();
        const f = document.getElementById('photo').files[0];
        reads.readAsDataURL(f);
        reads.onload = function(e) {
            document.getElementById('img').src = this.result;
            $("#img").css("display", "block");
        };
    }
</script>
</html>
