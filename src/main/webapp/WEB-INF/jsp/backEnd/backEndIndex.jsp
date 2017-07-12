<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>后台首页</title>
    <jsp:include page="backEndCss.jsp"/>
</head>
<body>
<jsp:include page="backEndHeader.jsp"/>
<div class="content">

    <div class="header">
        <h1 class="page-title">首页</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a>
            <span class="divider">/</span></li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">删除信息</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>你确定要删除这条信息么？</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" data-dismiss="modal">删除</button>
                </div>
            </div>


            <footer>
                <hr>
                <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
            </footer>

        </div>
    </div>
</div>


<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
</body>
</html>
