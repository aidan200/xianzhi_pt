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
    <title>公司信息</title>
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
                var form = document.getElementById("CompanyForm");
                form.submit();
            }
        }

//        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/CompanyInfo/deleteCompanyInfo.emp?loginID=" + id;
                }
            });
        }


    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">企业用户信息表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">企业用户信息表</li>
    </ul>

    <div class="container-fluid">

        <form id="CompanyForm" action="${pageContext.request.contextPath}/CompanyInfo/goCompanyInfo.emp" method="post">
            <input id="thePage" type="hidden"  name="page" value="${page}">
            <div class="row-fluid">
                <div>

                    条件查询 ：
                    <br/>
                    公司名: <input name="companyName"
                                value="${xzCompany.companyName}">
                    公司电话: <input name="companyPhone"
                                 value="${xzCompany.companyPhone}">

                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="vv">公司表ID</th>
                        <th class="v">登录表ID</th>
                        <th class="v">公司名</th>
                        <th class="v">公司地址</th>
                        <th class="v">公司电话</th>
                        <th class="v">公司标志</th>

                        <th class="v">公司简介</th>
                        <th class="v">公司国模</th>
                        <th class="v">公司性质</th>
                        <th class="v">所属行业</th>

                        <th class="v">应聘</th>
                        <th class="v">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="com1" items="${companyList}">
                        <tr>
                            <td class="vv">${com1.companyID}</td>
                            <td class="v">${com1.loginID}</td>
                            <td class="v">${com1.companyName}</td>
                            <td class="v">${com1.companyLocation}</td>
                            <td class="v">${com1.companyPhone}</td>
                            <td class="v">${com1.companyPicture}</td>

                            <td class="v">${com1.companyIntro}</td>
                            <td class="v">${com1.companyScale}</td>
                            <td class="v">${com1.companyNature==1?"私企":"国企"}</td>
                            <td class="v">${com1.industry}</td>

                            <td><a href="${pageContext.request.contextPath}/Resume/selectResumeEndEndEnd.emp?companyId=${com1.companyID}">应聘信息</a></td>
                            <td>
                                    <%--<a id="delInfo" href="${pageContext.request.contextPath}/XzLogin/deleteLogin.emp?loginID=${log1.loginID}"  hidden="hidden"/>--%>
                                <a href="${pageContext.request.contextPath}/CompanyInfo/goUpdateCompanyInfo.emp?loginID=${com1.loginID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${com1.loginID})"
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
