<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/1
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/third-party/template.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/Test/A" method="post">
    <textarea id="myEditor" name="gg" style="width: 600px;height: 400px">

    </textarea>
    <button type="submit">go</button>
</form>
<script type="text/javascript">
    var um = UM.getEditor('myEditor',{imagePath:'${pageContext.request.contextPath}/'});
    console.log(um.options.imagePath);
</script>
</body>
</html>
