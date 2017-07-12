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
<!DOCTYPE  HTML>
<html>
<head>
    <title>修改用户信息</title>
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
    <script>
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
            var eID ="${xzEducation.educationID}";
            var saveForm = document.getElementById("dvInput2");
            if(eID!=0){
                saveForm.action = "${pageContext.request.contextPath}/Education/updateEducation.do";
            }
        });
        function setEducationSkill() {
            var text = document.getElementById('educationSkillID').value;
            document.getElementById("educationSkillHiddenID").value = text;
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>用户信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">首页</a></li>
                <li class="current-page">用户信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">

        <div class="company_position">
            <sf:form id="dvInput2" cssClass="position_form"  action="${pageContext.request.contextPath}/Education/AddEducation.do"
                     method="post" modelAttribute="xzEducation">
                <hr>
                <h4 class="position_h4">学历信息</h4>
                <sf:hidden path="educationID"/>
                <sf:hidden path="loginID"/>
                <label>
                    <span class="position_word">&emsp;学&emsp;&emsp;历 : </span>
                    <%--<sf:input path="education" autocomplete="off" class="position_input2"/>--%>
                    <sf:select cssClass="position_input2" path="education">
                        <option value ="高中">高中</option>
                        <option value ="大专">大专</option>
                        <option value ="本科">本科</option>
                        <option value ="研究生">研究生</option>
                        <option value ="硕士">硕士</option>
                        <option value ="博士">博士</option>
                    </sf:select>
                    <sf:errors path="education"/>
                </label>
                <label>
                    <span class="position_word">&emsp;学&emsp;&emsp;校 : </span>
                    <sf:input type="text" path="school" autocomplete="off" class="position_input2"/>
                    <sf:errors path="school"/>
                </label>
                <label>
                    <span class="position_word">&emsp;专&emsp;&emsp;业 : </span>
                    <sf:input path="major" autocomplete="off" class="position_input2"/>
                    <sf:errors path="major"/>
                </label>
                <label>
                    <span class="position_word" style="float: left">&emsp;专业技能： </span>

                    <textarea id="educationSkillID" onblur="setEducationSkill()" class="position_txt">${xzEducation.educationSkill}</textarea>
                    <sf:hidden id="educationSkillHiddenID" path="educationSkill" />
                    <sf:errors path="educationSkill"/>
                </label>
                <label>
                    <span class="position_word">&emsp;入学时间 : </span>
                    <sf:input class="position_input2" id="indate" placeholder=" 入学时间" path="enrollmentDate"/>
                </label>
                <label>
                    <span class="position_word">&emsp;毕业时间 : </span>
                    <sf:input class="position_input2" id="indate1" placeholder=" 毕业时间" path="graduateDate"/>
                    <span>${compareDateSpan}</span>
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