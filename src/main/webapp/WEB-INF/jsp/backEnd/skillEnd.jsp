<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/16
  Time: 11:30
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
    <title>技能信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jeDate.css" type="text/css">--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jeDate.js"></script>--%>
    <script type="application/javascript">
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("sendForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/skill/deleteSkill.emp?skillID=" + id;
                }
            });
        }
    </script>
</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">技能信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="#">1</a> <span class="divider">/</span></li>
        <li class="active">技能信息</li>
    </ul>
    <div class="container-fluid">

        <sf:form id="sendForm" action="${pageContext.request.contextPath}/skill/selectAllSkill.emp" method="post"
                 modelAttribute="xzSKill">
            <sf:hidden value="${xzSKill.loginID}" path="loginID"/>
            <input type="button" value="添加"
                   onClick="location.href='${pageContext.request.contextPath}/skill/goInsertSkill.emp?loginID=${xzSKill.loginID}'"/>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <td class="vv">技能名称</td>
                        <td class="v">掌握程度</td>
                        <td class="v">操作</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="s1" items="${skillList}">
                        <tr>
                            <td class="vv">${s1.skillName}</td>
                                <%--<td class="v">${s1.skillValue}</td>--%>
                            <td class="vv">
                                <div class="progress_bar">
                                    <div class="pro-bar">
                                        <span class="progress_number col-md-1">${s1.skillValue}%</span>

                                        <span class="progress-bar-inner col-md-10"
                                              style="background-color: #faa732; width: ${s1.skillValue}%;float: left" data-value="${s1.skillValue}"
                                              data-percentage-value="${s1.skillValue}"></span>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/skill/goUpdateSkill.emp?skillID=${s1.skillID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${s1.skillID})"
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
        </sf:form>
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

