<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>先知平台</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <%--<link rel="icon" sizes="any" mask href="//www.baidu.com/img/baidu.svg">--%>

</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>

<!-- banner -->
<div class="banner">
    <!-- banner Slider starts Here -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider3").responsiveSlides({
                auto: true,
                pager: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });

        });
    </script>
    <!--//End-slider-script -->

    <!--轮播-->
    <div id="top" class="callbacks_container">
        <ul class="rslides" id="slider3">
            <li>
                <div class="banner-bg">
                    <div class="container">
                        <div class="banner-info">
                            <h3>迈出第一步<span>知识的朋友</span></h3>
                            <p>一个人如果你不逼自己一把，你根本不知道自己有多优秀。
                            </p>
                            <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html"><i
                                    class="fa fa-thumbs-up icon_1"
                                    style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner-bg banner-img2">
                    <div class="container">
                        <div class="banner-info">
                            <h3>JAVA<span>打造你自己的专属课程</span></h3>
                            <p>当你的能力还驾驭不了你的目标时，你就应该沉下心来学习。
                            </p>
                            <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html"><i
                                    class="fa fa-thumbs-up icon_1"
                                    style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner-bg banner-img">
                    <div class="container">
                        <div class="banner-info">
                            <h3>Web前端工程师<span>年薪20万为什么不呢？</span></h3>
                            <p>每个人都会累，没有人能为你承担悲伤，人总有一段时间要学会自己长大。
                            </p>
                            <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html"><i
                                    class="fa fa-thumbs-up icon_1"
                                    style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner-bg">
                    <div class="container">
                        <div class="banner-info">
                            <h3>JAVA大数据<span>培训的绝对领导者</span></h3>
                            <p>阳光抱不到也要微笑，因为我自信，因为我不是弱者。
                            </p>
                            <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html"><i
                                    class="fa fa-thumbs-up icon_1"
                                    style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <div class="banner-bg banner-img2">
                    <div class="container">
                        <div class="banner-info">
                            <h3>走自己的路<span>做最好的自己</span></h3>
                            <p>每一个成功者都有一个开始，勇于开始，才能找到成功的路。
                            </p>
                            <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html"><i
                                    class="fa fa-thumbs-up icon_1"
                                    style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </li>

        </ul>
    </div>
</div>


<div class="details">
    <div class="container">
        <div class="col-sm-10 dropdown-buttons">
            <div class="col-sm-3 dropdown-button">
                <div class="input-group">
                    <input class="form-control has-dark-background" name="name" id="name" placeholder="姓名"
                           type="text" required="">
                </div>
            </div>
            <div class="col-sm-3 dropdown-button">
                <div class="input-group">
                    <input class="form-control has-dark-background" name="email" id="email"
                           placeholder="电子邮箱" type="text" required="">
                </div>
            </div>
            <div class="col-sm-3 dropdown-button">
                <div class="section_1">
                    <select id="country" onChange="change_country(this.value)" class="frm-field required">
                        <option value="null">学习水平</option>
                        <option value="null">初级</option>
                        <option value="AX">中级</option>
                        <option value="AX">高级</option>
                    </select>
                </div>
            </div>
            <div class="col-sm-3 dropdown-button">
                <div class="section_1">
                    <select id="country2" onChange="change_country(this.value)" class="frm-field required">
                        <option value="null">课程</option>
                        <option value="null">Java</option>
                        <option value="AX">Web前端</option>
                        <option value="AX">数据库</option>
                    </select>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-sm-2 submit_button">
            <form>
                <input type="submit" value="搜索">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<!--行业动态 项目实战-->
