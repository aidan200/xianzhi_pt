<%--
  Created by IntelliJ IDEA.
  User: SYHT01
  Date: 2017/3/27
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>编辑模板</title>
    <script type="application/javascript">
        window.onload = function () {
            var saveForm = document.getElementById("saveForm");
            if('${msg}'=='添加成功'||'${msg}'=='修改成功') window.location.href = "${pageContext.request.contextPath}/Test/selTestAll";
            if('${test.id }'!=0){
                saveForm.action = "${pageContext.request.contextPath}/Test/updateTest";
            }
        }

    </script>
</head>
<body>
        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Test/addTest" modelAttribute="test" >
            id:<sf:hidden  path="id" /><br>
            test_a:<sf:input id="ga"  path="testA"/><sf:errors path="testA"/><br>
            test_b:<sf:input  path="testB"/><sf:errors path="testB"/><br>
            <input type="submit" value="保存">
        </sf:form>
</body>
</html>
