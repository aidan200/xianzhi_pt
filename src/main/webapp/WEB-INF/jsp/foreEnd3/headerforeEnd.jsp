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
        <div>
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="alllogo">
            <ul class="nav nav_2">
                <li>
                    <a href="/" class="sim-button button01"><span data-hover="先知首页">&nbsp;先知首页&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span
                            data-hover="在线直播">&nbsp;在线直播&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="会员中心">&nbsp;会员中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="先知社区">&nbsp;先知社区&nbsp;</span></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/zp_index" class="sim-button button01"><span
                            data-hover="招聘中心">&nbsp;招聘中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="活动中心">&nbsp;活动中心&nbsp;</span></a>
                </li>
            </ul>
            <ul class="nav nav_1">
                <c:if test="${userLogin!=undefined}">
                    <a href="" style="">
                        <li class="login1">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="allheader">
                            <ul class="head-menu">
                                <li>
                                    <span>郑秀妍</span>
                                    <span><a href="" style="float: right">注销</a></span>
                                </li>
                                <li><a href="#">我的简历</a></li>
                                <li><a href="#">查看职位信息</a></li>
                                <li><a href="#">balabala</a></li>
                            </ul>

                                <%--<a><span>${userLogin.loginCount}${userLogin.member.memberId}</span></a>--%>
                        </li>
                    </a>
                </c:if>

                <%--<li class="register1">--%>
                    <%--<a href="#0" class="allregister" style="margin-top: 13px"><span>注册</span></a>--%>
                <%--</li>--%>
                <li class="login1">
                    <a href="${pageContext.request.contextPath}/view/foreEnd3/login.html"
                       style="margin-top: 13px"><span>登录</span></a>
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
