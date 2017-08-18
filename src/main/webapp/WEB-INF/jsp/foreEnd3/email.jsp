<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/7
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body>

<div style='width: 100%;
            min-width: 1100px;
            height: auto;
            overflow: hidden'>
    <div style='width: 600px;
            margin: 40px auto;
            height: 680px;
            border: 3px dashed #3d9ccc;
    padding: 40px'>
        <img src='${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO12.png' style='width: 150px;
            height: 60px;
            margin-left: 30px;
            margin-top: 30px'>
        <div style='padding: 20px;
            width: 90%;
            height: auto;
            margin: 0 auto'>
            <h3 style='color: #fc6866;margin-bottom: 30px'><b>亲爱的先知网用户 您好</b></h3>
            <div style='font-size: 17px;
            margin-top: 10px'>
                &emsp;&emsp;欢迎您成为先知网注册用户，为了您能随时接收与您匹配的高薪职位推荐，邀请您完成 邮箱验证。
            </div>
            <div style='font-size: 17px;
            margin-top: 10px'>
                &emsp;&emsp;同时，为了您能够快速收到企业HR和猎头顾问的精准职位邀请，让简历曝光机会提升68%，成功应聘率提升23%，我们强烈建议您完善简历。
            </div>

            <a style='width: 230px;
            height: 40px;
            margin-top: 30px;
            background-color: #FFA500;
            border: none;
            color: #FFFFff;
            outline: none;
            border-radius: 3px;
            display: block;
            font-size: 15px;
text-align: center;line-height: 40px' href='###'>开启邮箱验证，走进先知世界</a>

            <img src='${pageContext.request.contextPath}/dist/foreEnd3/img/celebrate.png' style='width: 200px;height: 130px;margin-top: 30px;float: right'>

        </div>
    </div>

</div>

</body>
</html>
