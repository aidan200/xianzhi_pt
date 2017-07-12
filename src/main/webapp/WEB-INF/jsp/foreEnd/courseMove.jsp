<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 12:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>移动端</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Learn Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/bootstrap-3.1.1.min.css" rel='stylesheet'
          type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/style.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jquery.countdown.css"/>

    <!----font-Awesome----->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/foreEnd/css/datedropper.css">
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
        });
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("thePage");
                pageInp.value = page;
                var form = document.getElementById("courseForm");
                form.submit();
            }
        }
        function jump(id) {
            var test = window.location.href;
            var a2 = "${pageContext.request.contextPath}";
            var a;
            if (null == a2 || "" == a2) {
                a = test.substr(21);
            } else {
                a = test.substr(21+a2.length);
            }
            window.location.href="${pageContext.request.contextPath}/XzVideo/playVideo.do?videoID="+id+"&jumpAddress="+a;
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>

<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>移动端</h3>
        <p class="description">
            大数据指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，是有更强的决策洞察发现力和流程优化能力的海量、
            高增长率和多样化的信息资产。
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">移动端</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="admission">
    <div class="container">
        <sf:form id="courseForm" action="${pageContext.request.contextPath}/XzVideo/goCourses.do"
                 modelAttribute="xzVideo">
            <input id="thePage" type="hidden" name="page" value="${page}">
            <sf:hidden path="vclass"/>
            <c:forEach var="t1" items="${videoList}">

                <div class="faculty_top">
                    <div class="op col-md-4">
                        <figure class="team_member">
                            <img src="${pageContext.request.contextPath}/dist/videoPic/${t1.videoPicture}" width="350xp"
                                 height="240px" alt=""/>
                            <div></div>
                            <figcaption><h3 class="person-title"><a
                                    onclick="javascript:jump(${t1.videoID})">${t1.videoName}</a>
                            </h3>
                                <p class="person-deg1">点击查看</p>
                                <span class="person-deg1">1207</span>
                                <a onclick="javascript:jump(${t1.videoID})">
                                    <div class="fa fa-play-circle-o fa-4x" style="color: #f1b458"></div>
                                </a>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="course_a col-md-8">
                        <h3 class="course_h">${t1.videoName}</h3>
                        <div class="course_m">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${t1.videoIntroduce}
                        </div>
                        <div class="clearfix"></div>
                        <div class="course_b"><span>作者 : ${t1.memberName}</span>&emsp;<span> 上传时间 : <fmt:formatDate
                                value="${t1.recordDate}" pattern="yyyy-MM-dd"/></span></div>

                    </div>
                    <div class="clearfix"></div>
                </div>
            </c:forEach>

            <ul class="pagination">
                <page:paging length="10" page="${page}" pages="${pages}"/>
            </ul>
        </sf:form>
    </div>
</div>
<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css'/>
<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>

</body>
</html>