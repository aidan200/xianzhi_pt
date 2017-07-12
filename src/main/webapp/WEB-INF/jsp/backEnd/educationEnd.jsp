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
    <title>学历信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        window.onload = function () {
            var logID = ${xzEducation.loginID};
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
            document.getElementById("CompanyForm").submit();
        }
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("EducationForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Education/deleteEducationEnd.emp?eid=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">学历信息表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">学历信息表</li>
    </ul>

    <div class="container-fluid">

        <form id="EducationForm" action="${pageContext.request.contextPath}/Education/goEducationEnd.emp" method="post">
            <input id="thePage" type="hidden" name="page" value="${page}">
            <div class="row-fluid">
                <div>
                    <input type="hidden" name="loginID" value="${xzEducation.loginID}">
                    <c:if test="${xzEducation.loginID != 0}">
                    <span id="addSpan">
                            添加学历信息 :
                            <input type="button" value="添加"
                                   onClick="location.href='${pageContext.request.contextPath}/Education/goAddEducationEnd.emp?loginID=${xzEducation.loginID}'"/>
                            <br>
                    </span>
                    </c:if>
                    条件查询 ：
                    <br/>
                    学历: <input name="education"
                               value="${xzEducation.education}">
                    学校: <input name="school"
                               value="${xzEducation.school}">
                    专业: <input name="major"
                               value="${xzEducation.major}">

                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="vv">学历表ID</th>
                        <th class="v">登录表ID</th>
                        <th class="v">学历</th>
                        <th class="v">学校</th>
                        <th class="v">专业</th>
                        <th class="v">专业技能</th>
                        <th class="v">入学时间</th>
                        <th class="v">毕业时间</th>
                        <th class="v">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="ed1" items="${edList}">
                        <tr>
                            <td class="vv">${ed1.educationID}</td>
                            <td class="v">${ed1.loginID}</td>
                            <td class="v">${ed1.education}</td>
                            <td class="v">${ed1.school}</td>
                            <td class="v">${ed1.major}</td>
                            <td class="v">${ed1.educationSkill}</td>
                            <td class="v"><fmt:formatDate value="${ed1.enrollmentDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="v"><fmt:formatDate value="${ed1.graduateDate}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                    <%--<a id="delInfo" href="${pageContext.request.contextPath}/XzLogin/deleteLogin.emp?loginID=${log1.loginID}"  hidden="hidden"/>--%>
                                <a href="${pageContext.request.contextPath}/Education/goUpdateEducationEnd.emp?eid=${ed1.educationID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${ed1.educationID})"
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
