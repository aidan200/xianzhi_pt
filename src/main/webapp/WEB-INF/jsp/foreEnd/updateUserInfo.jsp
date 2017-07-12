<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/12
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
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
<!DOCTYPE html>
<html lang="en">
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

            var prevDiv = document.getElementById('preview');
            var lj = "${pageContext.request.contextPath}/dist/photo/${xzMember.memberPicture}";
//            alert(lj);
            if (lj != null && lj != "") {
                prevDiv.innerHTML = '<img src=\'' + lj + '\' width="150xp" height="150px"/>';
            }
        });
        function setSex(sex) {
            if (sex == 1) {
                document.getElementById("sexaaa").value = 1;
            } else if (sex == 2) {
                document.getElementById("sexaaa").value = 2;
            }
        }


    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
</head>
<body class="jg">

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3> 用户信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">用户信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">

        <div class="company_position">
            <sf:form action="${pageContext.request.contextPath}/UserInfo/updateUserInfo.do" class="position_form"
                     enctype="multipart/form-data" modelAttribute="xzMember">
                <hr>
                <h4 class="position_h4">基本信息</h4>
                <sf:hidden path="loginID"/>
                <sf:hidden path="memberID"/>
                <div class="imgt" style="outline: none">
                    <div class="imgx" id="preview"></div>
                    <span class="choose"></span>
                    <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                           name="photoFile" value="${xzMember.memberPicture}" style="margin-bottom: 30px"/>
                    <sf:hidden path="memberPicture"/>
                </div>

                <label>
                    <span class="position_word">&emsp;姓&emsp;&emsp;名 : </span>
                    <sf:input path="memberName" autocomplete="off" cssClass="position_input2"/>
                    <sf:errors path="memberName"/>
                </label>
                <label>
                    <span class="position_word">&emsp;性&emsp;&emsp;别 : </span>
                    <c:if test="${xzMember.memberSex!=0}">
                        <sf:radiobutton path="memberSex" value="1"/> 男 &emsp;
                        <sf:radiobutton path="memberSex" value="2"/>女
                    </c:if>
                    <c:if test="${xzMember.memberSex==0}">
                        <sf:radiobutton path="memberSex" value="1" checked="checked"/> 男 &emsp;
                        <sf:radiobutton path="memberSex" value="2"/>女
                    </c:if>
                </label>

                <label>
                    <span class="position_word">&emsp;年&emsp;&emsp;龄 : </span>
                    <sf:input path="memberAge" autocomplete="off" cssClass="position_input2"
                              onkeyup="this.value=this.value.replace(/\D/g,'')"
                              onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
                    <sf:errors path="memberAge"/>
                </label>
                <label>
                    <span class="position_word">&emsp;学&emsp;&emsp;历 : </span>
                    <sf:select class="position_input4" path="memberEducation">
                        <sf:option value="无学历">无学历</sf:option>
                        <sf:option value="大专">大专</sf:option>
                        <sf:option value="本科">本科</sf:option>
                        <sf:option value="研究生">研究生</sf:option>
                        <sf:option value="硕士">硕士</sf:option>
                        <sf:option value="博士">博士</sf:option>
                    </sf:select>
                </label>
                <label>
                    <span class="position_word">&emsp;身份证号 : </span>
                    <sf:input path="memberIDcard" autocomplete="off" cssClass="position_input2"/>
                    <span>${peID}</span>
                </label>
                <label>
                    <span class="position_word">&emsp;电&emsp;&emsp;话 : </span>
                    <sf:input path="memberPhone" autocomplete="off" cssClass="position_input2"/>
                    <span>${mob}</span>
                </label>
                <label>
                    <span class="position_word">&emsp;邮&emsp;&emsp;箱 : </span>
                    <sf:input path="memberEmail" autocomplete="off" cssClass="position_input2"/>
                    <span><sf:errors path="memberEmail" />${memberEmailSpan}</span>
                </label>
                <label>
                    <span class="position_word">&emsp;地&emsp;&emsp;址 : </span>
                    <sf:input path="memberAddress" autocomplete="off" cssClass="position_input2"/>
                    <span><sf:errors path="memberAddress" /> </span>
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


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>
<script type="text/javascript">

    //选择封面图片
    function preview(file) {
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/photo/${xzMember.memberPicture}"
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" width="150xp" height="150px"/>';
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    }

    //    function preview(file) {
    //        var prevDiv = document.getElementById('preview');
    //    }
</script>

</body>
</html>
