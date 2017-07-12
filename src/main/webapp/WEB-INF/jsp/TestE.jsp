<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/13
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sf:form id="dvInput2"  action="${pageContext.request.contextPath}/Education/AddEducation"  modelAttribute="education">
    <%--<sf:hidden path="educationID"/>
    <sf:hidden path="loginID"/>--%>
        学校<sf:input  path="school"/>
        <span><sf:errors path="school"/></span>
        学历<sf:input  path="education"/>
        <sf:errors path="education"/>

    <input id="userInfoB" type="submit" value="保存" />

</sf:form>
</body>
</html>
