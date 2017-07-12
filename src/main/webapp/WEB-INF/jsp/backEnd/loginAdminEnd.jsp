<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/10
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<head>
    <title>后台登录</title>
    <jsp:include page="cssJsHeader.jsp"/>

    <script type="application/javascript" src="${pageContext.request.contextPath}/dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript">


    </script>

</head>
<body class="bg3">
<div class="courses_box">
    <div class="container">
        <form class="login pas2" id="signupForm" method="post"
              action="${pageContext.request.contextPath}/XzLogin/Login.emp">
            <p class="lead">管理员页面</p>
            <input id="newCount" type="hidden" name="newCount">
            <div class="form-group">
                <c:if test="${logEmpInfo!=null}">
                <span>${logEmpInfo}</span>
                </c:if>
                <input  autocomplete="off" type="text" class="required form-control"
                       placeholder="用户名" name="count"/>

            </div>
            <div class="form-group">
                <input autocomplete="off" type="password" class="required form-control"
                       placeholder="密码"
                          name="password"/>
            </div>
            <div class="form-group">
                <input type="submit" class="pas btn btn-primary" name="submit" value="登录">
            </div>

        </form>
    </div>
</div>


</body>
</html>
