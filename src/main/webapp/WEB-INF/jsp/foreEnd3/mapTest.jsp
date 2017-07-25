<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/24
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/mapUtil.js" type="text/javascript"></script>
</head>
<body>
    <div id="container" style="width:500px; height:300px"></div>
    <input id="sss"><button onclick="go()"></button>
    <script>
        var postion = {};
        postion.city = "沈阳市"
        /*postion.x = 123;
        postion.y = 123;*/
        postion.input = "sss";
        postion.container = "container";
        postion.rollback = function (rs) {
            //alert(rs);
        }
        var myMap = new myMap(postion);
        myMap.init();

    </script>
</body>
</html>
