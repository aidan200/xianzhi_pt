<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/21
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="nav_small">
    <ul class="nav_smallul" style="margin-bottom: 0">
        <li><a href="${pageContext.request.contextPath}/zp_index" class="hvr-wobble-bottom">个人首页</a></li>
        <li><a href="${pageContext.request.contextPath}/view/foreEnd3/companylist.html" class="hvr-wobble-bottom">企业</a></li>
        <li><a href="${pageContext.request.contextPath}/Postion/selPostionIndex.do" class="hvr-wobble-bottom">搜索职位</a></li>
        <li><a href="${pageContext.request.contextPath}/view/foreEnd3/postposition.html" class="hvr-wobble-bottom">我的职位</a></li>
        <li><a href="${pageContext.request.contextPath}/view/foreEnd3/zp_jianli.html?resumId=${resumeId}" class="hvr-wobble-bottom">简历</a></li>
    </ul>
</nav>
</body>
</html>
