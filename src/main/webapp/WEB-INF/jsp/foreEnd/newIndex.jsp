<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/27
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="distFore.jsp"/>
</head>
<body style="background: #f3f5f7">

<!--nav-->
<jsp:include page="newHeader.jsp"/>
<!--nav-->

<div id="index_lb_bg" class="hidden-xs"></div>
<section id="index_content" class="container">
    <div id="index_lb">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/index_lo_1.jpg" alt="...">
                    <div class="carousel-caption index_lb_bg">
                        <div class="index_lb_bt ">
                            <h3>迈出第一步<span>知识的朋友</span></h3>
                            <p>一个人如果你不逼自己一把，你根本不知道自己有多优秀。 </p>
                            <a href="##"><i class="fa fa-thumbs-up icon_1" style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/index_lo_2.jpg" alt="...">
                    <div class="carousel-caption index_lb_bg">
                        <div class="index_lb_bt ">
                            <h3>JAVA<span>打造你自己的专属课程</span></h3>
                            <p>当你的能力还驾驭不了你的目标时，你就应该沉下心来学习。</p>
                            <a href="##"><i class="fa fa-thumbs-up icon_1" style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/index_lo_3.jpg" alt="...">
                    <div class="carousel-caption index_lb_bg">
                        <div class="index_lb_bt ">
                            <h3>Web前端工程师<span>年薪20万？</span></h3>
                            <p>每个人都会累，没有人能为你承担悲伤，人总有一段时间要学会自己长大。</p>
                            <a href="##"><i class="fa fa-thumbs-up icon_1" style="font-size: 20px; transition: color 0.2s ease 0s, border-color 0.2s ease 0s, background-color 0.2s ease 0s; min-height: 0px; min-width: 0px; line-height: 20px; border-width: 0px 2px 0px 0px; margin: 0px; padding:0px 10px 0 0; letter-spacing: 0px;"></i>查看课程</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
    <div  class="row index_js_top" >
        <a href="" class="pull-left">前端开发</a>
        <a href="" class="pull-right">更多</a>
    </div>
    <div  class="row index_zhanshi">

        <div class="index_zhanshi_content">
            <div class="col-md-3 _zhanshi_content_left">
                <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_a_left.jpg')">
                    <div class="_zhanshi_content_left_top">
                        <a href="">
                            <p style="margin-bottom: 10px;color: #FFBE99;">职业路径</p>
                            <h3 style="margin-bottom: 20px">前端进阶：响应式开发与常用框架</h3>
                            <p ><span>了解详情</span></p>
                        </a>
                    </div>
                    <div class="_zhanshi_content_left_bottom">
                        <hr>
                        <p><a href="">· HTML5与CSS3实现动态网页</a></p>
                        <p><a href="">· 前端小白入门</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-9 _zhanshi_content_right">
                <div class="_zhanshi_content_right_top" >
                    <a href="" style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/eeee1.jpg')"></a>
                </div>
                <div class="_zhanshi_content_right_bottom">
                    <div class="_zhanshi_left_margin">
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(75,150,220,.7),#4b96dc);">
                                jQuery
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_a3.jpg');"></p>
                            <h4>
                                <span>jQuery基础(四)—动画篇</span>
                                <p>jQuery基础教程动画篇，讲解jQuery结局开启动画修炼</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div >
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(255,150,0,.7),#ff9600);">
                                <span>HTML/CSS</span>&nbsp;&nbsp;<span>JavaScript</span>
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_a4.jpg');"></p>
                            <h4>
                                <span>Web安全-XSS</span>
                                <p>从Web安全XSS的定义,原理到实战全方位理解XSS安全</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(255,115,155,.7),#ff739b);">
                                AngularJS
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_a1.jpg')"></p>
                            <h4>
                                <span>Angular2一小时快速入门</span>
                                <p>Angular2一小时快速入门教程，快速上手Angular2开发</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div style="margin-right: 0" >
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(0,185,90,.7),#00b95a);">
                                Node.js
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_a2.jpg')"></p>
                            <h4>
                                <span>去哪儿前端沙龙分享第三期</span>
                                <p>本课程为去哪儿网前端交互沙龙第三期，精彩分享不容错过</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div  class="row index_js_top" >
        <a href="" class="pull-left">全栈开发</a>
        <a href="" class="pull-right">更多</a>
    </div>
    <div  class="row index_zhanshi">

        <div class="index_zhanshi_content">
            <div class="col-md-3 _zhanshi_content_left">
                <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_b2_left.jpg')">
                    <div class="_zhanshi_content_left_top">
                        <a href="">
                            <p style="margin-bottom: 10px;color: #FFBE99;">职业路径</p>
                            <h3 style="margin-bottom: 20px">前端进阶：成为全栈工程师</h3>
                            <p ><span>了解详情</span></p>
                        </a>
                    </div>
                    <div class="_zhanshi_content_left_bottom">
                        <hr>
                        <p><a href="">· 创建node服务器</a></p>
                        <p><a href="">· mongoDB数据库</a></p>
                    </div>
                </div>
            </div>
            <div class="col-md-9 _zhanshi_content_right">
                <div class="_zhanshi_content_right_top" >
                    <a href="" style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/eeee2.jpg')"></a>
                </div>
                <div class="_zhanshi_content_right_bottom">
                    <div class="_zhanshi_left_margin">
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(75,150,220,.7),#4b96dc);">
                                jQuery
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_b1.jpg');"></p>
                            <h4>
                                <span>jQuery基础(四)—动画篇</span>
                                <p>jQuery基础教程动画篇，讲解jQuery结局开启动画修炼</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div >
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(255,150,0,.7),#ff9600);">
                                <span>HTML/CSS</span>&nbsp;&nbsp;<span>JavaScript</span>
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_b2.jpg');"></p>
                            <h4>
                                <span>Web安全-XSS</span>
                                <p>从Web安全XSS的定义,原理到实战全方位理解XSS安全</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div>
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(255,115,155,.7),#ff739b);">
                                AngularJS
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_b3.jpg')"></p>
                            <h4>
                                <span>Angular2一小时快速入门</span>
                                <p>Angular2一小时快速入门教程，快速上手Angular2开发</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                    <div style="margin-right: 0" >
                        <a href="">
                            <div class="qqq_1" style="background: linear-gradient(270deg,rgba(0,185,90,.7),#00b95a);">
                                Node.js
                            </div>
                            <p style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd2/img/index_b4.jpg')"></p>
                            <h4>
                                <span>去哪儿前端沙龙分享第三期</span>
                                <p>本课程为去哪儿网前端交互沙龙第三期，精彩分享不容错过</p>
                                <b>初级 · <span>59543</span>人在学</b>
                            </h4>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div  class="row index_js_top" style="margin-top:20px; background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/wwww.png');">
        <a href="" class="pull-left" style=" color: #ffffff;">项目领域</a>
        <a href="" class="pull-right">更多</a>
    </div>
    <div id="index_xmly">
        <a href=""><div class="index_zs">
            <div class="row">
                <div class="index_zs_left col-lg-3 col-sm-6 text-center wow fadeInLeft animated" data-wow-animation-name="fadeInLeft" style="visibility: visible; animation-name: fadeInLeft;">
                    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/q1.jpg') "></div>
                </div>
                <div class="index_zs_right col-lg-9 col-sm-6 wow fadeInRight animated" data-wow-animation-name="fadeInRight" style="visibility: visible; animation-name: fadeInRight; ">
                    <span>云技术</span>
                    <div>
                        <p>
                            <i class="fa fa-check fa-lg pr-10"></i>
                            云技术（Cloud technology） 是云计算商业模式应用的网络技术、信息技术、整合技术、管理平台技术、应用技术等的总称，可以组成资源池，按需所用，灵活便利。云计算技术将变成重要支撑。技术网络系统的后台服务需要大量的计算和运算、存储资源，如视频网站、图片类网站和更多的门户网站。
                        </p>
                    </div>
                    <h4>
                        了解详情
                        <span class="fa fa-arrow-circle-right"></span>
                    </h4>

                </div>
            </div>
        </div></a>
        <a href=""><div class="index_zs">
            <div class="row">
                <div class="index_zs_left col-lg-3 col-sm-6 text-center wow fadeInLeft animated" data-wow-animation-name="fadeInLeft" style="visibility: visible; animation-name: fadeInLeft;">
                    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/q2.jpg') "></div>
                </div>
                <div class="index_zs_right col-lg-9 col-sm-6 wow fadeInRight animated" data-wow-animation-name="fadeInRight" style="visibility: visible; animation-name: fadeInRight; ">
                    <span>大数据</span>
                    <div>
                        <p>
                            <i class="fa fa-check fa-lg pr-10"></i>
                            大数据（big data），指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，它是一项非常新的技术，它是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产指不用随机分析法，（抽样调查）这样捷径，而采用所有数据进行分析处理。
                        </p>
                    </div>
                    <h4>
                        了解详情
                        <span class="fa fa-arrow-circle-right"></span>
                    </h4>

                </div>
            </div>
        </div></a>
        <a href=""><div class="index_zs">
            <div class="row">
                <div class="index_zs_left col-lg-3 col-sm-6 text-center wow fadeInLeft animated" data-wow-animation-name="fadeInLeft" style="visibility: visible; animation-name: fadeInLeft;">
                    <div style="background-image:url('${pageContext.request.contextPath}/dist/foreEnd2/img/q3.jpg') "></div>
                </div>
                <div class="index_zs_right col-lg-9 col-sm-6 wow fadeInRight animated" data-wow-animation-name="fadeInRight" style="visibility: visible; animation-name: fadeInRight; ">
                    <span>VR</span>
                    <div>
                        <p>
                            <i class="fa fa-check fa-lg pr-10"></i>
                            虚拟现实技术是一种可以创建和体验虚拟世界的计算机仿真系统，它利用计算机生成一种模拟环境，是一种多源信息融合的、交互式的三维动态视景和实体行为的系统仿真使用户沉浸到该环境中。
                        </p>
                    </div>
                    <h4>
                        了解详情
                        <span class="fa fa-arrow-circle-right"></span>
                    </h4>

                </div>
            </div>
        </div></a>
    </div>
