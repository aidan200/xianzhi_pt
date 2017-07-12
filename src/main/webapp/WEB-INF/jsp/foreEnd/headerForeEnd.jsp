<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>先知平台</title>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
                    src="${pageContext.request.contextPath}/dist/foreEnd/images/LOGO.png" alt=""
                    style="width: 130px;height: 60px;margin-top: -20px;float: left"></a>

            <c:if test="${userNull!='未登录'&&userNull!=null}">
                <div class="all_user"><a href="${pageContext.request.contextPath}${sessionScope.userOrCompany}"
                                         class="all_a">${userLogin.loginEmail}</a></div>
                <div class="all_user2"><a href="${pageContext.request.contextPath}/XzLogin/ExitUser.do"
                                          class="all_a">注销</a></div>
            </c:if>

        </div>
        <!--/.navbar-header-->
        <div class="navbar-collapse collapse" id="bs-example-navbar-collapse-1" style="height: 1px;">

            <ul class="nav navbar-nav">
                <c:if test="${userNull=='未登录'||userNull==null}">
                    <li class="dropdown">
                        <a id="topLogA" href="${pageContext.request.contextPath}/XzLogin/goLogin.do"><i
                                class="fa fa-user"></i><span>登录</span></a>
                    </li>
                    <li class="dropdown">
                        <a id="topLogB" href="#" data-toggle="dropdown"><i class="fa fa-pencil"></i><span>注册</span></a>
                        <ul id="topLogC" class="dropdown-menu login">
                            <li><a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">个人注册</a></li>
                            <li><a href="${pageContext.request.contextPath}/XzRegister/goRegisterC.do">企业注册</a></li>
                        </ul>
                    </li>
                </c:if>
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html" class="dropdown-toggle"><i
                            class="fa fa-list"></i><span>课程</span></a>
                </li>
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/Event/selectEventAll.do" class="dropdown-toggle"><i
                            class="fa fa-calendar"></i><span>活动</span></a>

                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="fa fa-search"></i><span>搜索</span></a>
                    <ul class="dropdown-menu search-form">
                        <form>
                            <input type="text" class="search-text" name="s" placeholder="搜索...">
                            <button type="submit" class="search-submit"><i class="fa fa-search"></i></button>
                        </form>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
    <!--/.navbar-collapse-->
</nav>
<nav class="navbar nav_bottom" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header nav_2">
            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse"
                    data-target="#bs-megadropdown-tabs">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <a class="navbar-brand" href="#"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
            <ul class="nav navbar-nav nav_1">
                <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">先知首页</a></li>
                <%--<li><a href="about.html">关于</a></li>--%>
                <%--<li><a href="${pageContext.request.contextPath}/WeChat/turnPay.do">会员中心</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do">会员中心</a></li>
                <li><a href="${pageContext.request.contextPath}/Teacher/selectTeacherAll.do">技术领域</a></li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">问题<span class="caret"></span></a>--%>
                <%--<ul class="dropdown-menu" role="menu">--%>
                <%--<li><a href="terms.html">如何报名</a></li>--%>
                <%--<li><a href="faq.html">常见问题</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
                <%--<li><a href="services.html">服务</a></li>--%>
                <li><a href="${pageContext.request.contextPath}/Resume/selectResumeAllIndex.do">招聘中心</a></li>
                <!--<li><a href="features.html">Features</a></li>-->
                <li><a href="${pageContext.request.contextPath}/Blog/selectBlogAll.do">先知博客</a></li>
                <%--<li><a href="career.html">职业</a></li>--%>
                <%--<li class="last"><a href="contact.html">联系</a></li>--%>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
</body>
</html>
