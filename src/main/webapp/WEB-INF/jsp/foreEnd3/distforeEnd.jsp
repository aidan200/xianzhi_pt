<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/html5shiv/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/respond/respond.min.js"></script>

    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>

    <%--弹出框--%>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/tanthree.js"></script>

    <%--头像下拉--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('nav li').hover(function () {
                $(this).find('.head-menu').css('display', 'block');
            }, function () {
                $(this).find('.head-menu').css('display', 'none');
            });
        });
    </script>



</head>
<body>

</body>
</html>
