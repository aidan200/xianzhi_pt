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

                <div style="margin-top: 15px;overflow: hidden">
                    <a class="login_forget" href="###">忘记密码?</a>
                    <span class="login_remember">
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="login1" name="remember" value="true">
                            <label for="login1" style="font-weight: normal;margin-bottom: 0">
                                <i>
                                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="50px" height="50px" viewBox="0 0 50 50"
                                         enable-background="new 0 0 50 50" xml:space="preserve">
							<circle fill="none" stroke="#B7B7B7" stroke-width="3" stroke-miterlimit="10" cx="25.11"
                                    cy="24.883" r="23.519"/>
                                        <path fill="none" stroke-width="3" stroke-miterlimit="10" d="M48.659,25c0,12.998-10.537,23.534-23.534,23.534
							S1.591,37.998,1.591,25S12.127,1.466,25.125,1.466c9.291,0,17.325,5.384,21.151,13.203L19,36l-9-14"/>
			            </svg>
                                </i>
                                记住我
                            </label>
                        </div>
                    </span>

                </div>
                <button type="submit" class="login_button">登 录</button>
                <a href="#0" class="login_re allregister">没有账号？ 立即注册</a>
            </div>
        </form>
    </div>

</div>

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
