<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/6/27
  Time: 14:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distFore.jsp"/>
</head>

<body style="background-color: #eeeeee">
<!--nav-->
<jsp:include page="newHeader.jsp"/>

<!--nav结束-->

<div class="container">

    <div class="blog_all col-md-12 col-sm-12 col-xs-12">
        <!--左边-->
        <div class="col-md-9 col-xs-12">
            <!--左边上面-->
            <div class="col-md-12 col-sm-12 col-xs-12">

                <!--个人信息-->
                <div class="col-md-6 col-xs-12" style="padding-right: 10px">
                    <div class="blog_news">
                        <div class="bn_l">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="">
                        </div>
                        <div class="bn_r">
                            <div style="margin-top: 10px;font-size: 20px">我叫什么呀</div>
                            <div style="margin-top: 10px">
                                <a href="">消息 (<span style="color: #ca151d">10</span>)</a> &emsp;
                                <a href=""><span> 退出</span></a>
                            </div>
                            <a href="">
                                <div style="margin-top: 15px"><img src="${pageContext.request.contextPath}/dist/foreEnd2/img/red.png" alt=""
                                                                   style="width: 30px;height: 30px"> 发博文
                                </div>
                            </a>

                            <div style="margin-top: 15px">
                                <span>关注 <span>214</span></span> |
                                <span>粉丝 <span>568</span></span></div>
                        </div>
                    </div>
                </div>
                <!--个人信息结束-->
                <!--博文分类-->
                <div class="blog_cc col-md-6 col-xs-12" style="padding-right: 10px">
                    <div class="blog_classify">

                        <!--丝带-->
                        <div class="wrap">
                            <span class="ribbon6" style="color: #ffffff;font-size: 18px">博文分类</span>
                        </div>

                        <ul style="">
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-database"></span>&emsp;移动开发</a>
                            </li>
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-cloud"></span>&emsp;Web前端</a>
                            </li>
                            <hr style="border: 1px dashed #eeeeee;margin-top: 15px;margin-bottom: 15px">
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-database"></span>&emsp;编程语言</a>
                            </li>
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-database"></span>&emsp;云计算</a>
                            </li>
                            <hr style="border: 1px dashed #eeeeee;margin-top: 15px;margin-bottom: 15px">
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-database"></span>&emsp;数据库</a>
                            </li>
                            <li class="col-md-6 col-xs-6">
                                <a href=""><span class="fa fa-database"></span>&emsp;互联网</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!--博文分类结束-->
            </div>


            <!--左面下面博文-->
            <div class="blog_content col-md-12 col-xs-12">
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="blog_every">

                    <div class="blog_head">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/small.jpg" alt="" class="blog_img">
                        <div style="margin-top: 10px">金泰妍</div>
                    </div>

                    <div class="blog_text">
                        <h4><b><a href="">OpenCV代码提取：remap函数的实现</a></b></h4>
                        <p>GIS与水文分析（3）DEM数据准备 ArcGIS的水文分析工具需要DEM数据才能执行，
                            因此在使用之前必须要准备好DEM数据并且针对DEM数据进行预处理。本章节内容介绍如何根据已有的数据制作和处理</p>
                        <div class="blog_bt">
                            <div><span class="fa fa-bars">&emsp;数据库</span>
                                <span style="float: right">
                                    <span class="fa fa-clock-o"> 2017-06-23</span>&emsp;
                                    <span class="fa fa-eye" style="margin-right: 30px"> 125</span>
                                </span>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <!--博文结束-->
            <div style="clear: both"></div>
            <!--分页-->
            <div style="text-align: center;margin-top:50px">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </div>

        </div>


        <!--右边-->
        <div class="blog_right col-md-3 col-xs-12">
            <!--投票-->
            <div class="br_t">
                <div class="br_img">
                    <h3>投票</h3>
                    <p>物联网与大数据将助推工业应用的崛起，你认同么？</p>
                </div>
                <div style="margin-top: 20px">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/chi.png" class="chidoudou" alt="">
                    <span><button class="blog_rb" type="button">投票</button></span>&emsp;

                </div>
            </div>
            <!--投票结束-->
            <!--博文搜索-->
            <form action="">
                <div class="br_c">
                    <div class="col-3">
                        <input class="effect-4" type="text" placeholder="搜索博文">
                        <span class="focus-border"></span>
                    </div>
                    <button class="blog_sb">搜索</button>
                </div>
            </form>
            <!--搜索结束-->
            <!--博文排行-->
            <div id="br_b">
                <h4>博文排行</h4>
                <ul>
                    <li>
                        <span class="br_l">1</span>&nbsp; <span><a href="">Android 开发技术选型（博客，新闻，阅读类）</a></span>
                    </li>
                    <li>
                        <span class="br_l">2</span>&nbsp; <span><a href="">React Native 自定义控件之验证码和Toast</a></span>
                    </li>
                    <li>
                        <span class="br_l">3</span>&nbsp; <span><a href="">Python Enclosing作用域、闭包、装饰器</a></span>
                    </li>
                    <li>
                        <span class="br_l">4</span>&nbsp; <span><a href="">VueJs与ReactJS&AngularJS的差异对比</a></span>
                    </li>
                    <li>
                        <span class="br_l">5</span>&nbsp; <span><a href="">Oracle DB Time 解读</a></span>
                    </li>
                    <li>
                        <span class="br_l">6</span>&nbsp; <span><a href="">SeaweedFS索引-CompactMap</a></span>
                    </li>
                    <li>
                        <span class="br_l">7</span>&nbsp; <span><a href="">[总结]FFMPEG视音频编解码零基础学习方法</a></span>
                    </li>
                    <li>
                        <span class="br_l">8</span>&nbsp; <span><a href="">Android里帐户同步的实现</a></span>
                    </li>
                    <li>
                        <span class="br_l">9</span>&nbsp; <span><a href="">pygame开发2048游戏</a></span>
                    </li>
                    <li>
                        <span class="br_l">10</span>&nbsp; <span><a href="">RSA算法之实现篇</a></span>
                    </li>
                </ul>
            </div>
            <!--排行结束-->
        </div>
    </div>
    <div style="clear: both"></div>
</div>

<footer>
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
                        <li><a href="">企业合作</a></li>
                        <li><a href="">人才招聘</a></li>
                        <li><a href="">联系我们</a></li>
                        <li><a href="">讲师招募</a></li>
                        <li><a href="">常见问题</a></li>
                        <li><a href="">意见反馈</a></li>
                    </ul>
                </div>
                <hr class="index_bottom_hr">
                <h3>© 2017 imooc.com 京ICP备 13046642号-2</h3>
            </div>
        </div>
    </section>
</footer>
</body>
</html>