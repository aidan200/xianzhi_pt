<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>活动</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if ('${msg}' == '添加成功' || '${msg}' == '修改成功') window.location.href = "${pageContext.request.contextPath}/Event/selectEventAll.emp";
            if ('${event.eventId }' != 0) {
                saveForm.action = "${pageContext.request.contextPath}/Event/updateEvent.emp";
            }
        });
        //判断起始时间必须小于截止时间
        function timeJudge() {
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            var d1 = new Date(startTime.replace(/\-/g, "\/"));
            var d2 = new Date(endTime.replace(/\-/g, "\/"));
            if (startTime != "" && endTime != "" && d1 >= d2) {
                alert("起始时间不能大于截止时间！");
            }
        }
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改活动信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">活动</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Event/saveEvent.emp"
                                 modelAttribute="event">
                            <sf:hidden path="eventId"/><br>
                            起始时间;<br><sf:input path="startTime" type="text" class="sang_Calender"
                                               id="startTime"/><sf:errors path="startTime"/> <br>
                            截止时间:<br><sf:input path="endTime" type="text" class="sang_Calender" id="endTime"/>
                            <sf:errors path="endTime"/>
                            <br>
                            举办地点:<br><sf:input path="eventPlace"/>
                            <sf:errors path="eventPlace"/>
                            <br>
                            主办人/主办方:<br><sf:input path="eventBy"/>
                            <sf:errors path="eventBy"/>
                            <br>
                            活动发布者:<br><sf:input path="eventWriter"/>
                            <sf:errors path="eventWriter"/>
                            <br>
                            活动标题:<br><sf:input path="eventTitle"/>
                            <sf:errors path="eventTitle"/>
                            <br>
                            活动类型:<br>
                            <sf:select path="eventType">
                                <option disabled>请选择</option>
                                <sf:option value="项目实战">项目实战</sf:option>
                                <sf:option value="企业宣传">企业宣传</sf:option>
                                <sf:option value="行业规划">行业规划</sf:option>
                                <sf:option value="技术宣讲">技术宣讲</sf:option>
                            </sf:select>
                            <br>
                            活动内容简介:<br><sf:textarea path="eventArticle"/>
                            <sf:errors path="eventArticle"/>
                            <br>
                            <button class="btn btn-warning" onclick="timeJudge()"><i class="icon-ok"></i>保存</button>
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
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datetime.js"></script>


</body>
</html>
