<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/10
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<head>
    <title>重置密码</title>
    <jsp:include page="cssForeEnd.jsp"/>

    <script type="application/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript">

        function selPassword(str) {
            var password1Hint = document.getElementById("passwordHint");
            password1Hint.innerHTML = "";

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
            var password1Hint = document.getElementById("confirmHint");
            password1Hint.innerHTML = "";

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

        // 第一次输入密码提示提示
        function setPasswordHint11() {
            var password1Hint = document.getElementById("passwordHint");
            password1Hint.innerHTML = "请输入数字或字母(区分大小写)";
            var password1 = window.document.getElementById("passwordSpan");
            password1.innerHTML = "";
        }

        // 第一次输入密码提示提示
        function setConfirmHint() {
            var password1Hint = document.getElementById("confirmHint");
            password1Hint.innerHTML = "请输入数字或字母(区分大小写)";
            var password1 = window.document.getElementById("confirmSpan");
            password1.innerHTML = "";
        }

    </script>

</head>
<body class="bg3">
<div class="courses_box">
    <div class="container">
        <form class="login pas2" id="signupForm" method="post"
              action="${pageContext.request.contextPath}/XzRegister/UpdatePassword.do">
            <p class="lead">重置密码</p>
            <input id="newCount" type="hidden" name="newCount" value="${updCount.loginCount}">
            <div class="form-group">
                <span id="passwordHint" class="regiHist"></span>
                <input id="password" autocomplete="off" type="password" name="password" class="required form-control"
                       onblur="selPassword(this.value)" value="${password}" onfocus="setPasswordHint11()"
                       placeholder="密码 *" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="" id="passwordSpan"></span>
            </div>
            <div class="form-group">
                <span id="confirmHint" class="regiHist"></span>
                <input id="confirm_password" autocomplete="off" type="password" class="required form-control"
                       name="confirmPassword" onfocus="setConfirmHint()" onblur="selConfirm(this.value)"
                       value="${confirmPassword}" placeholder="确认密码 *" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')">
                <span class="regi" id="confirmSpan">${confirmPasswordSpan}</span>
            </div>
            <div class="form-group">
                <input type="submit" class="pas btn btn-primary" name="submit" value="确认">

            </div>

        </form>
    </div>
</div>


</body>
</html>
