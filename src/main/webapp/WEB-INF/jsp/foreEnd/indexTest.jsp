<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/4/7
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
    <jsp:include page="cssJsHeader.jsp"/>
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
                            <a href="courses.html"><i class="fa fa-thumbs-up icon_1"
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
                            <a href="courses.html"><i class="fa fa-thumbs-up icon_1"
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
                            <a href="courses.html"><i class="fa fa-thumbs-up icon_1"
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
                            <a href="courses.html"><i class="fa fa-thumbs-up icon_1"
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
                            <a href="courses.html"><i class="fa fa-thumbs-up icon_1"
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
        <div class="col-md-4">
            <div class="news">
                <h1>行业动态</h1>
                <div class="section-content">
                    <c:forEach var="n1" items="${newsList}">
                        <article>
                            <figure class="date"><i class="fa fa-file-o"></i><fmt:formatDate  value="${n1.newsDate}" type="both" pattern="MM-dd-yyyy" /></figure>
                            <a href="#">${n1.newsTitle}</a>
                        </article>
                    </c:forEach>

                </div><!-- /.section-content -->
                <a href="${pageContext.request.contextPath}/News/selectNewsAll" class="read-more">所有动态</a>
            </div><!-- /.news-small -->
        </div>
        <div class="col-md-8 grid_1_right">
            <div class="news">
            <h2>项目实战</h2>
            <div class="but_list">
                <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                    <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
                        <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab"
                                                                  data-toggle="tab" aria-controls="home"
                                                                  aria-expanded="true">第一天&nbsp;&nbsp;&nbsp;31-08-2015</a>
                        </li>
                        <li role="presentation"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab"
                                                   aria-controls="profile">第二天&nbsp;&nbsp;&nbsp;01-09-2015</a></li>
                        <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab"
                                                   aria-controls="profile1">第三天&nbsp;&nbsp;&nbsp;05-09-2015</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>203教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">张老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>

                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>333教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">张老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>
                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>407教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">李老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>
                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>407教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">李老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>
                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledby="profile-tab1">
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>407教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">李老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>
                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="events_box">
                                <div class="event_left">
                                    <div class="event_left-item">
                                        <div class="icon_2"><i class="fa fa-clock-o"></i>09:00 - 10:30</div>
                                        <div class="icon_2"><i class="fa fa-location-arrow"></i>407教室</div>
                                        <div class="icon_2">
                                            <div class="speaker">
                                                <i class="fa fa-user"></i>
                                                <div class="speaker_item">
                                                    <a href="#">李老师</a>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="event_right">
                                    <h3><a href="#">JAVA实战项目开发1-网上商城</a></h3>
                                    <p>随着Internet的发展，网上购物成为一种购物时尚。目前国内企业
                                        纷纷加入到阿里巴巴，京东等一系列大型电子商务网站中，那么利用我们学习的java怎么才
                                        能开发出网上商城呢，那么就进入我们的课程去学习吧！</p>
                                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" class="img-responsive" alt=""/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
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
            <form>
                <input type="text" name="ne" size="30" required="" placeholder="请填写你的电子邮件 ">
                <input type="submit" value="订阅">
            </form>
        </div>
    </div>
</div>

<!--项目-->
<div class="bottom_content">
    <h3>我们的项目</h3>
    <div class="grid_2">
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q1.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_java.html">Java</a></h4>
                <div class="hid">Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，
                    因此Java语言具有功能强大和简单易用两个特征。</div>
                <span>
				<a href="course_java.html">相关课程</a>
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q2.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_web.html">大前端</a></h4>
                <div class="hid">大前端时代是WEB统一的时代，利用html5或者6，即可以开发传统的网站，又可以采用BS架构应用程序、
                    开发手机端web应用、移动端Native应用程序、智能设备。</div>
                <span>
				<a href="course_web.html">相关课程</a>
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q3.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_big.html">大数据</a></h4>
                <div class="hid">大数据指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，
                    是有更强的决策洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产。</div>
                <span>
				<a href="course_big.html">相关课程</a>
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>

    <div class="grid_3">
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q1.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_java.html">Java</a></h4>
                <div class="hid">Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、
                    指针等概念，因此Java语言具有功能强大和简单易用两个特征。</div>
                <span>
				<a href="course_java.html">相关课程</a>
                    <!--<a href="students.html">College Studies</a>-->
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q2.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_web.html">大前端</a></h4>
                <div class="hid">大前端时代是WEB统一的时代，利用html5或者6，即可以开发传统的网站，又可以采用BS架构应用程序、
                    开发手机端web应用、移动端Native应用程序、智能设备。</div>
                <span>
				<a href="course_web.html">相关课程</a>
                    <!--<a href="students.html">College Studies</a>-->
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-4 portfolio-left">
            <div class="portfolio-img event-img">
                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/q3.jpg" class="img-responsive" alt=""/>
                <div class="over-image"></div>
            </div>
            <div class="portfolio-description">
                <h4><a href="course_big.html">大数据</a></h4>
                <div class="hid">大数据指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，
                    是有更强的决策洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产。</div>
                <span>
				<a href="course_big.html">相关课程</a>
                    <!--<a href="students.html">College Studies</a>-->
				</span>
                <a href="events.html">
                    <span><i class="fa fa-chain chain_1"></i>查看项目</span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>

</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>

<script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.countdown.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/script.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/index.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/sketch.min.js"></script>

</body>
</html>