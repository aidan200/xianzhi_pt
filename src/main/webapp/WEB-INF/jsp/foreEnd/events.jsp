<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>活动</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/clndr.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/underscore-min.js" type="text/javascript"></script>
    <script src= "${pageContext.request.contextPath}/dist/foreEnd/js/moment-2.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/clndr.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/site.js" type="text/javascript"></script>
    <script>
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("eventPage");
                pageInp.value = page;
                var form = document.getElementById("eventForm");
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
        <h3>活动</h3>
        <p class="description">
            企业需求的项目案例，市场上最流行的产品研发技术行业内最先进的教学平台
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">活动</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <div class="none col-md-4">
            <div class="cal1 cal_2"><div class="clndr"><div class="clndr-controls"><div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div><div class="month">September 2015</div><div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div></div><table class="clndr-table" border="0" cellspacing="0" cellpadding="0"><thead><tr class="header-days"><td class="header-day">S</td><td class="header-day">M</td><td class="header-day">T</td><td class="header-day">W</td><td class="header-day">T</td><td class="header-day">F</td><td class="header-day">S</td></tr></thead><tbody><tr><td class="day past adjacent-month last-month calendar-day-2015-08-30"><div class="day-contents">30</div></td><td class="day past adjacent-month last-month calendar-day-2015-08-31"><div class="day-contents">31</div></td><td class="day today calendar-day-2015-09-01"><div class="day-contents">1</div></td><td class="day calendar-day-2015-09-02"><div class="day-contents">2</div></td><td class="day calendar-day-2015-09-03"><div class="day-contents">3</div></td><td class="day calendar-day-2015-09-04"><div class="day-contents">4</div></td><td class="day calendar-day-2015-09-05"><div class="day-contents">5</div></td></tr><tr><td class="day calendar-day-2015-09-06"><div class="day-contents">6</div></td><td class="day calendar-day-2015-09-07"><div class="day-contents">7</div></td><td class="day calendar-day-2015-09-08"><div class="day-contents">8</div></td><td class="day calendar-day-2015-09-09"><div class="day-contents">9</div></td><td class="day event calendar-day-2015-09-10"><div class="day-contents">10</div></td><td class="day event calendar-day-2015-09-11"><div class="day-contents">11</div></td><td class="day event calendar-day-2015-09-12"><div class="day-contents">12</div></td></tr><tr><td class="day event calendar-day-2015-09-13"><div class="day-contents">13</div></td><td class="day event calendar-day-2015-09-14"><div class="day-contents">14</div></td><td class="day calendar-day-2015-09-15"><div class="day-contents">15</div></td><td class="day calendar-day-2015-09-16"><div class="day-contents">16</div></td><td class="day calendar-day-2015-09-17"><div class="day-contents">17</div></td><td class="day calendar-day-2015-09-18"><div class="day-contents">18</div></td><td class="day calendar-day-2015-09-19"><div class="day-contents">19</div></td></tr><tr><td class="day calendar-day-2015-09-20"><div class="day-contents">20</div></td><td class="day event calendar-day-2015-09-21"><div class="day-contents">21</div></td><td class="day event calendar-day-2015-09-22"><div class="day-contents">22</div></td><td class="day event calendar-day-2015-09-23"><div class="day-contents">23</div></td><td class="day calendar-day-2015-09-24"><div class="day-contents">24</div></td><td class="day calendar-day-2015-09-25"><div class="day-contents">25</div></td><td class="day calendar-day-2015-09-26"><div class="day-contents">26</div></td></tr><tr><td class="day calendar-day-2015-09-27"><div class="day-contents">27</div></td><td class="day calendar-day-2015-09-28"><div class="day-contents">28</div></td><td class="day calendar-day-2015-09-29"><div class="day-contents">29</div></td><td class="day calendar-day-2015-09-30"><div class="day-contents">30</div></td><td class="day adjacent-month next-month calendar-day-2015-10-01"><div class="day-contents">1</div></td><td class="day adjacent-month next-month calendar-day-2015-10-02"><div class="day-contents">2</div></td><td class="day adjacent-month next-month calendar-day-2015-10-03"><div class="day-contents">3</div></td></tr></tbody></table></div></div>
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

            <ul class="posts">
                <h3>近期活动</h3>
                <c:forEach var="e2" items="${recentEvent}">
                <li>
                    <article class="entry-item">
                        <div class="entry-thumb pull-left">
                            <c:forEach var="imm" items="${e2.eventImage}">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${imm.imagePath}" class="img-responsive" alt=""/>
                            </c:forEach>
                        </div>
                        <div class="entry-content">
                            <h6><a href="${pageContext.request.contextPath}/Event/eventEdit.do?eventId=${e2.eventId}">
                                <c:choose><c:when test="${fn:length(e2.eventTitle)>'12'}">${fn:substring(e2.eventTitle,0,12)} . . .
                                </c:when><c:otherwise>${e2.eventTitle}</c:otherwise></c:choose></a></h6>
                            <p>活动地点：${e2.eventPlace} <br>
                                <fmt:formatDate value="${e2.startTime}" type="both" pattern="MM-dd HH:mm" />&nbsp;-&nbsp;
                                <fmt:formatDate value="${e2.endTime}" type="both" pattern="MM-dd HH:mm" />
                            </p>
                        </div>
                        <div class="clearfix"> </div>
                    </article>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-8 detail">
            <form id="eventForm" action="${pageContext.request.contextPath}/Event/selectEventAll.do" >

                    <c:forEach var="e1" items="${eventList}"><div class="event-page">
                    <div class="row">
                    <div class="col-xs-4 col-sm-4">
                        <div class="event-img">
                            <a href="${pageContext.request.contextPath}/Event/eventEdit.do?eventId=${e1.eventId}">
                            <c:forEach var="mm" items="${e1.eventImage}">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${mm.imagePath}" class="img-responsive" alt=""/></a>
                            </c:forEach>
                            <div class="over-image"></div>
                        </div>
                    </div>
                    <div class="col-xs-8 col-sm-8 event-desc">
                        <h2><a href="${pageContext.request.contextPath}/Event/eventEdit.do?eventId=${e1.eventId}">${e1.eventTitle}</a></h2>
                        <div class="event-info-text">
                            <div class="event-info-middle"><p style="display:inline;"></p>
                                <p><span class="event-bold">活动日期 : &nbsp;</span>
                                <fmt:formatDate value="${e1.startTime}" type="both" pattern="MM月dd日" />&nbsp;-&nbsp;
                                <fmt:formatDate value="${e1.endTime}" type="both" pattern="MM月dd日" /></p>
                                <p><span class="event-bold">活动时间 : &nbsp;</span>
                                    <fmt:formatDate value="${e1.startTime}" type="both" pattern="HH:mm" />&nbsp;-&nbsp;
                                    <fmt:formatDate value="${e1.endTime}" type="both" pattern="HH:mm" /></p>
                                <p><span class="event-bold">活动地点 : &nbsp;</span>${e1.eventPlace}</p>
                                <p><span class="event-bold">活动类型 : &nbsp;</span>${e1.eventType}</p>
                                <span class="event-bold">主办方 : &nbsp;</span>
                                <ul class="event-speakers" style="display:inline"><li>${e1.eventBy}</li></ul>
                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                    </c:forEach>



                <c:if test="${pages > 1}">
                    <ul class="pagination">
                        <input id="eventPage" type="hidden" name="page" value="${page}">
                        <page:paging length="10" page="${page}" pages="${pages}"/>
                    </ul>
                </c:if>
            </form>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css' />
<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>

<!-- FlexSlider -->
</body>
</html>