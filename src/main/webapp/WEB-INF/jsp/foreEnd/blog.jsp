<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>博客</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("blogPage");
                pageInp.value = page;
                var form = document.getElementById("blogForm");
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
            天赐我一双翅膀，就应该展翅翱翔，满天乌云又能怎样，穿越过就是阳光。
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

<div class="features">
    <div class="container">
        <form id="blogForm" action="${pageContext.request.contextPath}/Blog/selectBlogAll.do">
            <c:forEach var="t1" items="${blogList}">
                <div class="blog_box1">
                    <dl class="item_info_dl">
                        <h2><a href="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.do?blogId=${t1.blogId}">${t1.blogTitle}</a></h2>
                        <dd><address class="item_createdby">发帖者：${t1.blogWriter}</address></dd>
                        <dd><fmt:formatDate value="${t1.blogTime}" type="both" pattern="MM-dd-yyyy HH:mm:ss"/></dd>
                    </dl>
                    <c:forEach var="im" items="${t1.blogImage}">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${im.imagePath}" class="img-responsive" alt=""/>
                    </c:forEach>

                    <p class="blog_p">${t1.blogArticle}</p>

                    <a href="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.do?blogId=${t1.blogId}" class="radial_but"
                       id="blogId">阅读更多</a>
                </div></c:forEach>


            <%--分页符--%>
            <c:if test="${pages > 1}">
            <ul class="pagination">
                <input id="blogPage" type="hidden" name="page" value="${page}">
                <page:paging length="10" page="${page}" pages="${pages}"/>
            </ul></c:if>
        </form>
    </div>
</div>

<jsp:include page="footerForeEnd.jsp"/>
</body>
</html>