<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/aniJS.js"></script>
    <script>
        $(document).ready(function () {
            $("#updown").click(function () {
                $(".video_more").fadeToggle(500);
            });
        });
    </script>
</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>

<!--上面一堆-->
<div class="video_top">
    <div id="myCarousel2" class="video_lun carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="/wp-content/uploads/2014/07/slide1.png" alt="First slide">
            </div>
            <div class="item">
                <img src="/wp-content/uploads/2014/07/slide2.png" alt="Second slide">
            </div>
            <div class="item">
                <img src="/wp-content/uploads/2014/07/slide3.png" alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;</a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;</a>
    </div>

    <!--轮播里的搜索框-->
    <div class="video_ser">
        <div class="video_tr">
            <input type="text" class="video_search1" placeholder="轮播里的搜索">
            <button class="video_button1">搜 索</button>
        </div>
    </div>

    <!--固定顶部的搜索框-->
    <div class="video_center anifTopLe">
        <div class="video_search2">
            <div class="col-3">
                <input class="effect-9 anifInput" type="text" placeholder="往下滑固定在顶部的搜索">
                <span class="focus-border">
		            	<i></i>
                </span>
                <button type="submit">
                    <span class="video_b fa fa-search fa-2x"></span>
                </button>
            </div>
            <button id="updown">
                <span class="fa fa-sort-down fa-2x"></span>
            </button>
            <div class="video_mine">
                <span><a href="">我的收藏</a></span>
                <span><a href="">我的视频</a></span>
            </div>
        </div>

    </div>
    <!--一堆分类-->

    <div class="video_more">
        <div class="container">
            <!--1-->
            <div class="video_more1">
                <span>方向：</span>
                <ul>
                    <li><a href="" class="video_ba">全部</a></li>
                    <li><a href="">前端开发</a></li>
                    <li><a href="">后端开发</a></li>
                    <li><a href="">移动开发</a></li>
                    <li><a href="">数据库</a></li>
                    <li><a href="">云计算&大数据</a></li>
                    <li><a href="">运维&测试</a></li>
                    <li><a href="">UI设计</a></li>
                </ul>
                <div style="clear: both"></div>
            </div>

            <!--2-->
            <div class="video_more2">
                <span>全部：</span>
                <ul>
                    <li><a href="">HTML/CSS</a></li>
                    <li><a href="">Javascript</a></li>
                    <li><a href="">Html5</a></li>
                    <li><a href="">CSS3</a></li>
                    <li><a href="">jQuery</a></li>
                    <li><a href="">Node.js</a></li>
                    <li><a href="">AngularJS</a></li>
                    <li><a href="">Bootstrap</a></li>
                    <li><a href="">React.JS</a></li>
                    <li><a href="">Vue.js</a></li>
                    <li><a href="">Sass/Less</a></li>
                    <li><a href="">WebApp</a></li>
                    <li><a href="">前端工具</a></li>
                    <li><a href="">Php</a></li>
                    <li><a href="">Java</a></li>
                    <li><a href="">Python</a></li>
                    <li><a href="">C</a></li>
                    <li><a href="">C++</a></li>
                    <li><a href="">Go</a></li>
                    <li><a href="">C#</a></li>
                    <li><a href="">Ruby</a></li>
                    <li><a href="">Android</a></li>
                    <li><a href="">iOS</a></li>
                    <li><a href="">Unity 3D</a></li>
                    <li><a href="">Cocos2d-x</a></li>
                    <li><a href="">MySQL</a></li>
                    <li><a href="">MongoDB</a></li>
                    <li><a href="">Oracle</a></li>
                    <li><a href="">SQL Server</a></li>
                    <li><a href="">大数据</a></li>
                    <li><a href="">云计算</a></li>
                    <li><a href="">测试</a></li>
                    <li><a href="">Linux</a></li>
                    <li><a href="">动画动效</a></li>
                    <li><a href="">APPUI设计</a></li>
                    <li><a href="">设计工具</a></li>
                    <li><a href="">设计基础</a></li>
                </ul>
                <div style="clear: both"></div>
            </div>

            <!--3-->
            <div class="video_more3">
                <span>类型：</span>
                <ul>
                    <li><a href="">全部</a></li>
                    <li><a href="">基础</a></li>
                    <li><a href="">案例</a></li>
                    <li><a href="">框架</a></li>
                    <li><a href="">工具</a></li>
                    <li><a href="">设计模式</a></li>
                </ul>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>

</div>


<!--内容课程开始-->
<div class="container" style="margin-top: 50px">
    <a href="" class="video_ca">最新</a> | <a href="" class="video_ca">最热</a>
    <div class="video_con col-md-12" style="padding: 0">
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/scissors.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <div class="video_p2"><span>945620</span>人在学</div>
                <!--<img src="img/gg.png" alt="" class="video_allimg">-->
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/scissors.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <div class="video_p2"><span>945620</span>人在学</div>
                <!--<img src="img/gg.png" alt="" class="video_allimg">-->
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/scissors.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <div class="video_p2"><span>945620</span>人在学</div>
                <!--<img src="img/gg.png" alt="" class="video_allimg">-->
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/scissors.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <div class="video_p2"><span>945620</span>人在学</div>
                <!--<img src="img/gg.png" alt="" class="video_allimg">-->
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
        <div class="video_out col-md-3 col-sm-6 col-xs-12">
            <div class="video_body">
                <h4>Javascript深入浅出</h4>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/star.png" alt="" style="width: 100%;">
                <p class="video_p1">由浅入深学习JS语言特性，且解析JS常见误区，从入门到掌握</p>
                <p class="video_p2"><span>945620</span>人在学</p>
                <div class="oh">
                    <div class="oh2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/haha.png" alt="" class="video_allimg">
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>


<footer style="margin-top: 50px">

</footer>
</body>
</html>