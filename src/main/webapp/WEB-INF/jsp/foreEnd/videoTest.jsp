<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/20
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>capture screen</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        //       将本地视频地址 赋给video标签
        function preview() {
//            上传视频格式判定
            var ext, idx;
            var vSpan = document.getElementById('videoSpan');
            var imgName = document.getElementById('v_file').value;
            if (imgName == '') {
                document.getElementById('submit_upload').disabled = true;
                vSpan.innerHTML = "请选择需要上传的文件!";
                return;
            } else {
                idx = imgName.lastIndexOf(".");
                if (idx != -1) {
                    ext = imgName.substr(idx + 1).toUpperCase();
                    ext = ext.toLowerCase();
                    // alert("ext="+ext);
                    if (ext != 'webm') {
                        document.getElementById('submit_upload').disabled = true;
                        vSpan.innerHTML = "只能上传.webm类型的文件!";
                        return;
                    } else {
                        document.getElementById('submit_upload').disabled = false;
                    }
                } else {
                    document.getElementById('submit_upload').disabled = true;
                    vSpan.innerHTML = "只能上传.webm类型的文件!";
                    return;
                }
            }
            var file = document.getElementById('v_file').files[0];
            var url = URL.createObjectURL(file);
            console.log(url);
            document.getElementById("video").src = url;
        }


    </script>
    <%--设置输出框的DIV 大小--%>
    <style type="text/css">
        #output {
            width: 320px;
            height: 240px;
        }
    </style>

</head>
<body>

<div id="output"></div>
<sf:form action="${pageContext.request.contextPath}/XzVideo/uploadVideo.do" method="post"
         enctype="multipart/form-data" modelAttribute="xzVideo">
    <sf:hidden path="memberID"/>
    <sf:hidden path="memberName"/>
    <div class="content">
            <%--接收上传视频--%>
        <video id="video" controls autoplay hidden></video>
        <input id="v_file" name="videoFile" type="file" onChange="preview()"/>
        <input id="submit_upload" type="submit" class="load-btn" value="上传" disabled/>
        <br>
        <span id="videoSpan"></span>
        <br>
        <input type="hidden" id="videoPic" name="imageDataurl"/>
        <br>
        视频名称:<sf:input path="videoName"/>
        <sf:errors path="videoName"/>
        <br>
        视频介绍:<sf:input path="videoIntroduce"/>
        <sf:errors path="videoIntroduce"/>
        <br>
        视频类别:
        <sf:select path="vclass">
            <sf:option value="1">java</sf:option>
            <sf:option value="2">大前端</sf:option>
            <sf:option value="3">dba</sf:option>
            <sf:option value="4">移动端</sf:option>
        </sf:select>
    </div>
</sf:form>


<%--上传视频预览图JS--%>
<script type="text/javascript">
    (function () {
        var video, output;
        var scale = 0.8;
        var initialize = function () {
            output = document.getElementById("output");
            video = document.getElementById("video");
            video.addEventListener('loadeddata', captureImage);
        };
        var captureImage = function () {
            var canvas = document.createElement("canvas");
//            输出图片大小
            canvas.width = video.videoWidth * scale;
            canvas.height = video.videoHeight * scale;
            canvas.getContext('2d').drawImage(video, 0, 0, canvas.width, canvas.height);
            //            输出img标签大小
            output.innerHTML = '<img src=\'' + canvas.toDataURL(" ") + '\' width="320xp" height="240px"/>';
            var toDataURL = canvas.toDataURL("image/png");
            var imageDateB64 = toDataURL.substring(22);
            document.getElementById("videoPic").value = imageDateB64;
        };
        initialize();
    })();
</script>
</body>
</html>
