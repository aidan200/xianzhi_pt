<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>播放视频课程</title>
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
    <!-- Custom Theme files -->
    <jsp:include page="cssForeEnd.jsp"/>
    <!----font-Awesome----->
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/foreEnd/css/datedropper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/clndr.css" type="text/css" />
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/underscore-min.js" type="text/javascript"></script>
    <script src= "${pageContext.request.contextPath}/dist/foreEnd/js/moment-2.2.1.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/clndr.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/site.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/video-js.css" rel="stylesheet">
    <!-- If you'd like to support IE8 -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/videojs-ie8.min.js"></script>
    <!----font-Awesome----->
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
        //判断是否为空
        function notNull(index) {
            if(document.getElementById("reText"+index).value == '') {
                alert("请输入回复内容!");
            }else{
                document.getElementById("reButton").submit();
            }
        }
        //判断是否为空
        function unNull() {
            if(document.getElementById("reComment").value == '') {
                alert("请输入评论内容!");
            }else{
                document.getElementById("reSubmit").submit();
            }
        }
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("drPage");
                pageInp.value = page;
                var form = document.getElementById("drForm");
                form.submit();
            }
        }
    </script>

    <!----End Calender -------->
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>

<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <c:if test="${xzVideo.vclass==1}">
            <h3>JAVA课程</h3>
            <p class="description">
                Oracle/Java基础/Java高级/Web前端Html5、CSS3、JavaScript、BootStrap等/Web编程(Jsp、Servlet......)/设计模式/Web框架(SpringMVC、Mybatis、Spring)
            </p>
            <div class="breadcrumb1">
                <ul>
                    <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                    <li class="current-page"><a
                            href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=1">JAVA</a></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${xzVideo.vclass==2}">
            <h3>大前端课程</h3>
            <p class="description">
                Oracle/Java基础/Java高级/Web前端Html5、CSS3、JavaScript、BootStrap等/Web编程(Jsp、Servlet......)/设计模式/Web框架(SpringMVC、Mybatis、Spring)
            </p>
            <div class="breadcrumb1">
                <ul>
                    <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                    <li class="current-page"><a
                            href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=2">大前端</a></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${xzVideo.vclass==3}">
            <h3>大数据课程</h3>
            <p class="description">
                Oracle/Java基础/Java高级/Web前端Html5、CSS3、JavaScript、BootStrap等/Web编程(Jsp、Servlet......)/设计模式/Web框架(SpringMVC、Mybatis、Spring)
            </p>
            <div class="breadcrumb1">
                <ul>
                    <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                    <li class="current-page"><a
                            href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=3">大数据</a></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${xzVideo.vclass==4}">
            <h3>移动端课程</h3>
            <p class="description">
                Oracle/Java基础/Java高级/Web前端Html5、CSS3、JavaScript、BootStrap等/Web编程(Jsp、Servlet......)/设计模式/Web框架(SpringMVC、Mybatis、Spring)
            </p>
            <div class="breadcrumb1">
                <ul>
                    <li class="icon6"><a href="${pageContext.request.contextPath}/">首页</a></li>
                    <li class="current-page"><a
                            href="${pageContext.request.contextPath}/XzVideo/goCourses.do?vclass=4">移动端</a></li>
                </ul>
            </div>
        </c:if>


    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container">
        <div class="none col-md-4">
            <div class="cal1 cal_2">
                <div class="clndr">
                    <div class="clndr-controls">
                        <div class="clndr-control-button"><p class="clndr-previous-button">previous</p></div>
                        <div class="month">September 2015</div>
                        <div class="clndr-control-button rightalign"><p class="clndr-next-button">next</p></div>
                    </div>
                    <table class="clndr-table" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr class="header-days">
                            <td class="header-day">S</td>
                            <td class="header-day">M</td>
                            <td class="header-day">T</td>
                            <td class="header-day">W</td>
                            <td class="header-day">T</td>
                            <td class="header-day">F</td>
                            <td class="header-day">S</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="day past adjacent-month last-month calendar-day-2015-08-30">
                                <div class="day-contents">30</div>
                            </td>
                            <td class="day past adjacent-month last-month calendar-day-2015-08-31">
                                <div class="day-contents">31</div>
                            </td>
                            <td class="day today calendar-day-2015-09-01">
                                <div class="day-contents">1</div>
                            </td>
                            <td class="day calendar-day-2015-09-02">
                                <div class="day-contents">2</div>
                            </td>
                            <td class="day calendar-day-2015-09-03">
                                <div class="day-contents">3</div>
                            </td>
                            <td class="day calendar-day-2015-09-04">
                                <div class="day-contents">4</div>
                            </td>
                            <td class="day calendar-day-2015-09-05">
                                <div class="day-contents">5</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="day calendar-day-2015-09-06">
                                <div class="day-contents">6</div>
                            </td>
                            <td class="day calendar-day-2015-09-07">
                                <div class="day-contents">7</div>
                            </td>
                            <td class="day calendar-day-2015-09-08">
                                <div class="day-contents">8</div>
                            </td>
                            <td class="day calendar-day-2015-09-09">
                                <div class="day-contents">9</div>
                            </td>
                            <td class="day event calendar-day-2015-09-10">
                                <div class="day-contents">10</div>
                            </td>
                            <td class="day event calendar-day-2015-09-11">
                                <div class="day-contents">11</div>
                            </td>
                            <td class="day event calendar-day-2015-09-12">
                                <div class="day-contents">12</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="day event calendar-day-2015-09-13">
                                <div class="day-contents">13</div>
                            </td>
                            <td class="day event calendar-day-2015-09-14">
                                <div class="day-contents">14</div>
                            </td>
                            <td class="day calendar-day-2015-09-15">
                                <div class="day-contents">15</div>
                            </td>
                            <td class="day calendar-day-2015-09-16">
                                <div class="day-contents">16</div>
                            </td>
                            <td class="day calendar-day-2015-09-17">
                                <div class="day-contents">17</div>
                            </td>
                            <td class="day calendar-day-2015-09-18">
                                <div class="day-contents">18</div>
                            </td>
                            <td class="day calendar-day-2015-09-19">
                                <div class="day-contents">19</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="day calendar-day-2015-09-20">
                                <div class="day-contents">20</div>
                            </td>
                            <td class="day event calendar-day-2015-09-21">
                                <div class="day-contents">21</div>
                            </td>
                            <td class="day event calendar-day-2015-09-22">
                                <div class="day-contents">22</div>
                            </td>
                            <td class="day event calendar-day-2015-09-23">
                                <div class="day-contents">23</div>
                            </td>
                            <td class="day calendar-day-2015-09-24">
                                <div class="day-contents">24</div>
                            </td>
                            <td class="day calendar-day-2015-09-25">
                                <div class="day-contents">25</div>
                            </td>
                            <td class="day calendar-day-2015-09-26">
                                <div class="day-contents">26</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="day calendar-day-2015-09-27">
                                <div class="day-contents">27</div>
                            </td>
                            <td class="day calendar-day-2015-09-28">
                                <div class="day-contents">28</div>
                            </td>
                            <td class="day calendar-day-2015-09-29">
                                <div class="day-contents">29</div>
                            </td>
                            <td class="day calendar-day-2015-09-30">
                                <div class="day-contents">30</div>
                            </td>
                            <td class="day adjacent-month next-month calendar-day-2015-10-01">
                                <div class="day-contents">1</div>
                            </td>
                            <td class="day adjacent-month next-month calendar-day-2015-10-02">
                                <div class="day-contents">2</div>
                            </td>
                            <td class="day adjacent-month next-month calendar-day-2015-10-03">
                                <div class="day-contents">3</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
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
                    <div class="clearfix"></div>
                </ul>
            </div>
            <ul class="posts">
                <h3>最新视频</h3>
                <c:forEach var="rv" items="${recentVideoList}">
                <li>
                    <article class="entry-item">
                        <div class="entry-thumb pull-left">
                            <%--<img src="${pageContext.request.contextPath}/dist/photo/${rv.memberPicture}" class="img-responsive" alt="" style="width: 60px;height: 60px"/>--%>
                        </div>
                        <div class="entry-content">
                            <h6><a href="#">${rv.videoName}</a></h6>
                            <p>${rv.memberName} &nbsp;/&nbsp;<fmt:formatDate value="${rv.recordDate}" type="both" pattern="yyyy年MM月dd日"/>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </article>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-md-8 detail">
            <%--<video controls autoplay class="vv" src="${pageContext.request.contextPath}/dist/video/${xzVideo.videoAddress}">--%>

            <%--</video>--%>

                <%--播放器插件--%>
            <video id="my-video" class="video-js" controls preload="auto"
                    data-setup="{}">
                <source src="${pageContext.request.contextPath}/XzVideo/playVideoUrl.do?videoAddress=${xzVideo.videoAddress}" type="video/webm">
            </video>
            <script src="${pageContext.request.contextPath}/dist/foreEnd/js/video.min.js"></script>
            <script type="text/javascript">
                var myPlayer = videojs('my-video');
                videojs("my-video").ready(function(){
                    var myPlayer = this;
                    myPlayer.play();
                });
            </script>


            <!--<img src="images/event.jpg" class="img-responsive" alt=""/>-->
            <h3>${xzVideo.videoName}</h3>
            <ul class="meta-post">
                <li class="author">
                    ${xzVideo.memberName}
                </li>
                <%--<li class="view">--%>
                    <%--2017.11.22--%>
                <%--</li>--%>
                <%--<li class="category">--%>
                    <%--会议室--%>
                <%--</li>--%>
            </ul>
            <p>${xzVideo.videoIntroduce}</p>
            <div class="author-box author-box1">
                <div class="author-box-left"><img src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png" class="img-responsive sup2" alt=""/>
                </div>
                <div class="author-box-right">
                    <h4>李老师</h4>
                    <p>
                        主要从事Java开源领域开发，五年以上软件开发及教学经验，擅长Java、JavaEE平台软件开发，在系统架构整合方面，曾就职于北京塞博维尔信息咨询公司，具备多年的互联网应用经验，精通PHP框架技术。在Web3.0前沿技术方面有着深入的研究，曾参与Shop
                        EX核心模块开发。</p>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="comment_section">
                <h4>相关评论 </h4>
                <ul class="comment-list">
                    <c:forEach var="vd" varStatus="status" items="${vdList}">
                        <li id="${status.count}">
                            <div class="author-box">
                                <div class="author-box_left"><img src="${pageContext.request.contextPath}/dist/photo/${vd.memberPicture}" class="img-responsive code sup" alt=""/></div>
                                <div class="author-box_right">
                                    <h5><span>${vd.discussWriter}</span>
                                        <span class="pull-right">
                                                <c:if test="${sessionScope.userIndex == vd.discussWriter}">
                                                    <a class="comment-reply-link" href="${pageContext.request.contextPath}/VideoDiscuss/deleteVideoDiscuss.do?discussId=${vd.discussId}&videoId=${xzVideo.videoID}">删除</a>
                                                </c:if>
                                            </span>
                                    </h5>
                                    <span class="m_1"><fmt:formatDate value="${vd.discussTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                    <p>${vd.discussArticle}</p>
                                    <c:forEach var="r1" items="${vd.replyId}">
                                        <div class="blog_h">
                                            <p>${r1.discussWriter}回复${vd.discussWriter}:
                                            <p>${r1.discussArticle}<br><br></p>
                                            <div class="blog_t">
                                                <fmt:formatDate value="${r1.discussTime}" type="both" pattern="MM-dd-yyyy HH:mm:ss"/>
                                            </div>
                                            <div class="bb9">
                                                <c:if test="${sessionScope.userIndex == r1.discussWriter}">
                                                    <a href="${pageContext.request.contextPath}/VideoDiscuss/deleteReply.do?discussId=${r1.discussId}&videoId=${xzVideo.videoID}">删除</a>
                                                </c:if>
                                            </div>
                                            </p>
                                        </div>
                                    </c:forEach>
                                    <button class="btn btn-primary" onclick="reMsg(${status.index})" id="kkl">发表回复</button>
                                    <form id="saveReply" action="${pageContext.request.contextPath}/VideoDiscuss/insertVideoReply.do?videoId=${xzVideo.videoID}" method="post">
                                        <div id="text${status.index}" style="display: none">
                                            <input type="hidden" value="${vd.discussId}" name="discussId">
                                            <textarea name="replyComment" id="reText${status.index}" class="form-control"  placeholder="回复"></textarea>
                                            <input type="submit" id="reButton" class="ttt2 btn btn-primary" value="添加回复" onclick="notNull(${status.index})">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                    </c:forEach>

                </ul>
                <form id="drForm" action="${pageContext.request.contextPath}/XzVideo/playVideo.do?videoID=${xzVideo.videoID}" method="post">
                    <c:if test="${pages > 1}">
                        <ul class="pagination">
                            <input id="drPage" type="hidden" name="page" value="${page}">
                            <page:paging length="10" page="${page}" pages="${pages}"/>
                        </ul>
                    </c:if>
                </form>

            </div>
            <form id="saveForm" class="comment-form" action="${pageContext.request.contextPath}/VideoDiscuss/insertVideoDiscuss.do?videoId=${xzVideo.videoID}" method="post">

                <div class="col-xs-12">
                    <h4>发表评论</h4>
                    <%--<input type="hidden" value="${blog.blogId}" name="blogId">--%>
                    <textarea name="comment" id="reComment" class="form-control" placeholder="评论"></textarea>
                </div>
                <div class="clearfix"> </div>
                <div class="form-submit">
                    <input name="submit" type="submit" id="reSubmit" class="submit_1 btn btn-primary btn-block" value="添加评论 " onclick="unNull()" style="width: 150px">
                </div>
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css'/>
<%--<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>--%>
<script type="text/javascript">
//    $(function () {
//        SyntaxHighlighter.all();
//    });
//    $(window).load(function () {
//        $('.flexslider').flexslider({
//            animation: "slide",
//            start: function (slider) {
//                $('body').removeClass('loading');
//            }
//        });
//    });
    //显示发表回复文本框
    function reMsg(index) {
        var div = document.getElementById("text" + index);
        var v = $(div);
        v.toggle();
    }
</script>
<!-- FlexSlider -->
</body>
</html>
