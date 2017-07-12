<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/11
  Time: 18:19
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
    <title>历史记录</title>
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
                var form = document.getElementById("videoManageForm");
                form.submit();
            }
        }
    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>上传管理</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzVideo/recordHistory.do">历史记录</a></li>
                <li class="current-page"><a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do">会员中心</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="in_gray">

    <div class="in_white2">
        <div class="vip_nav">
            <ul class="col-md-2 col-xs-12" style="padding-right: 40px">
                <c:if test="${userLogin.loginType==1}">
                    <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do" class="view_w"><li class="vip_li">上传管理</li></a>
                </c:if>
                <a href="${pageContext.request.contextPath}/XzVideo/recordHistory.do" class="view_w"><li class="vip_li active">历史记录</li></a>
                <a href="${pageContext.request.contextPath}/XzVideo/boughtRecord.do" class="view_w"><li class="vip_li">已购视频</li></a>

            </ul>
        </div>

        <div class="col-md-10 col-xs-12">
            <sf:form id="videoManageForm" action="${pageContext.request.contextPath}/XzVideo/recordHistory.do"
                     modelAttribute="xzVideo">
                <input id="thePage" type="hidden" name="page" value="${page}">
                <div class="c">
                    <table class="table-fix table table-striped">
                        <thead>
                        <tr>
                            <th class="w9">视频预览图</th>
                            <th class="w8">视频名称</th>
                            <th class="w10">视频类别</th>
                            <th class="w2">观看日期</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="v1" items="${videoList}">
                            <tr class="user_height2">
                                <td class="ww">
                                    <a href="${pageContext.request.contextPath}/XzVideo/playUploadVideo.do?videoID=${v1.videoID}">
                                        <img
                                                src="${pageContext.request.contextPath}/dist/videoPic/${v1.videoPicture}"
                                                alt="视频小图" class="v2_img">
                                        <img src="${pageContext.request.contextPath}/dist/videoPic/${v1.videoPicture}"
                                             alt="视频大图" class="v_img">
                                    </a>
                                </td>
                                <td class="ww">${v1.videoName}</td>
                                <td class="ww">
                                        ${v1.className}
                                </td>
                                <td class="ww"><fmt:formatDate value="${v1.recordDate}" pattern="yyyy-MM-dd"/></td>

                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div>
                    <ul class="pagination">
                        <page:paging length="10" page="${page}" pages="${pages}"/>
                    </ul>
                </div>
            </sf:form>
        </div>


        <div style="clear:both;"></div>
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

