<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/10
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>公司审核中状态</title>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="aud_all2">
    <div style="width: 980px;margin: 0 auto;color: #666">
        <h3><span class="fa fa-cogs"></span> 公司信息审核中</h3>
    </div>
    <div class="aud_all2in">
        <div class="aud_line">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/person.png" alt="" class="aud_topimg">

            <div style="font-size: 20px;margin-top: 80px;margin-bottom: 10px">公司名称：<span>${company.companyName}</span></div>
            <div style="font-size: 20px;margin-bottom: 10px;color: #666">营业执照：</div>
            <img src="${pageContext.request.contextPath}/uploadImg/${company.licence}" alt="" class="aud_img2">
        </div>
    </div>
</div>

<jsp:include page="behindforeEnd.jsp"/>

</body>
</html>
