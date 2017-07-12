<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/26
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>查看视频</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        function setVideoType() {
            var xzVideo = ${xzVideo};
            $.ajax({
                url: '${pageContext.request.contextPath}/Test/selById',
                data: {id: id},
                type: 'get',
                success: function (data) {
                    var addBox = document.getElementById("addBox");
                    var saveForm = document.getElementById("saveForm");
                    document.getElementById("testId").value = data.test.id;
                    document.getElementById("testA").value = data.test.testA;
                    document.getElementById("testB").value = data.test.testB;
                    saveForm.action = "${pageContext.request.contextPath}/Test/updateTest";
                    addBox.style.display = "block";
                }
            })


        }
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">

    <div class="header">
        <h1 class="page-title">视频</h1>

    </div>

    <ul class="breadcrumb">
        <li><a href="#">1</a> <span class="divider">/</span></li>
        <li class="active">视频</li>
    </ul>

    <div class="container-fluid">
        <sf:form action="${pageContext.request.contextPath}/XzVideo/selectVideo.emp" method="post"
                 modelAttribute="xzVideo">
            <div class="row-fluid">
                <video controls class="back_v"
                       src="${pageContext.request.contextPath}/dist/video/${xzVideo.videoAddress}"/>
            </div>
            <%--<a href="#" onClick="history.go(-1);return true;">--%>
            <%--<button class="back_b btn btn-warning" style="width: 80px;margin-top: 20px;margin-left: 40px;" type="button"--%>
            <%-->返回</button>--%>
            <%--</a>--%>
            <label>
                审核状态 :
                <c:if test="${xzVideo.videoType == 1}">
                    通过
                </c:if>
                <c:if test="${xzVideo.videoType == 2}">
                    未通过
                </c:if>
                <c:if test="${xzVideo.videoType == 3}">
                    待审核
                </c:if>
                <a href="${pageContext.request.contextPath}/XzVideo/goUpdateVideo.emp?videoID=${xzVideo.videoID}">&nbsp;&nbsp;&nbsp;修改   </a>
            </label>
            <button class="back_b btn btn-warning" type="submit">返回</button>
        </sf:form>
        <footer>
            <hr>
            <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
        </footer>
    </div>
</div>

</body>
</html>
