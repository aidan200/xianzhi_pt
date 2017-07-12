<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>登录信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var logID = ${xzLogin.loginID};
            var saveForm = document.getElementById("tab");
            var a = window.document.getElementById("loginInfoSpan");
            if (logID == 0) {
                saveForm.action = "${pageContext.request.contextPath}/XzLogin/addLogin.emp";
                a.innerHTML = "添加登录信息";
                var logType = ${xzLogin.loginType};
                if (logType != 2) {
                    var c4 = document.getElementById("company1");
                }
                c4.style.display = "none";
            } else {
                a.innerHTML = "修改登录信息";
                var c1 = document.getElementById("loginT");
                var c2 = document.getElementById("logC");
                var c3 = document.getElementById("logE");
                c1.style.display = "none";
                c2.style.display = "none";
                c3.style.display = "none";

            }
            var company1 = document.getElementById("company1");
            company1.style.display = "none";
        });
        function setCompany(v1) {
            var company1 = document.getElementById("company1");
            if (v1 == 1) {
                company1.style.display = "none";
            } else {
                company1.style.display = "block";
            }
        }
        function selByCompanyName1(str) {
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

    </script>


</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">登录信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">登录信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">


            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home" style="margin-top: 20px">
                        <sf:form id="tab" action="${pageContext.request.contextPath}/XzLogin/updateLogin.emp"
                                 method="post" modelAttribute="xzLogin">
                            登录表ID:<br/>
                            <sf:hidden path="loginID"/>
                            <input type="text" placeholder="登录表ID *" class="input-xlarge" value="${xzLogin.loginID}"
                                   disabled="disabled"><br/>
                            <span id="logC">
                            账号:<br/>
                            <sf:input placeholder="账号 *" cssClass="input-xlarge" path="loginCount"/>
                                <sf:errors path="loginCount"/>
                            </span><br/>

                            密码:<br/>
                            <sf:input placeholder="密码 *" cssClass="input-xlarge" path="loginPassword"/>
                            <sf:errors path="loginPassword"/><br/>
                            <span id="logE">
                            邮箱:<br/>
                            <sf:input placeholder="邮箱 *" cssClass="input-xlarge" path="loginEmail"/>
                                <sf:errors path="loginEmail"/>
                            </span><br/>

                            <span id="loginT">
                            用户类型:<br/>
                                <sf:select cssClass="input-xlarge" path="loginType" onchange="setCompany(this.value)">
                                    <option disabled>请选择</option>
                                    <sf:option value="1" id="o1">普通用户</sf:option>
                                    <sf:option value="2" id="o2">企业用户</sf:option>
                                </sf:select>
                            </span><br/>
                            <span id="company1">
                            公司名:<br/>
                            <sf:input placeholder="公司名 *" class="input-xlarge" path="companyName"
                                      onblur="selByCompanyName1(this.value)"/>
                                <span class="" id="selCompany"></span>
                             </span><br/>
                            激活类型:<br/>
                            <sf:select cssClass="input-xlarge" path="loginActive">
                                <option disabled>请选择</option>
                                <sf:option value="2">未激活</sf:option>
                                <sf:option value="1">激活</sf:option>
                            </sf:select><br/>
                            <div class="btn-toolbar">
                                <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </div>

            <footer>
                <hr>
                <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
            </footer>

        </div>
    </div>

</div>


<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/datedropper.min.js"></script>
<script>
    $("#pickdate").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
    $("#pickdate2").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
</script>

</body>
</html>