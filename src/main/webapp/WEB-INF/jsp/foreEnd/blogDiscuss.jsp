<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>博客评论</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        //判断是否为空
        function notNull(index) {
            if (document.getElementById("reText" + index).value == '') {
                alert("请输入回复内容!");
            } else {
                document.getElementById("reButton").submit();
            }
        }
        //判断是否为空
        function unNull() {
            if (document.getElementById("reComment").value == '') {
                alert("请输入评论内容!");
            } else {
                document.getElementById("reSubmit").submit();
            }
        }
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("drPage");
                pageInp.value = page;
                var form = document.getElementById("drForm");
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
        <h3>博客</h3>
        <p class="description">
            秉持“助力梦想，伴你成长”的品牌理念，努力打造最值得信赖的校企合作伙伴。
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">博客</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div>
        <div>
            <div class="container">
                <div class="col-md-3">
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
                    <div class="personBox">
                        <div class="personBox_1">
                            <div class="person_image">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png"
                                     class="img-responsive" alt=""/>
                            </div>
                            <div class="person_image_desc">
                                <h1>公司介绍</h1>
                                <p>助力梦想</p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="person_description">
                            <p>
                                自创立以来，秉持“助力梦想，伴你成长”的品牌理念，努力打造最值得信赖的校企合作伙伴，以产教深度融合、校企合作为主线，与高校一同积极探索校企合作的办学模式和人才培养模式的创新。<a
                                    href="#">更多...</a>
                            </p>
                        </div>
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
                        <h3>近期博客</h3>
                        <c:forEach var="r2" items="${recentList}">
                            <li>
                                <article class="entry-item">
                                    <div class="entry-thumb pull-left">
                                        <c:forEach var="mmm" items="${r2.blogImage}">
                                            <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${mmm.imagePath}"
                                                 class="img-responsive" alt=""/>
                                        </c:forEach>
                                    </div>
                                    <div class="entry-content">
                                        <h6>
                                            <a href="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.do?blogId=${r2.blogId}">
                                                <c:choose><c:when
                                                        test="${fn:length(r2.blogTitle)>'15'}">${fn:substring(r2.blogTitle,0,15)} . . .
                                                </c:when><c:otherwise>${r2.blogTitle}</c:otherwise></c:choose></a></h6>
                                        <p>${r2.blogWriter} &nbsp;/&nbsp;
                                            <fmt:formatDate value="${r2.blogTime}" type="both"
                                                            pattern="yyyy年MM月dd日"/></p>
                                    </div>
                                    <div class="clearfix"></div>
                                </article>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="col-md-9 detail">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/course.jpg" class="img-responsive"
                         alt=""/>
                    <h3>${blog.blogTitle}</h3>
                    <p>${blog.blogArticle}</p>
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                    </div>
                    <div class="author-box">
                        <div class="author-box-left"><img
                                src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png"
                                class="img-responsive sup2" alt=""/></div>
                        <div class="author-box-right">
                            <h4>发帖者：<a href="#">${blog.blogWriter}</a></h4>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="tto">

                        <ul style="list-style-type: none">
                            <h4 style="font-size: 2em;margin-bottom: 1em">相关评论 </h4>
                            <c:forEach var="d1" varStatus="status" items="${discussList}">
                                <li id="${status.count}">
                                    <div class="author-box">
                                        <div class="author-box_left">
                                            <c:if test="${d1.memberPicture==null}">
                                                <img src="${pageContext.request.contextPath}/dist/foreEnd/images/t13.png"
                                                     class="img-responsive sup" alt=""/>
                                            </c:if>
                                            <c:if test="${d1.memberPicture != null}">
                                                <img src="${pageContext.request.contextPath}/dist/photo/${d1.memberPicture}"
                                                     class="img-responsive sup" alt=""/>
                                            </c:if>
                                        </div>
                                        <div class="author-box_right">
                                            <h5><span>${d1.discussWriter}</span>
                                                <span class="pull-right">
                                                <c:if test="${sessionScope.userIndex == d1.discussWriter}">
                                                    <a class="comment-reply-link"
                                                       href="${pageContext.request.contextPath}/Discuss/interceptDeleteDiscuss.do?discussId=${d1.discussId}&blogId=${blog.blogId}">删除</a>
                                                </c:if>
                                            </span>
                                            </h5>
                                            <span class="m_1"><fmt:formatDate value="${d1.discussTime}" type="both"
                                                                              pattern="MM-dd-yyyy HH:mm:ss"/></span>
                                            <p>${d1.discussArticle}</p>
                                            <c:forEach var="r1" items="${d1.replyId}">
                                                <div class="blog_h">
                                                    <p>${r1.discussWriter}回复${d1.discussWriter}:
                                                    <p>${r1.discussArticle}<br><br></p>
                                                    <div class="blog_t">
                                                        <fmt:formatDate value="${r1.discussTime}" type="both"
                                                                        pattern="MM-dd-yyyy HH:mm:ss"/>
                                                    </div>
                                                    <div class="bb9">
                                                        <c:if test="${sessionScope.userIndex == r1.discussWriter}">
                                                            <a href="${pageContext.request.contextPath}/Discuss/interceptDeleteReply.do?discussId=${r1.discussId}&blogId=${blog.blogId}">删除</a>
                                                        </c:if>
                                                    </div>
                                                    </p>
                                                </div>
                                            </c:forEach>
                                            <button class="btn btn-primary" onclick="reMsg(${status.index})" id="kkl">
                                                发表回复
                                            </button>
                                            <form id="saveReply"
                                                  action="${pageContext.request.contextPath}/Discuss/interceptSaveReply.do?blogId=${blog.blogId}"
                                                  method="post">
                                                <div id="text${status.index}" style="display: none">
                                                        <%--<input type="hidden" value="" name="blogId">--%>
                                                    <input type="hidden" value="${d1.discussId}" name="discussId">
                                                    <textarea name="replyComment" id="reText${status.index}"
                                                              class="form-control" placeholder="回复"></textarea>
                                                    <input type="submit" id="reButton" class="ttt2 btn btn-primary"
                                                           value="添加回复" onclick="notNull(${status.index})">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </li>
                            </c:forEach>
                        </ul>
                        <form id="drForm"
                              action="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.do?blogId=${blog.blogId}"
                              method="post">
                            <c:if test="${pages > 1}">
                                <ul class="pagination">
                                    <input id="drPage" type="hidden" name="page" value="${page}">
                                    <page:paging length="10" page="${page}" pages="${pages}"/>
                                </ul>
                            </c:if>
                        </form>
                        <form id="saveForm" class="comment-form"
                              action="${pageContext.request.contextPath}/Discuss/interceptSaveDiscuss.do?blogId=${blog.blogId}"
                              method="post">

                            <div class="col-xs-12">
                                <h4>发表评论</h4>
                                <%--<input type="hidden" value="${blog.blogId}" name="blogId">--%>
                                <textarea name="comment" id="reComment" class="form-control"
                                          placeholder="评论"></textarea>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-submit">
                                <input name="submit" type="submit" id="reSubmit"
                                       class="submit_1 btn btn-primary btn-block" value="添加评论 " onclick="unNull()"
                                       style="width: 150px">
                            </div>
                        </form>
                    </div>
                </div>


            </div>
            <div class="clearfix"></div>

        </div>
    </div>
    <div class="clearfix"></div>
</div>
<jsp:include page="footerForeEnd.jsp"/>
<!-- FlexSlider -->
<link href="${pageContext.request.contextPath}/dist/foreEnd/css/flexslider.css" rel='stylesheet' type='text/css'/>
<script defer src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.flexslider.js"></script>

<script type="text/javascript">
    //显示发表回复文本框
    function reMsg(index) {
        if (${sessionScope.userIndex == null} ||${sessionScope.userIndex == ""}) {
            alert("您还未登录,请登录!");
            window.location.href = "${pageContext.request.contextPath}/XzLogin/goLogin.do";
        } else {
            var div = document.getElementById("text" + index);
            var v = $(div);
            v.toggle();
        }
    }
</script>
<!-- FlexSlider -->
</body>
</html>