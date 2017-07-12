<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/13
  Time: 17:43
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
    <title>Courses</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <jsp:include page="cssForeEnd.jsp"/>

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
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>

<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>课程搜索</h3>
        <br/><br/>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">  首页</a></li>
                <li class="current-page">  课程搜索</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="admission">
    <div class="container">
        <sf:form id="courseForm" action="${pageContext.request.contextPath}/XzVideo/selectAllVideo.do"
                 modelAttribute="xzVideo">
            <input id="thePage" type="hidden" name="page" value="${page}">
            <div class="userlist_search col-md-12 col-sm-12">
                <div class="user_1 col-md-4"><span>用户名：</span>
                    <sf:input cssClass="user_search" type="text" placeholder=" 按用户名" path="memberName"/>
                </div>
                <div class="user_1 col-md-4"><span>视频名：</span>
                    <sf:input cssClass="user_search" type="text" placeholder=" 视频名" path="videoName"/>
                </div>
                <div class="user_1 col-md-4"><span>视频类别：</span>
                    <sf:select cssClass="user_search" type="text" placeholder=" 视频类别" path="vclass">
                        <sf:option value="0">请选择</sf:option>
                        <c:forEach var="c1" items="${xzVideoClassList}">
                            <sf:option value="${c1.vclassID}">${c1.className}</sf:option>
                        </c:forEach>
                    </sf:select>
                    <button type="submit">
                        <span class="fa fa-search" style="cursor: pointer"></span>
                    </button>
                </div>
            </div>
            <c:forEach var="t1" items="${videoList}">

                <div class="faculty_top">
                    <div class="op col-md-4">
                        <figure class="team_member">
                            <img src="${pageContext.request.contextPath}/dist/videoPic/${t1.videoPicture}" width="350xp"
                                 height="240px" alt=""/>
                            <div></div>
                            <figcaption><h3 class="person-title"><a
                                    href="${pageContext.request.contextPath}/XzVideo/playVideo.do?videoID=${t1.videoID}">${t1.videoName}</a>
                            </h3>
                                <p class="person-deg1">点击查看</p>
                                <span class="person-deg1">1207</span>
                                <a href="${pageContext.request.contextPath}/XzVideo/playVideo.do?videoID=${t1.videoID}">
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
                        <div class="course_b"><span>作者 : ${t1.memberName}</span>&emsp;<span>上传时间 :
                            <fmt:formatDate value="${t1.recordDate}" pattern="yyyy-MM-dd"/></span>
                        </div>
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
