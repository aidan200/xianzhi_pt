<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/5
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .navbar-bottom {
            background-color: rgba(85, 97, 101, 0);
            position: fixed;
            z-index: 99999;
            width: 100%;
            box-shadow: none;
        }
    </style>
    <!--轮播-->
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery.color.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/index_lunbo.js"></script>
    <script>
        $(function () {
            m_lo1("#home_1")
        })
    </script>
    <!--导航透明度-->
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/script.js"></script>


</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>
<!--轮播-->
<header id="home_1" style="z-index: 4">
    <h4></h4>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/19.jpg');z-index:2;background-size: cover">
        <div class="index_top">
            <h1>大数据上云最佳实现</h1>
            <p>一站式等保合规解决方案，限时优惠</p>
            <a href="#" class="btn2 btn-4">查看详情</a>
        </div>
        <div class="items__inner" id="js-scene">

            <div class="items__layer layer" data-depth="0.10">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/01.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.15">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/02.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.20">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/03.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.30">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/04.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.45">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/05.png" alt="">
                </div>
            </div>
        </div>
    </div>
    </div>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/19.jpg')">
        <div class="index_top">
            <h1>阿里云快照商业化</h1>
            <p>让业务数据更安全</p>
            <a href="#" class="btn2 btn-4">查看详情</a>
        </div>
        <div class="items__inner" id="js-scene2">

            <div class="items__layer layer" data-depth="0.10">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/06.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.15">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/07.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.20">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/08.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.30">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/09.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.45">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/10.png" alt="">
                </div>
            </div>

        </div>
    </div>
    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd3/img/19.jpg')">
        <div class="index_top">
            <h1>物联网套件正式商业化</h1>
            <p>端云一体化方案助企业快速搭建物联网平台</p>
            <a href="#" class="btn2 btn-4">查看详情</a>
        </div>
        <div class="items__inner" id="js-scene3">

            <div class="items__layer layer" data-depth="0.10">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/11.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.15">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/12.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.20">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/13.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.30">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/14.png" alt="">
                </div>
            </div>

            <div class="items__layer layer" data-depth="0.45">
                <div class="items__item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/15.png" alt="">
                </div>
            </div>

        </div>
    </div>
</header>

<div class="index_all">

    <!--全民开发计划-->
    <div class="index_01">
        <h3>全民开发计划</h3>
        <p>全球领先、安全、稳定的云计算产品,计算储存网络安全大数据人工智能惠普科技助你飞跃发展</p>

        <div class="index_plan">
            <div class="plan_a">
                <div class="plan_in">
                    <div class="plan_c">
                        <h4>入门型</h4>
                        <span class="plan_d">
                        <p>适用个人网站初始阶段并发访问量小
                            开发、测试环境
                            代码存储服务器</p>
                        </span>
                    </div>
                    <div class="plan_a2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/1111.png" alt=""
                             class="plan_img">
                        <div><a href="" style="color: #2a68c5">查看详情</a></div>
                    </div>

                </div>
            </div>
            <div class="plan_a">
                <div class="plan_in">
                    <div class="plan_c">
                        <h4>基础型</h4>
                        <span class="plan_d">
                        <p>流量适中的网站应用
                            简单开发环境
                            代码存储库</p></span>
                    </div>
                    <div class="plan_a2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/1111.png" alt=""
                             class="plan_img">
                        <div><a href="" style="color: #0073b2">查看详情</a></div>
                    </div>

                </div>
            </div>
            <div class="plan_a">
                <div class="plan_in">
                    <div class="plan_c">
                        <h4>通用型</h4>
                        <span class="plan_d">
                        <p>日常运营活动
                            并行计算应用
                            普通数据处理</p></span>
                    </div>
                    <div class="plan_a2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/1111.png" alt=""
                             class="plan_img">
                        <div><a href="" style="color: #0073b2">查看详情</a></div>
                    </div>

                </div>
            </div>
            <div class="plan_a">
                <div class="plan_in">
                    <div class="plan_c">
                        <h4>进阶型</h4>
                        <span class="plan_d">
                        <p>中小型 Web 服务器
                            企业运营活动
                            普通数据处理服务</p></span>
                    </div>
                    <div class="plan_a2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/1111.png" alt=""
                             class="plan_img">
                        <div><a href="" style="color: #0073b2">查看详情</a></div>
                    </div>

                </div>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>

    <!--解决方案-->
    <div class="index_02">
        <h3>海纳百川，各行各业解决方案</h3>
        <p>开发者工具、建站、API、企业应用、支持云端应用服务</p>
        <div class="an_main">
            <!-- FIFTH EXAMPLE -->
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ff.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>电商解决方案</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dain.png" alt="">
                    <p>结合大数据能力帮助电商企业快速搭建平台，应对业务高并发，剖析秒杀视频直播等场景</p>
                    <a href="#" class="info">
                        查看详情
                    </a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/gg.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>APP解决方案</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/app.png" alt="">
                    <p>助移动开发者轻松应对用户数爆发式增长、实现基于大数据化的运营、增强用户黏性</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/hh.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>金融解决方案</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/jin.png" alt="">
                    <p>为金融行业提供量身定制的云计算服务，具备低成本、高弹性、高可用、安全合规的特性</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dd.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>游戏解决方案</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/game.png" alt="">
                    <p>为游戏开发者提供专属集群、尊享VIP服务、专项扶持基金、多场景游戏部署解决方案</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/jj.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>医疗解决方案</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/yi.png" alt="">
                    <p>融合云计算大数据，连接用户医疗设备、医疗结构和医疗ISV，构建医疗行业云生态</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both"></div>

    <!--服务内容-->
    <div class="index_03">
        <h3>海纳百川，精选全球的高品质软件与服务</h3>
        <p>开发者工具、建站、API、企业应用、支持云端应用服务</p>
        <div class="index_content">
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/24.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/25.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具</div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/26.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具</div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/27.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具</div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/28.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具</div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/29.png" alt="">
                    <h4>软件环境</h4>
                    <div>
                        预装PHP | 预装JAVA | 预装ASP/.NET
                    </div>
                    <div> 预装建站系统 | 服务器软件 | 应用开发工具</div>
                </a>
            </div>
            <div style="clear: both"></div>
        </div>
    </div>
    <div style="clear: both"></div>

    <!--社区-->
    <div class="index_04">
        <h3>大咖云集，知识分享的开发者技术社区</h3>
        <p>实战干货、在线直播、专家问答、技术论坛、学习、成长、分享、共建</p>
        <ul class="index_list">
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/lv.jpg">
                <div class="mask4">
                    <p class="index_04p">【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/hu.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/lan.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zhu.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/qianblue.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/pi.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/qainbl.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
            <li>
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/shenb.jpg">
                <div class="mask4">
                    <p>【分享】SQL Server疑难杂症解决之道</p>
                    <a href="">点击查看</a>
                </div>
            </li>
        </ul>
    </div>

    <!--生态圈-->
    <div class="index_05">
        <h3>海纳百川，精选全球的高品质软件与服务</h3>
        <p>开发者工具、建站、API、企业应用、支持云端应用服务</p>
        <div class="index_05all">
            <div class="circle_in">
                <div class="index_circle">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle2">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i2">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle2">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i2">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i">
                </div>
            </div>

            <div class="circle_in">
                <div class="index_circle2">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i2">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i">
                </div>
            </div>

            <div class="circle_in">
                <div class="index_circle2">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i2">
                </div>
            </div>
            <div class="circle_in">
                <div class="index_circle">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i">
                </div>
            </div>

            <div class="circle_in">
                <div class="index_circle2">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sony.png" alt="" class="circle_i2">
                </div>
            </div>

        </div>

    </div>

