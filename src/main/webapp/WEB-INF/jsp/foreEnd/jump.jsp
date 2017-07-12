<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<head>
    <meta charset="UTF-8">
    <title>跳转页面</title>
    <jsp:include page="cssForeEnd.jsp"/>
    <script type="application/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-3.2.1.min.js"></script>
    <script type="application/javascript">
        var times=4;
        clock();
        function clock()
        {
            window.setTimeout('clock()',1000);
            times=times-1;
            time.innerHTML =times;
        }



    </script>
    <meta http-equiv= "Refresh" content= "3;url= ${jumpAddress}">
</head>
<body onload="startTime()">

<div class="theme-popover">

    <div class="topp">
        <span class="ex fa fa-exclamation"></span><p class="call">提示</p>
    </div>
    <span class="check fa fa-check fa-3x"></span>

    <div class="theme-popbod dform"><span id="jumpSpan">${jumpInfo}</span></div>
    <div class="small"><small><Span  id= "time"> 3 </Span>  三秒后自动跳转页面......</small></div>

</div>
<div class="theme-popover-mask"></div>

</body>
</html>
