<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/6/27
  Time: 16:16
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
    <jsp:include page="distFore.jsp"/>
</head>

<body class="login_bg">

<div class="login_top">
    <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/logo22.png" alt="先知logo" class="login_logo">
</div>

<div class="login_center">
    <div class="login_white">
        <!--左边-->
        <div class="login_left">
            <div class="login_no">
                <form class="login_form" method="post" action="${pageContext.request.contextPath}/XzLogin/Login.do">
                    <h4>密码登录</h4>
                    <div class="col-3" style="margin-top: 20px">
                        <input class="effect-0" type="text" placeholder="会员名/邮箱/手机号" name="username" value="${count1}">
                        <span class="focus-border">
		            	<i></i>
		            </span>
                    </div>

                    <div class="col-3" style="margin-top: 30px">
                        <input class="effect-0" type="text" placeholder="请输入密码" name="password" value="${password1}">
                        <span class="focus-border">
		            	<i></i>
		            </span>
                    </div>

                    <!--错误信息-->
                    <div class="login_err">
                        <c:if test="${msg != undefined}">
                            <span class="fa fa-times"></span> ${msg}
                        </c:if>
                    </div>
                    <a href="" class="login_forget" href="${pageContext.request.contextPath}/XzRegister/goForget.do">忘记密码?</a>
                    <span class="login_remember">
                        <input type="checkbox" name="remember" value="true"> 记住我
                    </span>
                    <button type="submit" class="login_button">登 录</button>
                </form>
            </div>
        </div>

        <!--右边-->
        <div class="login_right">
            <p>还没有账号？</p>
            <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do"><h4>立即注册&emsp;<span
                    class="login_car fa fa-2x fa-car"></span></h4></a>
        </div>

    </div>
</div>

</body>
</html>
