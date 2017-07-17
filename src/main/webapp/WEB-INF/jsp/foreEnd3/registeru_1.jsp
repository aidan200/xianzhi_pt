<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/14
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css" />
</head>
<body style="background-color: #e6e6e6">

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
                    <p class="ui-stepName">用户注册</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">3</a>
                    <p class="ui-stepName">邮箱验证</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">4</a>
                    <p class="ui-stepName">注册成功</p>
                </td>
            </tr>
        </table>
    </div>
</div>


<div class="register1_all">
    <form action="">
        <div class="register2_in">
            <div class="r2_left">
                <div class="r2_ne">
                    <div class="r2_every" style="margin-top: 100px">
                        <span>用 户 名&nbsp;</span>&emsp;<input type="text" class="r1_g">
                    </div>
                    <div class="r2_every">
                        <span>密&emsp;&emsp;码</span>&emsp;<input type="text" class="r1_g">
                    </div>
                    <div class="r2_every">
                        <span>确认密码</span>&emsp;<input type="text" class="r1_g">
                    </div>
                    <!--<div class="r2_every">-->
                    <!--<span>邮&emsp;&emsp;箱</span>&emsp;<input type="text" class="r2_g">-->
                    <!--</div>-->

                    <button class="r2_button">下一步</button>
                </div></div>
        </div>
        <div class="r2_bottom">
            <img src="img/hjhj.png" alt="">
            <div>
                <h4>先知承诺</h4>
                <p>个人资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
            </div>
        </div>

    </form>
</div>

<!--进度-->
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>
<script type="text/javascript">
    $(function(){

        stepBar.init("stepBar", {
            step : 1,
            change : false,
            animation : false
        });

    });
</script>
</body>
</html>