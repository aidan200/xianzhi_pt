<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>简历信息编辑</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        //跳转页面
        window.onload = function () {
            var saveForm = document.getElementById("saveForm");
            if ('${msg}' == '修改成功') window.location.href = "${pageContext.request.contextPath}/UserInfo/goUserInfo.do";
        }
        function setResumeIntroduce () {
            var a = document.getElementById("resumeIntroduceID").value;
            document.getElementById("resumeIntroduceHidden").value = a;
        }
        
        //输入检查
        function check() {
            var year = $("#rYear").val();
            var salary = $("#reSalary").val();
            var email = $("#reEmail").val();
            var checkEmail = /^[a-zA-z]\w{3,15}$/;
            var saveForm = document.getElementById("saveForm");
            if (year > 50 || year < 0) {
                alert("工作年限必须在0-50年之间!");
                saveForm.action = "${pageContext.request.contextPath}/Resume/editResume.do";
            } else if (salary <= 0) {
                alert("薪资必须大于0!");
                saveForm.action = "${pageContext.request.contextPath}/Resume/editResume.do";
            } else if (!checkEmail.test(email)) {
                alert("请输入正确的邮箱地址!");
                saveForm.action = "${pageContext.request.contextPath}/Resume/editResume.do";
            } else {
                var reSum = document.getElementById("resumeSubmit");
                reSum.submit();
            }
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
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">用户信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">
        <div class="company_position">
            <sf:form id="saveForm" action="${pageContext.request.contextPath}/Resume/updateResume.do"
                     class="position_form" method="post" modelAttribute="resume">
                <sf:hidden path="resumeId"/>
                <sf:hidden path="memberName"/>
                <hr>
                <h4 class="position_h4">基本信息</h4>
                <label>
                    <span class="position_word">&emsp;姓&emsp;名 : </span>
                        ${resume.memberName}
                </label>
                <label>
                    <span class="position_word">&emsp;职&emsp;位 : </span>
                    <sf:select class="position_input2" path="resumeJob">
                        <sf:option value="JAVA开发"> JAVA开发 </sf:option>
                        <sf:option value="软件测试"> 软件测试 </sf:option>
                        <sf:option value="PHP开发"> PHP开发 </sf:option>
                        <sf:option value="Oracle维护"> Oracle维护 </sf:option>
                        <sf:option value="ASP.NET开发"> ASP.NET开发 </sf:option>
                        <sf:option value="大数据"> 大数据 </sf:option>
                        <sf:option value="日语翻译"> 日语翻译 </sf:option>
                        <sf:option value="其他"> 其他 </sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">&emsp;薪&emsp;资 : </span>
                    <sf:input path="resumeSalary" id="reSalary"
                              autocomplete="off" class="position_input2"/>
                    <span>${resumeSalarySpan}</span>
                </label>
                <label>
                    <span class="position_word">&emsp;地&emsp;点 : </span>
                    <sf:input path="resumePlace" autocomplete="off"
                              class="position_input2"/>
                    <sf:errors path="resumePlace"/>
                </label>
                <label>
                    <span class="position_word">&emsp;类&emsp;型 : </span>
                    <sf:select class="position_input2" path="resumeType">
                        <sf:option value="全职"> 全职 </sf:option>
                        <sf:option value="兼职"> 兼职 </sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">&emsp;现状态 : </span>
                    <sf:select class="position_input2" path="resumeState">
                        <sf:option value="找工作"> 找工作 </sf:option>
                        <sf:option value="跳槽"> 跳槽 </sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">工作经验 : </span>
                    <sf:select path="resumeYear" autocomplete="off" class="position_input2">
                        <sf:option value="无工作经验">无工作经验</sf:option>
                        <sf:option value="小于1年">小于1年</sf:option>
                        <sf:option value="1-2年">1-2年</sf:option>
                        <sf:option value="2-3年">2-3年</sf:option>
                        <sf:option value="3-5年">3-5年</sf:option>
                        <sf:option value="5-10年">5-10年</sf:option>
                        <sf:option value="10年以上">10年以上</sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word" style="float: left">自我评价：</span>
                    <textarea id="resumeIntroduceID" class="position_txt" onchange="setResumeIntroduce()">${resume.resumeIntroduce}</textarea>
                    <sf:hidden id="resumeIntroduceHidden" path="resumeIntroduce"/>
                    <sf:errors path="resumeIntroduce"/>
                </label>
                <div style="text-align: center">
                    <button type="submit" class="position_button btn btn-primary">保存</button>
                    <a href="javascript:history.go(-1)">
                        <button type="button" class="position_button btn btn-primary">取消</button>
                    </a>
                </div>
            </sf:form>
            <%--</sf:form>--%>

        </div>


    </div>

</div>
<div class="footer2">
    <div class="container">
        <div class="copy">
            <p>&copy; 2017.先知蓝创<a target="_blank" href="#"></a></p>
        </div>
    </div>
</div>


</body>
</html>