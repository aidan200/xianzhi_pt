<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/8
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公司审核状态</title>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/lib/bootstrap/css/bootstrap.css" rel="stylesheet"
          media="screen">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/css测试.css" type="text/css"/>
    <link href="${pageContext.request.contextPath}/dist/foreEnd3/css/font-awesome.min.css" type="text/css" rel="stylesheet">
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="aud_all">
    <div class="aud1_all">
        <form>
            <div class="aud_in">
                <div class="aud_left" style="margin-top: 100px">
                    <div class="aud_ne">
                        <input type="hidden" name="companyId" value="">
                        <div class="aud_every">
                            <span>公司名称</span>&emsp;<input type="text" name="companyName" placeholder="请填写公司营业执照上的公司名称全称" class="aud_g">
                        </div>
                        <div style="position: relative">
                            <span class="aud_span" style="">营业执照&nbsp;</span>&emsp;
                            <input type="file" name="file" class="nicefile" style="float: left"/>
                            <span class="fa fa-envelope" style="position: absolute;right: -40px;top: 30px"></span>
                        </div>
                        <button class="aud_button" type="submit">提 交</button>
                    </div>

                </div>
            </div>
            <div class="aud_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bvbv.png" alt="">
                <div>
                    <h4>先知承诺</h4>
                    <p>企业资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                </div>
            </div>

        </form>
    </div>
</div>

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
