<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>新增技能</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <jsp:include page="cssForeEnd.jsp"/>
    <script>
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
            var skID = "${xzSKill.skillID}";
            var saveForm = document.getElementById("skillForm");
            if (skID != 0) {
                saveForm.action = "${pageContext.request.contextPath}/skill/updateSkill.do";
            }
            //固定进度条
            var maxBar =document.getElementById("bar");
            var a = ${xzSKill.skillValue};
            var barPX = maxBar.offsetWidth*a/100;
            document.getElementById("bar01").style.width = barPX+"px";
            document.getElementById("btn5").style.left = barPX+"px";

        });
    </script>
</head>
<body>
<jsp:include page="headerForeEnd.jsp"/>
<!-- banner -->
<div class="courses_banner">
    <div class="container">
        <h3>技能掌握</h3>
        <p class="description">

        </p>
        <div class="breadcrumb1">
            <ul>
                <li class="icon6"><a href="index.html">首页</a></li>
                <li class="current-page">技能掌握</li>
            </ul>
        </div>
    </div>
</div>
<!-- //banner -->
<div class="courses_box1">
    <div class="container" style="width:80%">

        <div class="company_position">

            <sf:form id="skillForm" action="${pageContext.request.contextPath}/skill/insertSkill.do" method="post"
                     modelAttribute="xzSKill" style="width: 80%;margin: 0 auto">
                <sf:hidden path="skillID"/>
                <sf:hidden path="loginID"/>
                <hr>
                <h4 class="position_h4">添加掌握技能</h4>
                <div style="margin-top: 60px">
                    <div style="text-align: center">技能名称：
                    <sf:input autocomplete="off" cssClass="position_input2"
                              style="width: 200px" placeholder="请填写技能名称" path="skillName"/></div>

                    <ul class="lanren">
                        <li>
                            <div class="scale_panel">
                                <span class="r">100</span>0
                                <span id="title">${xzSKill.skillValue}%</span>
                                <div class="scale" id="bar">
                                    <div id="bar01" style=""></div>
                                    <span id="btn5" style=""></span>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <br>
                    <sf:hidden id="skillValueID" path="skillValue"/>
                    <div style="clear: both"></div>
                    <sf:errors path="skillName"/>
                </div>

                <div style="width: 210px;margin: 0 auto">
                    <button type="submit" class="position_button btn btn-primary" style="float: left;margin-right: 10px">保存</button>
                    <a href="javascript:history.go(-1)">
                        <button type="button" class="position_button btn btn-primary">取消</button></a>
                </div>
            </sf:form>
        </div>
    </div>


</div>
<jsp:include page="footerForeEnd.jsp"/>

<script>
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
//                g.onmouseup = new Function('this.onmousemove=null');
                g.onmouseup = function () {
                    this.onmousemove=null;
                    alert(123);
                }

            };
        },
        ondrag: function (pos, x) {
            this.step.style.width = Math.max(0, x) + 'px';
            this.title.innerHTML = pos + '%';
            document.getElementById("skillValueID").value = pos;
        }
    }

    new scale('btn5', 'bar', 'title');
</script>
</body>
</html>
