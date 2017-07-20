<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/10
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .cd-popup-container {
            height: 400px;
            margin-top: 100px;
            overflow: hidden;
        }
        .index_tan{
            width: 100%;
            height: 200px;
            margin-top: 50px;
        }
    </style>

</head>
<body background="${pageContext.request.contextPath}/dist/foreEnd3/img/scsc.jpg" class="login_body">

<!--<img src="img/scsc.jpg" alt="" class="login_img">-->
<div class="login_img">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="login_logo">

    <div class="login_all">
        <form action="${pageContext.request.contextPath}/XzLogin/Login.do" method="post" >
            <div class="login_in">
                <h2>欢迎登录先知账号</h2>
                <div class="login_input" style="margin-top: 30px">
                    <input class="effect-4" type="text" name="username" value="${username}" placeholder="会员名/邮箱">
                    <span class="focus-border"></span>
                </div>

                <div class="login_input" style="margin-top: 40px">
                    <input class="effect-4" type="password" name="password" placeholder="请输入密码">
                    <span class="focus-border"></span>
                </div>

                <div class="login_err">
                    <c:if test="${msg!=null}">
                        <span class="fa fa-exclamation-triangle">&nbsp;</span>${msg}
                    </c:if>
                </div>

                <div style="margin-top: 15px;">
                    <a class="login_forget" href="###">忘记密码?</a>
                    <span class="login_remember">
                        <input type="checkbox" name="remember" value="true"> 记住我
                    </span>

                </div>
                <button type="submit" class="login_button">登 录</button>
                <a href="#0" class="login_re cd-popup-trigger">没有账号？ 立即注册</a>
            </div>
        </form>
    </div>

</div>

<div class="cd-popup" role="alert">
    <div class="cd-popup-container">
        <div class="index_tan">
            <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">用户</a>
            <a href="${pageContext.request.contextPath}/XzRegister/goRegisterC.do">企业</a>
        </div>
        <a href="#0" class="cd-popup-close cmd_close img-replace">Close</a>
    </div>
</div>


</body>
</html>
