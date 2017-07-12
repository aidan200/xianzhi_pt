<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/11
  Time: 11:01
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
<!DOCTYPE  html>
<head>
    <title>修改项目经验</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jeDate.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jeDate.js"></script>
    <!----font-Awesome----->
    <script type="application/javascript">
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
            var proID ="${xzProjectExperience.projectID}";
            var saveForm = document.getElementById("dvInput4");
            if(proID!=0){
                saveForm.action = "${pageContext.request.contextPath}/ProjectE/updateProjectE.do";
            }
        });

        function setPDiscribe() {
            var text = document.getElementById('projectDescribeID').value;
            document.getElementById("describeHiddenID").value = text;
        }

        function setJobDuties() {
            var text = document.getElementById('jobDutiesID').value;
            document.getElementById("dutiesHiddenID").value = text;
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>项目经验</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">首页</a></li>
                <li class="current-page">项目经验</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">

        <div class="company_position">
            <sf:form id="dvInput4" cssClass="position_form"  action="${pageContext.request.contextPath}/ProjectE/addProjectE.do"
                     method="post" modelAttribute="xzProjectExperience">
                <sf:input type="hidden"  path="projectID"/>
                <sf:input type="hidden"  path="loginID"/>
                <sf:input type="hidden"  path="deleteFalt"/>
                <hr>
                <h4 class="position_h4">项目经验</h4>
                <label>
                    <span class="position_word">&emsp;项目名称 : </span>
                    <sf:input path="projectName" autocomplete="off" class="position_input2" placeholder=" 项目名称"/>
                </label>
                <label>
                    <span class="position_word" style="float: left">&emsp;项目描述：</span>
                    <textarea id="projectDescribeID" onblur="setPDiscribe()" class="position_txt">${xzProjectExperience.projectDescribe}</textarea>
                    <sf:hidden id="describeHiddenID"  path="projectDescribe" />
                    <sf:errors path="projectDescribe"/>
                </label>
                <label>
                    <span class="position_word">&emsp;开始日期 : </span>
                    <sf:input class="position_input2" id="indate" placeholder=" 开始日期" path="startDate"/>
                </label>
                <label>
                    <span class="position_word">&emsp;结束日期 : </span>
                    <sf:input class="position_input2" id="indate1" placeholder=" 结束日期" path="endDate"/>
                    <span>${compareDateSpan}</span>
                </label>
                <label>
                    <span class="position_word" style="float: left">&emsp;工作内容：</span>
                    <textarea id="jobDutiesID" onblur="setJobDuties()" class="position_txt">${xzProjectExperience.jobDuties}</textarea>
                    <sf:hidden id="dutiesHiddenID" path="jobDuties" />
                    <sf:errors path="jobDuties"/>
                </label>
                <div style="text-align: center">
                    <button type="submit" class="position_button btn btn-primary">保存</button>
                    <a href="javascript:history.go(-1)">
                        <button type="button" class="position_button btn btn-primary">取消</button></a>
                </div>

            </sf:form>

        </div>


    </div>

</div>
<jsp:include page="footerForeEnd.jsp"/>
<script>
    jeDate({
        dateCell:"#indate",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
    jeDate({
        dateCell:"#indate1",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
</script>

</body>

</html>