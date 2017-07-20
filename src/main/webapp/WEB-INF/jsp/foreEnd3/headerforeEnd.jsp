<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>nav</title>
</head>
<body>
<nav class="navbar navbar-bottom" role="navigation">

    <div id="two">
        <div style="min-width:1200px">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="alllogo">
            <ul class="nav navbar-nav nav_2">
                <li>
                    <a href="index.html" class="sim-button button01"><span data-hover="先知首页">&nbsp;先知首页&nbsp;</span></a>
                </li>
                <li>
                    <a href="video_home.html" class="sim-button button01"><span
                            data-hover="在线直播">&nbsp;在线直播&nbsp;</span></a>
                </li>
                <li>
                    <a href="#" class="sim-button button01"><span data-hover="会员中心">&nbsp;会员中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="blog_home.html" class="sim-button button01"><span data-hover="先知社区">&nbsp;先知社区&nbsp;</span></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/zp_index" class="sim-button button01"><span data-hover="招聘中心">&nbsp;招聘中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="#" class="sim-button button01"><span data-hover="活动中心">&nbsp;活动中心&nbsp;</span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav nav_1">
                <c:if test="${userLogin!=undefined}">
                    <li class="login1">
                        <a><span>${userLogin.loginCount}${userLogin.member.memberId}</span></a>
                    </li>
                </c:if>
                <li class="login1">
                    <a href="${pageContext.request.contextPath}/view/foreEnd3/login.html"><span>登录</span></a>
                </li>
                <li class="register1">
                    <a href="#0" class="allregister"><span>注册</span></a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="allpop" role="alert">
    <div class="all_container">
        <div class="index_tan">
            <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">用户</a>
            <a href="${pageContext.request.contextPath}/XzRegister/goRegisterC.do">企业</a>
        </div>
        <a href="#0" class="all_close cmd_close"></a>
    </div>
</div>
</body>
</html>