</div>

<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>



<footer>

</footer>

<%--<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/move_blog.js"></script>--%>
<script>
    "use strict";
    (function ($) {
        $(function () {
            $(".index_list li").bind("mouseenter mouseleave", function (e) {
                var w = $(this).width();
                var h = $(this).height();
                var x = (e.pageX - this.offsetLeft - (w / 2)) * (w > h ? (h / w) : 1);
                var y = (e.pageY - this.offsetTop - (h / 2)) * (h > w ? (w / h) : 1);
                var direction = Math.round((((Math.atan2(y, x) * (180 / Math.PI)) + 180) / 90) + 3) % 4; //direction的值为“0,1,2,3”分别对应着“上，右，下，左”
                var eventType = e.type;
                var dirName = new Array('上方', '右侧', '下方', '左侧');
                let mask = $(this).children('.mask4');
                if (e.type == 'mouseenter') {
                    switch (direction) {
                        case 0:
                            mask.css({
                                top: -240,
                                left: 0
                            });
                            break;
                        case 1:
                            mask.css({
                                top: 0,
                                left: 240
                            });
                            break;
                        case 2:
                            mask.css({
                                top: 240,
                                left: 0
                            });
                            break;
                        case 3:
                            mask.css({
                                top: 0,
                                left: -240
                            });
                            break;
                    }
                    mask.stop(true).animate({
                        left: 0,
                        top: 0
                    }, 400);
                } else {
                    let end = {};
                    switch (direction) {
                        case 0:
                            end = {
                                top: -240,
                                left: 0
                            };
                            break;
                        case 1:
                            end = {
                                top: 0,
                                left: 240
                            };
                            break;
                        case 2:
                            end = {
                                top: 240,
                                left: 0
                            };
                            break;
                        case 3: {
                            end = {
                                top: 0,
                                left: -240
                            };
                            break;
                        }
                    }
                    mask.stop(true).animate(end, 400);
                }
            });
        });
    })(jQuery);
</script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>
<!--轮播里的小东西-->
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/haha.js"></script>
<script>
    var scene = document.getElementById('js-scene');
    var parallax = new Parallax(scene);
    var scene2 = document.getElementById('js-scene2');
    var parallax = new Parallax(scene2);
    var scene3 = document.getElementById('js-scene3');
    var parallax = new Parallax(scene3);
</script>


<!--风琴社区-->
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/anime.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/main.js"></script>
<!--轮播里的-->
<script>
    (function () {
        [].slice.call(document.querySelectorAll('.grid--effect-rigel > .grid__item')).forEach(function (stackEl) {
            new RigelFx(stackEl);
        });
    })();
</script>


</body>
</html>