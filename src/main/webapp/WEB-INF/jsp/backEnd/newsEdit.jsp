<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>行业动态</title>
    <jsp:include page="backEndCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/datedropper.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/timedropper.min.css">

    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if('${msg}'=='添加成功'||'${msg}'=='修改成功') window.location.href = "${pageContext.request.contextPath}/News/selectNewsAll.emp";
            if('${news.newsId }'!=0){
                saveForm.action = "${pageContext.request.contextPath}/News/updateNews.emp";
            }
        });
    </script>
</head>
<jsp:include page="backEndHeader.jsp"/>

<body>
<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改行业动态</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">行业动态</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/News/saveNews.emp" modelAttribute="news" >
                            <sf:hidden  path="newsId" /><br>
                            动态发布者:<br>
                            <sf:input id="ga" path="newsWriter"/>
                            <sf:errors path="newsWriter"/>
                            <br>
                            动态标题:<br>
                            <sf:input  path="newsTitle"/>
                            <sf:errors path="newsTitle"/>
                            <br>
                            发布日期：<br>
                            <sf:input path="newsDate" type="text" class="input" id="pickdate" />
                            <sf:errors path="newsDate"/>
                            <br/>
                            动态内容:<br>
                            <sf:textarea path="newsArticle"/>
                            <sf:errors path="newsArticle"/>
                            <br>
                            <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/backEnd/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datedropper.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/timedropper.min.js"></script>
<script>
    $("#pickdate").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '2020'
    });
</script>

</body>
</html>
