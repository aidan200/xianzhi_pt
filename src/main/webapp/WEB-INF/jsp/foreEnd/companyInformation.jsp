<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/3
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>公司信息内容</title>
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
        });
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>公司信息</h3>
        <p class="description">
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">首页</a></li>
                <li class="current-page">公司信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <sf:form class="news readonly" id="dvInput"
                 action="" method="post"
                 enctype="multipart/form-data" modelAttribute="xzCompany">
            <sf:input type="hidden" value="${xzCompany.loginID}" path="loginID"/>
            <div class="user_title2">
                <div class="col-md-3">
                    <img src="${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}" alt="" class="content_img2">
                </div>
                <div class="user_t col-md-9">
                    <div class="user_name1 col-md-10 col-xs-12">
                        公司名：${xzCompany.companyName}
                    </div>
                    <div class="user_x col-md-2 col-xs-12"><a href="${pageContext.request.contextPath}/CompanyInfo/goUpdateCompanyInfo.do?loginID=${xzCompany.loginID}" class="user_y">修改</a></div>
                    <div class="user_o col-md-12">
                            <div class="col-md-4">
                                规模 ：<span>${xzCompany.companyScale}</span>
                            </div>
                            <div class="col-md-4">
                                性质 ：<span>${xzCompany.companyNature==1?"国企":"私企"}</span>
                            </div>
                            <div class="col-md-4">
                                行业 ：<span>${xzCompany.industry}</span>
                            </div>
                        <div class="col-md-6">
                            地址 ：<span>${xzCompany.companyLocation}</span>
                        </div>
                        <div class="col-md-6">
                            电话 ：<span>${xzCompany.companyPhone}</span>
                        </div>
                    </div>
                    <div class="user_o2 col-md-12">
                        <div class="col-md-6">

                            <a href="${pageContext.request.contextPath}/XzRecruit/selectRecruitC.do" class="button_a"> <button class="company_button" type="button" >查看已发布的职位 </button> </a>

                        </div>
                        <div class="col-md-6">

                            <a href="${pageContext.request.contextPath}/XzRecruit/goInsertRecruit.do?loginID=${xzCompany.loginID}" class="button_a"> <button class="company_button" type="button">发布职位</button> </a>

                        </div>
                    </div>
                </div>

            </div>
            <hr style="border: 1px solid #f1b458;width: 80%;margin-top: 40px">
            <div class="company_introduce">
                <h3>公司简介 ：</h3>
                <span style="font-size: 15px;letter-spacing: 1px;margin-top: 20px">
                &emsp;&emsp;${xzCompany.companyIntro}
                </span>
            </div>


        </sf:form>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>


</body>
</html>
