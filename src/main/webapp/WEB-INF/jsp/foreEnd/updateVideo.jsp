<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/9
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入日期标签--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>修改视频信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <!----font-Awesome----->
    <script type="application/javascript">
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );

            var prevDiv = document.getElementById('preview');
            var lj = "${pageContext.request.contextPath}/dist/videoPic/${xzVideo.videoPicture}";
            if (lj != null && lj != "") {
                prevDiv.innerHTML = '<img src=\'' + lj + '\' width="300xp" height="170px"/>';
            }
        });

        //       将本地视频地址 赋给video标签
        function setVideoIntroduce1() {
            var text = document.getElementById('videoTextarea').value;
            document.getElementById("videoIntroduceID").value = text;
        }

    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }
    </style>
</head>
<body style="background-color: #eeeeee">

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>上传视频</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzVideo/goUploadVideo.do">修改视频信息</a></li>
                <li class="current-page">视频管理</li>
            </ul>
        </div>
    </div>
</div>
<div class="in_gray">

    <div class="in_white2">
        <div class="vip_nav">
            <ul class="col-md-2 col-xs-12" style="padding-right: 40px">
                <li class="vip_li"><a href="#">历史记录</a></li>
                <li class="vip_li"><a href="#">已购视频</a></li>
                <li class="vip_li active"><a
                        href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do">上传管理</a></li>

            </ul>

        </div>

        <div class="col-md-10 col-xs-12">

            <div class="company_position">
                <sf:form action="${pageContext.request.contextPath}/XzVideo/updateVideo.do" class="position_form"
                         modelAttribute="xzVideo" enctype="multipart/form-data">
                    <sf:hidden path="loginID"/>
                    <sf:hidden path="memberName"/>
                    <sf:hidden path="videoID"/>
                    <label>

                        <span class="position_word" style="float: left">预览图：&emsp;</span>
                        <div class="imgt2">
                            <div class="img" id="preview"></div>
                            <span class="choose"></span>
                            <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                                   name="photoFile" style="margin-left: 90px;margin-top: 20px"/>
                            <sf:hidden id="ptAddress" path="videoPicture"/>
                        </div>

                    </label>
                    <label>
                        <span class="position_word">视频名称 ： </span>
                        <sf:input path="videoName" autocomplete="off" cssClass="position_input2"/>
                        <sf:errors path="videoName"/>
                    </label>
                    <label>
                        <sf:hidden id="videoIntroduceID" path="videoIntroduce" autocomplete="off"
                                   cssClass="position_input2"/>
                        <sf:errors path="videoIntroduce"/>
                        <span class="position_word" style="float: left">视频介绍 ： </span>
                        <textarea class="position_txt" id="videoTextarea"
                                  onchange="setVideoIntroduce1()">${xzVideo.videoIntroduce}</textarea>
                    </label>
                    <label>
                        <span class="position_word">视频类别 ： </span>
                        <sf:select path="vclass" cssClass="position_input4">
                            <c:forEach var="c1" items="${xzVideoClassList}">
                                <sf:option value="${c1.vclassID}">${c1.className}</sf:option>
                            </c:forEach>
                        </sf:select>
                    </label>
                    <div style="margin-left: 100px">
                        <input id="submit_upload" type="submit" class="position_button btn btn-primary" value="保存"/>

                        <a href="javascript:history.go(-1)">
                            <button type="button" class="position_button btn btn-primary">取消</button>
                        </a></div>
                </sf:form>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>
<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>

<script type="text/javascript">
    //选择封面图片
    function preview(file) {
        document.getElementById("ptAddress").value = file.value;
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/videoPic/${xzVideo.videoPicture}"
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" width="300xp" height="170px"/>';
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    }
</script>

</body>
</html>
