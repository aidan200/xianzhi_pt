<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/10
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
    </style>
</head>
<body>

<div style='width: 100%;
            min-width: 1100px;
            height: auto;
            overflow: hidden'>
    <div style='width: 600px;
            margin: 40px auto;
            height: 480px;
            border: 3px dashed #3d9ccc;
    padding: 40px'>
        <img src='${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO12.png' style='width: 150px;
            height: 60px;
            margin-left: 30px;
            margin-top: 20px'>
        <div style='padding: 20px;
            width: 90%;
            height: auto;
            margin: 0 auto'>
            <h3 style='color: #3d9ccc;margin-bottom: 30px'><b>先知网用户 您好</b></h3>
            <div style='font-size: 17px;
            margin-top: 10px'>
                &emsp;&emsp;感谢您使用先知网，修改密码的验证码为
                <div style='color: #fc6866;font-size: 30px;text-align: center;margin-top: 10px'>20127</div>
            </div>



            <a style='width: 120px;
            height: 40px;
            margin-top: 30px;
            background-color: #FFA500;
            border: none;
            color: #FFFFff;
            outline: none;
            border-radius: 3px;
            display: block;
            font-size: 15px;
text-align: center;line-height: 40px;margin-left: 150px
' href='###'>密码找回</a>
            <div style='font-size: 12px;
            margin-top: 30px;color: rgba(175,175,175,0.91)'>&emsp;&emsp;点击按钮进行密码找回，此邮件由先知网系统发出，系统不接收回信，请勿直接回复。</div>

        </div>
    </div>

</div>

</body>
</html>