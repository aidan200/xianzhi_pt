<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/11
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 18:38
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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>视频类别</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var saveForm = document.getElementById("tab");
            if (${xzVideoClass.vclassID==0}) {
                saveForm.action = "${pageContext.request.contextPath}/videoClass/insertVideoClass.emp";
            }
        });
    </script>

</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">课程类别</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">课程类别</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home" style="margin-top: 20px">
                        <sf:form id="tab" action="${pageContext.request.contextPath}/videoClass/updateVideoClass.emp"
                                 method="post"
                                 modelAttribute="xzVideoClass" enctype="multipart/form-data">
                            <sf:hidden path="vclassID"/>
                            类别名称：<br/>
                            <sf:input placeholder="类别名称*" cssClass="input-xlarge" path="className"/>
                            <sf:errors path="className"/><br/>
                            类别介绍:<br/>
                            <sf:textarea path="classIntroduce" cssClass="input-xlarge"/>
                            <sf:errors path="classIntroduce"/><br/>
                            <div class="btn-toolbar">
                                <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </div>



        </div>
        <footer>
            <hr>
            <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
        </footer>
    </div>

</div>


</body>
</html>

