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
<head>
    <title>修改企业信息</title>
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

    <!--<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>-->
    <!----font-Awesome----->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/font-awesome.css" rel="stylesheet">
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
            var lj = "${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}";
//            alert(lj);
            if (lj != null && lj != "") {
                prevDiv.innerHTML = '<img src=\'' + lj + '\' width="150xp" height="150px"/>';
            }
        });

        function setCompanyIntro() {
            var text = document.getElementById('companyIntroT').value;
            document.getElementById("companyIntro1").value = text;
        }

        function setNature(v1) {
            if (v1 == 1) {
                document.getElementById("companyNature1").value = 1;
            } else if (v1 == 2) {
                document.getElementById("companyNature1").value = 2;
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
        <h3> 企业信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">企业信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">

        <div class="company_position">
            <sf:form action="${pageContext.request.contextPath}/CompanyInfo/updateCompanyInfo.do" class="position_form"
                     enctype="multipart/form-data" modelAttribute="xzCompany">
                <hr>
                <h4 class="position_h4">基本信息</h4>
                <sf:hidden path="loginID"/>
                <sf:hidden path="companyID"/>
                <div class="imgt" style="outline: none">
                    <div class="imgx" id="preview"></div>
                    <span class="choose"></span>
                    <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                           name="photoFile" value="${xzCompany.companyPicture}" style="margin-bottom: 30px"/>
                    <sf:hidden path="companyPicture"/>
                </div>

                <label>
                    <span class="position_word">&emsp;公司名称 : </span>
                        ${xzCompany.companyName}
                    <sf:hidden path="companyName"/>
                </label>
                <label>
                    <span class="position_word">&emsp;公司地址 : </span>
                    <sf:input path="companyLocation" autocomplete="off" cssClass="position_input2"/>
                    <sf:errors path="companyLocation"/>
                </label>
                <label>
                    <span class="position_word">&emsp;公司电话 : </span>
                    <sf:input path="companyPhone" placeholder="固定电话格式:xxx-xxxxxxxx" autocomplete="off" cssClass="position_input2"/>
                        ${pho}
                </label>

                <label>
                    <span class="position_word">&emsp;公司规模 : </span>
                    <sf:select path="companyScale" cssClass="position_input2">
                        <sf:option value="1-19人">1-19人</sf:option>
                        <sf:option value="20-49人">20-49人</sf:option>
                        <sf:option value="50-99人">50-99人</sf:option>
                        <sf:option value="100-499人">100-499人</sf:option>
                        <sf:option value="500-999人">500-999人</sf:option>
                        <sf:option value="1000-1999人">1000-1999人</sf:option>
                        <sf:option value="2000人以上">2000人以上</sf:option>
                    </sf:select>
                </label>

                <label>
                    <span class="position_word">&emsp;公司性质 : </span>
                    <sf:select path="companyNature" autocomplete="off" cssClass="position_input2">
                        <sf:option value="1">国企</sf:option>
                        <sf:option value="2">私企</sf:option>
                    </sf:select>
                </label>

                <label>
                    <span class="position_word">&emsp;所属行业 : </span>
                    <sf:input path="industry" autocomplete="off" cssClass="position_input2"/>
                    <sf:errors path="industry"/>
                </label>
                <label>
                    <span class="position_word">&emsp;公司简介 : </span>
                    <textarea id="companyIntroT" rows="10" cols="42"
                              onblur="setCompanyIntro()" style="border-radius: 3px;border: 1px solid #CCCCCC"
                              class="position_txt">${xzCompany.companyIntro}</textarea>
                    <sf:input id="companyIntro1" type="hidden" path="companyIntro"/>
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
<script src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    //选择封面图片
    function preview(file) {
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}"
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
</script>

</body>
</html>
