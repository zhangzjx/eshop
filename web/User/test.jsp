<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html >
<head>
    <meta charset="UTF-8">
    <title>测试</title>
    <link rel="stylesheet" href="css/magnifier.css.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<body >

<div class="magnifier" id="magnifier1">
    <div class="magnifier-container">
        <div class="images-cover"></div>
        <!--当前图片显示容器-->
        <div class="move-view"></div>
        <!--跟随鼠标移动的盒子-->
    </div>
    <div class="magnifier-assembly">
        <div class="magnifier-btn">
            <span class="magnifier-btn-left">&lt;</span>
            <span class="magnifier-btn-right">&gt;</span>
        </div>
        <!--按钮组-->
        <div class="magnifier-line">
            <ul class="clearfix animation03">
                <li>
                    <div class="small-img">
                        <img src="images/1.png" />
                    </div>
                </li>
                <li>
                    <div class="small-img">
                        <img src="images/2.png" />
                    </div>
                </li>
                <li>
                    <div class="small-img">
                        <img src="images/3.png" />
                    </div>
                </li>
                <li>
                    <div class="small-img">
                        <img src="images/4.png" />
                    </div>
                </li>
                <li>
                    <div class="small-img">
                        <img src="images/1.png" />
                    </div>
                </li>
            </ul>
        </div>
        <!--缩略图-->
    </div>
    <div class="magnifier-view"></div>
    <!--经过放大的图片显示容器-->
</div>
</body>
<script src="js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/magnifier.js"></script>
<script type="text/javascript">
    $(function() {

        const magnifierConfig = {
            magnifier: "#magnifier1",//最外层的大容器
            width: 500,//承载容器宽
            height: 500,//承载容器高
            moveWidth: null,//如果设置了移动盒子的宽度，则不计算缩放比例
            zoom: 5//缩放比例
        };

        const _magnifier = magnifier(magnifierConfig);

        /*magnifier的内置函数调用*/
        /*
            //设置magnifier函数的index属性
            _magnifier.setIndex(1);

            //重新载入主图,根据magnifier函数的index属性
            _magnifier.eqImg();
        */
    });
</script>
</html>
