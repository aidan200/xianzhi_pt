<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/16
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>技能掌握</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var logID = ${xzSKill.skillID};
            var saveForm = document.getElementById("tab1");
            if (logID == 0) {
                saveForm.action = "${pageContext.request.contextPath}/skill/insertSkill.emp";
            }
        });
    </script>

</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">技能掌握</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a> <span class="divider">/</span></li>
        <li class="active">技能掌握</li>
    </ul>
    <sf:form id="tab1" action="${pageContext.request.contextPath}/skill/updateSkill.emp" method="post"
             modelAttribute="xzSKill" enctype="multipart/form-data">
        <div class="container-fluid">
            <div class="row-fluid">

                <div class="btn-toolbar">
                    <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                </div>

                <div class="well">

                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">技能掌握</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <br/>
                        <div class="tab-pane active in" id="home">
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="skillID"/>
                            <label>技能名称</label>
                            <sf:input  placeholder="技能名称 *" class="input-xlarge"
                                   path="skillName"/>
                            <sf:errors path="skillName"/>
                            <br/>
                            <label>掌握情况</label>
                            <ul class="lanren">
                                <li>
                                    <div class="scale_panel" style="margin: 0;padding: 0">
                                        <span class="r">100</span>0
                                        <span id="title">0</span>
                                        <div class="scale" id="bar">
                                            <div></div>
                                            <span id="btn5"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <sf:hidden id="skillValueID" path="skillValue"/>
                            <%--<sf:input placeholder="掌握情况 *" cssClass="input-xlarge" path="skillValue"/>--%>
                        </div>
                    </div>
                </div>
                <footer>
                    <hr>
                    <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
                </footer>

            </div>
        </div>
    </sf:form>
</div>


<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-1.12.3.min.js"></script>
<%--拖拽进度条--%>
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
                g.onmouseup = new Function('this.onmousemove=null');
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
