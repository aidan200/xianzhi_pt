<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/10
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE  html>
<head>
    <title>找回密码</title>
    <jsp:include page="cssForeEnd.jsp"/>
</head>
<body class="bg3">
<div class="courses_box">
    <div class="container">
        <form class="login pas2" id="signupForm" method="post" action="${pageContext.request.contextPath}/XzRegister/getPassword.do">
            <p class="lead">密码找回</p>

            <div class="form-group">
                <input id="username" autocomplete="off" type="text" name="username" class="required form-control"
                       placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <input autocomplete="off" type="email" class="required form-control" placeholder="请输入邮箱"
                       name="email">
            </div>
            <div class="form-group">
                <input type="submit" class="pas btn btn-primary" name="submit" value="确认">

            </div>

        </form>
    </div>
</div>


</body>
</html>
