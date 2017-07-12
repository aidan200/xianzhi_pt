<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>微信支付测试</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/WeChat/toPay.do" method="post">
    <input type="text" readonly="readonly" value="wx3fde7f58c03d3ab4" name="appid"><br><br>
    <input type="text" readonly="readonly" value="aaa" name="describe"><br><br>
    <input type="text" readonly="readonly" value="1" name="money"><br><br>
    <input type="text" readonly="readonly" value="aaa" name="payType"><br><br>
    <input type="submit" value="微信充值">
</form>
</body>
</html>
