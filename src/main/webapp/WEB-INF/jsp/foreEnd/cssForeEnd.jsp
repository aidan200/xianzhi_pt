<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>先知平台</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd/js/bootstrap.min.js"></script>
    <!-- Custom Theme files -->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/style.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd/css/jquery.countdown.css"/>

    <!----font-Awesome----->
    <link href="${pageContext.request.contextPath}/dist/foreEnd/css/font-awesome.css" rel="stylesheet">
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
    </script>
</head>
<body>

</body>
</html>