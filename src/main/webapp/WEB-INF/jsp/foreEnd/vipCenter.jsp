<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>会员中心</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <script type="application/javascript">
        window.onload = function () {
            if('${tip}'=='过期会员'){
                alert("您的会员已过期，请续费!");
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
        <h3>会员中心</h3>
        <p class="description">
        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page"><a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do">会员中心</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="in_gray">
    <div class="in_white2">
        <div>
            <div class="vip_nav">
                <ul class="col-md-2 col-xs-12 all_padding">
                    <a href="${pageContext.request.contextPath}/Vip/interceptVipEdit.do" style="color: white"><li class="vip_li active">个人中心</li></a>
                    <c:if test="${msg=='is vip'||msg=='outTime vip'}">
                        <a href="${pageContext.request.contextPath}/Vip/turnInsider.do" style="color: white"><li class="vip_li">充值中心</li></a>
                    </c:if>
                    <c:if test="${msg=='not vip'}">
                        <a href="${pageContext.request.contextPath}/Vip/turnUserInsider.do" style="color: white"><li class="vip_li">充值中心</li></a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/XzVideo/selectVideoManage.do" style="color: white"><li class="vip_li">视频管理</li></a>
                    <a href="" style="color: white"><li class="vip_li">积分商城 </li></a>
                </ul>
            </div>

            <div class="col-md-8 col-xs-12">
                <div class="vip_i">
                    <div class="vip_h">
                        <c:if test="${type == 'person'}">
                            <c:if test="${leaguer.memberPicture != null && leaguer.memberPicture != ''}">
                                <img class="vipimg" src="${pageContext.request.contextPath}/dist/photo/${leaguer.memberPicture}" alt="会员头像"></c:if>
                            <c:if test="${leaguer.memberPicture == null || leaguer.memberPicture == ''}">
                                <img class="vipimg" src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" alt="会员头像"></c:if>
                        </c:if>

                        <c:if test="${type == 'company'}">
                            <c:if test="${companyVip.companyPicture != null && companyVip.companyPicture != ''}">
                                <img class="vipimg" src="${pageContext.request.contextPath}/dist/photo/${companyVip.companyPicture}" alt="会员头像"></c:if>
                            <c:if test="${companyVip.companyPicture == null || companyVip.companyPicture == ''}">
                                <img class="vipimg" src="${pageContext.request.contextPath}/dist/foreEnd/images/timg1.jpg" alt="会员头像">
                            </c:if>
                        </c:if>

                        <img class="vipimg2" src="${pageContext.request.contextPath}/dist/foreEnd/images/vip.png" alt="会员皇冠">
                    </div>

                    <c:if test="${type=='person'}">
                    <div class="vip_name"><span>${leaguer.memberName}&ensp;
                        <c:if test="${leaguer.memberSex=='1'}">先生</c:if>
                        <c:if test="${leaguer.memberSex=='2'}">女士</c:if>
                    </span></div></c:if>
                    <c:if test="${type=='company'}">
                    <div class="vip_name"><span>${companyVip.companyName}&ensp;</span></div></c:if>
                </div>
                <div style="clear: both"></div>
            </div>
            <div style="clear: both"></div>
        </div>
        <div class="clearfix"></div>
        <div class="vip_time" style="margin-top: 50px">
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>我的积分
                        <c:if test="${msg == 'is vip' || msg == 'outTime vip' && type == 'person'}"><span>${leaguer.vipScore}</span></c:if>
                        <c:if test="${msg == 'is vip' || msg == 'outTime vip' && type == 'company'}"><span>${companyVip.vipScore}</span></c:if>
                    </h3>
                    <hr>
                   <h5>充值10元获得1积分 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即充值）</a></span></h5>
                </div>
            </div>
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>到期时间</h3>
                    <hr>
                    <c:if test="${msg == 'is vip'&& type == 'person'}">
                        <h5><fmt:formatDate value="${leaguer.expireTime}" type="both" pattern="yyyy年MM月dd日"/></h5>
                    </c:if>
                    <c:if test="${msg == 'is vip'&& type == 'company'}">
                        <h5><fmt:formatDate value="${companyVip.expireTime}" type="both" pattern="yyyy年MM月dd日"/></h5>
                    </c:if>
                    <c:if test="${msg == 'outTime vip'}">
                        <h5>您的会员已过期 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即续费）</a></span></h5>
                    </c:if>
                    <c:if test="${msg == 'not vip'}">
                        <h5>您还不是会员 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即充值）</a></span></h5>
                    </c:if>
                </div>
            </div>
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>累计消费</h3>
                    <hr>
                    <h5>${money}元</h5>
                </div>
            </div>
        </div>

        <div class="vip_time" style="margin-top: 40px">
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>我的等级
                        <span><c:if test="${msg == 'is vip' || msg == 'outTime vip' && type == 'person'}">${leaguer.vipLevel}</span></c:if>
                        <span><c:if test="${msg == 'is vip' || msg == 'outTime vip' && type == 'company'}">${companyVip.vipLevel}</span></c:if>
                    </h3>
                    <hr>
                    <h5>开通一年提高等级 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即充值）</a></span></h5>
                </div>
            </div>
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>我的余额
                        <c:if test="${type=='person'}"><span>${leaguer.vipRest}</span></c:if>
                        <c:if test="${type=='company'}"><span>${companyVip.vipRest}</span></c:if>
                    </h3>
                    <hr>
                    <c:if test="${msg == 'is vip'}">
                        <h5>续费会员 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即充值）</a></span></h5></c:if>
                    <c:if test="${msg == 'outTime vip'}">
                        <h5>您的会员已过期 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即续费）</a></span></h5>
                    </c:if>
                    <c:if test="${msg == 'not vip'}">
                        <h5>您还不是会员 <span><a href="${pageContext.request.contextPath}/Vip/turnInsider.do">（立即充值）</a></span></h5>
                    </c:if>
                </div>
            </div>
            <div class="vip_three col-md-4 col-xs-12">
                <div class="vip_in">
                    <h3>用户类型</h3>
                    <hr>
                    <c:if test="${userLogin.loginType == '1'}"><h5>个人用户</h5></c:if>
                    <c:if test="${userLogin.loginType == '2'}"><h5>企业用户</h5></c:if>
                </div>
            </div>
        </div>


        <div style="clear: both"></div>
    </div>
</div>


<!--footer-->
<jsp:include page="footerForeEnd.jsp"/>


</body>
</html>