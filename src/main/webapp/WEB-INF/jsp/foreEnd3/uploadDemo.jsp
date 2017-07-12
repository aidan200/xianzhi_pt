<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/6
  Time: 17:09
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
    <form>
        <input type="file" name="file">
        <span></span><br>
        <input type="button" value="go" onclick="uploadImg()"><br>
        <span id="info"></span><br>
        <img id="iimg" style="width: 200px;height: 200px">
        <span id="progress"></span><br>
        <span id="result"></span>
    </form>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/fileUpload.js"></script>
</body>
</html>