<div class="grid_1">
    <div class="container">
        <div class="col-md-4 col-xs-12">
            <div class="news" style="position: relative">
                <h1>行业动态</h1>
                <div class="section-content">
                    <c:forEach var="n1" items="${newsList}">
                        <article>
                            <figure class="date"><i class="fa fa-calendar-o"></i>
                                <fmt:formatDate value="${n1.newsDate}" type="both" pattern="yyyy-MM-dd"/></figure>
                            <img src="${pageContext.request.contextPath}/dist/foreEnd/images/t0.jpg" alt="" width="70px"
                                 height="60px" style="float: left;margin-right: 10px;line-height: 20px">
                            <a href="${pageContext.request.contextPath}/News/newsEdit.do?newsId=${n1.newsId}" class="in_article">${n1.newsTitle}</a>
                            <div style="clear: both"></div>
                        </article>

                    </c:forEach>
                </div><!-- /.section-content -->
                <a href="${pageContext.request.contextPath}/News/selectNewsAll.do" class="read-more">所有动态</a>
                <div class="in_on"></div>
            </div><!-- /.news-small -->
        </div>
        <div class="col-md-1"></div>

        <div class="col-md-7 col-xs-12 grid_1_right">
            <div class="news">
                <h2>活动</h2>
                <div class="but_list">
                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">

                        <%--<div id="myTabContent" class="tab-content">--%>
                            <c:forEach var="e1" items="${eventList}">
                                <%--<div class="tab-pane fade" id="profile" aria-labelledby="profile-tab">--%>
                                <div class="events_box">
                                    <div class="event_left">
                                        <div class="event_left-item">
                                            <div class="icon_2"><i class="fa fa-clock-o"></i>
                                                <fmt:formatDate value="${e1.startTime}" type="both"
                                                                pattern="MM-dd HH:mm"/>&nbsp;-&nbsp;<br>
                                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate
                                                        value="${e1.endTime}" type="both" pattern="MM-dd HH:mm"/>
                                            </div>
                                            <div class="icon_2"><i class="fa fa-location-arrow"></i>${e1.eventPlace}
                                            </div>
                                            <div class="icon_2">
                                                <div class="speaker">
                                                    <i class="fa fa-user"></i>
                                                    <div class="speaker_item">${e1.eventBy}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="event_right">
                                        <h3>
                                            <a href="${pageContext.request.contextPath}/Event/selectEventAll.do">${e1.eventTitle}</a>
                                        </h3>

                                        <p>${e1.eventArticle}</p>

                                            <%--<img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>--%>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <%--</div>--%>
                            </c:forEach>

                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="bg">
    <div class="container">
        <div class="timer_wrap">
            <div id="counter"></div>
        </div>
        <div class="newsletter">

            <%--<form>--%>
                <%--<input type="text" name="ne" size="30" required="" placeholder="请填写你的电子邮件 ">--%>
                <a href="${pageContext.request.contextPath}/AllPT/sel">全站查询测试</a>
                <input type="submit" value="订222阅">
            <%--</form>--%>
        </div>
    </div>
</div>

<!--项目-->
<div class="bottom_content">
    <h3>项目领域</h3>
    <div class="grid_2">
        <c:forEach var="ii" begin="0" end="2" items="${itemList}">
            <div class="col-md-4 portfolio-left">
                <div class="portfolio-img event-img">
                    <c:forEach var="mm" items="${ii.itemImage}">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${mm.imagePath}"
                             class="img-responsive" alt=""/>
                    </c:forEach>
                    <div class="over-image"></div>
                </div>
                <div class="portfolio-description">
                    <h4><a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">${ii.itemTitle}</a></h4>
                    <div class="hid">
                            ${ii.itemArticle}
                    </div>
                    <span>
				<a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">相关课程</a>
				</span>
                    <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">
                        <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                    </a>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:forEach>


        <div class="clearfix"></div>
    </div>

    <div class="grid_3">
        <c:forEach var="ii2" begin="3" end="5" items="${itemList}">
            <div class="col-md-4 portfolio-left">
                <div class="portfolio-img event-img">
                    <c:forEach var="mm2" items="${ii2.itemImage}">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${mm2.imagePath}"
                             class="img-responsive" alt=""/>
                    </c:forEach>
                    <div class="over-image"></div>
                </div>
                <div class="portfolio-description">
                    <h4><a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">${ii2.itemTitle}</a></h4>
                    <div class="hid">
                            ${ii2.itemArticle}
                    </div>
                    <span>
				<a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">相关课程</a>
                        <!--<a href="students.html">College Studies</a>-->
				</span>
                    <a href="${pageContext.request.contextPath}/view/foreEnd/courses.html">
                        <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                    </a>
                </div>
                <div class="clearfix"></div>
            </div>
        </c:forEach>
        <div class="clearfix"></div>
    </div>

</div>


<!--footer-->

<jsp:include page="footerForeEnd.jsp"/>


<%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.countdown.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/script.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/index.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/foreEnd/js/sketch.min.js"></script>--%>

</body>
</html>
