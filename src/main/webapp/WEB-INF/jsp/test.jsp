<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/20
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript">
        function add() {
            var addBox = document.getElementById("addBox");
            var saveForm = document.getElementById("saveForm");
            saveForm.action = "${pageContext.request.contextPath}/Test/addTest";
            addBox.style.display = "block";
            /*document.getElementById("testId").value = "";
            document.getElementById("testA").value = "";
            document.getElementById("testB").value = "";*/
        }
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
        function selById(id){
            $.ajax({
                url:'${pageContext.request.contextPath}/Test/selById',
                data:{id:id},
                type:'get',
                dataType:'json',
                success:function (data) {
                    var addBox = document.getElementById("addBox");
                    var saveForm = document.getElementById("saveForm");
                    document.getElementById("testId").value = data.test.id;
                    document.getElementById("testA").value = data.test.testA;
                    document.getElementById("testB").value = data.test.testB;
                    saveForm.action = "${pageContext.request.contextPath}/Test/updateTest";
                    addBox.style.display = "block";
                }
            })

        }
        window.onload = function () {
            if('${param.msg }'=='update'){
                alert("修改成功");
            }else if('${param.msg }'=='add'){
                alert("添加成功");
            }else if('${param.msg }'=='del'){
                alert("删除成功");
            }
        }
    </script>
</head>
<body>
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
                        <td><a href="javascript:void(0)" onclick="selById(${t1.id})">修改</a></td>
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
    <button onclick="add()">添加</button>
    <div id="addBox" style="display: none">
        <form:form id="saveForm" action="${pageContext.request.contextPath}/Test/addTest" modelAttribute="test">
            <%--<input id="testId" type="hidden" name="id" value="${updateTest.id}">--%>
            test_a:<form:input  path="testA"/><form:errors path="testA"/><br>
            test_b:<form:input  path="testB"/><form:errors path="testB"/><br>
            <input type="submit" value="保存">
        </form:form>
    </div>
</body>
</html>
