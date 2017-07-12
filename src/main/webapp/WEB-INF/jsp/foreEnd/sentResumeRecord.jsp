<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/3
  Time: 13:31
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
    <title>招聘信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jeDate.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jeDate.js"></script>
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
                var form = document.getElementById("recruitForm");
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
        <h3>投递记录</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzRecruit/selectRecruit.do">招聘信息</a></li>
                <li class="current-page">投递记录</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">

        <div class="">
            <div class="course_list">
                <sf:form id="recruitForm" action="${pageContext.request.contextPath}/sendResume/getSentResumeRecord.do"
                         method="post"
                         modelAttribute="xzResumeSend">
                    <sf:hidden path="resumeID"/>
                    <input id="thePage" type="hidden" name="page" value="${page}">
                    <div class="userlist_search col-md-12 col-sm-12">
                        <div class="user_1 col-md-4"><span>投递日期：</span>
                            <div style="width: 100%">
                                <sf:input cssClass="user_search1" id="indate3" placeholder=" 投递日期" path="sendDate"/>
                                -<sf:input cssClass="user_search1" id="indate4" placeholder=" 投递日期" path="sendDate2"/></div>

                        </div>
                        <div class="user_1 col-md-4"><span>公司名称</span>
                            <sf:input class="user_search" type="text" placeholder=" 按公司名称搜索" style="padding: 0"
                                      path="companyName"/>
                        </div>
                        <div class="user_1 col-md-4"><span>职位名称</span>
                            <sf:input class="user_search" type="text" placeholder=" 职位名称" style="padding: 0"
                                      path="jobName"/>
                            <button type="submit" style="border: none;background-color: #FFFFFF;outline: none"><span
                                    class="fa fa-search" style="cursor: pointer;font-size: 23px"></span></button>
                        </div>



                    </div>
                    <div style="clear:both;"></div>
                </sf:form>
                    <div class="table-responsive">
                        <table class="table-fix table table-striped">
                            <thead>
                            <tr>
                                <th class="w7">职位名称</th>
                                <th class="w7">公司名称</th>
                                <th class="w8">投递日期</th>
                                <th class="w8">查看状态</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="s1" items="${sendList}">
                                <tr class="user_height">
                                    <td class="ww"><a
                                            href="${pageContext.request.contextPath}/XzRecruit/goRecruitDetails.do?recruitID=${s1.recruitID}">${s1.jobName}</a>
                                    </td>
                                    <td class="ww">${s1.companyName}</td>
                                    <td class="ww"><fmt:formatDate value="${s1.sendDate}" pattern="yyyy-MM-dd"/></td>
                                    <td class="ww">${s1.state==2?"未查看":"已查看"}</td>
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
            </div>
        </div>


        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>


<script type="text/javascript">
    jeDate({
        dateCell:"#indate3",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
    jeDate({
        dateCell:"#indate4",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
</script>
</body>
</html>