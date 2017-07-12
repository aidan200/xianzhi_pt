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
    <title>工作经验</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var logID = ${xzWorkExperience.workExperienceID};
            var saveForm = document.getElementById("tab1");
            if (logID == 0) {
                saveForm.action = "${pageContext.request.contextPath}/WorkE/addWorkEnd.emp";
            }
        });
    </script>

</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">工作经验</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">工作经验</li>
    </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                <sf:form id="tab1" action="${pageContext.request.contextPath}/WorkE/updateWorkEEnd.emp"
                         method="post" modelAttribute="xzWorkExperience" enctype="multipart/form-data">
                <div class="btn-toolbar">
                    <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                </div>
                <div class="well">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="home" style="margin-top: 40px">
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="workExperienceID"/>
                            工作经验表ID:<br/>
                            <input type="text" placeholder="工作经验表ID *" class="input-xlarge" value="${xzWorkExperience.workExperienceID}"
                                   disabled="disabled"><br/>
                            公司名称:<br/>
                            <sf:input placeholder="公司名称 *" cssClass="input-xlarge" path="company"/>
                            <sf:errors path="company"/><br/>
                            职务:<br/>
                            <sf:input placeholder="职务 *" cssClass="input-xlarge" path="duty"/>
                            <sf:errors path="duty"/><br/>
                            入职日期:<br/>
                            <sf:input placeholder="入职日期 *" id="pickdate" cssClass="oh" path="entryDate"/><br/>
                            离职日期；<br/>
                            <sf:input placeholder="离职日期 *" id="pickdate2" cssClass="oh" path="dimissionDate"/><br/>
                            <span>${compareDateSpan}</span>
                            离职原因;<br/>
                            <sf:textarea placeholder="离职原因 *" cssClass="input-xlarge" path="dimissionCause"/>
                            <sf:errors path="dimissionCause"/><br/>
                            工作描述:<br/>
                            <sf:textarea placeholder="工作描述 *" cssClass="input-xlarge" path="workDescription"/>
                            <sf:errors path="workDescription"/><br/>
                        </div>
                    </div>
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