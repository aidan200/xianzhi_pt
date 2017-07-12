<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/14
  Time: 18:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--引入分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>项目经验</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        window.onload = function () {
            var logID = ${xzProjectExperience.loginID};
            var a2 = document.getElementById("addSpan");
            if (logID == 0) {
                a2.style.display = "none";
            }
        }
        function turning(type) {
            var page = parseInt(document.getElementById("testPage").value);
            if (type == "up") {
                page--;
            } else if (type == "down") {
                page++;
            }
            document.getElementById("testPage").value = page;
            document.getElementById("ProjectForm").submit();
        }
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("videoForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/ProjectE/deleteProjectEEnd.emp?pid=" + id+"&loginID=${xzProjectExperience.loginID}";
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>

<div class="content">

    <div class="header">
        <h1 class="page-title">项目经验表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">项目经验表</li>
    </ul>

    <div class="container-fluid">

        <form id="ProjectForm" action="${pageContext.request.contextPath}/ProjectE/goProjectEEnd.emp" method="post">
            <input id="thePage" type="hidden" name="page" value="${page}">
            <div class="row-fluid">
                <div>
                    <input type="hidden" name="loginID" value="${xzProjectExperience.loginID}">
                    <c:if test="${xzProjectExperience.loginID != 0}">
                    <span id="addSpan">
                    添加项目经验 :
                    <input type="button" value="添加"
                           onClick="location.href='${pageContext.request.contextPath}/ProjectE/goAddProjectEnd.emp?loginID=${xzProjectExperience.loginID}'"/>
                    <br>
                     </span>
                    </c:if>

                    条件查询 ：
                    <br/>
                    项目名称: <input name="projectName"
                                 value="${xzProjectExperience.projectName}">
                    项目描述: <input name="projectDescribe"
                                 value="${xzProjectExperience.projectDescribe}">

                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>

                        <th class="vv">项目经验表ID</th>
                        <th class="v">登录表ID</th>
                        <th class="v">项目名称</th>
                        <th class="v">项目描述</th>
                        <th class="v">开始日期</th>
                        <th class="v">结束日期</th>
                        <th class="v">工作内容</th>
                        <th class="v">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="plis1" items="${projectList}">
                        <tr>

                            <td class="vv">${plis1.projectID}</td>
                            <td class="v">${plis1.loginID}</td>
                            <td class="v">${plis1.projectName}</td>
                            <td class="v">${plis1.projectDescribe}</td>
                            <td class="v"><fmt:formatDate value="${plis1.startDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="v"><fmt:formatDate value="${plis1.endDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="v">${plis1.jobDuties}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/ProjectE/goUpdateProjectEEnd.emp?pid=${plis1.projectID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${plis1.projectID})"
                                ><i class="icon-remove"></i></a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <ul>
                    <page:paging length="10" page="${page}" pages="${pages}"/>
                </ul>
            </div>


        </form>


        <footer>
            <hr>
            <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
        </footer>

    </div>
</div>
</div>
<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
</body>
</html>
