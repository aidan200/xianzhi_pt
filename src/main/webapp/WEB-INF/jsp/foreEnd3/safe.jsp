<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/10
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>账号安全</title>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #f9f9f9">
<jsp:include page="headerforeEnd.jsp"/>

<div class="saf_all">

    <div class="saf_top">
        <span class="fa fa-cog" style="font-size: 35px"></span>
        <h2>安全中心</h2>
    </div>
    <div class="saf_allin">

        <div style="font-size: 18px;color: #FFA500">账号安全</div>
        <div class="saf_every">
            <span class="saf_s" style="width: 200px">邮箱</span>
            <span class="saf_s" id="theEmail" style="width: 450px;color: #3d9ccc"></span>
            <span class="saf_s">
                <span class="fa fa-remove" style="color: #666"></span> 未开放
                <%--<a href="###">验证</a>
                <a href="###">修改</a>--%>
            </span>
        </div>
        <div class="saf_every">
            <span class="saf_s" style="width: 770px">修改密码</span>
            <span class="saf_s">
                <a href="${pageContext.request.contextPath}/view/foreEnd3/retrievepassword.html">修改</a>
            </span>
        </div>
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/safe.png" alt="" class="saf_safe">

    </div>

</div>
<jsp:include page="behindforeEnd.jsp"/>
</body>
</html>
<script>
    $(function () {
        var email = "${userLogin.loginEmail}";
        var str = email.substring(3,email.indexOf("@"));
        str = str.replace(/(.{1})/g,"*");
        var email = email.replace(email.substring(3,email.indexOf("@")),str);
        $('#theEmail').text(email);
    })
</script>