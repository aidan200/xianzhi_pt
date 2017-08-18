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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>

<div class="nei_all">
    <div class="nei_center">
        <div class="nei_out">
            <div style="text-align: center;margin: 30px">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/env2.png" alt="" class="nei_img">
                <h4>${xzMsg.msgTital}</h4>
            </div>
            <div class="nei_sec">
                ${xzMsg.msgContent}
            </div>
            <div class="nei_many">
                <span style="margin-right: 20px"><span class="fa fa-calendar-minus-o"></span>
                    <fmt:formatDate value="${xzMsg.msgTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </span>
                <c:choose>
                    <c:when test="${xzMsg.msgType==0}">
                        <span>系统消息</span>
                    </c:when>
                    <c:when test="${xzMsg.msgType==1}">
                        <span>面试邀约</span>
                    </c:when>
                </c:choose>
            </div>
        </div>

    </div>
</div>
</body>
</html>
