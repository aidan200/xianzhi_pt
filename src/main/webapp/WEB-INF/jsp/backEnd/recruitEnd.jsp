<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/2
  Time: 17:35
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
    <title>招聘信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
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
                var form = document.getElementById("recruitForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/XzRecruit/deleteRecruit.emp?recruitID=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">招聘信息表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">招聘信息表</li>
    </ul>
    <div class="container-fluid">
        <sf:form id="recruitForm" action="${pageContext.request.contextPath}/XzRecruit/selectRecruit.emp" method="post"
                 modelAttribute="xzRecruit">
            <div class="row-fluid">
                <div>
                    条件查询 ：
                    <br/>
                    <input id="thePage" type="hidden" name="page" value="${page}">
                    公司名: <sf:input path="companyName"
                                   value="${xzRecruit.companyName}"/>
                    工作地点: <sf:input path="workplace"
                                    value="${xzRecruit.workplace}"/>
                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <td class="vv">招聘信息表ID</td>
                        <td class="v">公司ID</td>
                        <td class="v">公司名称</td>
                        <td class="v">职业名称</td>
                        <td class="v">最低工资</td>
                        <td class="v">最高工资</td>
                        <td class="v">工作地点</td>
                        <td class="v">工作经验</td>
                        <td class="v">招聘人数</td>
                        <td class="v">工作性质</td>
                        <td class="v">学历要求</td>
                        <td class="v">福利待遇</td>
                        <td class="v">工作职责</td>
                        <td class="v">工作地址</td>
                        <td class="v">行业</td>
                        <td class="v">发布日期</td>
                        <td class="v">操作</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="r1" items="${recruitList}">
                        <tr>
                            <td class="vv">${r1.recruitID}</td>
                            <td class="v">${r1.companyID}</td>
                            <td class="v">${r1.companyName}</td>
                            <td class="v">${r1.jobName}</td>
                            <td class="v">${r1.monthlyMin}</td>
                            <td class="v">${r1.monthlyMax}</td>
                            <td class="v">${r1.workplace}</td>
                            <td class="v">${r1.workExperience}年</td>
                            <td class="v">${r1.recNumber}</td>
                            <td class="v">${r1.jobNature}</td>
                            <c:if test="${r1.education==4||r1.education==0}">
                                <td class="v">无学历要求</td>
                            </c:if>
                            <c:if test="${r1.education==1}">
                                <td class="v">专科</td>
                            </c:if>
                            <c:if test="${r1.education==2}">
                                <td class="v">本科</td>
                            </c:if>
                            <c:if test="${r1.education==3}">
                                <td class="v">研究生</td>
                            </c:if>
                            <td class="v">${r1.treatment}</td>
                            <td class="v">${r1.obligation}</td>
                            <td class="v">${r1.jobAddress}</td>
                            <td class="v">${r1.profession}</td>
                            <td class="v"><fmt:formatDate value="${r1.releaseDate}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <a href="${pageContext.request.contextPath}/XzRecruit/goUpdateRecruit.emp?recruitID=${r1.recruitID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${r1.recruitID})"
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


