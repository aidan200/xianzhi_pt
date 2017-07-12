<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/6/28
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distFore.jsp"/>
</head>

<body style="background-color: #f8f8f8">
<div class="register_container">
    <div class="register_top">
        <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/xzgg2.png" alt="先知logo" class="register_logo">
        <!--<h2>先人一步知天下</h2>-->
    </div>
    <div class="register_bottom">
        <div>
            <img src="${pageContext.request.contextPath}/dist/foreEnd2/img/443.png" alt="" class="img-responsive register_img"></div>
        <div class="register_left">
            <form action="" class="register_form">
                <h2>欢迎注册先知账号</h2>
                <div class="col-3" style="margin-top: 20px">
                    <input class="effect-0" type="text" placeholder="用户名*">
                    <span class="focus-border">
		            	<i></i>
		            </span>
                </div>

                <div class="col-3" style="margin-top: 20px">
                    <input class="effect-0" type="text" placeholder="密码*">
                    <span class="focus-border">
		            	<i></i>
		            </span>
                </div>

                <div class="col-3" style="margin-top: 20px">
                    <input class="effect-0" type="text" placeholder="再次确认密码*">
                    <span class="focus-border">
		            	<i></i>
		            </span>
                </div>

                <div class="col-3" style="margin-top: 20px">
                    <input class="effect-0" type="text" placeholder="邮箱*">
                    <span class="focus-border">
		            	<i></i>
		            </span>
                </div>

                <!--错误信息-->
                <div class="register_err"><span class="fa fa-times">&nbsp;</span>错误信息</div>
                <button type="submit" class="register_button">注 册</button>
                <div class="register_a">已有账号 <a href="">登录</a></div>
            </form>
        </div>
    </div>
</div>


<!--<div class="login_center">-->
<!--<div class="login_white">-->
<!--&lt;!&ndash;左边&ndash;&gt;-->
<!--<div class="register_left">-->
<!--<div class="login_no">-->
<!--<form action="" class="login_form">-->
<!--<h4>密码登录</h4>-->
<!--<div class="col-3" style="margin-top: 20px">-->
<!--<input class="effect-0" type="text" placeholder="会员名/邮箱/手机号">-->
<!--<span class="focus-border">-->
<!--<i></i>-->
<!--</span>-->
<!--</div>-->

<!--<div class="col-3" style="margin-top: 30px">-->
<!--<input class="effect-0" type="text" placeholder="请输入密码">-->
<!--<span class="focus-border">-->
<!--<i></i>-->
<!--</span>-->
<!--</div>-->

<!--&lt;!&ndash;错误信息&ndash;&gt;-->
<!--<div class="login_err"><span class="fa fa-times"></span> 输入密码</div>-->
<!--<a href="" class="login_forget">忘记密码?</a>-->

<!--<span class="login_remember">-->
<!--<input type="checkbox" name="remember" value="true"> 记住我-->
<!--</span>-->

<!--<button type="submit" class="login_button">登 录</button>-->
<!--</form>-->
<!--</div>-->
<!--</div>-->


<!--</div>-->
<!--</div>-->

</body>
</html>