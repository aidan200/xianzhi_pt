<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>行业动态</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script>
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("newsPage");
                pageInp.value = page;
                var form = document.getElementById("newsForm");
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
        <h3>行业动态</h3>
        <p class="description">

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

                    <!-- select-block -->
                    <input type="button" value="搜索" class="course-submit">
                </form>
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


        <div class="col-md-9">
            <form id="newsForm" action="${pageContext.request.contextPath}/News/selectNewsAll.do" >
            <div class="course_list">
                <div class="table-header clearfix">
                    <div class="name_col">行业动态</div>
                    <div class="date_col">发布日期</div>
                </div>

                <ul class="table-list">
                    <c:forEach var="n1" items="${newsList}">
                    <li class="clearfix">
                        <div class="name_col"><a href="${pageContext.request.contextPath}/News/newsEdit.do?newsId=${n1.newsId}">${n1.newsTitle}</a></div>
                        <div class="date_col"><fmt:formatDate  value="${n1.newsDate}" type="both" pattern="yyyy-MM-dd" /></div>
                    </li>
                    </c:forEach>
                    <div>

                        <c:if test="${pages > 1}">
                            <ul class="pagination">
                                <input id="newsPage" type="hidden" name="page" value="${page}">
                                <page:paging length="10" page="${page}" pages="${pages}"/>
                            </ul>
                        </c:if>


                    </div>
                </ul>

            </div>
            </form>
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