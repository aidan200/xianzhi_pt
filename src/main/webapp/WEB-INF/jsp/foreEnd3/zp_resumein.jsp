<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/7
  Time: 10:55
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
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>


<div class="rei_all">
    <div class="rei_center">


        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/tutu.png" alt="" class="rei_top">

        <div class="rei_very">
            <div class="rei_left">
                <div class="rei_headout">
                    <img src="${pageContext.request.contextPath}/uploadImg/${xzResume.resumeIntentField}" alt="" class="rei_head">
                    <h4>${xzResume.resumeName}</h4>
                </div>
                <div class="rei_leftop">
                    <div>性&emsp;&emsp;别：<span>${xzResume.resumeSex eq 0?'男':''}${xzResume.resumeSex eq 1?'女':''}</span></div>
                    <div>出生年份：<span><fmt:formatDate value="${xzResume.resumeBirth}" pattern="yyyy"/></span></div>
                    <div>婚姻状况：<span>${xzResume.resumeMarriage eq 0?'未婚':''}${xzResume.resumeMarriage eq 1?'已婚':''}${xzResume.resumeMarriage eq 2?'保密':''}</span></div>
                    <div>状&emsp;&emsp;态：<span>${xzResume.resumeState eq 0?'未工作':''}${xzResume.resumeState eq 1?'在职':''}${xzResume.resumeState eq 2?'离职':''}</span></div>
                    <div>手&emsp;&emsp;机：<span>${xzResume.resumePhone}</span></div>
                    <div>邮&emsp;&emsp;箱：<span>${xzResume.resumeEmail}</span></div>
                    <div>职位名称：<span>${xzResume.resumePosition}</span></div>
                    <div>当前城市：<span>${xzResume.resumeWorkspace}</span></div>
                    <div>工作年限：<span>${xzResume.resumeIntentYm}年</span></div>
                </div>

                <div class="rei_leftop" style="border-bottom: none">
                    <div style="margin-bottom: 10px">擅长技能：</div>
                    <c:forEach items="${xzResume.xzResumeSkills}" var="sk">
                    <span class="rei_ji">${sk.skillName}</span>
                    </c:forEach>

                </div>
            </div>


            <div class="rei_right">
                <div class="rei_topr">
                    <h4><span class="fa fa-map-signs rei_col"></span> 职业意向</h4>
                    <div>目前行业：<span>
                        <c:forEach items="${xzResume.fields}" var="fi" varStatus="stat1">
                           <c:if test="${fi.fieldType.equals('2')}">
                                ${fi.fieldName}&nbsp;&nbsp;
                           </c:if>
                        </c:forEach>
                    </span></div>
                    <div>期望行业：<span>
                         <c:forEach items="${xzResume.fields}" var="fi" varStatus="stat1">
                             <c:if test="${fi.fieldType.equals('3')}">
                                 ${fi.fieldName}&nbsp;&nbsp;
                             </c:if>
                         </c:forEach>
                    </span></div>

                    <div class="rei_two">期望地点：<span>${xzResume.resumeIntentWorkspace}</span></div>
                    <div class="rei_two2">期望职位：<span>${xzResume.resumeIntentPosition}</span></div>

                    <div class="rei_two">目前年薪：<span>${fn:replace((xzResume.resumeMm*12/10000),".0","")}万</span></div>
                    <div class="rei_two2">期望年薪：<span>${fn:replace((xzResume.resumeIntentMm*12/10000),".0","")}万</span></div>

                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-calendar-minus-o rei_col"></span> 工作经历</h4>
                    <c:forEach items="${xzResume.jobExps}" var="jo">
                    <div><span><fmt:formatDate value="${jo.jobexpBeginTime}" pattern="yyyy-MM-dd"/></span> 至
                        <span style="margin-right: 40px"><fmt:formatDate value="${jo.jobexpEndTime}" pattern="yyyy-MM-dd"/></span>
                        <span style="margin-right: 40px">${jo.jobexpWorkspace}</span>
                        <span>${jo.jobexpCompanyName}</span>
                    </div>
                    <div>公司领域：<span>
                        <c:forEach items="${jo.fields}" var="jf" varStatus="state">
                            <c:if test="${!state.last}">${jf.fieldName}/</c:if>
                            <c:if test="${state.last}">${jf.fieldName}</c:if>
                        </c:forEach>
                    </span></div>
                    <div class="rei_two">职位名称：<span>${jo.jobexpPostion}</span></div>
                    <div class="rei_two2">下属人数：<span>${jo.jobexpSubordinate}</span></div>
                    <div>职位业绩：<span></span></div>
                    </c:forEach>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-graduation-cap rei_col"></span> 教育经历</h4>
                    <c:forEach items="${xzResume.xzResumeEducations}" var="ed">
                    <div><span><fmt:formatDate value="${ed.enrollmentDate}" pattern="yyyy-MM-dd"/></span> 至
                        <span style="margin-right: 40px"><fmt:formatDate value="${ed.graduateDate}" pattern="yyyy-MM-dd"/></span>
                        <span>${ed.educationSchool}</span>
                    </div>
                    <div><span style="width: 32%;display: inline-block">专业：<span>${ed.educationMajor}</span></span>
                        <span style="width: 32%;display: inline-block">学历： <span>${ed.educationLevel}</span></span>
                        <span style="width: 32%;display: inline-block">${ed.educationEntrance eq 0?'非统招':''}${ed.educationEntrance eq 1?'统招':''}</span>
                    </div>
                    </c:forEach>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-navicon rei_col"></span> 项目经验</h4>
                    <c:forEach items="${xzResume.xzProjectExps}" var="pr">
                    <div>
                        <span><fmt:formatDate value="${pr.proexpBeginTime}" pattern="yyyy-MM-dd"/></span> 至
                        <span><fmt:formatDate value="${pr.proexpEndTime}" pattern="yyyy-MM-dd"/></span>
                        <span style="margin-left: 40px">${pr.proexpName}</span>
                    </div>
                    <div>项目职位：<span>${pr.proexpPostion}</span></div>
                    <div>项目描述：<br><span id="sp1">${pr.proexpDescribe}</span></div>
                        <input type="hidden" id="h1" value="${pr.proexpDescribe}">
                    <div>项目职责：<br><span id="sp2"></span></div>
                        <input type="hidden" id="h2" value="${pr.proexpDuty}">
                    </c:forEach>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-pencil-square-o rei_col"></span> 自我评价</h4>
                    <div><span id="sp3"></span></div>
                    <input id="h3" type="hidden" value="${xzResume.filed1}">
                </div>
                <div class="rei_topr" style="border-bottom: none">
                    <h4><span class="fa fa-tags rei_col"></span> 附加信息</h4>
                    <div><span id="sp4"></span></div>
                    <input type="hidden" id="h4" value="${xzResume.filed2}">
                </div>

            </div>
            <div style="clear: both"></div>
            <div class="rei_bottom">
                <form id="f1" action="${pageContext.request.contextPath}/ResumeCollect/insertSelective.do" style="display: inline-block">
                   <input type="hidden" name="resumeId" value="${xzResume.resumeId}">
                    <button class="rei_button">收藏简历</button>
                </form>
                <form id="f2" action="${pageContext.request.contextPath}/PostionSend/comInsert.do" style="display: inline-block">
                    <input type="hidden" name="resumeId" value="${xzResume.resumeId}">
                    <button class="rei_button">下载简历</button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="behindforeEnd.jsp"/>
<script>
    var content1 = $("#h1").val().replace(/\n/g, "<br>");
    $("#sp1").html(content1);
    var content2 = $("#h2").val().replace(/\n/g, "<br>");
    $("#sp2").html(content2);
    var content3 = $("#h3").val().replace(/\n/g, "<br>");
    $("#sp3").html(content3);
    var content4 = $("#h4").val().replace(/\n/g, "<br>");
    $("#sp4").html(content4);

</script>
</body>
</html>
