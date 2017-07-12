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
    <title>个人简历</title>
    <jsp:include page="cssJsHeader.jsp"/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>个人简历</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">个人简历</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="border: 1px solid #a9a9a9;padding: 0">


        <div class="user_title">
            <div class="col-md-2">
                <img src="${pageContext.request.contextPath}/dist/photo/${member.memberPicture}" alt=""
                     class="content_img">
            </div>

            <div class="user_t col-md-10">
                <div class="user_name1 col-md-12">${member.memberName}</div>
                <div class="user_o col-md-12">
                    <div class="col-md-4">
                        <span>
                            <c:if test="${member.memberSex=='1'}">男</c:if><c:if test="${member.memberSex=='2'}">女</c:if>
                        </span> | <span>${member.memberAge}岁</span>
                    </div>
                    <div class="col-md-4">
                        <c:if test="${resume.resumeState=='找工作'}">目前正在找工作</c:if>
                        <c:if test="${resume.resumeState=='跳槽'}">目前准备跳槽</c:if>
                    </div>
                    <div class="col-md-4">
                        工作经验：${resume.resumeYear}
                    </div>

                </div>
                <div class="user_o2 col-md-12">

                    <div class="col-md-4">
                        现居住地：<span>${member.memberAddress}</span>
                    </div>
                    <div class="col-md-4">
                        电话：<span>${member.memberPhone}</span>
                    </div>
                    <div class="col-md-4">
                        邮箱：<span>${member.memberEmail}</span>
                    </div>
                </div>
            </div>

        </div>

        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">求职意向：</h4>
                <div class="user_o2 col-md-12">
                    <div class="col-md-6" style="padding: 0">期望薪资： <span>${resume.resumeSalary}元/月</span></div>
                    <div class="col-md-6" style="padding: 0">地点：<span>${resume.resumePlace}</span></div>
                </div>
                <div class="user_o2 col-md-12">
                    <div class="col-md-6" style="padding: 0">行业：<span>${resume.resumeJob}</span></div>
                    <div class="col-md-6" style="padding: 0">工作类型：<span>${resume.resumeType}</span></div>
                </div>
                <div class="col-md-12 user_o2">自我评价：<span>${resume.resumeIntroduce}</span></div>
            </div>
            <div style="clear:both;"></div>
        </div>


        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">教育经历：</h4>
                <c:if test="${eduSize==0}">无教育经历</c:if>
                <c:forEach var="ed" items="${educationList}">
                    <div class="col-md-12 user_o2">
                        <div class="col-md-4" style="padding: 0">
                            <fmt:formatDate value="${ed.enrollmentDate}" type="both" pattern="yyyy.MM"/>
                            -<fmt:formatDate value="${ed.graduateDate}" type="both" pattern="yyyy.MM"/></div>
                        <div class="col-md-4" style="padding: 0">学校：<span>${ed.school}</span></div>
                        <div class="col-md-4" style="padding: 0">专业：<span>${ed.major}</span></div>
                    </div>
                    <div class="col-md-12 user_o2">
                        <div class="col-md-4" style="padding: 0">学历：<span>${ed.education}</span></div>
                    </div>
                    <div class="col-md-12 user_o2">
                        专业技能：<span>${ed.educationSkill}</span>
                    </div>
                </c:forEach>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">工作经验：</h4>
                <c:if test="${workESize==0}">无工作经验</c:if>
                <c:forEach var="ee" items="${workExperienceList}">
                    <div class="col-md-12 user_o2">
                        <div class="col-md-4" style="padding: 0">
                            <fmt:formatDate value="${ee.entryDate}" type="both" pattern="yyyy.MM"/>
                            -<fmt:formatDate value="${ee.dimissionDate}" type="both" pattern="yyyy.MM"/></div>
                        <div class="col-md-4" style="padding: 0">公司：<span>${ee.company}</span></div>
                        <div class="col-md-4" style="padding: 0">职位：<span>${ee.duty}</span></div>
                    </div>
                    <div class="col-md-12 user_o2" style="margin-bottom: 30px">
                        工作描述：<span>${ee.workDescription}</span>
                    </div>
                </c:forEach>
            </div>
            <div style="clear:both;"></div>
        </div>


        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">项目经验：</h4>
                <c:if test="${proExpSize==0}">无项目经验</c:if>
                <c:forEach var="peep" items="${projectExperienceList}">
                    <div class="col-md-12 user_o2">
                        <div class="col-md-4" style="padding: 0"><span>
                        <fmt:formatDate value="${peep.startDate}" type="both" pattern="yyyy.MM"/>
                        -<fmt:formatDate value="${peep.endDate}" type="both" pattern="yyyy.MM"/>
                    </span></div>
                        <div class="col-md-4" style="padding: 0">项目名称：<span>${peep.projectName}</span></div>
                    </div>
                    <div class="col-md-12 user_o2">项目描述：<span>${peep.projectDescribe}</span></div>
                    <div class="col-md-12 user_o2">工作内容：<span>${peep.jobDuties}</span></div>
                </c:forEach>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="user_center3">
            <div class="user_cc">
                <h4 class="center_h4">技能掌握：</h4>
                <c:forEach var="sk1" items="${xzSkillList}">
                    <div class="col-md-12 user_o2">
                        <div class="col-md-1">${sk1.skillName}:</div>
                        <div class="progress_bar col-md-8">
                            <div class="pro-bar">
                                <small class="progress_bar_title">
                                    <span class="progress_number1">${sk1.skillValue}%</span>
                                </small>
                                <span class="progress-bar-inner" style="background-color: #f1b458; width: ${sk1.skillValue}%;"
                                      data-value="${sk1.skillValue}"
                                      data-percentage-value="${sk1.skillValue}"></span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div style="clear:both;"></div>
        </div>


    </div>


</div>


<div class="footer2">
    <div class="container">
        <div class="copy">
            <p>&copy; 2017.先知蓝创<a target="_blank" href="#"></a></p>
        </div>
    </div>
</div>


</body>
</html>
