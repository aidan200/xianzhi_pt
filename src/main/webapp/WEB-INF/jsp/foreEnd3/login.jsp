<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/10
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/font-awesome.min.css" type="text/css" rel="stylesheet">
</head>
<body background="${pageContext.request.contextPath}/dist/foreEnd3/img/scsc.jpg" class="login_body">

<!--<img src="img/scsc.jpg" alt="" class="login_img">-->
<div class="login_img">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="login_logo">

    <div class="login_all">
        <form action="">
            <div class="login_in">
                <h2>欢迎登录先知账号</h2>
                <div class="login_input" style="margin-top: 30px">
                    <input class="effect-4" type="text" placeholder="会员名/邮箱">
                    <span class="focus-border"></span>
                </div>

                <div class="login_input" style="margin-top: 40px">
                    <input class="effect-4" type="password" placeholder="请输入密码">
                    <span class="focus-border"></span>
                </div>

                <div class="login_err"><span class="fa fa-exclamation-triangle">&nbsp;</span>错误信息</div>

                <div style="margin-top: 15px;">
                    <a class="login_forget" href="###">忘记密码?</a>
                    <span class="login_remember">
                        <input type="checkbox" name="remember" value="true"> 记住我
                    </span>

                </div>
                <button type="submit" class="login_button">登 录</button>
                <a href="###" class="login_re">没有账号？ 立即注册</a>
            </div>
        </form>
    </div>

</div>


</body>
</html>
