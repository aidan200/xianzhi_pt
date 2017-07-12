<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/17
  Time: 18:03
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
    <meta charset="utf-8">
    <title>进度条测试</title>
    <script type="application/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<form id="attachment_uploads" action="${pageContext.request.contextPath}/testFile/uploadTest"
      enctype="multipart/form-data" method="post">
    <input type="file" id="v_file"/>
    <span id="progressID" style="display: none">
        <div style="background:#e5f0de;width:200px;height:20px;margin-top:5px">
        <div id="progressNumber" style="background:#08f015;width:0px;height:20px">
        </div>
    </div>
    <font id="percent">0%</font>
    <input type="button" onclick="CheckRequest()" value="取消上传"/>
    </span>
    <br/>
    文件名 : <input id="fileNameID" type="text">


    <%--<span id="progressInfo" style="display:none;">--%>
    <%--<progress id="progressBar" value="0" max="100"></progress>--%>
    <%--<span id="percentage"></span>--%>
    <%--</span><br/>--%>
</form>

<%--<input type="file" id="file" name="myfile" onclick="clearProgressInfo()"/>--%>
<%--<span id="progressInfo" style="display:none;">--%>
<%--<progress id="progressBar" value="0" max="100"></progress>--%>
<%--<span id="percentage"></span>--%>
<%--</span><br/>--%>
<%--<input type="button" onclick="UpladFile()" value="上传" />--%>

</body>
<script>
    var file = null;
    $(function () {
        $("#v_file").change(function () {
            document.getElementById("progressID").style.display = "block";
            upload();
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

        //监听事件
        xhr.upload.addEventListener("progress", uploadProgress, false);

        //发送文件和表单自定义参数
        xhr.open("POST", "${pageContext.request.contextPath}/testFile/uploadTest", true);
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
//                alert(responseText);
                document.getElementById("fileNameID").value = responseText;
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
        if (percentComplete == 200) {
            document.getElementById("progressID").style.display = "none";
        }
        xhr.abort();//中断请求
    }
</script>
</html>
