<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/7
  Time: 18:04
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
    <title>投递记录</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/backEnd/css/jeDate.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/backEnd/js/jeDate.js"></script>
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
                var form = document.getElementById("sendForm");
                form.submit();
            }
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">用户投递记录</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="#">1</a> <span class="divider">/</span></li>
        <li class="active">用户投递记录</li>
    </ul>
    <div class="container-fluid">
        <sf:form id="sendForm" action="${pageContext.request.contextPath}/sendResume/selectSendRecord.emp" method="post"
                 modelAttribute="xzResumeSend">
            <sf:hidden value="${loginID}" path="loginID"/>
            <div class="row-fluid">
                <div>
                    条件查询 ：
                    <br/>
                    <sf:hidden path="resumeID"/>
                    <sf:hidden path="companyID"/>
                    <sf:hidden path="recruitID"/>
                    <input id="thePage" type="hidden"  name="page" value="${page}">
                    公司名称: <sf:input path="companyName"/>
                    职位名称: <sf:input path="jobName"/>
                    查看类型:
                    <sf:select path="state">
                        <sf:option value="0">请选择</sf:option>
                        <sf:option value="1">未查看</sf:option>
                        <sf:option value="2">已查看</sf:option>
                    </sf:select>
                    <br>
                    投递日期:
                    <sf:input  id="indate" placeholder=" 发布日期" path="sendDate"/>
                    -<sf:input  id="indate1" placeholder=" 发布日期" path="sendDate2"/>
                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <td class="vv">投递记录表ID</td>
                        <td class="v">公司ID</td>
                        <td class="v">公司名称</td>
                        <td class="v">职位ID</td>
                        <td class="v">职位名称</td>
                        <td class="v">发送日期</td>
                        <td class="v">查看类型</td>
                        <td class="v">操作</td>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="s1" items="${sendList}">
                        <tr>
                            <td class="vv">${s1.sendID}</td>
                            <td class="v">${s1.companyID}</td>
                            <td class="v">${s1.companyName}</td>
                            <td class="v">${s1.recruitID}</td>
                            <td class="v">${s1.jobName}</td>
                            <td class="v"><fmt:formatDate value="${s1.sendDate}" pattern="yyyy-MM-dd"/></td>
                            <td class="v">${s1.state==2?"已查看":"未查看"}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/sendResume/deleteSendRecord.emp?sendID=${s1.sendID}&loginID=${loginID}"
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
<script type="text/javascript">
    jeDate({
        dateCell:"#indate",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
    jeDate({
        dateCell:"#indate1",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
</script>
</body>
</html>

