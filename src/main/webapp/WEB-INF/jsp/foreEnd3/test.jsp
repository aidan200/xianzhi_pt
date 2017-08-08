<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/14
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>测试</title>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/test.js"></script>
</head>
<body>
<label>输入textarea</label><br>
<form id="sendState" action="${pageContext.request.contextPath}/PostionSend/selCollect.do">
    sendState: <input type="text" name="sendState"><br>
    <input type="submit"><br>
</form>

</body>
</html>
