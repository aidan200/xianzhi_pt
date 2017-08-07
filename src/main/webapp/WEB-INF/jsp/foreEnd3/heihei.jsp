<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/7
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>


<div class="rei_all">
    <div class="rei_center">
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/tutu.png" alt="" class="rei_xaio">
        <div class="rei_top">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="rei_head">
            <h3>郑秀妍</h3>
        </div>
        <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/xiaoge.png" alt="" class="rei_xaio">--%>
        <div class="rei_section">
            <div class="rei_left">

                <div class="rei_left1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">基本资料：</div>
                    <div class="rei_l">目前职位：</div>
                    <div class="rei_l">工作年限：</div>
                    <div class="rei_l">所在地点：</div>
                    <div class="rei_l">年龄：</div>
                    <div class="rei_l">手机：</div>
                    <div class="rei_l">出生日期：</div>
                    <div class="rei_l">婚姻状态：</div>
                    <div class="rei_l">目前状态</div>
                </div>

                <div class="rei_left1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">教育经历：</div>
                    <div class="rei_l"> <span>2017-12-12</span>至<span>2015-07-23</span></div>
                    <div class="rei_l">东北大学：</div>
                    <div class="rei_l">专业：</div>
                    <div class="rei_l">学历：</div>
                    <div class="rei_l">非统招</div>
                </div>

                <div class="rei_left1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">项目经验：</div>
                    <div class="rei_l"> <span>2017-12-12</span>至<span>2015-07-23</span></div>
                    <div class="rei_l">项目名称：</div>
                    <div class="rei_l">项目职位：</div>
                    <div class="rei_l">项目描述：</div>
                    <div class="rei_l">项目职责：</div>
                </div>

                <div class="rei_left1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">附加信息：</div>
                </div>
            </div>


            <div class="rei_right">
                <div class="rei_right1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">目前行业：</div>
                    <div class="rei_l">期望行业：</div>
                    <div class="rei_l">期望地点：</div>
                    <div class="rei_l">期望职位：</div>
                    <div class="rei_l">目前薪资：</div>
                    <div class="rei_l">期望薪资：</div>
                </div>

                <div class="rei_right1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">工作经历：</div>
                    <div class="rei_l"> <span>2017-12-12</span>至<span>2015-07-23</span></div>
                    <div class="rei_l">先知蓝创</div>
                    <div class="rei_l">公司领域：</div>
                    <div class="rei_l">职位名称：</div>
                    <div class="rei_l">下属人数：</div>
                    <div class="rei_l">职位业绩：</div>
                </div>

                <div class="rei_right1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">自我评价：</div>
                </div>

                <div class="rei_right1">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/img/biaoqian.png" alt="" class="rei_one">
                    <div class="rei_l">擅长技能：</div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>