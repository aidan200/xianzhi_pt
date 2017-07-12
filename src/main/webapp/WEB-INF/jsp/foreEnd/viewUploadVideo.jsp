<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/13
  Time: 19:06
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
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>观看上传视频</title>
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
        });
    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
</head>
<body style="background-color: #eeeeee">

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>已上传视频</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">上传管理</a></li>
                <li class="current-page"><a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do">会员中心</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="in_gray">

    <div class="in_white2">
        <div class="vip_nav">
            <ul class="col-md-2 col-xs-12" style="padding-right: 40px">
                <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do" class="view_w"><li class="vip_li active">上传管理</li></a>
                <a href="${pageContext.request.contextPath}/XzVideo/recordHistory.do" class="view_w"><li class="vip_li">历史记录</li></a>
                <a href="${pageContext.request.contextPath}/XzVideo/boughtRecord.do" class="view_w"><li class="vip_li">已购视频</li></a>
            </ul>
        </div>
        <div class="col-md-10 col-md-12">
            <video autoplay controls class="vv"
                   src="${pageContext.request.contextPath}/dist/video/${xzVideo.videoAddress}"></video>
            <div class="clearfix"></div>
            <div style="clear: both"></div>
            <a class="button right" href="#" onClick="history.go(-1);return true;">
                <button class="btn btn-primary" style="width: 80px;margin-top: 20px;margin-left: 40px;" type="button"
                        >返回</button>
            </a>
        </div>
        <div style="clear: both"></div>

    </div>
</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>

<script>
    $(function () {
        $("td .v2_img").hover(function () {
            $(this).next().show();
        }, function () {
            $(this).next().hide();
        })
    });
</script>
</body>
</html>
