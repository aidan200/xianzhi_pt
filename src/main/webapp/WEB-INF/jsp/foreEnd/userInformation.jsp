<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Learn Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
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
        window.onload = function () {

            var a = [];
            var b = [];
            <c:forEach var="skL1" items="${xzSkillList}">
            a.push(${skL1.skillID});
            b.push(${skL1.skillValue});
            </c:forEach>
            for (var i = 0; i < a.length; i++) {
                document.getElementById("bara" + a[i]).style.width = b[i] + "%";
                document.getElementById("btn5" + a[i]).style.left = b[i] + "%";
            }
        }
        function setSkill(id, value) {
//            document.getElementById("skillValueID"+id).value = value;
//            alert(id+"    "+ value);
            var skill = new Array();
            skill.push(id);
            skill.push(value);
            $.ajax({
                url: "${pageContext.request.contextPath}/skill/updateSkill.do",
                data: {setSkill: skill},
                dataType: "json",
                type: 'post',
                success: function (data) {
                    var orderInfo = data.returnSkill;
//                    alert(orderInfo);
                    if (orderInfo == "SUCCESS") {
                        console.log("修改成功");
                    } else {
                        console.log("修改失败");
                    }
                }
            })
        }
        function deleteSkill() {
            $("#addSkill").show();
            $("#newSkill").remove();
        }

        function submitSkillForm() {
            document.getElementById("newSkillForm").action = "${pageContext.request.contextPath}/skill/insertSkill.do";
//            alert(document.getElementById("newSkillForm").action);
            document.getElementById("newSkillForm").submit();
        }
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>用户信息</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="${pageContext.request.contextPath}/XzLogin/goIndex.do">首页</a></li>
                <li class="current-page">用户信息</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="border: 1px solid #a9a9a9;padding: 0">
        <div class="user_title">
            <div class="col-md-2">
                <img src="${pageContext.request.contextPath}/dist/photo/${xzMember.memberPicture}" alt=""
                     class="content_img"></div>

            <div class="user_t col-md-10">
                <div class="user_name1 col-md-12">${xzMember.memberName}</div>
                <div class="user_o col-md-12">
                    <div class="col-md-4">
                        <span>${xzMember.memberSex==1?'男':'女'}</span> | <span>${xzMember.memberAge}岁</span>
                    </div>
                    <div class="col-md-4">
                        学历：<span>${xzMember.memberEducation}</span>
                    </div>

                </div>
                <div class="user_o2 col-md-12">
                    <div class="col-md-4">
                        现居住地：<span>${xzMember.memberAddress}</span>
                    </div>
                    <div class="col-md-4">
                        电话：<span>${xzMember.memberPhone}</span>
                    </div>
                    <div class="col-md-4">
                        邮箱：<span>${xzMember.memberEmail}</span>
                    </div>
                </div>
            </div>
            <div class="revise"><a
                    href="${pageContext.request.contextPath}/UserInfo/goUpdateUserInfo.do?loginID=${xzMember.loginID}"
                    style="color: #FFFFFF">修改</a>
            </div>
        </div>

        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">求职意向：</h4>
                <div class="user_o2 col-md-12">
                    <div class="col-md-6" style="padding: 0">期望薪资： <span>${resumeUser.resumeSalary}元/月</span></div>
                    <div class="col-md-6" style="padding: 0">地点：<span>${resumeUser.resumePlace}</span></div>
                </div>
                <div class="user_o2 col-md-12">
                    <div class="col-md-6" style="padding: 0">行业：<span>${resumeUser.resumeJob}</span></div>
                    <div class="col-md-6" style="padding: 0">工作类型：<span>${resumeUser.resumeType}</span></div>
                </div>

                <div class="user_o2 col-md-12">
                    <div class="col-md-6" style="padding: 0">
                        <c:if test="${resumeUser.resumeState=='找工作'}">目前正在找工作</c:if>
                        <c:if test="${resumeUser.resumeState=='跳槽'}">目前准备跳槽</c:if>
                    </div>
                    <div class="col-md-6" style="padding: 0">
                        工作经验：${resumeUser.resumeYear}
                    </div>
                </div>

                <div class="col-md-12 user_o2">自我评价：<span>${resumeUser.resumeIntroduce}</span></div>
            </div>
            <div class="revise2"><a
                    href="${pageContext.request.contextPath}/Resume/goUpdateResume?resumeID=${resumeUser.resumeId}">修改</a>
            </div>
            <div style="clear:both;"></div>
        </div>

        <div class="user_center2">
            <div class="user_cc">
                <h4 class="center_h4">教育经历：</h4>
                <c:forEach var="t1" items="${edList}">
                    <div class="user_ca">
                        <div class="col-md-12 user_o2">
                            <div class="col-md-4" style="padding: 0">
                                <fmt:formatDate value="${t1.enrollmentDate}" type="both" pattern="yyyy.MM.dd"/>
                                -<fmt:formatDate value="${t1.graduateDate}" type="both" pattern="yyyy.MM.dd"/></div>
                            <div class="col-md-4" style="padding: 0">学校：<span>${t1.school}</span></div>
                            <div class="col-md-4" style="padding: 0">专业：<span>${t1.major}</span></div>
                        </div>
                        <div class="col-md-12 user_o2">
                            <div class="col-md-4" style="padding: 0">学历：<span>${t1.education}</span></div>
                        </div>
                        <div class="col-md-12 user_o2">
                            专业技能：<span>${t1.educationSkill}</span>
                        </div>
                        <div class="user_aaa">
                            <a href="${pageContext.request.contextPath}/Education/goUpdateEducation.do?educationID=${t1.educationID}"
                               class="user_co">修改</a>
                            <a href="${pageContext.request.contextPath}/Education/deleteEducation.do?edID=${t1.educationID}"
                               class="user_co2" onclick="return confirm('确定要删除吗？')">删除</a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <br/>
                    <br/>
                </c:forEach>
                <div class="revise2">
                    <a href="${pageContext.request.contextPath}/Education/goAddEducation.do">添加</a>
                </div>

            </div>
            <div style="clear:both;"></div>
        </div>


        <div class="user_center2">

            <div class="user_cc">
                <h4 class="center_h4">工作经验：</h4>
                <c:forEach var="t2" items="${wList}">
                    <div class="user_ca">
                        <div class="col-md-12 user_o2">
                            <div class="col-md-4" style="padding: 0">
                                <fmt:formatDate value="${t2.entryDate}" type="both" pattern="yyyy.MM"/>
                                -<fmt:formatDate value="${t2.dimissionDate}" type="both" pattern="yyyy.MM"/></div>
                            <div class="col-md-4" style="padding: 0">公司：<span>${t2.company}</span></div>
                            <div class="col-md-4" style="padding: 0">职位：<span>${t2.duty}</span></div>
                        </div>
                        <div class="col-md-12 user_o2" style="margin-bottom: 30px">
                            工作描述：<span>${t2.workDescription}</span>
                        </div>
                        <div class="user_aaa">
                            <a href="${pageContext.request.contextPath}/WorkE/goUpdateWorkE.do?workID=${t2.workExperienceID}"
                               class="user_co">修改</a>
                            <a href="${pageContext.request.contextPath}/WorkE/deleteWorkE.do?wID=${t2.workExperienceID}"
                               class="user_co2" onclick="return confirm('确定要删除吗？')">删除</a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </c:forEach>
            </div>

            <div class="revise2"><a href="${pageContext.request.contextPath}/WorkE/goAddWorkE.do">添加</a>
            </div>
            <div class="clearfix"></div>
        </div>


        <div class="user_center2">

            <div class="user_cc">
                <h4 class="center_h4">项目经验：</h4>
                <c:forEach var="peep" items="${pList}">
                    <div class="user_ca">
                        <div class="col-md-12 user_o2">
                            <div class="col-md-4" style="padding: 0"><span>
                        <fmt:formatDate value="${peep.startDate}" type="both" pattern="yyyy.MM"/>
                        -<fmt:formatDate value="${peep.endDate}" type="both" pattern="yyyy.MM"/>
                    </span></div>
                            <div class="col-md-4" style="padding: 0">项目名称：<span>${peep.projectName}</span></div>
                        </div>
                        <div class="col-md-12 user_o2">项目描述：<span>${peep.projectDescribe}</span></div>
                        <div class="col-md-12 user_o2">工作内容：<span>${peep.jobDuties}</span></div>
                        <div class="user_aaa">
                            <a href="${pageContext.request.contextPath}/ProjectE/goUpdateProjectE.do?projectID=${peep.projectID}"
                               class="user_co">修改</a>
                            <a href="${pageContext.request.contextPath}/ProjectE/deleteProjectE.do?pID=${peep.projectID}"
                               onclick="return confirm('确定要删除吗？')"
                               class="user_co2">删除</a>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                    <br/>
                    <br/>
                </c:forEach>
            </div>
            <div class="revise2">
                <a href="${pageContext.request.contextPath}/ProjectE/goAddProjectE.do">添加</a>
            </div>
            <div style="clear:both;"></div>

        </div>

        <%--新改的--%>
        <div class="user_center3">
            <div class="user_cc">
                <h4 class="center_h4">技能掌握：</h4>

                <div id="jin">
                    <c:forEach var="sk1" items="${xzSkillList}">
                        <div class="col-md-12 user_ca">
                            <div class="user_o2">
                                <sf:form action="${pageContext.request.contextPath}/skill/updateSkill.do">
                                    <input type="text" class="position_input2" style="width: 200px"
                                           placeholder="请填写技能" name="skillName" value="${sk1.skillName}" readonly/>
                                    <%--<input type="text" id="skillValueID${sk1.skillID}" name="skillValue"/>--%>
                                </sf:form>
                            </div>
                            <div class="col-md-12 user_o2">
                                <ul class="lanren">
                                    <li>
                                        <div class="scale_panel">
                                            <span class="r">100</span>0
                                            <span id="title${sk1.skillID}">${sk1.skillValue}%</span>
                                            <div class="scale" id="bar${sk1.skillID}" style="">
                                                <div id="bara${sk1.skillID}"></div>
                                                <span id="btn5${sk1.skillID}" style=""></span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>

                            <div class="user_aaa">
                                <a href="${pageContext.request.contextPath}/skill/deleteSkill.do?skillID=${sk1.skillID}"
                                   onclick="return confirm('确定要删除吗？')"
                                   class="user_co2">删除</a>
                            </div>
                        </div>
                        <div style="clear:both;"></div>


                        <input type="hidden" id="set${sk1.skillID}" value="1">
                        <script>
                            var i${sk1.skillValue} = 1;
                            var scale = function (btn, bar, title) {
                                this.btn = document.getElementById(btn);
                                this.bar = document.getElementById(bar);
                                this.title = document.getElementById(title);
                                this.step = this.bar.getElementsByTagName("div")[0];
                                this.init();
                            };
                            scale.prototype = {
                                init: function () {
                                    var f = this, g = document, b = window, m = Math;
                                    f.btn.onmousedown = function (e) {
                                        var x = (e || b.event).clientX;
                                        var l = this.offsetLeft;
                                        var max = f.bar.offsetWidth - this.offsetWidth;
                                        var ff;
                                        g.onmousemove = function (e) {
                                            var thisX = (e || b.event).clientX;
                                            var to = m.min(max, m.max(-2, l + (thisX - x)));
                                            f.btn.style.left = to + 'px';
                                            f.ondrag(m.round(m.max(0, to / max) * 100), to);
                                            b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                                            ff = m.round(m.max(0, to / max) * 100);
                                        };
                                        g.onmouseup = new Function('this.onmousemove=null');
                                        g.onmouseup = function () {
                                            this.onmousemove = null;
                                            setSkill(${sk1.skillID}, ff);
                                        }
                                    };
                                },
                                ondrag: function (pos, x) {
                                    this.step.style.width = Math.max(0, x) + 'px';
                                    this.title.innerHTML = pos + '%';
                                }

                            }
                            new scale('btn5${sk1.skillID}', 'bar${sk1.skillID}', 'title${sk1.skillID}');
                        </script>
                    </c:forEach></div>
            </div>
            <div class="revise2">
                <a id="addSkill" href="###" onclick='addElement()'>添加</a>
            </div>
            <div style="clear:both;"></div>
        </div>
        <%----%>


    </div>


