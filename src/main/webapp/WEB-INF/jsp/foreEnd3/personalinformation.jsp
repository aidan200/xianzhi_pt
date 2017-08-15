<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/11
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .readonly input{border:none}
    </style>
</head>
<body style="background-color: #f0f0f0">
<jsp:include page="headerforeEnd.jsp"/>
<div class="pef_all">
    <div class="pef_top">
        <span class="fa fa-user"></span> <span>个人信息</span>
    </div>
    <div class="pef_allin">
        <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/pink.png" alt="" class="pef_top">--%>
        <div class="pef_small">
            <div style="text-align: center">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/person.png" alt="" class="pef_text">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="pef_head">
            </div>
            <div class="pef_sec">
                <ul id="dvInput" class="readonly">
                    <li>姓&emsp;名：<input type="text" readonly value="郑秀妍" class="pef_input"/></li>
                    <li>性&emsp;别：<input type="text" readonly value="女"  class="pef_input"/></li>
                    <li>年&emsp;龄：<input type="text" readonly value="28" class="pef_input" /></li>
                    <li>生&emsp;日：<input type="text" readonly value="1989-04-18" class="pef_input" /></li>
                    <li>电&emsp;话：<input type="text" readonly value="1355576656754" class="pef_input" /></li>
                    <li>身份证：<input type="text" readonly value="242465474568776" class="pef_input" /></li>
                    <li>地&emsp;址：<input type="text" readonly value="而且为人发给我二个发生过法国诗人" class="pef_input" /></li>
                </ul>
                <input type="button" value="修改信息" onclick="btnClick(this)" id="btn0" class="pef_but"/>
            </div>
        </div>
    </div>
</div>

<jsp:include page="behindforeEnd.jsp"/>
<script>
    var btn0 = document.getElementById('btn0');
    function btnClick(btn0) {
        var toEdit = btn0.value == '修改信息';
        $('#dvInput')[toEdit ? 'removeClass' : 'addClass']('readonly').find(':input')
            .attr('readonly', toEdit ? false : true);
        btn0.value = toEdit ? '保存信息' : '修改信息';
        if (!toEdit) {//保存的ajax代码
        }
    }
</script>

</body>
</html>
