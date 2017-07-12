<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html lang="en">
<head>
    <meta charset="UTF-8">
    <title>跳转邮箱</title>
    <jsp:include page="cssForeEnd.jsp"/>
    <script type="application/javascript" src="${pageContext.request.contextPath}/dist/js/jquery-3.1.1.min.js"></script>
    <script type="application/javascript">
        function email() {
            var uurl = "${goEmail}";
            uurl = gotoEmail(uurl);
            if (uurl != "") {
                window.location.href = "http://"+uurl;
            } else {
                alert("抱歉!未找到对应的邮箱登录地址，请自己登录邮箱查看邮件！");
                window.location.href = "${pageContext.request.contextPath}/";
            }
        }
        //功能：根据用户输入的Email跳转到相应的电子邮箱首页
        function gotoEmail($mail) {
             $t = $mail.split('@')[1];
            $t = $t.toLowerCase();
            if ($t == '163.com') {
                return 'mail.163.com';
            } else if ($t == 'vip.163.com') {
                return 'vip.163.com';
            } else if ($t == '126.com') {
                return 'mail.126.com';
            } else if ($t == 'qq.com' || $t == 'vip.qq.com' || $t == 'foxmail.com') {
                return 'mail.qq.com';
            } else if ($t == 'gmail.com') {
                return 'mail.google.com';
            } else if ($t == 'sohu.com') {
                return 'mail.sohu.com';
            } else if ($t == 'tom.com') {
                return 'mail.tom.com';
            } else if ($t == 'vip.sina.com') {
                return 'vip.sina.com';
            } else if ($t == 'sina.com.cn' || $t == 'sina.com') {
                return 'mail.sina.com.cn';
            } else if ($t == 'tom.com') {
                return 'mail.tom.com';
            } else if ($t == 'yahoo.com.cn' || $t == 'yahoo.cn') {
                return 'mail.cn.yahoo.com';
            } else if ($t == 'tom.com') {
                return 'mail.tom.com';
            } else if ($t == 'yeah.net') {
                return 'www.yeah.net';
            } else if ($t == '21cn.com') {
                return 'mail.21cn.com';
            } else if ($t == 'hotmail.com') {
                return 'www.hotmail.com';
            } else if ($t == 'sogou.com') {
                return 'mail.sogou.com';
            } else if ($t == '188.com') {
                return 'www.188.com';
            } else if ($t == '139.com') {
                return 'mail.10086.cn';
            } else if ($t == '189.cn') {
                return 'webmail15.189.cn/webmail';
            } else if ($t == 'wo.com.cn') {
                return 'mail.wo.com.cn/smsmail';
            } else if ($t == '139.com') {
                return 'mail.10086.cn';
            } else {
                return '';
            }
        };

    </script>

</head>
<body >
<input id="email" type="hidden" value="${goEmail}"/>

<div class="theme-popover">

    <div class="topp">
        <span class="ex fa fa-exclamation"></span><p class="call">提示</p>
    </div>
    <span class="check fa fa-check fa-3x"></span>

    <div class="theme-popbod dform"><span id="jumpSpan">${jumpInfo}</span></div>
    <div class="small"><a href="javascript:email()"><small>点击此处跳转到邮箱登录页面</small></a></div>

</div>
<div class="theme-popover-mask"></div>

</body>
</html>
