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
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公司注册</title>
    <jsp:include page="distforeEnd.jsp"/>
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
                    <p class="ui-stepName">激活账号</p>
                </td>
                <td class="ui-stepInfo">
                    <a class="ui-stepSequence">3</a>
                    <p class="ui-stepName">完善企业信息</p>
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
        <sf:form class="login" id="signupForm" method="post"
            action="${pageContext.request.contextPath}/XzRegister/Register.do" modelAttribute="xzLogin" onsubmit="return goSubMit()">
            <div class="register2_in">
                <div class="r2_left">
                    <div class="r2_ne">
                        <sf:hidden path="loginType"/>
                        <div class="r2_every" style="margin-top: 100px">
                            <span>用 户 名&nbsp;</span>&emsp;<sf:input path="loginCount" type="text"  class="r1_g"
                                                                    onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')"/><span class="ru_s" style="font-size: 13px"><sf:errors path="loginCount"/></span>
                        </div>
                        <div class="r2_every">
                            <span>密&emsp;&emsp;码</span>&emsp;<sf:input id="password" path="loginPassword" type="password" class="r1_g"
                                                                       onKeyUp="value=value.replace(/[^\w\.\/]/ig,'')" onblur="validatePass()"/>
                            <span class="ru_s" style="font-size: 13px"><sf:errors path="loginPassword"/></span>
                        </div>
                        <div class="r2_every">
                            <span>确认密码</span>&emsp;<input id="password2" type="password" class="r1_g" onblur="validatePass()">
                            <span class="ru_s" style="font-size: 13px" id="password2f"></span>
                        </div>
                        <div class="r2_every">
                            <span>邮&emsp;&emsp;箱</span>&emsp; <sf:input id="email" path="loginEmail" type="text" class="r1_g"
                                                                        onKeyUp="value=value.replace(/(^\s*)|(\s*$)/g,'')"/>
                            <span class="ru_s"style="font-size: 13px"><sf:errors path="loginEmail"/></span>
                        </div>
                        <button class="r2_button" id="theFirstBtn">下一步</button>
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
        </sf:form>
    </div>
</div>

<div class="myTab" id="register_2">
    <div class="register1_all">

        <div class="regiater1_small">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/carh.gif" alt="" style="width: 300px;height: 300px;display: block;margin: 0 auto;margin-top: 30px;margin-bottom: 10px">
            ${msg} <br>
            <button onclick="remailgo()" class="reg_b">前往邮箱完成验证</button>
            <button onclick="remailgoReplay()" class="reg_b">重新发送验证邮件</button>
            <span id="mailReMsg" style="display: block"></span>
        </div>
    </div>
</div>

<div class="myTab" id="register_3">
    <div class="register1_all">
        <form action="${pageContext.request.contextPath}/XzRegister/addCompanyByReg.do" method="post" enctype="multipart/form-data">
            <div class="register2_in">
                <div class="r2_left">
                    <div class="r2_ne">
                        <div>
                            ${msg}
                        </div>
                        <input type="hidden" name="companyId" value="${userLogin.company.companyId}">
                        <div class="r2_every">
                            <span>公司名称</span>&emsp;<input type="text" name="companyName" placeholder="请填写公司营业执照上的公司名称全称" class="r2_g">
                        </div>
                        <div>
                            <span class="r3_span" style="">营业执照&nbsp;</span>&emsp;
                            <input type="file" name="file" class="nicefile" style="float: left"/>
                        </div>
                        <button class="r2_button" type="submit">提 交</button>
                        <button type="button" class="r2_button" onclick="toTag(4)">跳 过</button>
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
                <button>进入官网首页</button>
                <div class="reu_bo"><span id="test">5</span>秒后自动跳转</div>
                <span>${msg}</span>
            </div>

        </div>
    </div>
</div>



<!--进度-->
<%--<script type="text/javascript"--%>
        <%--src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        console.log('${msg}');
        var state = 1 ;
        if ('${state}') {
            console.log('${state}');
            state = '${state}';
        }
        toTag(state);
    });
    
    function toTag(state) {
        stepBar.init("stepBar", {
            step: state,
            change: false,
            animation: false

        });
        $('.myTab').hide();
        $('#register_' + state).show();
        if (state == '4') {
            var i = 4;
            setInterval(function () {
                if (i == 0) {
                    location.href = "${pageContext.request.contextPath}/";
                }
                document.getElementById("test").innerHTML = i--;

            }, 1200);
        }
    }
    
    function validatePass(b) {
        if($('#password2').val()!=""){
            if($('#password').val()!=$('#password2').val()){
                $('#password2f').html("密码不一致");
                if(b!=undefined){
                    return b;
                }
            }else{
                $('#password2f').html("");
                if(b!=undefined){
                    b = true;
                    return b;
                }
            }
        }else{
            $('#password2f').html("密码不能为空");
        }
        return b;
    }
    function goSubMit() {
        var b = false;
        //alert(validatePass(b));
        var rs = validatePass(b);
        if(rs){
            $('#theFirstBtn').attr("disabled",true);
        }
        return rs;
    }
    function remailgoReplay() {
        console.log('${xzLogin.loginId}');
        $.ajax({
            url:'${pageContext.request.contextPath}/XzRegister/mailgoReplay.do',
            type:'post',
            data:{loginId:'${xzLogin.loginId}',usertype:${xzLogin.loginType}},
            dataType:'json',
            success:function (data) {
                $('#mailReMsg').html(data.msg)
            }
        })
    }
    function remailgo() {
        var email = '${xzLogin.loginEmail}';
        var uurl = gotoEmail(email);
        if (uurl != "") {
            window.location.href = "http://"+uurl;
        } else {
            alert("抱歉!未找到对应的邮箱登录地址，请自己登录邮箱查看邮件！");
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
