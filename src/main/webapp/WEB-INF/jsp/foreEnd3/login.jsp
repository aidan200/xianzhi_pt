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
    <%--<script>--%>
        <%--$(document).ready(function(){--%>
            <%--$(".login_com").click(function(){--%>
                <%--$(".login_in").animate({left:'400px'});--%>
                <%--$(".login_in2").animate({left:'0'});--%>
            <%--});--%>
            <%--$(".login_user").click(function(){--%>
                <%--$(".login_in").animate({left:'0'});--%>
                <%--$(".login_in2").animate({left:'-400px'});--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>

</head>
<body background="${pageContext.request.contextPath}/dist/foreEnd3/img/scsc.jpg" class="login_body">

<!--<img src="img/scsc.jpg" alt="" class="login_img">-->
<div class="login_img">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="login_logo">

        <div class="login_all">
            <form action="${pageContext.request.contextPath}/XzLogin/Login.do" method="post">

                <div class="login_in">
                    <%--<button type="button" class="login_com">企业登录 <span class="fa fa-arrow-right" style="color: #3d9ccc"></span></button>--%>
                    <h2>欢迎登录用户账号</h2>
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

                    <div style="margin-top: 15px;overflow: hidden">
                        <a class="login_forget" href="${pageContext.request.contextPath}/view/foreEnd3/retrievepassword.html">忘记密码?</a>
                        <span class="login_remember">
                            <input type="checkbox" name="remember" value="true">
                        记住我
                    </span>

                    </div>
                    <button type="submit" class="login_button">用户登录</button>
                    <a href="#0" class="login_re allregister">没有账号？ 立即注册</a>
                </div>
            </form>
            <%--<form action="">--%>
                <%--<div class="login_in2">--%>
                    <%--<button type="button" class="login_user"><span class="fa fa-arrow-left" style="color: #FFA500"></span> 用户登录</button>--%>
                    <%--<h2>欢迎登录企业账号</h2>--%>
                    <%--<div class="login_input" style="margin-top: 30px">--%>
                        <%--<input class="effect-4" type="text" name="username" value="${username}" placeholder="会员名/邮箱">--%>
                        <%--<span class="focus-border"></span>--%>
                    <%--</div>--%>

                    <%--<div class="login_input" style="margin-top: 40px">--%>
                        <%--<input class="effect-4" type="password" name="password" placeholder="请输入密码">--%>
                        <%--<span class="focus-border"></span>--%>
                    <%--</div>--%>

                    <%--<div class="login_err">--%>
                        <%--<c:if test="${msg!=null}">--%>
                            <%--<span class="fa fa-exclamation-triangle">&nbsp;</span>${msg}--%>
                        <%--</c:if>--%>
                    <%--</div>--%>

                    <%--<div style="margin-top: 15px;overflow: hidden">--%>
                        <%--<a class="login_forget" href="###">忘记密码?</a>--%>
                        <%--<span class="login_remember">--%>
                            <%--<input type="checkbox" name="remember" value="true">--%>
                        <%--记住我--%>
                    <%--</span>--%>

                    <%--</div>--%>
                    <%--<button type="submit" class="login_button2">企业登录</button>--%>
                    <%--<a href="#0" class="login_re allregister">没有账号？ 立即注册</a>--%>
                <%--</div>--%>
            <%--</form>--%>
        </div>



</div>

<div class="allpop" role="alert">
    <div class="all_container">
        <div class="index_tan">
            <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ren.png" alt="" class="re_im">
                <span class="head_span">用户注册</span>
            </a>
            <a href="${pageContext.request.contextPath}/XzRegister/goRegisterC.do">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/gong.png" alt="" class="re_im">
                <span class="head_span">企业注册</span>
            </a>
        </div>
        <a href="#0" class="all_close cmd_close"></a>
    </div>
</div>


</body>
</html>
