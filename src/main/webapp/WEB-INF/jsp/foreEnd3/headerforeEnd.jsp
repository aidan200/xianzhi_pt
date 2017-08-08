<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/3
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>nav</title>
</head>

<body>
<nav class="navbar navbar-bottom" role="navigation">

    <div id="two">
        <div>
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/LOGO1.png" alt="" class="alllogo">
            <ul class="nav nav_2">
                <li>
                    <a href="/" class="sim-button button01"><span data-hover="先知首页">&nbsp;先知首页&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span
                            data-hover="在线直播">&nbsp;在线直播&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="会员中心">&nbsp;会员中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="先知社区">&nbsp;先知社区&nbsp;</span></a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/zp_index" class="sim-button button01"><span
                            data-hover="招聘中心">&nbsp;招聘中心&nbsp;</span></a>
                </li>
                <li>
                    <a href="###" class="sim-button button01"><span data-hover="活动中心">&nbsp;活动中心&nbsp;</span></a>
                </li>
            </ul>
            <ul class="nav nav_1">
                <c:choose>
                    <c:when test="${userLogin!=undefined}">
                        <a href="" style="">
                            <li class="login1">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/hahaha.png" alt="" class="allheader">
                                <span style="width: 5px;height: 5px;background-color: red;display:inline-block;border-radius: 50px;position: absolute;top: 19px;left: 70px "></span>
                                <ul class="head-menu">
                                    <li class="head_new2">
                                        <span class="fa fa-user" style="color: #666;float: left;font-size: 16px;margin-right: 5px;line-height: 22px"></span>
                                        <span style="float: left"><a href="###" style="width: 80px;display: inline-block;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;line-height: 22px">郑秀妍</a></span>
                                        <span style="float: right"><a href="${pageContext.request.contextPath}/XzLogin/ExitUser.do">注销</a></span>
                                        <span style="float: right;margin-right: 5px"><a href="${pageContext.request.contextPath}/xzMsg/selMsgAll.do" class="fa fa-envelope" style="color: #fc6866"> (<span>10</span>)</a></span>
                                    </li>
                                    <li><span class="head_new"></span><a href="#">我的简历</a></li>
                                    <li><span class="head_new"></span><a href="#">查看职位信息</a></li>
                                    <li><span class="head_new"></span><a href="#">balabala</a></li>
                                </ul>
                            </li>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <li class="register1">
                            <a href="#0" class="allregister" style="margin-top: 13px"><span>注册</span></a>
                        </li>
                        <li class="login1">
                            <a href="${pageContext.request.contextPath}/view/foreEnd3/login.html"
                               style="margin-top: 13px"><span>登录</span></a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>


<div class="allpop" role="alert">
    <div class="all_container">
        <div class="index_tan">
            <a href="${pageContext.request.contextPath}/XzRegister/goRegister.do">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ren.png" alt="" class="re_im">
                <span class="head_span">用户注册</span>
            </a>
            <a href="${pageContext.request.contextPath}/XzRegister/goRegisterC.do">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/gong.png" alt="" class="re_im">
               <span class="head_span">企业注册</span>
            </a>
        </div>
        <a href="#0" class="all_close cmd_close"></a>
    </div>
</div>


<%--确定和取消--%>
<%--<a href="###" class="newtan"><span>点我</span></a>--%>
<div class="newpop" role="alert">
    <div class="newpop_container">
        <div class="allnew_tan">
            哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈
        </div>
        <div>
            <button class="bee_one">确定</button>
            <button class="all_close bee_two">取消</button>
        </div>
        <a href="###" class="all_close tan_close fa fa-remove"></a>
    </div>
</div>

</body>
<script>
    $(function () {
        if(${userLogin==null}){
            if(getCookie("count")!=null&&getCookie("pw")!=null){
                $.ajax({
                    url:'${pageContext.request.contextPath}/XzLogin/LoginCookie.do',
                    data:{username:getCookie("count"),password:getCookie("pw")},
                    success:function (data) {
                        if(data.msg=="ok"){
                            window.location.reload();
                        }
                    }
                });
            }
        }
    })
    function getCookie(name)
    {
        var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
        if(arr=document.cookie.match(reg))
            return arr[2];
        else
            return null;
    }
</script>
</html>
