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
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查询模板</title>
    <script type="application/javascript">
        function turning(type) {
            var page = parseInt(document.getElementById("testPage").value);
            if(type=="up"){
                page--;
            }else if(type=="down"){
                page++;
            }
            document.getElementById("testPage").value = page;
            document.getElementById("testForm").submit();
        }
    </script>
</head>
<body>
<a href="${pageContext.request.contextPath}/Test/testEdit">添加</a>
<form id="testForm" action="${pageContext.request.contextPath}/Test/selTestAll" >
    <div>
        条件查询 ： test_a: <input name="testA" value="${test.testA}"> test_b <input name="testB" value="${test.testB}">
        <input type="submit" value="go">
    </div>
    <table>
        <thead>
        <tr>
            <th>id</th>
            <th>test_a</th>
            <th>test_b</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="t1" items="${tlist}">
            <tr>
            <td>${t1.id}</td>
            <td>${t1.testA}</td>
            <td>${t1.testB}</td>
            <td><a href="${pageContext.request.contextPath}/Test/testEdit?id=${t1.id}">修改</a></td>
            <td><a href="${pageContext.request.contextPath}/Test/delTest?id=${t1.id}">删除</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <input id="testPage" type="hidden" name="page" value="${page}">
    <div><button onclick="turning('up')" <c:if test="${page==1}">disabled="disabled" </c:if> >上一页</button><button onclick="turning('down')" <c:if test="${page==pages}">disabled="disabled" </c:if> >下一页</button></div>
    <div>当前${page}页/共${pages}页</div>
    <div>共${total}条</div>
</form>
</body>
</html>
