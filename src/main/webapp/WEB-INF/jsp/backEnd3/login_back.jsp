<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/18
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="dist.jsp"/>
</head>

<body class="login_bg">
<div class="login_all">
    <div class="login_center">
        <form action="">
            <h3 class="login_h3">登 录</h3>
            <div>
                <input type="text" placeholder="请输入用户名" class="login_input"/></div>
            <div>
                <input type="password" placeholder="请输入密码" class="login_input"/></div>
            <button type="submit" class="login_button">确定</button>
        </form>

    </div>
</div>
</body>
</html>