</section>

<section id="index_bottom">
    <div class="container">
        <div class="row">
            <p>
                <a href="" class="fa fa-skyatlas" style="color: #5A9CDA"></a>
                <a href="" class="fa fa-weibo" style="color: #F19D25"></a>
                <a href="" id="index_weixin" class="fa fa-wechat" style="color: #CD6180"></a>
                <a href="" class="fa fa-qq" style="color:#079F51;"></a>
            </p>
            <div>
                <ul>
                    <li> <a href="">企业合作</a></li>
                    <li> <a href="">人才招聘</a></li>
                    <li> <a href="">联系我们</a></li>
                    <li> <a href="">讲师招募</a></li>
                    <li> <a href="">常见问题</a></li>
                    <li> <a href="">意见反馈</a></li>
                </ul>
            </div>
            <hr class="index_bottom_hr">
            <h3>© 2017 imooc.com  京ICP备 13046642号-2</h3>
        </div>
    </div>
</section>
<div class="hidden-xs" id="cbl">
    <ul>
        <li>
            <a href="#" class="fa fa-commenting-o"></a>
        </li>
        <li>
            <a href="#" class="fa fa-envelope-open"></a>
        </li>
        <li>
            <a href="#" class="fa fa-user"></a>
        </li>
        <li>
            <a href="#" class="fa fa-steam"></a>
        </li>
        <li  id="index_hddb">
            <a href="javascript:;" class="fa fa-chevron-up"></a>
        </li>
    </ul>
</div>





<script src="${pageContext.request.contextPath}/dist/foreEnd2/js/index.js"></script>

</body>
</html>
