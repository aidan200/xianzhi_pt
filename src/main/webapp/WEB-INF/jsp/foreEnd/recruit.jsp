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
        window.onload = function () {
            document.getElementById("monthlyMinID").value = 0;
        }
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
                <sf:form id="recruitForm" action="${pageContext.request.contextPath}/XzRecruit/selectRecruit.do"
                         method="post"
                         modelAttribute="xzRecruit">
                    <input id="thePage" type="hidden" name="page" value="${page}">
                    <div class="userlist_search col-md-12 col-sm-12">
                        <div class="user_1 col-md-4"><span>职位名称：</span>
                            <sf:input class="user_search" placeholder=" 按职位名称搜索" path="jobName"/>
                        </div>

                        <div class="user_1 col-md-4"><span>公司名称</span>
                            <sf:input class="user_search" type="text" placeholder=" 按公司名称搜索" style="padding: 0"
                                      path="companyName"/>
                        </div>


                        <div class="user_1 col-md-4"><span>工作地点：</span>
                            <sf:input class="user_search" placeholder=" 按工作地点搜索" path="workplace"/>
                        </div>

                        <div class="user_1 col-md-4"><span>工作经验：</span>
                            <sf:select autocomplete="off" class="user_search" path="workExperience">
                                <sf:option value="">无限制</sf:option>
                                <sf:option value="1-3年">1-3年</sf:option>
                                <sf:option value="3-5年">3-5年</sf:option>
                                <sf:option value="5年以上">5年以上</sf:option>
                            </sf:select>
                        </div>

                        <div class="user_1 col-md-4"><span>薪资要求：</span>
                            <sf:select id="monthlyMinID" class="user_search" placeholder=" 按薪资要求搜索" path="monthlyMin">
                                <sf:option value="0">请选择</sf:option>
                                <sf:option value="1500">1500</sf:option>
                                <sf:option value="2000">2000</sf:option>
                                <sf:option value="2500">2500</sf:option>
                                <sf:option value="3000">3000</sf:option>
                                <sf:option value="3500">3500</sf:option>
                                <sf:option value="4000">4000</sf:option>
                                <sf:option value="4500">4500</sf:option>
                                <sf:option value="5000">5000</sf:option>
                                <sf:option value="6000">6000</sf:option>
                                <sf:option value="7000">7000</sf:option>
                                <sf:option value="8000">8000</sf:option>
                                <sf:option value="9000">9000</sf:option>
                                <sf:option value="10000">10000以上</sf:option>
                            </sf:select>
                            <button type="submit" style="border: none;background-color: #FFFFFF;outline: none"><span
                                    class="fa fa-search" style="cursor: pointer;font-size: 23px"></span></button>
                        </div>
                        <div class="col-md-4" style="margin-top: 30px">
                            <c:if test="${userLogin.loginID!=0}">
                                <button type="button" class="company_button"
                                        onclick="location.href='${pageContext.request.contextPath}/sendResume/getSentResumeRecord.do'">
                                    查看投递记录
                                </button>
                            </c:if>
                        </div>
                    </div>
                </sf:form>
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
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="r1" items="${recruitList}">
                            <tr class="user_height">
                                <td class="ww"><a
                                        href="${pageContext.request.contextPath}/XzRecruit/goRecruitDetails.do?recruitID=${r1.recruitID}">${r1.jobName}</a>
                                </td>
                                <td class="ww">${r1.companyName}</td>
                                <td class="ww">${r1.monthlyMin}-${r1.monthlyMax}</td>
                                <td class="ww">${r1.workplace}</td>
                                <td class="ww"><fmt:formatDate value="${r1.releaseDate}" pattern="yyyy-MM-dd"/></td>
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


</body>
</html>