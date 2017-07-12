<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>个人登录</title>
    <jsp:include page="cssForeEnd.jsp"/>
    <%--<link href="${pageContext.request.contextPath}/dist/foreEnd/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'/>--%>
    <%--<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->--%>
    <%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/bootstrap.min.js"></script>--%>
    <%--<!-- Custom Theme files -->--%>
    <%--<link href="${pageContext.request.contextPath}/dist/foreEnd/css/style.css" rel='stylesheet' type='text/css'/>--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jquery.countdown.css"/>--%>
    <%--<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>--%>
    <%--<!----font-Awesome----->--%>
    <%--<link href="${pageContext.request.contextPath}/dist/foreEnd/css/font-awesome.css" rel="stylesheet">--%>
    <script>
        window.onload = function () {
            <%--var test = window.location.href;--%>
            <%--var a2 = "${pageContext.request.contextPath}";--%>
            <%--alert(a2);--%>
            <%--var a;--%>
            <%--if (null == a2 || "" == a2) {--%>
                <%--a = test.substr(21);--%>
            <%--} else {--%>
                <%--a = test.substr(21+a2.length);--%>
            <%--}--%>
            <%--document.getElementById("jumpHidden").value = a;--%>
            <%--alert(${redirectUrl});--%>

        }

        $(document).ready(function () {
            var a2 = "${pageContext.request.contextPath}";
            var r = window.location.search;
            r = r.substring(r.indexOf("=")+1+a2.length,r.length);
            document.getElementById("jumpHidden").value = r;
        })

    </script>

</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>登录</h3>
        <p class="description">
            登陆你的账户
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzRegister/goIndex.do">首页</a></li>
                <li class="current-page">登录</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <form class="login" id="signupForm" method="post" action="${pageContext.request.contextPath}/XzLogin/Login.do">
            <input type="hidden" id="jumpHidden" name="jumpAddress"/>

            <p class="lead">欢迎回来!</p>
            <%--<span class="yellow fa fa-warning"></span>--%>
            <span class="logi">${sessionScope.loginC1}</span>

            <div class="form-group">
                <input id="username" autocomplete="off" type="text" name="username" class="required form-control"
                       placeholder="用户名" value="${count1}">
            </div>
            <div class="form-group">
                <input autocomplete="off" type="password" class="password required form-control" placeholder="密码"
                       name="password" value="${password1}">

            </div>
            <div class="form-group">
                <input type="checkbox" name="remember" value="true"> 记住我 &nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/XzRegister/goForget.do" class="forget">
                &nbsp;&nbsp;忘记密码</a>
                <input type="submit" class="btn btn-primary btn-lg1 btn-block" name="submit" value="登录">

            </div>
            <p>没有账户? <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do" title="Sign Up">注册</a></p>
        </form>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>

</body>
</html>