</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="margin-top: 200px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    提示信息
                </h4>
            </div>
            <div class="modal-body">
                <span id="trackOrderSpan">个人信息尚不完整 , 请补全个人信息</span>
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
<c:if test="${jumpResumeInfo != null}">
    <script>
        $(function () {
            $('#myModal').modal({
                keyboard: true
            })
        });
    </script>
</c:if>


<jsp:include page="footerForeEnd.jsp"/>


<%--<script>--%>
<%--var i = 1;--%>
<%--function addElement(){--%>
<%--var div = document.createElement('div');--%>
<%--div.innerHTML = '';--%>
<%--div.id = 'Elem'+i;--%>
<%--document.getElementById('jin').appendChild(div);--%>
<%--i++;--%>
<%--}--%>
<%--</script>--%>
<script>
    var i = 1;
    function addElement() {
        $("#addSkill").hide();
        var div = document.createElement('div');
        div.innerHTML = '<div id="newSkill" class="col-md-12 user_ca">' +
            ' <div  class="user_o2"> ' +
            '<form id="newSkillForm" action="">' +
            '<input type="text" name="skillName" class="position_input2" style="width: 200px" placeholder="请填写技能"> ' +
            '<input id="newSkillHidden" name="skillValue" type="hidden"/>' +
            '</form> </div> <div class="col-md-12 user_o2"> <ul class="lanren"> <li>' +
            ' <div class="scale_panel"> <span class="r">100</span>0 <span id="title">0</span> ' +
            '<div class="scale" id="bar"> <div></div> <span id="btn5"></span> </div> </div> </li> ' +
            '</ul> </div> <div class="user_aaa"> <a onclick="submitSkillForm()" class="user_co">保存</a>' +
            ' <a onclick="deleteSkill()" class="user_co2">删除</a> </div> ' +
            '</div>';


        div.id = 'Elem' + i;
        document.getElementById('jin').appendChild(div);
        i++;

        var scale = function (btn, bar, title) {
            this.btn = document.getElementById(btn);
            this.bar = document.getElementById(bar);
            this.title = document.getElementById(title);
            this.step = this.bar.getElementsByTagName("div")[0];
            this.init();
        };
        scale.prototype = {
            init: function () {
                var f = this, g = document, b = window, m = Math;
                f.btn.onmousedown = function (e) {
                    var x = (e || b.event).clientX;
                    var l = this.offsetLeft;
                    var max = f.bar.offsetWidth - this.offsetWidth;
                    g.onmousemove = function (e) {
                        var thisX = (e || b.event).clientX;
                        var to = m.min(max, m.max(-2, l + (thisX - x)));
                        f.btn.style.left = to + 'px';
                        f.ondrag(m.round(m.max(0, to / max) * 100), to);
                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                    };
                    g.onmouseup = new Function('this.onmousemove=null');
                };
            },
            ondrag: function (pos, x) {
                this.step.style.width = Math.max(0, x) + 'px';
                this.title.innerHTML = pos + '%';
                document.getElementById("newSkillHidden").value = pos;
            }
        }
        new scale('btn5', 'bar', 'title');

    }


</script>


</body>
</html>
