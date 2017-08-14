<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/11
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #f0f0f0">
<jsp:include page="headerforeEnd.jsp"/>
<div class="pef_all">
    <div class="pef_top">
        <span class="fa fa-user"></span> <span>个人信息</span>
    </div>
    <div class="pef_allin">
        <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/pink.png" alt="" class="pef_top">--%>
        <div class="pef_small">
            <div style="text-align: center">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/person.png" alt="" class="pef_text">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="pef_head">
            </div>
            <div class="pef_sec">
                <ul>
                    <li>姓名：<span>郑秀妍</span></li>
                    <li>性别：<span>女</span></li>
                    <li>年龄：<span>28</span></li>
                    <li>生日：<span>1989-04-18</span></li>
                    <li>电话：<span>13641789439</span></li>
                    <li>身份证：<span>614897123948832</span></li>
                    <li>地址：<span>案发过去啊噶尔尕而阿尔</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<jsp:include page="behindforeEnd.jsp"/>

</body>
</html>
