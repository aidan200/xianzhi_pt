<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>

</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>


<div class="resume_container">
    <div class="resume_all">
        <!--上面基本信息-->
        <div class="resume_top">
            <div class="resume_outimg">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="resume_head">
            </div>
            <div class="resume_right">
                <h3>${xzResume.resumeName}</h3>
                <div style="margin-top: 20px">
                    <span class="resume_outs">
                    目前公司: <span>${xzResume.resumeField}</span>
                    </span>
                    <span class="resume_outs">
                    所在地点: <span>${xzResume.resumeWorkspace}</span>
                    </span>
                </div>

                <div style="margin-top: 10px">
                    <span class="resume_outs">
                    目前职位: <span>${xzResume.resumePosition}</span>
                    </span>
                    <span class="resume_outs">
                    工作年限: <span>${xzResume.resumeIntentYm}</span>
                    </span>
                </div>
            </div>
        </div>

        <div class="resume_out1">
            <div style="position: relative">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/xun.png" alt="" class="resume_xun">
                <span class="resume_is">${xzResume.resumePosition}</span></div>
        </div>

        <div class="resume_center">
            <!--基本资料-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-user-circle-o"></span>基本资料</h4>
                    <div class="resume_two">
                        <div class="resume_every">
                            性&emsp;&emsp;别：<span>${xzResume.resumeSex eq 1?'女':''}${xzResume.resumeSex eq 0?'男':''}</span>
                        </div>
                        <div class="resume_every">
                            手&emsp;&emsp;机：<span>${xzResume.resumePhone}</span>
                        </div>
                        <div class="resume_every">
                            年&emsp;&emsp;龄：<span id="s1"><fmt:formatDate value="${xzResume.resumeBirth}"
                                                                         pattern="yyyy"/></span>
                        </div>
                        <div class="resume_every">
                            出生日期： <span>
                            <fmt:formatDate value="${xzResume.resumeBirth}" pattern="yyyy-MM-dd"/></span>
                        </div>
                        <div class="resume_every">
                            婚姻状况： <span>${xzResume.resumeMarriage eq 0?'已婚':''}${xzResume.resumeMarriage eq 1?'未婚':''}</span>
                        </div>
                        <div class="resume_every">
                            目前状态： <span>${xzResume.resumeState}</span>
                        </div>
                    </div>

                </div>
            </div>
            <div style="clear: both"></div>

            <!--职业意向-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-map-signs"></span>职业意向</h4>
                    <div class="resume_two">
                        <div class="resume_every">
                            期望行业：<span>
                            <c:forEach var="f1" items="${xzResume.fields}">
                                ${f1.fieldName}/
                            </c:forEach>
                        </span>
                        </div>
                        <div class="resume_every">
                            期望地点：<span>${xzResume.resumeIntentWorkspace}</span>
                        </div>
                    </div>

                    <div class="resume_two">
                        <div class="resume_every">
                            期望职位： <span>${xzResume.resumeIntentPosition}</span>
                        </div>
                        <div class="resume_every">
                            期望年薪： <span> ${fn:replace((xzResume.resumeIntentMm*12/10000),".0","")}万</span>
                        </div>

                    </div>
                </div>

            </div>
            <div style="clear: both"></div>

            <!--工作经历-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-calendar-minus-o"></span>工作经历</h4>
                    <b>
                        <c:forEach var="je" items="${xzResume.jobExps}">
                        <div class="resume_self">

                            <span style="padding-left: 20px"><fmt:formatDate value="${je.jobexpBeginTime}"
                                                                             pattern="yyyy-MM-dd"/></span>-<span
                                id="s2"><fmt:formatDate value="${je.jobexpEndTime}" pattern="yyyy-MM-dd"/></span>
                            <span style="padding-left: 20px">${je.jobexpCompanyName}</span>
                        </div>
                    </b>
                    <div class="resume_two">
                        <%--<div class="resume_every">--%>
                            <%--公司性质：<span>${je.jobexpCompanyType}</span>--%>
                        <%--</div>--%>
                        <div class="resume_every">
                            公司规模：<span>${je.jobexpSubordinate}人</span>
                        </div>
                        <div class="resume_every">
                            经营领域：<span>${je.jobexpField}</span>
                        </div>
                        <div class="resume_every">
                            工作职位：<span>${je.jobexpPostion}</span>
                        </div>
                        <%--<div class="resume_every">--%>
                            <%--薪酬状况：<span>${je.jobexpMm}</span>--%>
                        <%--</div>--%>
                        <div class="resume_every">
                            工作地点：<span>${je.jobexpWorkspace}</span>
                        </div>
                        <%--<div class="resume_every">--%>
                            <%--所在部门：<span>${je.jobexpDept}</span>--%>
                        <%--</div>--%>
                        <div class="resume_every3">
                            <span style="display: inline-block;float: left">职责业绩：${je.jobexpDuty}</span>
                            <span class="resume_many">hhahhahahahhahaha</span>
                        </div>
                    </div>
                    </c:forEach>

                </div>

            </div>

            <div style="clear: both"></div>

            <!--教育经历-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-graduation-cap"></span>教育经历</h4>
                    <c:forEach var="e1" items="${xzResume.xzResumeEducations}">
                        <div class="resume_two">
                            <div class="resume_every3">
                                <b><span>${e1.educationSchool}</span><span style="margin-left: 20px"><fmt:formatDate
                                        value="${e1.enrollmentDate}" pattern="yyyy-MM-dd"/>-<fmt:formatDate
                                        value="${e1.graduateDate}" pattern="yyyy-MM-dd"/></span></b>
                            </div>
                            <div class="resume_every2">
                                专业名称：<span>${e1.educationMajor}</span>
                            </div>
                            <div class="resume_every2">
                                学历：<span>${e1.educationLevel}</span>
                            </div>
                            <div class="resume_every2">
                                是否是统招：<span>${e1.educationEntrance eq 1?'统招':''}${e1.educationEntrance eq 0?'非统招':''}
                            </span>
                            </div>

                        </div>
                    </c:forEach>

                </div>

            </div>
            <div style="clear: both"></div>

            <!--项目经验-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-map-signs"></span>项目经验</h4>
                    <c:forEach var="e2" items="${xzResume.xzProjectExps}">
                        <div class="resume_two">
                            <div class="resume_every3">
                                项目名称：<span>${e2.proexpName}</span>
                            </div>
                            <div class="resume_every3">
                                <span style="display: inline-block;float: left">项目职务：</span>
                                <span class="resume_many">${e2.proexpPostion}</span>
                            </div>
                            <div class="resume_every3">
                                <span style="display: inline-block;float: left">项目职责：</span>
                                <span class="resume_many">${e2.proexpDuty}</span>
                            </div>
                            <div class="resume_every3">
                                <span style="display: inline-block;float: left">项目描述：</span>
                                <span class="resume_many">${e2.proexpDescribe}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <div style="clear: both"></div>

            <!--自我评价-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-pencil-square-o"></span>自我评价</h4>
                    <div class="resume_two">
                        ${xzResume.filed1}
                    </div>
                </div>
            </div>
            <div style="clear: both"></div>

            <!--附加信息-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-tags"></span>附加信息</h4>
                    <div class="resume_two">
                        ${xzResume.filed2}
                    </div>


                </div>

            </div>
            <div style="clear: both"></div>

            <!--擅长技能-->
            <div class="r_out" style="border-bottom:none">
                <div class="resume_more">
                    <h4><span class="fa fa-motorcycle"></span>擅长技能</h4>
                    <div class="resume_two">
                        <c:forEach var="s1" items="${xzResume.xzResumeSkills}">
                            <span class="res_sp">${s1.skillName}</span>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>

<jsp:include page="behindforeEnd.jsp"/>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>
<script>
    $(function () {
        var n = $("#s1").text();
        var date = new Date();
        var year = date.getYear();
        var c = parseInt(year) + 1900 - parseInt(n);
        $("#s1").text(c);
    });
    $(function () {
        var s = $("#s2").text();
        if (s == "" || s == null) {
            $("#s2").text("至今");
        }
    });

</script>
</body>
</html>