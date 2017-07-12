<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/5
  Time: 16:53
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
<!DOCTYPE HTML>
<html>
<head>
    <title>发布职位</title>
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
            var rID = "${xzRecruit.recruitID}";
            var saveForm = document.getElementById("insertRecruitForm");
            if (rID != 0) {
                saveForm.action = "${pageContext.request.contextPath}/XzRecruit/updateRecruit.do";
            }

        });

        window.onload = function () {
            if (${xzRecruit.monthlyMin == 0}) {
                document.getElementById("monthlyMinID").value = 0;
            }
            if (${xzRecruit.monthlyMax == 0}) {
                document.getElementById("monthlyMaxID").value = 0;
            }
        }

        //            福利待遇hidden 赋值
        function saveTreatment() {
            var text = document.getElementById('treatmentID').value;
            document.getElementById("treatment1").value = text;
        }
        //            工作职责hidden 赋值
        function saveObligation() {
            var text = document.getElementById('obligationID').value;
            document.getElementById("obligation1").value = text;
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>发布职位</h3>
        <p class="description">
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">发布职位</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width: 90%">
        <!--基本信息-->
        <div class="company_position">
            <!--<h2>发布职位</h2>-->
            <sf:form id="insertRecruitForm" action="${pageContext.request.contextPath}/XzRecruit/insertRecruit.do"
                     class="position_form" modelAttribute="xzRecruit">
                <hr>
                <h4 class="position_h4">基本信息</h4>
                <sf:hidden path="recruitID"/>
                <sf:hidden path="companyID"/>
                <sf:hidden path="companyName"/>
                <label>
                    <span class="position_word">职位名称 : </span>
                    <sf:input autocomplete="off" class="position_input2" path="jobName"/>
                    <sf:errors path="jobName"/>
                </label>
                <label>
                    <span class="position_word">职位类别 : </span>
                    <sf:input cssClass="position_input2" path="profession"/>
                </label>
                <label>
                    <span class="position_word">职位月薪 : </span>
                    <sf:input id="monthlyMinID" autocomplete="off" class="position_input1" path="monthlyMin"/> -
                    <sf:input id="monthlyMaxID" autocomplete="off" class="position_input1" path="monthlyMax"/>
                    <sf:errors path="monthlyMin"/>&nbsp;&nbsp;&nbsp;<sf:errors path="monthlyMax"/>
                </label>
                <label>
                    <span class="position_word">工作地点 : </span>
                    <sf:input autocomplete="off" class="position_input2" path="workplace"/>
                    <sf:errors path="workplace"/>
                </label>
                <label>
                    <span class="position_word">工作经验 : </span>
                    <sf:select autocomplete="off" class="position_input2" path="workExperience">
                        <sf:option value="无限制">无限制</sf:option>
                        <sf:option value="1-3年">1-3年</sf:option>
                        <sf:option value="3-5年">3-5年</sf:option>
                        <sf:option value="5年以上">5年以上</sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">招聘人数 : </span>
                    <sf:select autocomplete="off" class="position_input2" path="recNumber">
                        <sf:option value="1-5人">1-5人</sf:option>
                        <sf:option value="5-10人">5-10人</sf:option>
                        <sf:option value="10-15人">10-15人</sf:option>
                        <sf:option value="15-20人">15-20人</sf:option>
                        <sf:option value="20人以上">20人以上</sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">工作性质 : </span>
                    <sf:radiobutton class="position_input3" path="jobNature" value="1"/>全职
                    <sf:radiobutton class="position_input3" path="jobNature" value="2"/>兼职
                </label>
                <label>
                    <span class="position_word">学历要求 : </span>
                    <sf:select class="position_input4" path="education">
                        <sf:option value="1">无学历要求</sf:option>
                        <sf:option value="2">高中学历</sf:option>
                        <sf:option value="3">大专学历</sf:option>
                        <sf:option value="4">本科学历</sf:option>
                        <sf:option value="5">研究生及以上学历</sf:option>
                    </sf:select>
                </label>
                <hr>
                <h4 class="position_h4">职位描述</h4>
                <label>
                    <span class="position_word" style="float: left">福利待遇&emsp; </span>
                    <textarea id="treatmentID" class="position_txt"
                              onchange="saveTreatment()">${xzRecruit.treatment}</textarea>
                    <sf:hidden id="treatment1" path="treatment"/>
                    <sf:errors path="treatment"/>
                </label>

                <label>
                    <span class="position_word" style="float: left">岗位职责&emsp; </span>
                    <textarea id="obligationID" class="position_txt"
                              onchange="saveObligation()">${xzRecruit.obligation}</textarea>
                    <sf:hidden id="obligation1" path="obligation"/>
                    <sf:errors path="obligation"/>
                </label>
                <label>
                    <span class="position_word">详细地址 : </span>
                    <sf:input autocomplete="off" class="position_input2" path="jobAddress"/>
                    <sf:errors path="jobAddress"/>
                </label>
                <div style="text-align: center">
                    <button type="submit" class="position_button btn btn-primary">保存</button>
                    <a href="javascript:history.go(-1)">
                        <button type="button" class="position_button btn btn-primary">取消</button>
                    </a>
                </div>
            </sf:form>
        </div>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>

</body>
</html>
