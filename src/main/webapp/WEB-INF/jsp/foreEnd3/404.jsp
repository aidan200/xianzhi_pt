<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/15
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>404</title>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #fc6866">
<div style="text-align: center;position: relative">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/404.png" alt="" class="four_img">
    <div class="four_out">
        <p>页面不知道去哪了</p>
        <a href="###" class="btn-3" onClick="javascript:history.back(-1)">返回</a>
    </div>
</div>
</body>
</html>
