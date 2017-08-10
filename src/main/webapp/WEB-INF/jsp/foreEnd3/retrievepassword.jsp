<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/10
  Time: 19:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet"
          media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css"/>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/font-awesome.min.css" type="text/css" rel="stylesheet">
</head>
<body style="background-color: #FFFFff;">

<jsp:include page="headerforeEnd.jsp"/>
<!--上面的进度-->
<div id="stepBar" class="ui-stepBar-wrap">
    <div class="ui-stepBar">
        <div class="ui-stepProcess"></div>
    </div>
    <div class="ui-stepInfo-wrap">
        <table class="ui-stepLayout" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">1</a>
                    <p class="ui-stepName">输入邮箱</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">2</a>
                    <p class="ui-stepName">验证邮箱</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">3</a>
                    <p class="ui-stepName">修改密码</p>
                </td>
            </tr>
        </table>
    </div>
</div>


<%--1--%>
<div class="myTab" id="repall_1">
    <div class="rep_out">
        <form method="post">
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">输入邮箱发送验证码</div>
                    <div>
                        <span style="font-size: 16px">输入邮箱：</span><input type="text" class="rep_input">
                        <button class="rep_button">发 送</button>
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error"> <span class="fa fa-exclamation-circle">&nbsp;</span>邮箱输入不正确</div>
                    <button class="rep_next">到邮箱验证</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%--2--%>
<div class="myTab" id="repall_2">
    <div class="rep_out">
        <form method="post">
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">输入发送到邮箱的验证码</div>
                    <div>
                        <span style="font-size: 16px">输入验证码：</span><input type="text" class="rep_input">
                        <button class="rep_button">确 定</button>
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error"> <span class="fa fa-exclamation-circle">&nbsp;</span>验证码不正确</div>
                    <button class="rep_next">下一步</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%--3--%>
<div class="myTab" id="repall_3">
    <div class="rep_out">
        <form method="post">
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">新密码</div>
                    <div style="text-align: left;margin-left: 40px">
                        <span style="font-size: 16px">输入密码：</span><input type="password" class="rep_input2">
                    </div>
                    <div style="text-align: left;margin-left: 40px;margin-top: 10px">
                        <span style="font-size: 16px">确认密码：</span><input type="password" class="rep_input2">
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error2"> <span class="fa fa-exclamation-circle">&nbsp;</span>两次输入密码不一样</div>
                    <button class="rep_next2">确 定</button>
                </div>
            </div>
        </form>
    </div>
</div>


<!--进度-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>

<script type="text/javascript">
    $(function () {
        var state2 = 3;
        stepBar.init("stepBar", {
            step: state2,
            change: false,
            animation: false
        });
        $('.myTab').hide();
        $('#repall_' + state2).show();
        alert();
    });
</script>
</body>
</html>
