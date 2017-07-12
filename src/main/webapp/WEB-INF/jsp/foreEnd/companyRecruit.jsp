<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/4
  Time: 11:18
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
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <%--日期控件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jeDate.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jeDate.js"></script>
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
        <h3>招聘信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">招聘信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">

        <div class="">
            <div class="course_list">
                <sf:form id="recruitForm" action="${pageContext.request.contextPath}/XzRecruit/selectRecruitC.do" method="post"
                         modelAttribute="xzRecruit">
                    <input id="thePage" type="hidden"  name="page" value="${page}">
                    <div class="userlist_search col-md-12 col-sm-12">

                        <%--<div class="user_1 col-md-5"><span>发布日期：</span>--%>
                            <%--<div style="width: 90%">--%>
                            <%--<sf:input class="user_search1" id="indate" placeholder=" 发布日期" path="releaseDate"/>--%>
                            <%---<sf:input class="user_search1" id="indate1" placeholder=" 发布日期" path="releaseDate2"/></div>--%>
                            <%--<button type="submit" style="border: none;background-color: #FFFFFF;outline: none"><span class="fa fa-search" style="cursor: pointer;font-size: 23px"></span></button>--%>
                        <%--</div>--%>
                        <div class="user_1 col-md-5"><span>投递日期：</span>
                            <div style="width: 100%">
                                <input class="user_search1" id="indate" placeholder=" 投递日期" path="sendDate">-
                                <input class="user_search1" id="indate1" placeholder=" 投递日期" path="sendDate2"></div>
                                <%--<input class="user_search1" id="indate3" placeholder=" 投递日期" path="sendDate"/>--%>
                                <%---<input class="user_search1" id="indate4" placeholder=" 投递日期" path="sendDate2"/></div>--%>

                        </div>
                            <div class="user_1 col-md-4"><span>职位名称：</span>
                                <sf:input class="user_search" type="text" placeholder=" 职位名称" style="padding: 0" path="jobName"/>
                                <button type="submit" style="border: none;background-color: #FFFFFF;outline: none"><span class="fa fa-search" style="cursor: pointer;font-size: 20px"></span></button>
                            </div>


                    </div>
                    <div style="clear:both;"></div>
                    <div class="table-responsive">
                        <table class="table-fix table table-striped">
                            <thead>
                            <tr>
                                <th class="w7">职位名称</th>
                                <th class="w7">公司名称</th>
                                <th class="w8">职位月薪</th>
                                <th class="w8">工作地点</th>
                                <th class="w8">发布日期</th>
                                <th class="w8">操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="r1" items="${recruitList}">
                                <tr class="user_height">
                                    <td class="ww"><a href="${pageContext.request.contextPath}/XzRecruit/goUpdateRecruit.do?recruitID=${r1.recruitID}">${r1.jobName}</a></td>
                                    <td class="ww">${r1.companyName}</td>
                                    <td class="ww">${r1.monthlyMin}-${r1.monthlyMax}</td>
                                    <td class="ww">${r1.workplace}</td>
                                    <td class="ww"><fmt:formatDate value="${r1.releaseDate}" pattern="yyyy-MM-dd"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/XzRecruit/goUpdateRecruit.do?recruitID=${r1.recruitID}">修改</a>
                                        <a href="${pageContext.request.contextPath}/XzRecruit/deleteRecruit.do?recruitID=${r1.recruitID}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </sf:form>
                <div >
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
        dateCell:"#indate",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
    jeDate({
        dateCell:"#indate1",
        format:"YYYY-MM-DD",
        isTime:false,
        minDate:"2014-09-19 00:00:00"});
</script>

</body>
</html>
