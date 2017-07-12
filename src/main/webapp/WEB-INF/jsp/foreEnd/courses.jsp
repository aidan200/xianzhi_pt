<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>课程</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]-->
    <%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/respond.min.js"></script>--%>
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <%--<link href="${pageContext.request.contextPath}/dist/foreEnd/css/style.css" rel='stylesheet' type='text/css'/>--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jquery.countdown.css"/>

    <!----font-Awesome----->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/font-awesome.css" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/icomoon.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/bootstrap.css">
    <!-- Superfish -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/superfish.css">

    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/style.css" rel='stylesheet' type='text/css' />

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/modernizr-2.6.2.min.js"></script>


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/foreEnd/css/datedropper.css">
    <!--[endif]-->
    <script>
        $(document).ready(function(){
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
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
        <h3>课程类别</h3>
        <p class="description">
            2017版课程体系全面重磅升级  中国计算机学会软件能力认证
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">首页</a></li>
                <li class="current-page">课程类别</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->

<div id="fh5co-wrapper">
    <div id="fh5co-page">

        <div id="fh5co-work">
            <div class="work-wrap">
                <div class="container">
                    <div class="fh5co-project-inner row">
                        <div class="fh5co-imgs col-md-8 animate-box">
                            <div class="img-holder-1 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_1_large.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                            <div class="img-holder-2 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_1_small.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                        </div>
                        <div class="fh5co-text col-md-4 animate-box">
                            <h2>JAVA</h2>
                            <p style="line-height: 30px">Oracle、Java基础/Java高级、Web前端 Html5 CSS3 JavaScript BootStrap AngularJS、Web编程 Jsp、Servlet......、设计模式、Web框架 SpringMVC Mybatis Spring</p>
                            <p style="margin-top: 30px"><a href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=1" class="btn btn-primary">查看课程</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="work-wrap work-wrap-bg">
                <div class="container">
                    <div class="fh5co-project-inner row">
                        <div class="fh5co-imgs col-md-8 col-md-push-4 animate-box">
                            <div class="img-holder-1 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_2_large.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                            <div class="img-holder-2 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_2_small.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                        </div>
                        <div class="fh5co-text col-md-4 col-md-pull-8 animate-box">
                            <h2>大前端</h2>
                            <p style="line-height: 30px">Html5/CSS3/JavaScript、Ajax、Jquery、BootStrap、MongoDB、Mongoose、Express4、AngularJs、NodeJs、React、VUE</p>
                            <p style="margin-top: 30px"><a href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=2" class="btn btn-primary">查看课程</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="work-wrap">
                <div class="container">
                    <div class="fh5co-project-inner row">
                        <div class="fh5co-imgs col-md-8 animate-box">
                            <div class="img-holder-1 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_3_large.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                            <div class="img-holder-2 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_3_small.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                        </div>
                        <div class="fh5co-text col-md-4 animate-box">
                            <h2>大数据</h2>
                            <p style="line-height: 30px">大数据是规模非常巨大和复杂的数据集，传统数据库管理工具处理起来面临很多问题，比如说获取、存储、检索、共享、分析和可视化，数据量达到 PB、EB或ZB的级别。</p>
                            <p style="margin-top: 30px"><a href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=3" class="btn btn-primary">查看课程</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="work-wrap work-wrap-bg">
                <div class="container">
                    <div class="fh5co-project-inner row">
                        <div class="fh5co-imgs col-md-8 col-md-push-4 animate-box">
                            <div class="img-holder-1 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_4_large.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                            <div class="img-holder-2 animate-box">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/work_4_small.jpg" alt="Free HTML5 Bootstrap Template">
                            </div>
                        </div>
                        <div class="fh5co-text col-md-4 col-md-pull-8 animate-box">
                            <h2>移动端</h2>
                            <p style="line-height: 30px">H5响应式开发/Ionic/微信小程序开发</p>
                            <p style="margin-top: 30px"><a href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=4" class="btn btn-primary">查看课程</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- fh5co-work-section -->




    </div>
    <!-- END fh5co-page -->

</div>

<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css' />
<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>
<!-- FlexSlider -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/bootstrap.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.waypoints.min.js"></script>
<!-- Superfish -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/hoverIntent.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/superfish.js"></script>

<!-- Main JS (Do not remove) -->
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/main.js"></script>
</body>
</html>
