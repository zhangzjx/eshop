<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<html >
<head>
    <meta charset="UTF-8">
    <title>测试</title>
    <link rel="stylesheet" href="css/magnifier.css">
    <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>

</head>
<body>
<h2>省市区三级菜单联动</h2>
请选择：
<select name='province'></select>
<select name='city'></select>
<select name='area'></select>

</body>

<script type="text/javascript">
    $(function() {
        // 初始化省市区
        initAddress();
        // 更改省份后的操作
        $("select[name='province']").change(function() {

            const provCode = $("select[name='province']").val();
            getCity(provCode);

        });

        // 更改城市后的操作
        $("select[name='city']").change(function() {
            const cityCode = $("select[name='city']").val();
            getArea(cityCode);
        });

    });

    function initAddress() {

        let firstProvCode;
        // ajax请求所有省份
        $.get("/airticleMgr/address", {
            method : "initProvince"
        }, function(data) {

            $.each(data, function(i, d) {
                $("select[name='province']").append(
                    "<option value='"+d.provinceCode+"'>" + d.provinceName
                    + "</option>");
            });

            // 获取第一个省份的code
            firstProvCode = data[0].provinceCode;
            // 根据第一个省份code获取对应城市列表
            getCity(firstProvCode);
        }, 'json');

    }

    //获取对应城市列表（里面包括获取第一个城市的区县列表）
    function getCity(provCode) {

        var firstCityCode;

        // ajax请求所有市级单位
        $.get("/airticleMgr/address", {
            method : "getCity",
            provCode : provCode
        }, function(data) {

            // 先清空城市下拉框
            $("select[name='city']").empty();

            $.each(data, function(i, d) {
                $("select[name='city']").append(
                    "<option value='"+d.cityCode+"'>" + d.cityName
                    + "</option>");
            });

            // 获取第一个城市的code
            firstCityCode = data[0].cityCode;
            // 根据第一个城市code获取对应区县列表
            getArea(firstCityCode);

        }, 'json');
    }

    function getArea(cityCode) {

        // ajax请求所有区县单位
        $.get("/airticleMgr/address", {
            method : "getArea",
            cityCode : cityCode
        }, function(data) {

            // 先清空区县下拉框
            $("select[name='area']").empty();
            $.each(data, function(i, d) {
                $("select[name='area']").append(
                    "<option value='"+d.areaCode+"'>" + d.areaName
                    + "</option>");
            });
        }, 'json');
    }

</script>
</html>
