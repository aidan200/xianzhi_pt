<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/11
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="age" uri="/xianzhipt/ageTag" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/Time.css">
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .readonly input {
            border: none
        }
        .readonly select {
            border: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }
        button[disabled],
        html input[disabled] {
            cursor: default;
            background-color: #FFFFff;
        }
    </style>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jeDate.js"></script>
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
            <form id="memUp" action="${pageContext.request.contextPath}/Member/updateMemberInfo.do">
                <div style="text-align: center">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/person.png" alt="" class="pef_text">

                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="pef_head">
                </div>
                <div class="pef_sec">
                    <ul id="dvInput" class="readonly">
                        <input type="hidden" name="memberId" value="${member.memberId}"/>
                        <li>姓&emsp;名：<input type="text" name="memberName" readonly value="${member.memberName}" class="pef_input"/></li>
                        <li>性&emsp;别：<select class="pef_input" name="memberSex" disabled="true" id="selectid">
                                <option value="">男</option>
                                <option value="">女</option>
                            </select>
                            <%--<input type="text" name="memberSex" readonly value="${member.memberSex}" class="pef_input"/>--%>
                        </li>
                        <li>年&emsp;龄：<input type="text" name="memberAge" readonly value="<age:getAge year="${member.memberBirth.year+1900}"/>" class="pef_input"/></li>
                        <li>生&emsp;日：<input type="text" name="memberBirth" readonly value=" <fmt:formatDate value="${member.memberBirth}" pattern="yyyy-MM-dd"/>" class="pef_input" id="indate" disabled="disabled"/></li>
                        <li>电&emsp;话：<input type="text" name="memberPhone" readonly value="${member.memberPhone}" class="pef_input"/></li>
                        <li>身份证：<input type="text" name="memberIdcard" readonly value="${member.memberIdcard}" class="pef_input" id="idCard"/></li>
                        <li>地&emsp;址：<input type="text" name="memberAddress" readonly value="${member.memberAddress}" class="pef_input"/></li>
                    </ul>
                    <input type="button" value="修改信息" onclick="btnClick(this)" id="btn0" class="pef_but"/>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="behindforeEnd.jsp"/>
<script>
    //var btn0 = document.getElementById('btn0');
    function btnClick(btn0) {
        var toEdit = btn0.value == '修改信息';
        var ipus = $('#dvInput')[toEdit ? 'removeClass' : 'addClass']('readonly').find(':input');
        for(var i = 0;i<ipus.length;i++){
            console.log(ipus[i]);
            if($(ipus[i]).attr("type")=="text"){
                $(ipus[i]).attr('readonly', toEdit ? false : true);
            }
        }
        if(toEdit){
            $("#indate").attr("disabled",false);
            $('#selectid').attr('disabled',false);
        }else{
            //$("#indate").attr("disabled",true);
            console.log($("#indate").attr("disabled"));
            $('#memUp').submit();
        }

        btn0.value = toEdit ? '保存信息' : '修改信息';
        /*if (!toEdit) {//保存的ajax代码

            $('#selectid').attr('disabled',true)
            $('#indate').attr('disabled',true)

        }else{
            $('#selectid').attr('disabled',false)
            $('#indate').attr('disabled',false)
            console.log(2);

        }*/
    }

    $(function () {
        $('#idCard').on('blur',function () {
            var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            if(reg.test($('#idCard').val())==false) {
                alert("身份证输入不合法");
                return  false;
            }else {

            }
        })});

</script>
<script>
    jeDate({
        dateCell: "#indate",
        format: "YYYY-MM-DD",
        isTime: false, //isClear:false,
        minDate: "2000-01-01 00:00:00"
    })
</script>

</body>
</html>
