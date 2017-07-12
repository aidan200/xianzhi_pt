<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>用户充值中心</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        window.onload = function () {
            if('${msg}'=='余额不足'){
                alert("该视频为付费视频，您的余额不足，请立即充值!");
            }
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
        <h3>用户充值中心</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">用户充值中心</li>
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
                            <div class="in_left">￥10</div>
                            <div class="in_right"><span> | </span> 充值</div>

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
                            <div class="in_left">￥30</div>
                            <div class="in_right"> | 充值</div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="col-md-3 in_money">
                <a href="#three" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥50</div>
                            <div class="in_right"> | 充值</div>
                        </div>
                    </div>
                </a>
            </li>
            <li class="col-md-3 in_money">
                <a href="#four" data-toggle="tab">
                    <div class="in_in">
                        <div class="in_in2">
                            <div class="in_left">￥100</div>
                            <div class="in_right"> | 充值</div>
                        </div>
                    </div>
                    <div class="three"></div>
                    <h5>特惠</h5>
                </a>
            </li>

        </ul>
        <div style="clear: both"></div>

        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="one">
                <div style="clear: both"></div>
                <div style="margin-top: 80px;text-align: center">
                    <h4>应付总额：<span>9元</span></h4>
                    <h4 style="margin-top: 20px">成为<a href="${pageContext.request.contextPath}/Vip/turnInsider.do">会员</a>可免费观看视频</h4>
                </div>
                <div class="normal_h4">
                    <div class="one_all">
                        <div class="one_center2">
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=0.01&body=会员充值0.01元">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        支付宝支付
                                    </div></a>
                            </div>
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=9">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        微信支付
                                    </div></a>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>

                    <a href="${pageContext.request.contextPath}/Vip/turnInsider.do"><button class="normal_b" style="margin: 10px">成为会员</button></a>
                    <a href="${pageContext.request.contextPath}${url}"><button class="pay_b1" style="margin: 10px">返回</button></a>
                </div>
            </div>

            <div class="tab-pane fade in" id="two">
                <div style="clear: both"></div>
                <div style="margin-top: 80px;text-align: center">
                    <h4>应付总额：<span>30元</span></h4>
                    <h4 style="margin-top: 20px">成为<a href="${pageContext.request.contextPath}/Vip/turnInsider.do">会员</a>可免费观看视频</h4>
                </div>
                <div class="normal_h4">
                    <div class="one_all">
                        <div class="one_center2">
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=30&body=会员充值30元">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        支付宝支付
                                    </div></a>
                            </div>
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=30">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        微信支付
                                    </div></a>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Vip/turnInsider.do"><button class="normal_b" style="margin: 10px">成为会员</button></a>
                    <a href="${pageContext.request.contextPath}${url}"><button class="pay_b1" style="margin: 10px">返回</button></a>
                </div>
            </div>

            <div class="tab-pane fade in" id="three">
                <div style="clear: both"></div>
                <div style="margin-top: 80px;text-align: center">
                    <h4>应付总额：<span>50元</span></h4>
                    <h4 style="margin-top: 20px">成为<a href="${pageContext.request.contextPath}/Vip/turnInsider.do">会员</a>可免费观看视频</h4>
                </div>
                <div class="normal_h4">
                    <div class="one_all">
                        <div class="one_center2">
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=50&body=会员充值50元">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        支付宝支付
                                    </div></a>
                            </div>
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=50">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        微信支付
                                    </div></a>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Vip/turnInsider.do"><button class="normal_b" style="margin: 10px">成为会员</button></a>
                    <a href="${pageContext.request.contextPath}${url}"><button class="pay_b1" style="margin: 10px">返回</button></a>
                </div>
            </div>

            <div class="tab-pane fade in" id="four">
                <div style="clear: both"></div>
                <div style="margin-top: 80px;text-align: center">
                    <h4>应付总额：<span>90元</span></h4>
                    <h4 style="margin-top: 20px">成为<a href="${pageContext.request.contextPath}/Vip/turnInsider.do">会员</a>可免费观看视频</h4>
                </div>
                <div class="normal_h4">
                    <div class="one_all">
                        <div class="one_center2">
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/AliPay/alipayMessage.do?subject=会员充值&total_amount=90&body=会员充值90元">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/zhi.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        支付宝支付
                                    </div></a>
                            </div>
                            <div class="one_center col-md-6 col-xs-12">
                                <a href="${pageContext.request.contextPath}/weixin/sentInfo.do?total_fee=90">
                                    <img class="one_img" src="${pageContext.request.contextPath}/dist/foreEnd/images/wei.png" alt="">
                                    <div class="payall" style="margin-top: 10px">
                                        微信支付
                                    </div></a>
                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <a href="${pageContext.request.contextPath}/Vip/turnInsider.do"><button class="normal_b" style="margin: 10px">成为会员</button></a>
                    <a href="${pageContext.request.contextPath}${url}"><button class="pay_b1" style="margin: 10px">返回</button></a>
                </div>
            </div>
        </div>

    </div>
</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>

</body>
</html>
