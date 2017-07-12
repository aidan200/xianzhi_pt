<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/weixin/sentInfo" method="post">
    <input type="text" readonly="readonly" value="1" name="total_fee"><br><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
