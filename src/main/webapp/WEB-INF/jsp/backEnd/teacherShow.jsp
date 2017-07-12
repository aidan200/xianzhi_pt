<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>师资</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("teacherPage");
                pageInp.value = page;
                var form = document.getElementById("teacherForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Teacher/deleteTeacher.emp?teacherId=" + id;
                }
            });
        }
    </script>
</head>

<body class="">
<jsp:include page="backEndHeader.jsp"/>

<div class="content">
    <div class="header">
        <h1 class="page-title">师资</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">师资</li>
    </ul>


    <div class="container-fluid">
        <div class="row-fluid">
            <form id="teacherForm" action="${pageContext.request.contextPath}/Teacher/selectTeacherAll.emp">
                <div style="margin: 10px 0;padding: 0">
                    讲师姓名：<input name="teacherName" value="${teacher.teacherName}" type="text"
                                style="width: 10%;margin-right: 10px">
                    所授科目：<select name="subjectId" style="width: 12%;margin-right: 10px">
                    <option value="">请选择</option>
                    <option value="JAVA" <c:if test="${teacher.subjectId=='JAVA'}">selected="selected"</c:if>>JAVA</option>
                    <option value="大前端" <c:if test="${teacher.subjectId=='大前端'}">selected="selected"</c:if>>大前端</option>
                    <option value="大数据" <c:if test="${teacher.subjectId=='大数据'}">selected="selected"</c:if>>大数据</option>
                    <option value="移动端" <c:if test="${teacher.subjectId=='移动端'}">selected="selected"</c:if>>移动端</option>
                </select>
                    讲师级别：<select name="teacherLevel" style="width: 12%;margin-right: 10px">
                    <option value="">请选择</option>
                    <option value="教授" <c:if test="${teacher.teacherLevel=='教授'}">selected="selected"</c:if>>教授</option>
                    <option value="副教授" <c:if test="${teacher.teacherLevel=='副教授'}">selected="selected"</c:if>>副教授</option>
                    <option value="讲师" <c:if test="${teacher.teacherLevel=='讲师'}">selected="selected"</c:if>>讲师</option>
                    <option value="助教" <c:if test="${teacher.teacherLevel=='助教'}">selected="selected"</c:if>>助教</option>
                </select>
                    讲师简介：<input name="teacherIntroduce" value="${teacher.teacherIntroduce}"
                                style="width: 10%;margin-right: 10px" type="text">
                    <input type="submit" class="btn btn-warning" value="搜索" style="margin-top: -10px">
                </div>
                <div class="well">

                    <a href="${pageContext.request.contextPath}/Teacher/teacherEdit.emp" id="bo">添加</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">讲师姓名</th>
                            <th class="v">所授科目</th>
                            <th class="v">讲师级别</th>
                            <th class="v">讲师简介</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="t1" items="${teaList}">
                            <tr>
                                <td>${t1.teacherId}</td>
                                <td>${t1.teacherName}</td>
                                <td>${t1.subjectId}</td>
                                <td>${t1.teacherLevel}</td>
                                <td><div class="all_w2">${t1.teacherIntroduce}</div></td>
                                <td><a href="${pageContext.request.contextPath}/Teacher/teacherEdit.emp?teacherId=${t1.teacherId}">修改</a></td>
                                <td><a onclick="go(${t1.teacherId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="teacherPage" type="hidden" name="page" value="${page}">
                            <page:paging length="10" page="${page}" pages="${pages}"/>
                        </ul>
                    </c:if>
                </div>
            </form>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">删除信息</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>你确定要删除这条信息么？</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" data-dismiss="modal">删除</button>
                </div>
            </div>

            <footer>
                <hr>
                <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
            </footer>
        </div>
    </div>

</div>


</body>
</html>