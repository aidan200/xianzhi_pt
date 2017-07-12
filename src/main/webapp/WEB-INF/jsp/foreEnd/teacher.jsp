<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>师资</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script>
        //分页
        function turning(type) {
            var page = parseInt(document.getElementById("teaPage").value);
            if(type=="up"){
                page--;
            }else if(type=="down"){
                page++;
            }
            document.getElementById("teaPage").value = page;
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>技术领域</h3>
        <p class="description">
            总部专家、产品经理、社区技术专家、中心教员、中心班主任、职业规划师从入学到毕业
            提供全方位教学服务，让学习过程更轻松，
            让学习效果更明显，私人定制每个学员的IT梦想
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">技术领域</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="admission">
    <div class="container">

            <c:forEach var="t1" varStatus="status" items="${teaList}">
                <c:if test="${status.index % 3 == 0}"><div class="faculty_top"></c:if>
            <div class="col-md-4 faculty_grid">
                <figure class="team_member">
                    <c:forEach var="ii" items="${t1.teacherImage}">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/${ii.imagePath}" class="img-responsive wp-post-image" alt=""/>
                    </c:forEach>
                    <div></div>
                    <figcaption><h3 class="person-title">${t1.teacherName}</h3>
                        <span class="person-deg">${t1.subjectId}${t1.teacherLevel}</span>
                        <div class="person-social">
                            <p>${t1.teacherIntroduce}</p>
                        </div>
                    </figcaption>
                </figure>
            </div>
                <c:if test="${status.index % 3 == 2}"></div></c:if>
            </c:forEach>
            <div class="clearfix"> </div>

    <%--</c:forEach>--%>

    </div>
</div>
<jsp:include page="footerForeEnd.jsp"/>
</body>
</html>