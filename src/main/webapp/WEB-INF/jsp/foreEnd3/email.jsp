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

<div class="ema_all">
    <div class="ema_in">
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="ema_img">
        <%--<hr class="ema_hr">--%>
        <div class="ema_center">
            <h3 style="color: #fc6866;margin-bottom: 30px"><b>亲爱的先知网用户 您好</b></h3>
            <div class="ema_d1">
                &emsp;&emsp;欢迎您成为先知网注册用户，为了您能随时接收与您匹配的高薪职位推荐，邀请您完成 邮箱验证。
            </div>
            <div class="ema_d1">
                &emsp;&emsp;同时，为了您能够快速收到企业HR和猎头顾问的精准职位邀请，让简历曝光机会提升68%，成功应聘率提升23%，我们强烈建议您完善简历。
            </div>

            <button class="ema_button">开启邮箱验证，走进先知世界</button>

        </div>
    </div>

</div>

</body>
</html>
