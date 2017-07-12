<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/17
  Time: 14:41
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
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript">
        <%--声明一个dataForm对象--%>
        var formData = new FormData($("#attachment_uploads")[0]);
        <%--增加监听事件--%>
        function onprogress(evt) {
            // display uploading progress infomation...
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
        ;

        var xhr_provider = function () {
            var xhr = jQuery.ajaxSettings.xhr();
            if (onprogress && xhr.upload) {
                xhr.upload.addEventListener('progress', onprogress, false);
            }
            return xhr;
        };

        function doUpload() {
            UpladFile();
            $.ajax({
                url: '${pageContext.request.contextPath}/testFile/uploadTest',
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                processData: false,
                success: function (returndata) {
//                    alert(returndata);
                },
                error: function (returndata) {
//                    alert(returndata);
                }
            });
        }

        function CheckRequest() {
//        alert('已取消');
            document.getElementById("progressID").style.display = "none";
            xhr.abort();//中断请求
        }

        //        显示上传文件进度条
        function UpladFile() {
            var fileObj = document.getElementById("v_file").files[0]; // js 获取文件对象
            var FileController = ""; // 接收上传文件的后台地址

            // FormData 对象
            var form = new FormData();
            form.append("author", "hooyes"); // 可以增加表单数据
            form.append("v_file", fileObj); // 文件对象

            // XMLHttpRequest 对象
            var xhr = new XMLHttpRequest();
            xhr.open("post", FileController, true);
            xhr.onload = function () {
                // alert("上传完成!");
            };

            document.getElementById('progressInfo').style.display = "";
            xhr.upload.addEventListener("progress", progressFunction, false);

            xhr.send(form);
        }
        function clearProgressInfo() {
            document.getElementById('progressInfo').style.display = 'none';
            document.getElementById("progressBar").value = 0;
            document.getElementById("percentage").innerHTML = "";
        }
        function progressFunction(evt) {
            var progressBar = document.getElementById("progressBar");
            var percentageDiv = document.getElementById("percentage");
            if (evt.lengthComputable) {
                progressBar.max = evt.total;
                progressBar.value = evt.loaded;
                percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
            }
        }
    </script>
</head>
<body>
<form id="attachment_uploads" action="${pageContext.request.contextPath}/testFile/uploadTest"
      enctype="multipart/form-data" method="post">
    <p>指定文件名： <input type="text" name="filename" value=""/></p>
    <p>上传文件： <input id="v_file" type="file" name="file" /></p>
    <%--进度条--%>
    <span id="progressInfo" style="display:none;">
        <progress id="progressBar" value="0" max="100"></progress>
        <span id="percentage"></span>
    </span>
</form>
</body>
</html>
