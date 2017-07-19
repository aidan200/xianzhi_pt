<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/14
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公司注册</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet"
          media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css"/>
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
                    <p class="ui-stepName">公司注册</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">2</a>
                    <p class="ui-stepName">完善信息</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">3</a>
                    <p class="ui-stepName">企业认证</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">4</a>
                    <p class="ui-stepName">注册成功</p>
                </td>
            </tr>
        </table>
    </div>
</div>


<%--1--%>
<div class="myTab" id="register_1">
    <div class="register1_all">
        <form action="">
            <div class="register2_in">
                <div class="r2_left">
                    <div class="r2_ne">
                        <div class="r2_every" style="margin-top: 100px">
                            <span>用 户 名&nbsp;</span>&emsp;<input type="text" class="r1_g">
                        </div>
                        <div class="r2_every">
                            <span>密&emsp;&emsp;码</span>&emsp;<input type="password" class="r1_g">
                        </div>
                        <div class="r2_every">
                            <span>确认密码</span>&emsp;<input type="password" class="r1_g">
                        </div>
                        <!--<div class="r2_every">-->
                        <!--<span>邮&emsp;&emsp;箱</span>&emsp;<input type="text" class="r2_g">-->
                        <!--</div>-->

                        <button class="r2_button">下一步</button>
                    </div>
                </div>
            </div>
            <div class="r2_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bvbv.png" alt="">
                <div>
                    <h4>先知承诺</h4>
                    <p>企业资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="myTab" id="register_2">
    <div class="register1_all">
        <form action="">
            <div class="register2_in">
                <div class="r2_left" style="margin-top: 50px">
                    <div class="r2_ne">
                        <div class="r2_every">
                            <span>公司名称</span>&emsp;<input type="text" placeholder="请填写公司营业执照上的公司名称全称" class="r2_g">
                        </div>
                        <div class="r2_every">
                            <span>公司地址</span>&emsp;<input type="text" class="r2_g">
                        </div>
                        <div class="r2_every">
                            <span>公司电话</span>&emsp;<input type="text" class="r2_g">
                        </div>
                        <div class="r2_every">
                            <span style="float: left">公司简介</span>&emsp;<textarea class="r2_g2"></textarea>
                        </div>


                        <button class="r2_button">下一步</button>
                    </div>
                </div>
            </div>
            <div class="r2_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bvbv.png" alt="">
                <div>
                    <h4>先知承诺</h4>
                    <p>企业资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                </div>
            </div>

        </form>
    </div>
</div>
<div class="myTab" id="register_3">
    <div class="register1_all">
        <form action="">
            <div class="register2_in">
                <div class="r2_left">
                    <div class="r2_ne">
                        <div style="margin-top: 130px">
                            <span class="r3_span" style="">营业执照&nbsp;</span>&emsp;
                            <input type="file" class="nicefile" style="float: left"/>
                        </div>
                        <div class="r2_every" style="margin-left: 3px">
                            <span>邮&emsp;&emsp;箱</span>&emsp;<input type="text" class="r3_g">
                        </div>
                        <button class="r2_button">提 交</button>
                    </div>

                </div>
            </div>
            <div class="r2_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bvbv.png" alt="">
                <div>
                    <h4>先知承诺</h4>
                    <p>企业资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                </div>
            </div>

        </form>
    </div>
</div>
<div class="myTab" id="register_4">
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


<!--进度-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        console.log('${msg}');
        var state = 4;
        if ('${state}') {
            console.log('${state}');
            state = '${state}';
        }
        stepBar.init("stepBar", {
            step: state,
            change: false,
            animation: false

        });
        $('.myTab').hide();
        $('#register_' + state).show();
        if (state == '4') {
            var i = 2;
            setInterval(function () {
                if (i == 0) {
                    location.href = "${pageContext.request.contextPath}/";
                }
                document.getElementById("test").innerHTML = i--;

            }, 800);
        }
    });
</script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.nice-file-input.js"></script>
<script type="text/javascript">
    $('document').ready(function () {
        $(".nicefile").niceFileInput({
            'width': '390',
            'height': '35',
            'btnText': '浏 览',
            'btnWidth': '100',
            'margin': '20',
            'background-color': '#f8a91e'
        });

    });
</script>
</body>
</html>
