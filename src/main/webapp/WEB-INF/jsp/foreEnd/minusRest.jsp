<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>视频付费</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
    <script type="application/javascript">
        window.onload = function () {
            if('${msg}'=='会员过期'){
                alert("该视频为付费视频，您的会员已过期，请充值!");
            }
        }
    </script>
</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>视频付费</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">视频付费</li>
                <li>${msg}</li>
            </ul>
        </div>
    </div>
</div>

<div class="in_gray">
    <div style="width: 70%;margin: 0 auto">
        <div style="text-align: center;margin-top: 100px;margin-bottom: 100px">
            <h4 style="margin-top: 20px">观看该视频需付费 <span>${price}</span>元</h4>
            <h4 style="margin-top: 20px">您当前的账户余额为 <span>${rest}</span>元</h4>
            <hr>
            <h4 style="margin-top: 20px">您还不是会员，是否付费观看?</h4>
            <div style="margin-top: 20px">
                <a href="${pageContext.request.contextPath}/Vip/minusRest.do?rest=${rest}&videoPrice=${price}&videoId=${videoId}"><button class="pay_b1">付费观看</button></a>
                <a href="${pageContext.request.contextPath}/Vip/turnInsider.do"><button class="pay_b1">充值会员</button></a>
                <a href="${pageContext.request.contextPath}${url}"><button class="pay_b1">返回</button></a>
            </div>
        </div>
    </div>
</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>

</body>
</html>