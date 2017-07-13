<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/13
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C" type="text/javascript"></script>
    <script>
        function init() {
            if (navigator.geolocation)
            {
                //获取当前位置，分别传入了成功和失败的两个函数
                navigator.geolocation.getCurrentPosition(showPosition,showError);
            }
            //如果不支持，则进行提示
            else{alert("Geolocation is not supported by this browser.");}
        }
        function showError(error) {
            //console.log("错误");
            //initMaps();
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    alert("定位失败,用户拒绝请求地理定位");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("定位失败,位置信息是不可用");
                    break;
                case error.TIMEOUT:
                    alert("定位失败,请求获取用户位置超时");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("定位失败,定位系统失效");
                    break;
            }
            initMaps(position);
        }

        function showPosition(position) {
            console.log("成功");
            initMaps(position);
        }
        var address;
        var map;
        var city = "沈阳市-和平区";
        function initMaps(position) {
            var x = 116.404;
            var y = 39.915
            if(position){
                x = position.coords.latitude
                y = position.coords.longitude;
            }
            map = new BMap.Map("container");
            map.centerAndZoom(city);
            map.addControl(new BMap.NavigationControl());
            map.enableScrollWheelZoom();
            //创建搜索服务对象
            var autocomplete = new BMap.Autocomplete({location:"沈阳市",input:"sss"});
            //搜索对象
            var localSearch = new BMap.LocalSearch(map);
            localSearch.setSearchCompleteCallback(function (searchResult) {
                var poi = searchResult.getPoi(0);
                setPoint(poi);
            });

            //搜索对象选中回调
            autocomplete.addEventListener('onconfirm',function (rs) {
                //alert(rs);
                address = document.getElementById("sss").value;
                console.log(address);
                map.setZoom(14);
                //触发坐标搜索
                localSearch.search(address);
            });
            //map点击事件
            map.addEventListener('click',function (rs) {
                setPoint(rs);
            })
        }
        //设置坐标
        function setPoint(rs) {
            console.log(rs);
            map.clearOverlays();//清空原来的标注
            var ppt = new BMap.Point(rs.point.lng, rs.point.lat);
            var marker = new BMap.Marker(ppt);  // 创建标注，为要查询的地址对应的经纬度
            map.addOverlay(marker);
            map.panTo(ppt);
        }

    </script>
</head>
<body>
    <div id="container" style="width:500px; height:300px"></div>
    <script>
        initMaps();
    </script>
    <input id="sss">
</body>
</html>
