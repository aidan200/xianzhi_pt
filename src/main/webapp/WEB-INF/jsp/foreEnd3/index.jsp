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
            <h1>先知共创平台</h1>
            <p>企业资源一体化，共创信息文化大数据平台</p>
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
            <h1>企业级定制化方案</h1>
            <p>精准定位，解决互联网技术痛点</p>
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
            <h1>全民开发计划</h1>
            <p>十年磨一剑，打造最佳开发实践平台</p>
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

    <%--个人企业入口--%>
    <div class="index_00">
        <h3>最新职位发布</h3>

        <%--<div id="wrapper" style="margin-top: 40px">--%>
        <%--<div class="index_tt">--%>
        <%--<a class="shake shake-slow" href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/person.png" alt="" class="index_01img">--%>
        <%--<h1 class="h1">个人入口</h1></a>--%>
        <%--<p>上传简历为你找寻最适合你的工作。</p>--%>
        <%--</div>--%>
        <%--<div class="index_tt">--%>
        <%--<a class="shake shake-slow" href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/house.png" alt="" class="index_01img">--%>
        <%--<h1 class="h1">企业入口</h1></a>--%>
        <%--<p>寻找最稀缺的精英人才</p>--%>
        <%--</div>--%>
        <%--</div>--%>

        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/chang.png" alt="" class="index_ii0">
        <div class="index_oa">

            <ul class="index_1u">
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>
                <li class="index_li1"><span class="index_no fa fa-remove"></span>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/huilogo.png" alt="" class="index_hui">
                    <div class="index_com"><a href="">公司叫什么名公司叫什么名</a></div>
                    <div class="index_pos"><a href="">职位叫什么名呀叫gt</a></div>
                    <div class="index_01tag">
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                        <span class="index_01s">haha</span>
                    </div>
                    <div class="index_01time">2017-08-10</div>
                </li>


                
                
            </ul>
        </div>


    </div>


    <!--全民开发计划-->
    <div class="index_01">
        <h3>国内最专业、最权威的企业级IT人才资源库</h3>
        <p>先知平台联合众多企业为IT互联网人才提供精准的定位、优质的服务，助你飞跃发展。</p>

        <div class="index_plan">
            <div class="plan_a">
                <div class="plan_in">
                    <div class="plan_c">
                        <h4>初创展示</h4>
                        <span class="plan_d">
                        <p>适合网站初始化建设、信息展示、个性化体验、动态交互。</p>
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
                        <h4>建站推广</h4>
                        <span class="plan_d">
                        <p>服务器端搭建、资源整合、并发访问控制、数据持久化存储以及高效开发工具。</p></span>
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
                        <h4>移动互联</h4>
                        <span class="plan_d">
                        <p>电子商务、大数据平台、移动互联网开发等企业级应用快速搭建。实现领先、安全、稳定的互联网产品。</p></span>
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
                        <h4>行业解决方案</h4>
                        <span class="plan_d">
                        <p>非富项目资源库，覆盖多个行业的专业解决方案。从设计到实现，一站式的技术全面升级。</p></span>
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

    <!--服务解决方案分析-->
    <div class="index_02">
        <h3>先知服务</h3>
        <p>开发者工具、建站、API、企业应用、支持云端应用服务</p>
        <div class="an_main">
            <!-- FIFTH EXAMPLE -->
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ff.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>企业级人才定制</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dain.png" alt="">
                    <p>企业与人才间的便捷对接，致力于为国内外企业提供“轻量级、精准化”的服务。</p>
                    <a href="#" class="info">
                        查看详情
                    </a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/gg.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>技术服务与推广</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/app.png" alt="">
                    <p>专业的流程，高效的服务能力和一站式解决方案，提供最佳的网络架构设计方案。</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/hh.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>高品质企业资源服务</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/jin.png" alt="">
                    <p>聚焦互联网IT行业，云集多家名企，实现企业与人才精准化对接。完成一站式人才推送服务，打破求职者与招聘企业的中间壁垒。</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dd.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>校园共建</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/game.png" alt="">
                    <p>学校与企业资源、信息共享的”双赢”模式。应社会所需 ，与市场接轨，实践与理论相结合的全新理念。</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
            <div class="view view-fifth">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/jj.jpg" style="width: 100%"/>
                <div class="mask">
                    <h2>创新创业资源共享</h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/yi.png" alt="">
                    <p>平台通过“互联网＋”的技术手段，打破资源汇聚的地缘优势，实现创新创业资源的平等共享。</p>
                    <a href="#" class="info">查看详情</a>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both"></div>

    <!--服务内容-->
    <div class="index_03">
        <h3>全民开发计划</h3>
        <p>开发者工具、建站、API、企业应用、支持云端应用服务</p>
        <div class="index_content">
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/24.png" alt="">
                    <h4>开发者工具</h4>
                    <div>
                        <span>Intellij-idea</span> | <span>Webstorm</span> | <span>Eclipse</span>
                    </div>
                    <div><span>Sublime-text</span> | <span>Visual-studio</span> | <span>Xcode</span>
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/25.png" alt="">
                    <h4>环境搭建</h4>
                    <div>
                        <span>MEAN框架</span> | <span>预装JAVA</span> | <span>预装ASP/.NET</span>
                    </div>
                    <div><span>预装建站系统</span> | <span>服务器软件</span> | <span>应用开发工具</span>
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/26.png" alt="">
                    <h4>API文档</h4>
                    <div>
                        <span>JDK文档</span> | <span>Maven手册</span> | <span> Mybatis-3.1</span>
                    </div>
                    <div><span> Tomcat </span> | <span> MySQL中文文档</span> | <span> Node.js</span>
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/27.png" alt="">
                    <h4>企业案例分析</h4>
                    <div>
                        <span>支付模块</span> | <span>视频模块</span> | <span>电商平台</span>
                    </div>
                    <div><span>博客模块</span> | <span>招聘模块</span> | <span>OV</span>
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/28.png" alt="">
                    <h4>知识库</h4>
                    <div>
                        <span>技术文章</span> | <span>技术文章</span> | <span>技术文章</span>
                    </div>
                    <div><span>技术文章</span> | <span>技术文章</span> | <span>技术文章</span>
                    </div>
                </a>
            </div>
            <div class="content_in col-md-4 col-sm-6">
                <a href="">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/29.png" alt="">
                    <h4>开发文档</h4>
                    <div>
                        <span>需求管理</span> | <span>需求开发</span> | <span>系统设计</span>
                    </div>
                    <div><span>项目规划</span> | <span>项目监控</span> | <span>服务与维护</span>
                    </div>
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


<%--小箭头小邮箱--%>
<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>


<jsp:include page="behindforeEnd.jsp"/>

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

<%--职位--%>
<script>
    jQuery(".index_no").click(function () {
        jQuery(this).closest('li').fadeOut(500, function () {
            $(this).remove();
        });
    })
</script>


</body>
</html>