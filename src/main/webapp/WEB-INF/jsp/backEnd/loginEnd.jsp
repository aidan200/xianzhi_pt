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
    <title>登录信息</title>
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
                var form = document.getElementById("loginForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/XzLogin/deleteLogin.emp?loginID=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">登录信息表</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">登录信息表</li>
    </ul>

    <div class="container-fluid">

        <sf:form id="loginForm" action="${pageContext.request.contextPath}/XzLogin/selAllLogin.emp" method="post" modelAttribute="xzLogin">
            <input id="thePage" type="hidden"  name="page" value="${page}">
            <div class="row-fluid">
                <div>
                    添加用户 :
                    <input type="button" value="添加" onClick="location.href='${pageContext.request.contextPath}/XzLogin/goAddLogin.emp'"/>
                    <br>
                    条件查询 :
                    <br/>
                    账号: <input name="loginCount"
                               value="${xzLogin.loginCount}">
                    邮箱: <input name="loginEmail"
                               value="${xzLogin.loginEmail}">
                    用户类型:
                    <sf:select path="loginType">
                        <sf:option value="0">请选择</sf:option>
                        <sf:option value="1">普通用户</sf:option>
                        <sf:option value="2">企业用户</sf:option>
                    </sf:select>
                    激活类型:
                    <sf:select path="loginActive">
                        <sf:option value="0">请选择</sf:option>
                        <sf:option value="1">激活</sf:option>
                        <sf:option value="2">未激活</sf:option>
                    </sf:select>

                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="vv">登录表ID</th>
                        <th class="v">账号</th>
                        <th class="v">密码</th>
                        <th class="v">邮箱</th>
                        <th class="v">用户类型</th>
                        <th class="v">激活类型</th>
                        <th class="v">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="ls1" items="${loginList}">
                        <tr>
                            <th class="vv">${ls1.loginID}</th>
                            <th class="vv">${ls1.loginCount}</th>
                            <th class="v">${ls1.loginPassword}</th>
                            <th class="v">${ls1.loginEmail}</th>
                            <th class="v">${ls1.loginType==1?"普通用户":"企业用户"}</th>
                            <th class="v">${ls1.loginActive==1?"激活":"未激活"}</th>
                            <td>
                                    <%--<a id="delInfo" href="${pageContext.request.contextPath}/XzLogin/deleteLogin.emp?loginID=${log1.loginID}"  hidden="hidden"/>--%>
                                <a href="${pageContext.request.contextPath}/XzLogin/goUpdateLogin.emp?loginID=${ls1.loginID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${ls1.loginID})"
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
