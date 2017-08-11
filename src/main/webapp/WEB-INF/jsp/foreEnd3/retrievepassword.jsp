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
    <style>
        .ddds{
            background-color: #d9d3d4;
        }
    </style>
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
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">输入邮箱发送验证码</div>
                    <div>
                        <span style="font-size: 16px">输入邮箱：</span><input type="text" id="email1" onblur="validateEmail()" class="rep_input">
                        <button class="rep_button"  id="emailGo" onclick="sendMail()" >发 送</button>
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error" id="emailMsg1Box" style="display: none"> <span class="fa fa-exclamation-circle">&nbsp;</span><span id="emailMsg1" >邮箱输入不正确</span></div>
                    <button class="rep_next ddds" id="toEmail" onclick="remailgo()" disabled >到邮箱验证</button>
                </div>
            </div>
    </div>
</div>

<%--2--%>
<div class="myTab" id="repall_2">
    <div class="rep_out">
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">输入发送到邮箱的验证码</div>
                    <div>
                        <span style="font-size: 16px">输入验证码：</span><input id="valiKey" type="text" class="rep_input">
                        <%--<button class="rep_button">确 定</button>--%>
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error" id="emailMsg2Box" style="display: none"> <span class="fa fa-exclamation-circle">&nbsp;</span><span id="emailMsg2">验证码不正确</span></div>
                    <button class="rep_next" onclick="validateKey()">下一步</button>
                </div>
            </div>
    </div>
</div>

<%--3--%>
<div class="myTab" id="repall_3">
    <div class="rep_out">
            <div class="rep_bgimg">
                <div class="rep_bgin">
                    <div class="rep_text">新密码</div>
                    <div style="text-align: left;margin-left: 40px">
                        <span style="font-size: 16px">输入密码：</span><input id="password1" type="password" class="rep_input2">
                    </div>
                    <div style="text-align: left;margin-left: 40px;margin-top: 10px">
                        <span style="font-size: 16px">确认密码：</span><input id="password2" type="password" class="rep_input2">
                    </div>

                    <%--错误信息--%>
                    <div class="rep_error2" id="emailMsg3Box" style="display: none"> <span class="fa fa-exclamation-circle">&nbsp;</span><span id="emailMsg3">两次输入密码不一样</span></div>
                    <button class="rep_next2" onclick="updatePwd(this)">确 定</button>
                </div>
            </div>
    </div>
</div>


<!--进度-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/stepBar.js"></script>

<script type="text/javascript">
    $(function () {
        var state2 = 1;
        if('${param.type}'!=''){
            state2 = "${param.type}";
        }
        stepBar.init("stepBar", {
            step: state2,
            change: false,
            animation: false
        });
        $('.myTab').hide();
        $('#repall_' + state2).show();
    });
    function updatePwd(btn) {
        var p1 = $('#password1').val();
        var p2 = $('#password2').val();
        console.log(p1);
        console.log(p2);
        if(p1==""||p2==""){
            $("#emailMsg3Box").show();
            $("#emailMsg3").text("密码不能为空");
        }else if(p1.length<6||p1.length>18){
            $("#emailMsg3Box").show();
            $("#emailMsg3").text("长度必须在6到18字符之间");
        }else if(p1!=p2){
            $("#emailMsg3Box").show();
            $("#emailMsg3").text("密码不一致");
        }else{
            $(btn).addClass("ddds");
            $(btn).attr("disabled",true);
            $.ajax({
                url:'${pageContext.request.contextPath}/XzRegister/findBack3.do',
                data:{key:$("#valiKey").val(),email:'${param.email}',password:p2},
                success:function (data) {
                    if(data.msg=="ok"){
                        alert(1);
                    }else{
                        alert(2);
                    }
                }
            });
        }
    }
    function validateKey() {
        var key = $("#valiKey").val();
        if(key==""){
            $("#emailMsg2Box").show();
            $("#emailMsg2").text("验证码不能为空");
        }else {
            $.ajax({
                url:'${pageContext.request.contextPath}/XzRegister/findBack2.do',
                data:{key:key,email:'${param.email}'},
                success:function (data) {
                    if(data.msg=="ok"){
                        var state2 = 3;
                        stepBar.init("stepBar", {
                            step: state2,
                            change: false,
                            animation: false
                        });
                        $('.myTab').hide();
                        $('#repall_' + state2).show();
                    }else{
                        $("#emailMsg2Box").show();
                        $("#emailMsg2").text("验证码错误");
                    }
                }
            });
        }
    }
    var isOK = false;
    function validateEmail() {
        var email = $('#email1').val();
        var reg = /^[\w,\.,-]*@[0-9A-Za-z]{1,20}((\.com)|(\.net)|(\.com.cn)){1}$/;
        var b = reg.test(email);
        if(b){
            $.ajax({
                url:'${pageContext.request.contextPath}/XzRegister/selByEmail.do',
                data:{email:email},
                success:function (data) {
                    if(data.msg=="ok"){
                        isOK = true;
                    }else{
                        $('#emailMsg1Box').show();
                        $('#emailMsg1').text("邮箱不存在");
                    }
                }
            });
        }else{
            $('#emailMsg1Box').show();
            $('#emailMsg1').text("邮箱格式不正确");
        }
    }
    function sendMail() {
        validateEmail();
        $('#emailGo').attr("disabled",true);
        $("#emailGo").addClass("ddds");
        var email = $('#email1').val();
        if(isOK){
            $("#toEmail").val("邮件发送中...");
            $.ajax({
                url:'${pageContext.request.contextPath}/XzRegister/findBack1.do',
                data:{email:email},
                success:function (data) {
                    if(data.msg=="ok"){
                        $("#toEmail").val("到邮箱验证");
                        $("#toEmail").attr("disabled",false);
                        $("#toEmail").removeClass("ddds");
                    }else{
                        $("#toEmail").val("邮件发送失败");
                    }
                }
            });
        }
    }
    
    function remailgo() {
        var email = $('#email1').val();
        var uurl = gotoEmail(email);
        if (uurl != "") {
            window.open("http://"+uurl, "_blank");
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
</body>
</html>
