<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/7
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>个人注册</title>
    <jsp:include page="cssForeEnd.jsp"/>
    <script type="application/javascript">
        function selByUser(str) {
            var usernameHint = document.getElementById("usernameHint");
            usernameHint.innerHTML = "";
            if (str != null && str != "") {
                $.ajax({
                    url: "${pageContext.request.contextPath}/XzRegister/selByUser.do",
                    data: {str: str},
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        var a = window.document.getElementById("userSpan");
                        if (data.spanColor == "true") {
                            $("#userSpan").attr("class", "green");
                        } else {
                            $("#userSpan").attr("class", "regi");
                        }
                        a.innerHTML = data.selUser;
                    }
                })
            } else {
                var a = window.document.getElementById("userSpan");
                $("#userSpan").attr("class", "regi");
                a.innerHTML = "ｘ 用户名不能为空!";
            }

        }
        function selByEmailU(str) {
            var emailHint = document.getElementById("emailHint");
            emailHint.innerHTML = "";
            if (str != null && str != "") {
                $.ajax({
                    url: "${pageContext.request.contextPath}/XzRegister/selByEmail.do",
                    data: {str: str},
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        var a = window.document.getElementById("emailSpan");
                        if (data.spanColor == "true") {
                            $("#emailSpan").attr("class", "green");
                        } else {
                            $("#emailSpan").attr("class", "regi");
                        }
                        a.innerHTML = data.selEmail;
                    }
                })
            } else {
                var a = window.document.getElementById("emailSpan");
                $("#emailSpan").attr("class", "regi");
                a.innerHTML = "ｘ 邮箱不能为空!";
            }
        }

        function selPassword(str) {
            var password1 = document.getElementById("password1Hint");
            password1.innerHTML = "";
            if (str != null && str != "") {
                var a = window.document.getElementById("passwordSpan");
                $("#passwordSpan").attr("class", "green");
                a.innerHTML = "√";
            } else {
                var a = window.document.getElementById("passwordSpan");
                $("#passwordSpan").attr("class", "regi");
                a.innerHTML = "ｘ 密码不能为空!";
            }
        }

        function selConfirm(str) {
            var password2Hint = document.getElementById("password2Hint");
            password2Hint.innerHTML = "";
            var a = window.document.getElementById("confirmSpan");
            if (str != null && str != "") {
                var b1 = document.getElementById("password").value;
                if (str == b1) {
                    $("#confirmSpan").attr("class", "green");
                    a.innerHTML = "√";

                } else {
                    $("#confirmSpan").attr("class", "regi");
                    a.innerHTML = "ｘ 两次输入不一致!";
                }

            } else {
                $("#confirmSpan").attr("class", "regi");
                a.innerHTML = "ｘ 密码不能为空!";
            }
        }
        // 用户名输入提示
        function setUsernameHint() {
            var usernameHint = document.getElementById("usernameHint");
            var userInfo = window.document.getElementById("userSpan");
            usernameHint.innerHTML = "请输入数字或字母(区分大小写)";
            userInfo.innerHTML = "";
        }

        // 第一次输入密码提示提示
        function setPasswordHint() {
            var password1Hint = document.getElementById("password1Hint");
            var password1 = window.document.getElementById("passwordSpan");
            password1Hint.innerHTML = "请输入数字或字母(区分大小写)";
            password1.innerHTML = "";
        }

        // 第二次输入密码提示提示
        function setPassword2Hint() {
            var password2Hint = document.getElementById("password2Hint");
            password2Hint.innerHTML = "请输入数字或字母(区分大小写)";
            var password2 = window.document.getElementById("confirmSpan");
            password2.innerHTML = "";
        }

        // 第二次输入密码提示提示
        function setEmailHint() {
            var emailHint = document.getElementById("emailHint");
            emailHint.innerHTML = "请输入正确的邮箱";
            var email = window.document.getElementById("emailSpan");
            email.innerHTML = "";
        }
    </script>
</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>

<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>个人注册</h3>
        <p class="description">
            还没有账户？注册一个吧。
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">个人注册</li>
            </ul>
        </div>
    </div>
</div>

<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <sf:form class="login" id="signupForm" method="post"
                 action="${pageContext.request.contextPath}/XzRegister/Register.do" modelAttribute="xzLogin">
            <p class="lead">注册新用户</p>
            <div class="form-group">
                <sf:hidden path="loginID"/>
                <span id="usernameHint" class="regiHist"></span>
                <sf:input id="username" name="username" type="text" autocomplete="off" class="required form-control"
                          placeholder="用户名 *" onfocus="setUsernameHint()" onblur="selByUser(this.value)"
                          path="loginCount" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="regi" id="userSpan"><sf:errors path="loginCount"/> </span>
            </div>

            <div class="form-group">
                <span id="password1Hint" class="regiHist"></span>
                <sf:input id="password" name="password" type="password" autocomplete="off" class="required form-control"
                          placeholder="密码 *" path="loginPassword" onfocus="setPasswordHint()"
                          onblur="selPassword(this.value)" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="regi" id="passwordSpan"><sf:errors path="loginPassword"/></span>
            </div>

            <div class="form-group">
                <span id="password2Hint" class="regiHist"></span>
                <sf:input id="confirm_password" path="confirmPassword" type="password" autocomplete="off"
                          class="required form-control" placeholder="再次确认密码 *" onfocus="setPassword2Hint()"
                          onblur="selConfirm(this.value)" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')" />
                <span class="regi" id="confirmSpan">${confirmSpan}</span>
            </div>

            <div class="form-group">
                <span id="emailHint" class="regiHist"></span>
                <sf:input id="email" name="email" type="email" autocomplete="off" class="required form-control"
                          placeholder="邮箱 *" onfocus="setEmailHint()" onblur="selByEmailU(this.value)"
                          path="loginEmail"/>
                <span class="regi" id="emailSpan"><sf:errors path="loginEmail"/>${eSpan}</span>
            </div>

            <div class="form-group">
                <input id="register" name="submit" type="submit" class="btn btn-primary btn-lg1 btn-block" value="注册">
            </div>

            <p>已经有账户？ <a href="${pageContext.request.contextPath}/XzLogin/goLogin.do">登录</a></p>
        </sf:form>

    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>

</body>
</html>
