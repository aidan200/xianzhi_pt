<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        $(document).ready(function () {
            var logID = ${xzEducation.educationID};
            var saveForm = document.getElementById("tab1");
            if (logID == 0) {
                saveForm.action = "${pageContext.request.contextPath}/Education/addEducationEnd.emp";
            }
        });
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">学历信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">学历信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">


            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home" style="margin-top: 20px">
                        <sf:form id="tab1" action="${pageContext.request.contextPath}/Education/updateEducationEnd.emp"
                                 method="post"
                                 modelAttribute="xzEducation" enctype="multipart/form-data">
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="educationID"/>
                            学历表ID:<br/>
                            <input type="text" placeholder="学历表ID *" class="input-xlarge"
                                   value="${xzEducation.educationID}"
                                   disabled="disabled"><br/>
                            学历:<br/>
                            <sf:input placeholder="学历 *" cssClass="input-xlarge" path="education"/>
                            <sf:errors path="education"/><br/>
                            学校:<br/>
                            <sf:input placeholder="学校 *" cssClass="input-xlarge" path="school"/>
                            <sf:errors path="school"/><br/>
                            专业:<br/>
                            <sf:input placeholder="专业 *" cssClass="input-xlarge" path="major"/>
                            <sf:errors path="major"/><br/>

                            入学时间:<br/>
                            <sf:input placeholder="入学时间 *" id="pickdate" cssClass="oh" path="enrollmentDate"/><br/>
                            毕业时间:<br/>
                            <sf:input placeholder="毕业时间 *" id="pickdate2" cssClass="oh" path="graduateDate"/>
                            <span>${compareDateSpan}</span><br/>

                            专业技能:<br/>
                            <sf:textarea placeholder="专业技能 *" cssClass="input-xlarge" path="educationSkill"/>
                            <sf:errors path="educationSkill"/><br/>
                            <div class="btn-toolbar">
                                <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                            </div>
                        </sf:form>
                    </div>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/datedropper.min.js"></script>
<script>
    $("#pickdate").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
    $("#pickdate2").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
</script>

</body>
</html>