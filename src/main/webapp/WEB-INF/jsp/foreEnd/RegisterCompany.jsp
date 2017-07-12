<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>企业注册</title>
    <jsp:include page="cssForeEnd.jsp"/>


    <script type="application/javascript">

        function selByCompanyName(str) {
            var password1Hint = document.getElementById("companyHint");
            password1Hint.innerHTML = "";
            if (str != null && str != "") {
                $.ajax({
                    url: "${pageContext.request.contextPath}/XzRegister/selByCompanyName.do",
                    data: {str: str},
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        var a = window.document.getElementById("selCompany");
                        if (data.spanColor == "true") {
                            $("#selCompany").attr("class", "green");
                        } else {
                            $("#selCompany").attr("class", "regi");
                        }
                        a.innerHTML = data.selCompany;
                    }
                })
            } else {
                var a = window.document.getElementById("selCompany");
                $("#selCompany").attr("class", "regi");
                a.innerHTML = "ｘ 公司名不能为空!";
            }
        }
        function selByUser1(str) {
            var password1Hint = document.getElementById("usernameHintC");
            password1Hint.innerHTML = "";
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
        function selByEmailU1(str) {
            var password1Hint = document.getElementById("emailHintC2");
            password1Hint.innerHTML = "";
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

        function selPassword1(str) {
            var password1Hint = document.getElementById("passwordHintC1");
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

        function selConfirm1(str) {
            var password1Hint = document.getElementById("passwordHintC2");
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

        function setCompanyHint() {
            var password1Hint = document.getElementById("companyHint");
            password1Hint.innerHTML = "请输入公司名称";
            var password1 = window.document.getElementById("selCompany");
            password1.innerHTML = "";
        }

        function setUsernameHintC() {
            var password1Hint = document.getElementById("usernameHintC");
            password1Hint.innerHTML = "请输入数字或字母(区分大小写)";
            var password1 = window.document.getElementById("userSpan");
            password1.innerHTML = "";
        }

        function setPasswordHintC1() {
            var password1Hint = document.getElementById("passwordHintC1");
            password1Hint.innerHTML = "请输入数字或字母(区分大小写)";
            var password1 = window.document.getElementById("passwordSpan");
            password1.innerHTML = "";
        }
        function setPasswordHintC2 () {
            var password1Hint = document.getElementById("passwordHintC2");
            password1Hint.innerHTML = "请再次输入密码,要求与第一次输入一致";
            var password1 = window.document.getElementById("confirmSpan");
            password1.innerHTML = "";
        }
        
        function setEmailHintC () {
            var password1Hint = document.getElementById("emailHintC2");
            password1Hint.innerHTML = "请输入正确的邮箱格式";
            var password1 = window.document.getElementById("emailSpan");
            password1.innerHTML = "";
        }

    </script>

</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>


<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>企业注册</h3>
        <p class="description">
            还没有账户？注册一个吧。
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">企业注册</li>
            </ul>
        </div>
    </div>
</div>

<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <sf:form class="login" id="signupForm" method="post"
                 action="${pageContext.request.contextPath}/XzRegister/RegisterC.do" modelAttribute="xzLogin">
            <p class="lead">注册新用户</p>
            <sf:hidden path="loginID"/>
            <div class="form-group">
                <span id="companyHint" class="regiHist"></span>
                <input type="text" autocomplete="off" class="required form-control" placeholder="公司名称 *" name="Cname"
                       value="${companyName}" onfocus="setCompanyHint()" onblur="selByCompanyName(this.value)">
                <span class="regi" id="selCompany">${companyAAA}</span>
            </div>
            <div class="form-group">
                <span id="usernameHintC" class="regiHist"></span>
                <sf:input type="text" autocomplete="off" class="required form-control" placeholder="用户名 *"
                          name="username" value="" path="loginCount" onfocus="setUsernameHintC()"
                          onblur="selByUser1(this.value)" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="regi" id="userSpan"><sf:errors path="loginCount"/> </span>
            </div>
            <div class="form-group">
                <span id="passwordHintC1" class="regiHist"></span>
                <sf:input type="password" class="required form-control" id="password" placeholder="密码 *" name="password"
                          value="" path="loginPassword" onfocus="setPasswordHintC1()" onblur="selPassword1(this.value)"
                          onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="regi" id="passwordSpan"><sf:errors path="loginPassword"/></span>
            </div>
            <div class="form-group">
                <span id="passwordHintC2" class="regiHist"></span>
                <sf:input type="password" class="required form-control" placeholder="再次确认密码 *" path="confirmPassword"
                       value="" onfocus="setPasswordHintC2()" onblur="selConfirm1(this.value)" onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/>
                <span class="regi" id="confirmSpan">${confirmSpan}</span>
            </div>
            <div class="form-group">
                <span id="emailHintC2" class="regiHist"></span>
                <sf:input type="text" autocomplete="off" class="required form-control" placeholder="邮箱 *" name="email"
                          value="" onfocus="setEmailHintC()" onblur="selByEmailU1(this.value)" path="loginEmail"/>
                <span class="regi" id="emailSpan"><sf:errors path="loginEmail"/>${eSpan} </span>
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