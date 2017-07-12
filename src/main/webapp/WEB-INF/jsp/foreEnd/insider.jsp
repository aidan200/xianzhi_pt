<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>会员充值中心</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        window.onload = function () {
            if('${msg}'=='会员过期'){
                alert("您的会员已过期，请立即续费!")
            }
        }
    </script>
    <style>
        .readonly input {
            border: 1px solid #c6c6c6;
        }

    </style>
</head>
<body style="background-color: #eeeeee">

<jsp:include page="headerForeEnd.jsp"/>

<div class="courses_banner">
    <div class="container">
        <h3>会员充值中心</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">会员充值中心</li>
            </ul>
        </div>
    </div>
</div>
<div class="in_gray">
    <div class="in_white2">
        <div class="vip_nav">
            <ul class="col-md-2 col-xs-12 all_padding">
                <a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do" style="color: white"><li class="vip_li">个人中心</li></a>
                <a href="${pageContext.request.contextPath}/Vip/turnInsider.do" style="color: white"><li class="vip_li active">充值中心</li></a>
                <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do" style="color: white"><li class="vip_li">视频管理</li></a>
                <a href="###" style="color: white"><li class="vip_li">积分商城 </li></a>
            </ul>
        </div>


        <ul id="ins" class="col-md-10 col-xs-12">
            <li class="active col-md-3 in_money">
                <a href="#one" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥20</div>
                            <div class="in_right"><span> | </span> 一个月</div>

                        </div>
                    </div>
                    <div class="three"></div>
                    <h5>特惠</h5>
                </a>
            </li>
            <li class="col-md-3 in_money">
                <a href="#two" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥55</div>
                            <div class="in_right"> | 三个月</div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="col-md-3 in_money">
                <a href="#three" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥100</div>
                            <div class="in_right"> | 半年</div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="col-md-3 in_money">
                <a href="#four" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥180</div>
                            <div class="in_right"> | 一年</div>
                        </div>
                    </div>
                    <div class="three"></div>
                    <h5>特惠</h5>
                </a>
            </li>

        </ul>
        <div style="clear:both;"></div>


        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="one">
                <div class="one_top"><h4>应付总额：<span>20元</span>
                </h4></div>

                <div class="one_all">
                    <div class="one_center2">
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=0.01&body=会员充值0.01元">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                            <div class="payall" style="margin-top: 10px">
                                支付宝支付
                            </div></a>
                        </div>
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=20">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                            <div class="payall" style="margin-top: 10px">
                                微信支付
                            </div></a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div class="tab-pane fade" id="two">
                <div class="one_top"><h4>应付总额：<span>55元</span>
                </h4></div>

                <div class="one_all">
                    <div class="one_center2">
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=55&body=会员充值55元">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    支付宝支付
                                </div></a>
                        </div>
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=55">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    微信支付
                                </div></a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>

            </div>
            <div class="tab-pane fade" id="three">
                <div class="one_top"><h4>应付总额：<span>100元</span>
                </h4></div>

                <div class="one_all">
                    <div class="one_center2">
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=100&body=会员充值100元">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    支付宝支付
                                </div></a>
                        </div>
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=100">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    微信支付
                                </div></a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div class="tab-pane fade" id="four">
                <div class="one_top"><h4>应付总额：<span>180元</span>
                </h4></div>

                <div class="one_all">
                    <div class="one_center2">
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=180&body=会员充值180元">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    支付宝支付
                                </div></a>
                        </div>
                        <div class="one_center col-md-6 col-xs-6">
                            <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=180">
                                <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                <div class="payall" style="margin-top: 10px">
                                    微信支付
                                </div></a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </div>

    </div>
</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>


</body>
</html>