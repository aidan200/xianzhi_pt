<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/11
  Time: 9:26
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
    <title>视频类别</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("videoClassForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/videoClass/deleteVideoClass.emp?vclassID=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">视频课程表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">视频课程表</li>
    </ul>
    <div class="container-fluid">
        <sf:form id="videoClassForm" action="${pageContext.request.contextPath}/videoClass/selectVideoClass.emp" method="post"
                 modelAttribute="xzVideo">
            <a href="${pageContext.request.contextPath}/videoClass/goInsertVideoClass.emp">添加</a>
            <input id="thePage" type="hidden"  name="page" value="${page}">
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <td class="vv">视频类别表ID</td>
                        <td class="v">视频名称</td>
                        <td class="v">类别介绍</td>
                        <td class="v">操作</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="c1" items="${videoClassList}">
                        <tr>
                            <td class="vv">${c1.vclassID}</td>
                            <td class="v">${c1.className}</td>
                            <td class="v">${c1.classIntroduce}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/videoClass/goUpdateVideoClass.emp?vclassID=${c1.vclassID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${c1.vclassID})"
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

