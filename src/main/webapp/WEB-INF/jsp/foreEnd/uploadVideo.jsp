<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/9
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>上传视频</title>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
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
        });
        //       表单提交失败 重新将视频地址 赋给 video 标签
        window.onload = function () {
            var videoAddress1 = "${xzVideo.videoAddress}";
            if (videoAddress1 != null && videoAddress1 != "") {
                var videoUrl = "${pageContext.request.contextPath}/dist/video/${xzVideo.videoAddress}";
//                alert(videoUrl);
                console.log(videoUrl);
                document.getElementById("video").src = videoUrl;
                document.getElementById('submit_upload').disabled = false;
            }
        }
        //       将本地视频地址 赋给video标签
        function preview() {
//            上传视频格式判定
            var ext, idx;
            var vSpan = document.getElementById('videoSpan');
            var imgName = document.getElementById('v_file').value;
            if (imgName == '') {
                document.getElementById('submit_upload').disabled = true;
                document.getElementById("uploadSuccess").innerHTML = "";
                vSpan.innerHTML = "请选择需要上传的文件!";
                return false;
            } else {
                idx = imgName.lastIndexOf(".");
                if (idx != -1) {
                    ext = imgName.substr(idx + 1).toUpperCase();
                    ext = ext.toLowerCase();
                    // alert("ext="+ext);
                    if (ext != 'webm') {
                        document.getElementById('submit_upload').disabled = true;
                        document.getElementById("uploadSuccess").innerHTML = "";
                        vSpan.innerHTML = "只能上传.webm类型的文件!";
                        return false;
                    } else {
                        document.getElementById('submit_upload').disabled = false;
                        document.getElementById("uploadSuccess").innerHTML = "";
                        vSpan.innerHTML = "";
//                        将地址赋给 video标签
                        var file = document.getElementById('v_file').files[0];
                        var url = URL.createObjectURL(file);
                        console.log(url);
                        document.getElementById("video").src = url;
                        return true;
                    }
                } else {
                    document.getElementById('submit_upload').disabled = true;
                    document.getElementById("uploadSuccess").innerHTML = "";
                    vSpan.innerHTML = "只能上传.webm类型的文件!";
                    return false;
                }
            }

        }

        function setVideoIntroduce() {
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
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzVideo/goUploadVideo.do">上传视频</a></li>
                <li class="current-page"><a
                        href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do">上传管理</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="in_gray">

    <div class="in_white2">
        <div class="vip_nav">
            <ul class="col-md-2 col-xs-12" style="padding-right: 40px">
                <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do" class="view_w">
                    <li class="vip_li active">上传管理</li>
                </a>
                <a href="${pageContext.request.contextPath}/XzVideo/recordHistory.do" class="view_w">
                    <li class="vip_li">历史记录</li>
                </a>
                <a href="${pageContext.request.contextPath}/XzVideo/boughtRecord.do" class="view_w">
                    <li class="vip_li">已购视频</li>
                </a>

            </ul>

        </div>

        <div class="col-md-10 col-xs-12">

            <div class="video">
                <sf:form action="${pageContext.request.contextPath}/XzVideo/uploadVideo.do" class="position_form"
                         modelAttribute="xzVideo" enctype="multipart/form-data">
                    <sf:hidden path="loginID"/>
                    <sf:hidden path="memberName"/>
                    <sf:hidden path="videoID"/>
                    <label>
                            <%--视频标签 用来截取预览图--%>
                        <video id="video" controls hidden></video>
                        <span class="video_word" style="float: left">预览图 ：</span>
                        <div id="output" class="video_view"></div>
                            <%--<img src="" alt="视频预览图" style="width: 300px;height: 170px">--%>
                        <br/><br/>
                            <%--显示上传进度条--%>
                            <%--<span id="progressInfo" style="display:none;">--%>
                            <%--<progress id="progressBar" value="0" max="100"></progress>--%>
                            <%--<span id="percentage"></span>--%>
                            <%--</span>--%>

                        <span id="progressID" style="display: none">
                            <div style="background:#e5f0de;width:200px;height:20px;margin-top:5px">
                                <div id="progressNumber" style="background:#08f015;width:0px;height:20px">
                                 </div>
                            </div>
                            <font id="percent">0%</font>
                            <input type="button" onclick="CheckRequest()" value="取消上传"/>
                        </span>

                        <br/>
                        <sf:hidden id="fileNameID" path="videoAddress"/>

                        <span id="uploadSuccess"></span>

                        <span id="videoSpan"></span>
                            <%--预览图 字节流--%>
                        <input type="hidden" id="videoPic" name="imageDataurl"/>

                        <input id="v_file" type="file" name="videoFile" onChange="preview()"
                               class="video_ww"/>
                    </label>
                    <label>
                        <span class="position_word">视频名称 ： </span>
                        <sf:input path="videoName" autocomplete="off" cssClass="video_input2"/>
                        <sf:errors path="videoName"/>
                    </label>
                    <label>
                        <span class="position_word" style="float: left">视频介绍 ： </span>
                        <textarea id="videoTextarea" class="position_txt" style="width: 50%" onblur="setVideoIntroduce()">${xzVideo.videoIntroduce}</textarea>
                        <sf:hidden id="videoIntroduceID" path="videoIntroduce" autocomplete="off" />
                        <sf:errors path="videoIntroduce"/>
                    </label>
                    <label>
                        <span class="position_word">视频类别 ： </span>
                        <sf:select path="vclass" cssClass="video_input2">
                            <c:forEach var="c1" items="${xzVideoClassList}">
                                <sf:option value="${c1.vclassID}">${c1.className}</sf:option>
                            </c:forEach>
                        </sf:select>
                    </label>
                    <div style="margin-left: 80px">
                        <input id="submit_upload" type="submit" class="position_button btn btn-primary" value="上传"
                               disabled/>
                        <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do">
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
    var uploadFileName = null;
    var file = null;
    $(function () {
        $("#v_file").change(function () {
            if (preview()) {
                var uploadFileName1 = document.getElementById("v_file").value;
                //    判断上传文件是否为同一文件
                if (uploadFileName1 != uploadFileName) {
                    uploadFileName = uploadFileName1;
                    document.getElementById("progressID").style.display = "block";
                    upload();
                }
            }
        });
    });
    var input = document.getElementById("v_file");
    //文件域选择文件时, 执行readFile函数
    input.addEventListener('change', readFile, false);

    function readFile() {
        file = this.files[0];
    }
    //上传文件
    var xhr = new XMLHttpRequest();
    function upload() {

        var fd = new FormData();

        fd.append("fileName", file);
        fd.append("videoAddress","${xzVideo.videoAddress}");

        //监听事件
        xhr.upload.addEventListener("progress", uploadProgress, false);

        //发送文件和表单自定义参数
        xhr.open("POST", "${pageContext.request.contextPath}/XzVideo/upload", true);
        //发送请求
        xhr.send(fd);
        //回掉函数 (取得后台传递过来的值)
        xhr.onreadystatechange = callback;
    }
    function callback() {
        //判断对象交互完成
        if (xhr.status == 200) {
            if (xhr.readyState == 4) {
                //判断http交互是否成功
                //获取服务器的数据
                //获取XML包装的的数据
                var responseText = xhr.responseText;
                document.getElementById("fileNameID").value = responseText;
                document.getElementById("uploadSuccess").innerHTML = "完成";
                document.getElementById('submit_upload').disabled = false;
            }
        }
    }
    //    进度条
    function uploadProgress(evt) {
        if (evt.lengthComputable) {
            //evt.loaded：文件上传的大小 evt.total：文件总的大小
            var percentComplete = Math.round((evt.loaded) * 200 / evt.total);
            //加载进度条，同时显示信息
            $("#percent").html(percentComplete / 2 + '%')
            $("#progressNumber").css("width", "" + percentComplete + "px");
            if (percentComplete == 200) {
                document.getElementById("progressID").style.display = "none";
            }
        }
    }
    //    取消上传
    function CheckRequest() {
//        alert('已取消');
        document.getElementById("progressID").style.display = "none";
        xhr.abort();//中断请求
    }

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
            output.innerHTML = '<img src=\'' + canvas.toDataURL(" ") + '\' width="300xp" height="170px"/>';
            var toDataURL = canvas.toDataURL("image/png");
            var imageDateB64 = toDataURL.substring(22);
            document.getElementById("videoPic").value = imageDateB64;
        };
        initialize();
    })();
</script>

</body>
</html>