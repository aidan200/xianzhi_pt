<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>评论回复</title>
   <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if('${msg}'=='添加成功'||'${msg}'=='修改成功') window.location.href = "${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.emp";
            if('${discuss.discussId }'!=0){
                saveForm.action = "${pageContext.request.contextPath}/Discuss/updateReply.emp";
            }
        });
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改回复信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.emp">评论</a> <span class="divider">/</span></li>
        <li class="active">回复评论</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Discuss/saveReply.emp" modelAttribute="discuss" >
                            <sf:hidden  path="discussId" />
                            <c:if test="${discuss.blogId != null}">
                                上级评论编号:<br>
                                <input type="text" name="blogId" value="${discuss.blogId}" disabled="disabled">
                                <sf:hidden path="blogId"/><br>
                            </c:if>
                            回复人:<br>
                            <sf:input id="ga" path="discussWriter"/>
                            <sf:errors path="discussWriter"/>
                            <br>
                            回复时间:<br>
                            <sf:input path="discussTime"  class="sang_Calender"/>
                            <sf:errors path="discussTime"/>
                            <br>
                            回复内容:<br>
                            <sf:textarea path="discussArticle"/>
                            <sf:errors path="discussArticle"/>
                            <br>
                            <button class="btn btn-warning" type="submit"><i class="icon-ok" onclick="change()"></i>保存</button>
                        </sf:form>
                    </div>
                </div>
            </div>

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
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datetime.js"></script>

</body>
</html>
