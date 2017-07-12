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
    <title>招聘信息详情</title>
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
        <h3>职位详情</h3>
        <p class="description">
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="current-page">职位详情</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width: 80%">

        <div>
            <h3 class="recruit_h3">公司名</h3>
            <div class="col-md-4 recruit_right">
                <img src="${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}" alt="公司图片" class="recruit_img">
                <div class="recruit_l">
                    <div class="col-md-12 recruit_e">公司规模：<span>${xzCompany.companyScale}人</span></div>
                    <div class="col-md-12 recruit_e">公司行业：<span>${xzCompany.industry}</span></div>
                    <div class="col-md-12 recruit_e">公司性质：<span>${xzCompany.companyNature==1?"国企":"私营"}</span></div>
                    <div class="col-md-12 recruit_e">公司地址：<span>${xzCompany.companyLocation}</span></div>
                    <div class="col-md-12 recruit_e">
                        <c:if test="${sendButton}">
                            <button type="button" class="company_button"
                                    onclick="location.href='${pageContext.request.contextPath}/sendResume/interceptorInsertSendResume.do?recruitID=${xzRecruit.recruitID}'">
                                投递简历
                            </button>
                        </c:if>
                        <c:if test="${!sendButton}">
                            <button type="button" class="company_button2"
                                    onclick="">
                                已投递
                            </button>
                        </c:if>
                        <div style="margin-top: 20px">
                            <a href="${pageContext.request.contextPath}/XzRecruit/selectRecruit.do">
                                <button type="button" class="company_button2 btn btn-primary">取消</button></a>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 recruit_left">
                <div>
                    <div class="col-md-6 recruit_e">职位月薪：<span>${xzRecruit.monthlyMin}-${xzRecruit.monthlyMax} 元</span>
                    </div>
                    <div class="col-md-6 recruit_e">工作地点：<span>${xzRecruit.workplace}</span></div>
                    <div class="col-md-6 recruit_e">发布日期：<span><fmt:formatDate value="${xzRecruit.releaseDate}" pattern="yyyy-MM-dd" /></span></div>
                    <div class="col-md-6 recruit_e">工作性质：<span>${xzRecruit.jobNature==1?"全职":"兼职"}</span></div>
                    <div class="col-md-6 recruit_e">工作经验：<span>${xzRecruit.workExperience}</span></div>
                    <div class="col-md-6 recruit_e">最低学历：
                        <span>
                            <c:if test="${xzRecruit.education==0||xzRecruit.education == 4}">
                                不限
                            </c:if>
                            <c:if test="${xzRecruit.education==1}">
                                专科
                            </c:if>
                            <c:if test="${xzRecruit.education==2}">
                                本科
                            </c:if>
                            <c:if test="${xzRecruit.education==3}">
                                研究生
                            </c:if>
                        </span></div>
                    <div class="col-md-6 recruit_e">招聘人数：<span>${xzRecruit.recNumber}</span></div>
                    <div class="col-md-6 recruit_e">职位类别：<span> ${xzRecruit.profession}</span></div>
                </div>
                <div style="clear: both"></div>
                <hr style="width: 100%">
                <div class="col-md-12">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#information1" data-toggle="tab">
                                职位描述
                            </a>
                        </li>
                        <li><a href="#information2" data-toggle="tab">公司介绍</a></li>

                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade in active" id="information1">
                            <div class="recruit_l3">&emsp;福利待遇&nbsp;：
                                <span>${xzRecruit.treatment}</span>
                            </div>
                            <div class="recruit_l2">&emsp;岗位职责&nbsp;：
                                <span>${xzRecruit.obligation}</span>
                            </div>
                            <div class="recruit_l2">&emsp;详细地址&nbsp;：
                                <span>${xzRecruit.jobAddress}</span>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="information2">
                            <div class="recruit_l2">&emsp;${xzCompany.companyIntro}</div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>


</div>


<jsp:include page="footerForeEnd.jsp"/>



</body>
</html>