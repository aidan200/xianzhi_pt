<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/27
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                    data-target="#one">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="one" style="height: 1px;">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#"><span>&nbsp;先知官网&nbsp;</span></a>
                </li>
                <li>
                    <a href="#"><span>&nbsp;先知俱乐部&nbsp;</span></a>
                </li>
                <li>
                    <a href="#"><span>&nbsp;先知活动&nbsp;</span></a>
                </li>
                <li>
                    <a href="#"><span>&nbsp;先知推广&nbsp;</span></a>
                </li>
            </ul>
            <ul class="oh nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span>中文ZH</span>
                    </a>
                    <ul class="dropdown-menu" style="text-align: center">
                        <li><a href="#">英语EN</a></li>
                        <li><a href="#">日语JA</a></li>
                        <li><a href="#">韩语KO</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><span>帮助中心</span></a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</nav>
<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#two">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">
                <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/xzgg.png" alt=""
                     class="logo">
            </a>
        </div>
        <div class="navbar-collapse collapse" id="two" style="height: 1px;">
            <ul class="nav navbar-nav">
                <li class="inputhome">
                    <form action="">
                        <input class="effect-1" type="text" placeholder=" 搜索">
                        <span class="focus-border"></span>
                        <span class="fa fa-search" style="cursor: pointer"></span>
                    </form>
                </li>
                <c:if test="${userLogin == undefined}">
                <li class="login1">
                    <a href="${pageContext.request.contextPath}/view/foreEnd/newlogin.html"><span>登录</span></a>
                </li>
                <li class="login2">
                    <a href="#"><span>注册</span></a>
                </li>
                </c:if>
                <c:if test="${userLogin != undefined}">
                    <li class="login1">
                        <a href="#">${userLogin.loginCount}</a>
                    </li>
                    <li class="login2">
                        <a href="${pageContext.request.contextPath}/XzLogin/ExitUser.do">注销</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</nav>
<nav class="navbar nav_bottom" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header nav_2">
            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                    data-target="#three">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="three">
            <ul class="nav navbar-nav nav_1">
                <li><a href="index.html"><span>先知首页</span></a></li>
                <li><a href="mukevideo.html"><span>先知课程</span></a></li>
                <li><a href="###"><span>会员中心</span></a></li>
                <li><a href="${pageContext.request.contextPath}/Blog/selBlogIndex"><span>先知博客</span></a></li>
                <li><a href="###"><span>招聘中心</span></a></li>
                <li><a href="###"><span>技术领域</span></a></li>
                <li><a href="###"><span>活动中心</span></a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
</body>
</html>
