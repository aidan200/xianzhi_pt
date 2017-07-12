<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/2
  Time: 18:25
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
    <title>招聘信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">招聘信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">招聘信息</li>
    </ul>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="well">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">修改招聘信息</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="home" style="margin-top: 20px">
                            <sf:form id="tab" action="${pageContext.request.contextPath}/XzRecruit/updateRecruit.emp" method="post"
                                     modelAttribute="xzRecruit" >
                            <sf:hidden path="recruitID"/>
                            <sf:hidden path="companyID"/>
                            <sf:hidden path="companyName"/>
                            招聘信息表ID:<br/>
                            <input type="text" placeholder="招聘信息表ID *" class="input-xlarge"
                                   value="${xzRecruit.recruitID}"
                                   disabled="disabled"><br/>
                            职业名称:<br/>
                            <sf:input placeholder="职业名称 *" cssClass="input-xlarge" path="jobName"/>
                            <sf:errors path="jobName"/><br/>
                           最低工资:<br/>
                            <sf:input placeholder="最低工资 *" cssClass="input-xlarge" path="monthlyMin"/>
                            <sf:errors path="monthlyMin"/><br/>
                            最高工资:<br/>
                            <sf:input placeholder="最高工资 *" cssClass="input-xlarge" path="monthlyMax"/>
                            <sf:errors path="monthlyMax"/><br/>
                            工作地点:<br/>
                            <sf:input placeholder="工作地点 *" cssClass="input-xlarge" path="workplace"/>
                            <sf:errors path="workplace"/><br/>

                            工作经验:<br/>
                            <sf:input id="workExperience1" placeholder="工作经验 *" cssClass="input-xlarge" path="workExperience"/>
                            <sf:errors path="workExperience"/><br/>
                            招聘人数:<br/>
                            <sf:input id="recNumber1" placeholder=" 招聘人数 *" cssClass="input-xlarge" path="recNumber"/>
                            <sf:errors path="recNumber"/><br/>

                            工作性质：<br/>
                            <sf:select path="jobNature">
                                <sf:option value="1">全职</sf:option>
                                <sf:option value="2">兼职</sf:option>
                            </sf:select><br/>

                           学历要求：<br/>
                            <sf:select path="education">
                                <sf:option value="4">无学历限制</sf:option>
                                <sf:option value="1">专科及以上学历</sf:option>
                                <sf:option value="2">本科及以上学历</sf:option>
                                <sf:option value="3">研究生及以上学历</sf:option>
                            </sf:select><br/>

                            福利待遇：<br/>
                            <sf:input placeholder=" 福利待遇 *" cssClass="input-xlarge" path="treatment"/>
                            <sf:errors path="treatment"/><br/>
                            工作职责：<br/>
                            <sf:input placeholder=" 工作职责*" cssClass="input-xlarge" path="obligation"/>
                            <sf:errors path="obligation"/><br/>
                            工作地址：<br/>
                            <sf:input placeholder=" 工作地址 *" cssClass="input-xlarge" path="jobAddress"/>
                            <sf:errors path="jobAddress"/><br/>
                            职位类别：<br/>
                            <sf:input placeholder=" 职位类别 *" cssClass="input-xlarge" path="profession"/><br/>
                            备用列1
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
<script type="text/javascript">
    var text = document.getElementById("workExperience1");
    var text2 = document.getElementById("recNumber1");
    text.onkeyup = function(){
        this.value=this.value.replace(/\D/g,'');
    }
    text2.onkeyup = function(){
        this.value=this.value.replace(/\D/g,'');
    }
</script>
</body>
</html>