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
    <title>普通用户信息</title>
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
            document.getElementById("loginForm").submit();
        }

        function setSexEnd(v3) {
            document.getElementById("sex11").value = v3;
        }
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("memberForm");
                form.submit();
            }
        }
        //        删除弹窗
        var tis = new tis(300);
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/UserInfo/deleteUserInfo.emp?loginID=" + id;
                }
            });
        }
    </script>


</head>


<body class="">

<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">普通用户信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="home.html">1</a> <span class="divider">/</span></li>
        <li class="active">普通用户信息</li>
    </ul>

    <div class="container-fluid">

        <sf:form id="memberForm" action="${pageContext.request.contextPath}/UserInfo/goUserInfo.emp" method="post" modelAttribute="xzMember">
            <input id="thePage" type="hidden"  name="page" value="${page}">
            <div class="row-fluid">
                <div>
                    条件查询 ：
                    <br/>
                    姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名: <input name="memberName"
                                                                         value="${xzMember.memberName}">
                    性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:

                    <sf:select path="memberSex">
                        <sf:option value="0">请选择</sf:option>
                        <sf:option value="1">男</sf:option>
                        <sf:option value="2">女</sf:option>
                    </sf:select>
                    身份证号: <input name="memberIDcard"
                                 value="${xzMember.memberIDcard}">
                    <input type="submit" value="查询">
                </div>
            </div>
            <!--表-->
            <div class="well">
                <table class="table">
                    <thead>
                    <tr>
                        <th class="vv">用户ID</th>
                        <th class="v">登录表ID</th>
                        <th class="v">姓名</th>
                        <th class="v">性别</th>
                        <th class="v">年龄</th>
                        <th class="v">身份证号</th>
                        <th class="v">头像</th>
                        <th class="v">电话</th>
                        <th class="v">简历信息</th>
                        <th class="v">投递记录</th>
                        <th class="v">学历信息</th>
                        <th class="v">工作经验信息</th>
                        <th class="v">项目经验信息</th>
                        <th class="v">技能掌握</th>
                        <th class="v">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="userList1" items="${userList}">
                        <tr>
                            <th class="vv">${userList1.memberID}</th>
                            <th class="vv">${userList1.loginID}</th>
                            <th class="v">${userList1.memberName}</th>
                            <th class="v">${userList1.memberSex==1?'男':'女'}</th>
                            <td class="v">${userList1.memberAge}</td>
                            <td class="v">${userList1.memberIDcard}</td>
                            <td class="v">${userList1.memberPicture}</td>
                            <td class="v">${userList1.memberPhone}</td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/Resume/selectResumeByLogin.emp?loginId=${userList1.loginID}">简历</a>
                            </td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/sendResume/selectSendRecord.emp?loginID=${userList1.loginID}">查看投递记录</a>
                            </td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/Education/goEducationEnd1.emp?loginID=${userList1.loginID}">学历</a>
                            </td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/WorkE/goWorkEEnd1.emp?loginID=${userList1.loginID}">工作经验</a>
                            </td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/ProjectE/goProjectEEnd1.emp?loginID=${userList1.loginID}">项目经验</a>
                            </td>
                            <td class="v">
                                <a href="${pageContext.request.contextPath}/skill/selectAllSkillA.emp?loginID=${userList1.loginID}">技能掌握</a>
                            </td>
                            <td>
                                    <%--<a id="delInfo" href="${pageContext.request.contextPath}/XzLogin/deleteLogin.emp?loginID=${log1.loginID}"  hidden="hidden"/>--%>
                                <a href="${pageContext.request.contextPath}/UserInfo/goUpdateUserInfo.emp?loginID=${userList1.loginID}"><i
                                        class="icon-pencil"></i></a>
                                <a onclick="go(${userList1.loginID})"
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
