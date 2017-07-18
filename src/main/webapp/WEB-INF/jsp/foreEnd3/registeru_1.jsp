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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet"
          media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>
    <script type="text/javascript">
        function buttonon() {
            var i = 2;
            setInterval(function () {
                if (i == 0) {
                    location.href = "index.html";
                }
                document.getElementById("test").innerHTML = i--;

            }, 800);
        }
        ;
    </script>
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
                    <a class="ui-stepSequence">2</a>
                    <p class="ui-stepName">邮箱验证</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">3</a>
                    <p class="ui-stepName">注册成功</p>
                </td>
            </tr>
        </table>
    </div>
</div>


<div id="myTabContent" class="tab-content">

    <div class="tab-pane fade in active" id="register_one">
        <div class="register1_all">
            <form action="">
                <div class="register2_in">
                    <div class="r2_left">
                        <div class="r2_ne">
                            <div class="r2_every" style="margin-top: 100px">
                                <span>用 户 名&nbsp;</span>&emsp;<input type="text" class="r1_g"><span class="ru_s"
                                                                                                    style="font-size: 13px">用户名不能为空</span>
                            </div>
                            <div class="r2_every">
                                <span>密&emsp;&emsp;码</span>&emsp;<input type="text" class="r1_g"><span class="ru_s"
                                                                                                       style="font-size: 13px">用户名不能为空</span>
                            </div>
                            <div class="r2_every">
                                <span>确认密码</span>&emsp;<input type="text" class="r1_g"><span class="ru_s"
                                                                                             style="font-size: 13px">用户名不能为空</span>
                            </div>
                            <div class="r2_every">
                                <span>邮&emsp;&emsp;箱</span>&emsp;<input type="text" class="r1_g"><span class="ru_s"
                                                                                                       style="font-size: 13px">用户名不能为空</span>
                            </div>
                            <a href="#register_two" data-toggle="tab">
                                <button class="r2_button">下一步</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="r2_bottom">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/hjhj.png" alt="">
                    <div>
                        <h4>先知承诺</h4>
                        <p>个人资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                    </div>
                </div>

            </form>
        </div>
    </div>

    <div class="tab-pane fade" id="register_two">
        <div class="register1_all">
            验证信息已经发送到你的邮箱
            <button>前往邮箱完成验证</button>
            <a href="#register_three" data-toggle="tab">
                <button onclick="buttonon()">下一步</button>
            </a>
        </div>
    </div>

    <div class="tab-pane fade" id="register_three">
        <div class="register1_all">
            <div class="reu_over">
                <div class="reu_b">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/success.png" alt="" class="reu_img3">
                    <span>注册成功</span>
                </div>
                <button>进入官网首页</button>
                <div class="reu_bo"><span id="test">3</span>秒后自动跳转</div>
            </div>

        </div>
    </div>

</div>

<!--进度-->


<script type="text/javascript">
    $(document).ready(function () {
        stepBar.init("stepBar", {
            step: 1,
            change: false,
            animation: false

        });
        $(".r2_button").click(function () {
            if ($("#register_two").is(':hidden'))
                stepBar.init("stepBar", {
                    step: 2,
                    change: false,
                    animation: false
                });
        });
        if ($("#register_three").css("display") == 'block') {
            stepBar.init("stepBar", {
                step: 3,
                change: false,
                animation: false
            });
        }
    });


</script>
<%--<script type="text/javascript">--%>
<%--$(document).ready(function () {--%>
<%--stepBar.init("stepBar", {--%>
<%--step: 1,--%>
<%--change: false,--%>
<%--animation: false--%>
<%--});--%>
<%--$(".r2_button").click(function () {--%>
<%--if($("#register_two").css("display")=='block'){--%>
<%--stepBar.init("stepBar", {--%>
<%--step: 2,--%>
<%--change: false,--%>
<%--animation: false--%>
<%--});--%>
<%--}--%>
<%--});--%>
<%--if( $("#register_three").css("display")=='block' ){--%>
<%--stepBar.init("stepBar", {--%>
<%--step: 3,--%>
<%--change: false,--%>
<%--animation: false--%>
<%--});--%>
<%--}--%>
<%--});--%>

<%--</script>--%>


</body>
</html>