<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>师资</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if ('${msg}' == '添加成功' || '${msg}' == '修改成功') window.location.href = "${pageContext.request.contextPath}/Teacher/selectTeacherAll.emp";
            if ('${teacher.teacherId }' != 0) {
                saveForm.action = "${pageContext.request.contextPath}/Teacher/updateTeacher.emp";
            }
        });
    </script>
</head>
<jsp:include page="backEndHeader.jsp"/>

<body>
<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改师资信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">师资</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Teacher/saveTeacher.emp"
                                 modelAttribute="teacher">
                            <sf:hidden path="teacherId"/>
                            讲师姓名:<br>
                            <sf:input id="ga" path="teacherName"/>
                            <sf:errors path="teacherName"/>
                            <br>
                            所授科目:<br>
                            <sf:select path="subjectId">
                                <option disabled>请选择</option>
                                <sf:option value="JAVA">JAVA</sf:option>
                                <sf:option value="大前端">大前端</sf:option>
                                <sf:option value="大数据">大数据</sf:option>
                                <sf:option value="移动端">移动端</sf:option>
                            </sf:select><br>
                            讲师级别:<br>
                            <sf:select path="teacherLevel">
                                <option disabled>请选择</option>
                                <sf:option value="讲师">讲师</sf:option>
                                <sf:option value="助教">助教</sf:option>
                                <sf:option value="副教授">副教授</sf:option>
                                <sf:option value="教授">教授</sf:option>
                            </sf:select><br>
                            讲师简介:<br>
                            <sf:textarea path="teacherIntroduce"/>
                            <sf:errors path="teacherIntroduce"/>
                            <br>
                            <button id="saveButton" class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                        </sf:form>
                    </div>
                </div>

            </div>

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


<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>

</body>
</html>
