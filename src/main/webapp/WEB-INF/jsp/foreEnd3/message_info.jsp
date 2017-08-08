<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/7
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<div class="nei_all">
    <div class="nei_center">
        <div class="nei_out">
            <div style="text-align: center;margin: 30px">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/env2.png" alt="" class="nei_img">
                <h4>消息标题</h4>
            </div>
            <div class="nei_sec">
                让你来面试 别逼逼了 快点。。。
            </div>
            <div class="nei_many">
                <span style="margin-right: 20px"><span class="fa fa-calendar-minus-o"></span> 2017-08-08</span>
                <span>面试邀约</span>
            </div>


        </div>


    </div>
</div>
</body>
</html>
