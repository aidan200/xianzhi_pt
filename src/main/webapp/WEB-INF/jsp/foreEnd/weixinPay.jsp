<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/27
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>微信支付</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <!----font-Awesome----->
    <script type="application/javascript">
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });

        function jumpTrackOrder () {
            var out_trade_no = "${response.out_trade_no}";
            $.ajax({
                url: "${pageContext.request.contextPath}/weixin/trackOrder.do",
                data: {out_trade_no: out_trade_no},
                type: 'post',
                dataType: 'json',
                success: function (data) {
                    var orderInfo = data.trackOrder;
//                    alert(orderInfo);
                    var a = document.getElementById("trackOrderSpan");
                    if(orderInfo=="SUCCESS"){
//                        alert("支付成功! 页面即将跳转");
                        a.innerHTML = "支付成功! 页面即将跳转";
                        jump();
                    }else{
//                        alert("支付成功失败,请刷新二维码后重新扫描!");
                        a.innerHTML = "支付失败,请刷新二维码后重新扫描!";
                    }
                }
            })

        }
        function closeInfo () {
            var a = document.getElementById("trackOrderSpan");
            a.innerHTML = "正在查询订单信息,请稍后!";
        }
        function jump(){
            setTimeout("location.href='"+"${pageContext.request.contextPath}"+"/Vip/interceptVipEdit.do'",3000);
        }
    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
</head>
<body>

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>微信支付</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="/Vip/turnInsider.do">充值中心</a></li>
                <li class="current-page">微信支付</li>
            </ul>
        </div>
    </div>
</div>

<div class="in_gray">

    <div class="in_white">
        <div class="weixin_o" style="width: 100%;padding: 20px 30px 20px 30px">
            <div style="float: left">
                <span>订单编号：&emsp;</span><span>${response.out_trade_no}</span>
            </div>
            <div style="float: right">应付金额：￥<span>${response.total_fee}</span>元</div>
            <div style="clear: both"></div>
        </div>


        <div style="clear: both"></div>
        <div class="panel">
            <div class="panel-body">
                <ul class="nav nav-tabs" style="border-bottom: 1px solid #dddddd;
    width: 100%;">
                    <li class="active">
                        <a href="#edit" data-toggle="tab" style="padding: 10px 30px;border: 1px solid #dddddd ;
    border-bottom: 1px solid transparent;
    border-radius: 3px;">微信支付</a>
                    </li>
                </ul>

                <div class="tab-content" style="border-right: 1px solid #dddddd;
    border-left: 1px solid #dddddd;
    border-bottom: 1px solid #dddddd;
    border-radius: 3px;
    position: relative;
    top: -10px;">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd/images/WePayLogo.png" alt="微信大图标"
                         class="weixin_big">
                    <div class="weixin_out">
                        <button class="weixin_k" type="button"
                                onclick="location.href='${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=${response.total_fee}'">
                            <span class="fa fa-refresh fa-2x"></span>
                        </button>

                        <img src="${pageContext.request.contextPath}/dist/qrcode/${response.qrcodeName}"
                             class="weixin_two"/>
                    </div>
                    <div style="margin: 0 auto;width: 210px">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd/images/说明文字.png" alt=""
                             class="weixin_word">
                    </div>
                    <div style="text-align: center">
                        <button class="pay_b4" type="button" data-toggle="modal" data-target="#myModal" onclick="jumpTrackOrder()">支付成功点击这里</button>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 200px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    扫码支付信息
                </h4>
            </div>
            <div class="modal-body">
                <span id="trackOrderSpan"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeInfo()">关闭
                </button>
                <%--<button type="button" class="btn btn-primary">--%>
                    <%--提交更改--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<%--模态框 加载弹出--%>
<%--<script>--%>
    <%--$(function () { $('#myModal').modal({--%>
        <%--keyboard: true--%>
    <%--})});--%>
<%--</script>--%>
</body>
</html>
