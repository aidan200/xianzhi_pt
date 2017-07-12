<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>支付测试页面</title>
    <jsp:include page="cssJsHeader.jsp"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/AliPay/returnResult.do">
    <br>
    qrLogonId:<input type="text" name="qrLogonId"><br><br>
    qrStatus:<input type="text" name="qrStatus"><br><br>
    succ:<input type="text" name="succ"><br><br>
    订单号:<input type="text" name="WIDout_trade_no"><br><br>
    交易号:<input type="text" name="WIDtrade_no"><br><br>
    <input type="submit" value="提交">&nbsp;&nbsp;&nbsp;<input type="reset" value="重置">
</form>
</body>
</html>
