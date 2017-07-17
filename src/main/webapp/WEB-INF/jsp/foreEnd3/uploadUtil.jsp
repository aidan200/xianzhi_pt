<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/6
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/fileUpload.css">
</head>
<body>
<form id="aaaa"></form>
    <div id="test" style="width: 300px;height: 300px;background: red;">
    </div>
        <input id="ggg">
<div id="test2" style="width: 300px;height: 300px;background: red">
</div>
<input id="ggg2">
<div id="test3" style="width: 300px;height: 300px;background: red">
</div>
<input id="ggg3">
        <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/uploadUtil.js"></script>
        <script>
            var test = document.getElementById("test");
            var ggg = document.getElementById("ggg");
            var uu =  new uploadUtil(test,"http://localhost:8080/go/upload/img",ggg);
            uu.init();
            var test2 = document.getElementById("test2");
            var ggg2 = document.getElementById("ggg2");
            var uu2 =  new uploadUtil(test2,"http://localhost:8080/go/upload/img",ggg2);
            uu2.init();
            var test3 = document.getElementById("test3");
            var ggg3 = document.getElementById("ggg3");
            var uu3 =  new uploadUtil(test3,"http://localhost:8080/go/upload/img",ggg3);
            uu3.init();
        </script>
</body>
</html>
