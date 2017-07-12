<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/aniCss.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery.color.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/lunbo.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/aniJS.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script type="application/javascript">
        var thePage;
        function goLoad(loadBut) {
            thePage = '${page}';
            alert(thePage + '====' + '${pages}');
            if (thePage != '${pages}') {
                thePage++;
                $.ajax({
                    url: '${pageContext.request.contextPath}/Blog/selBlogIndexAjax.do',
                    data: {page: thePage},
                    dataType: 'json',
                    success: function (data) {
                        if (thePage == data.pages) {
                            loadBut.style.display = 'none';
                        }
                        for (var i = 0; i < data.blist.length; i++) {
                            var tt = getNowFormatDate(data.blist[i].blogTime);
                            $('#blogBox').append('<div class="blog_every">' +
                                '<div class="blog_head">' +
                                '<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="blog_img">' +
                                '<div style="margin-top: 10px">' + data.blist[i].login.loginCount + '</div>' +
                                '</div>' +
                                '<div class="blog_text">' +
                                '<h4><b><a href="">' + data.blist[i].blogTitle + '</a></b></h4>' +
                                '<p>' + data.blist[i].blogAbstract.substring(0, 100) + '</p>' +
                                '<div class="blog_bt">' +
                                '<div><span class="fa fa-bars">&emsp;' + data.blist[i].blogType + '</span>' +
                                '<span style="float: right">' +
                                '<span class="fa fa-clock-o">' + tt +'</span>&emsp;' +
                                '<span class="fa fa-eye" style="margin-right: 30px"> ' + data.blist[i].lsum + '</span>' +
                                '</span>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>');
                        }
                    }
                });
            } else {
                loadBut.style.display = 'none';
            }
        }
    </script>
</head>
<body>


<jsp:include page="headerforeEnd.jsp"/>


<div class="container">
    <div class="blog_all col-md-12 col-sm-12 col-xs-12">
        <!--左边-->
        <div class="col-md-9 col-xs-12">
            <!--左面下面博文-->
            <div class="col-md-12 col-xs-12">
                <!--轮播-->
                <%--<div id="myCarousel" class="blog_lun carousel slide">--%>
                <%--<!-- 轮播（Carousel）指标 -->--%>
                <%--<ol class="carousel-indicators">--%>
                <%--<li data-target="#myCarousel" data-slide-to="0" class="active"></li>--%>
                <%--<li data-target="#myCarousel" data-slide-to="1"></li>--%>
                <%--<li data-target="#myCarousel" data-slide-to="2"></li>--%>
                <%--</ol>--%>
                <%--<!-- 轮播（Carousel）项目 -->--%>
                <%--<div class="carousel-inner">--%>
                <%--<div class="item active">--%>
                <%--<img src="/wp-content/uploads/2014/07/slide1.png" alt="First slide">--%>
                <%--</div>--%>
                <%--<div class="item">--%>
                <%--<img src="/wp-content/uploads/2014/07/slide2.png" alt="Second slide">--%>
                <%--</div>--%>
                <%--<div class="item">--%>
                <%--<img src="/wp-content/uploads/2014/07/slide3.png" alt="Third slide">--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<!-- 轮播（Carousel）导航 -->--%>
                <%--<a class="carousel-control left" href="#myCarousel"--%>
                <%--data-slide="prev">&lsaquo;</a>--%>
                <%--<a class="carousel-control right" href="#myCarousel"--%>
                <%--data-slide="next">&rsaquo;</a>--%>
                <%--</div>--%>

                <div id="div1">
                    <h4></h4>
                    <div style="background-image:url('img/6.png');z-index:2">1111111111111111</div>
                    <div style="background-image:url('img/7.png')">222222222222222</div>
                    <div style="background-image:url('img/8.png')">3333333333333333</div>
                </div>

                <!--搜索-->
                <div class="blog_select anifTopLe">
                    <form action="">
                        <div class="blog_circle">
                            <div class="blog_s">
                                <input type="text" class="blog_se anifInput">
                                <button type="submit" class="blog_button">
                                    <span class="fa fa-search fa-2x" style="color: #ffffff"></span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!--博客内容-->
                <div id="blogBox" class="blog_content">
                    <c:forEach items="${blist}" var="b">
                        <div class="blog_every">
                            <div class="blog_head">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                     class="blog_img">
                                <div style="margin-top: 10px">${b.login.loginCount}</div>
                            </div>
                            <div class="blog_text">
                                <h4><b><a href="">${b.blogTitle}</a></b></h4>
                                <p class="bh_p">${fn:substring(b.blogAbstract,0 ,100 )}</p>
                                <div class="blog_bt">
                                    <div><span class="fa fa-bars">&emsp;${b.blogType}</span>
                                        <span style="float: right">
                                        <span class="fa fa-clock-o"><fmt:formatDate value="${b.blogTime}"
                                                                                    pattern="yyyy-MM-dd"/></span>&emsp;
                                            <span class="fa fa-eye" style="margin-right: 30px"> ${b.lsum}</span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div style="width: 100%;text-align: center">
                    <button class="blog_button2" onclick="goLoad(this)">加载更多</button>
                </div>
            </div>

            <div style="clear: both"></div>
        </div>
        <div class="col-md-3 col-xs-12">
            <div class="blog_news">
                <div class="bn_l">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="">
                </div>
                <div style="text-align: center">
                    <h4 style="margin-top: 15px">${userLogin.loginCount}</h4>
                    <div style="margin-top: 10px">
                        <span style="margin: 5px">关注 <span>156</span></span> |
                        <span style="margin: 5px">粉丝 <span>454</span></span>
                    </div>
                    <div style="margin-top: 10px">
                        <span><a href="${pageContext.request.contextPath}/view/foreEnd3/write_blog.html"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/blog.png" alt=""
                                                                                                              class="blog_f"></a></span>&emsp;
                        <span><a href="${pageContext.request.contextPath}/view/foreEnd3/write_blog.html">发博文</a></span>
                    </div>
                    <div style="margin-top: 10px">
                        <span class="fa fa-bell" style="color: #c7c7c7"> <a href="">消息 (<span>20</span>)</a></span>
                    </div>

                </div>
            </div>

            <!--排行-->
            <div class="blog_line">
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

        </div>

    </div>
    <div style="clear: both"></div>
</div>

<footer>

</footer>
</body>
</html>