<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/25
  Time: 18:38
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
    <title>视频信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var prevDiv = document.getElementById('preview');
            var lj = "${pageContext.request.contextPath}/dist/videoPic/${xzVideo.videoPicture}";
            if (lj != null && lj != "") {
                prevDiv.innerHTML = '<img src=\'' + lj + '\' width="320xp" height="240px"/>';
            }
        });
    </script>

</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">视频信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">视频信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">

            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home" style="margin-top: 20px">
                        <sf:form id="tab" action="${pageContext.request.contextPath}/XzVideo/updateVideo.emp"
                                 method="post"
                                 modelAttribute="xzVideo" enctype="multipart/form-data">
                            <sf:hidden path="videoID"/>
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="memberName"/>

                            <div class="col-md-12 col-xs-12">
                                预览图:
                                <div class="imgt">
                                    <div class="img" id="preview"></div>
                                    <span class="choose"></span>
                                    <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                                           name="photoFile"/>
                                        <%--path="memberPicture"--%>
                                    <sf:hidden id="ptAddress" path="videoPicture"/>
                                </div>
                            </div>

                            视频表ID:<br/>
                            <input type="text" placeholder="视频表ID *" class="input-xlarge"
                                   value="${xzVideo.videoID}"
                                   disabled="disabled"><br/>
                            视频名称:<br/>
                            <sf:input placeholder="视频名称 *" cssClass="input-xlarge" path="videoName"/>
                            <sf:errors path="videoName"/><br/>
                            视频介绍:<br/>
                            <sf:input placeholder="视频介绍 *" cssClass="input-xlarge" path="videoIntroduce"/>
                            <sf:errors path="videoIntroduce"/><br/>
                            视频类别:<br/>
                            <sf:select path="vclass">
                                <c:forEach var="c2" items="${xzVideoClassList}">
                                    <sf:option value="${c2.vclassID}">${c2.className}</sf:option>
                                </c:forEach>
                            </sf:select><br/>
                            审核状态:<br/>
                            <sf:select path="videoType">
                                <sf:option value="1">通过</sf:option>
                                <sf:option value="2">未通过</sf:option>
                                <sf:option value="3">未审核</sf:option>
                            </sf:select><br/>
                            <div class="btn-toolbar">
                                <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </div>
            <footer>
                <hr>
                <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
            </footer>
        </div>
    </div>
</div>

<script type="text/javascript">

    //选择封面图片
    function preview(file) {
        document.getElementById("ptAddress").value = file.value;
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/videoPic/${xzVideo.videoPicture}"
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" width="150xp" height="150px"/>';
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    }
</script>
</body>
</html>
