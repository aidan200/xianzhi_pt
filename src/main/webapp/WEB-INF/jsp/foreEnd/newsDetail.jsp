<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>行业动态</title>
    <jsp:include page="cssJsHeader.jsp"/>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>行业动态</h3>
        <p class="description">
            秉持“助力梦想，伴你成长”的品牌理念，努力打造最值得信赖的校企合作伙伴。
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">行业动态</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <div class="col-md-3">
            <div class="courses_box1-left">
                <form>
                    <div class="select-block1">
                        <select>
                            <option value="">学科</option>
                            <option value="">学科</option>
                            <option value="">学科</option>
                            <option value="">学科</option>
                            <option value="">学科</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <div class="select-block1">
                        <select>
                            <option value="">时间</option>
                            <option value="">时间</option>
                            <option value="">时间</option>
                            <option value="">时间</option>
                            <option value="">时间</option>
                        </select>
                    </div>
                    <!-- select-block -->
                    <div class="select-block1">
                        <select>
                            <option value="">级别</option>
                            <option value="">级别</option>
                            <option value="">级别</option>
                            <option value="">级别</option>
                            <option value="">级别</option>
                        </select>
                    </div>

                    <input type="button" value="搜索" class="course-submit">
                </form>
            </div>
            <div class="personBox">
                <div class="personBox_1">
                    <div class="person_image">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png" class="img-responsive" alt=""/>
                    </div>
                    <div class="person_image_desc">
                        <h1>公司介绍</h1>
                        <p>助力梦想</p>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="person_description">
                    <p>
                        自创立以来，秉持“助力梦想，伴你成长”的品牌理念，努力打造最值得信赖的校企合作伙伴，以产教深度融合、校企合作为主线，与高校一同积极探索校企合作的办学模式和人才培养模式的创新。<a href="#">更多...</a>
                    </p>
                </div>
            </div>
            <div class="social-widget">
                <h2>联系我们</h2>
                <ul class="courses_social">
                    <li class="facebook-icon">
                        <div>
                            <a href="#" class="fa fa-facebook"></a>
                            <p>2154</p>
                        </div>
                    </li>
                    <li class="twitter-icon">
                        <div>
                            <a href="#" class="fa fa-twitter"></a>
                            <p>1425</p>
                        </div>
                    </li>
                    <li class="gplus-icon">
                        <div>
                            <a href="#" class="fa fa-google-plus"></a>
                            <p>2150</p>
                        </div>
                    </li>
                    <div class="clearfix"> </div>
                </ul>
            </div>

        </div>
        <div class="col-md-9 detail">
            <img src="${pageContext.request.contextPath}/dist/foreEnd/images/course.jpg" class="img-responsive" alt=""/>
            <h3>${news.newsTitle}</h3>
            <p>${news.newsArticle}</p>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

            </div>
            <div class="author-box">
                <div class="author-box-left"><img src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png" class="img-responsive" alt=""/></div>
                <div class="author-box-right">
                    <h4 class="MM">发布者：${news.newsWriter}</h4>
                    <span class="m_1">发布日期：<fmt:formatDate  value="${news.newsDate}" type="both" pattern="yyyy-MM-dd" /></span>
                </div>
                <div class="clearfix"></div>
            </div>

        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css' />
<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>
<script type="text/javascript">
    $(function(){
        SyntaxHighlighter.all();
    });
    $(window).load(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>
<!-- FlexSlider -->
</body>
</html>
