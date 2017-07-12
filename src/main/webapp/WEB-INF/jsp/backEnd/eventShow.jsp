<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--字符串过长时进行...处理--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<html lang="en">
<head>
    <title>活动</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("eventPage");
                pageInp.value = page;
                var form = document.getElementById("eventForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Event/deleteEvent.emp?eventId=" + id;
                }
            });
        }
    </script>
</head>

<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">活动</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">活动</li>
    </ul>


    <div class="container-fluid">
        <div class="row-fluid">
            <form id="eventForm" action="${pageContext.request.contextPath}/Event/selectEventAll.emp">
                <div style="margin: 10px 0">
                    起始时间：<input name="begin"
                                value="<fmt:formatDate  value="${begin}" pattern="yyyy-MM-dd HH:mm:ss" />"
                                type="text" style="width: 12%" class="sang_Calender">
                    -<input name="over" value="<fmt:formatDate  value="${over}" pattern="yyyy-MM-dd HH:mm:ss" />"
                            type="text" style="width: 12%;margin-right: 10px" class="sang_Calender">
                    活动地点：<input name="eventPlace" value="${event.eventPlace}" style="width: 9%;margin-right: 10px" type="text">
                    活动标题：<input name="eventTitle" value="${event.eventTitle}" style="width: 9%;margin-right: 10px" type="text">
                    活动简介：<input name="eventArticle" value="${event.eventArticle}" type="text"
                                style="width: 9%;margin-right: 10px"><br>
                    截止时间：<input name="beginTime"
                                value="<fmt:formatDate  value="${beginTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
                                type="text" style="width: 12%" class="sang_Calender">
                    -<input name="overTime"
                            value="<fmt:formatDate  value="${overTime}" pattern="yyyy-MM-dd HH:mm:ss" />"
                            type="text" style="width: 12%;margin-right: 10px" class="sang_Calender">
                    活动类型：<select name="eventType" style="width: 10%;margin-right: 22px">
                    <option value="">请选择</option>
                    <option value="项目实战" <c:if test="${event.eventType=='项目实战'}">selected="selected"</c:if>>项目实战
                    </option>
                    <option value="企业宣传" <c:if test="${event.eventType=='企业宣传'}">selected="selected"</c:if>>企业宣传
                    </option>
                    <option value="行业规划" <c:if test="${event.eventType=='行业规划'}">selected="selected"</c:if>>行业规划
                    </option>
                    <option value="技术宣讲" <c:if test="${event.eventType=='技术宣讲'}">selected="selected"</c:if>>技术宣讲
                    </option>
                </select>
                    主办方： <input name="eventBy" value="${event.eventBy}" style="width: 9%;margin-right: 22px" type="text">
                    发布者： <input name="eventWriter" value="${event.eventWriter}" style="width: 9%;margin-right: 10px" type="text">
                    <input type="submit" class="btn btn-warning" value="搜索" style="margin-top: -10px">
                </div>
                <div class="well">

                    <a href="${pageContext.request.contextPath}/Event/eventEdit.emp" id="bo">添加</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v2">起始时间</th>
                            <th class="v">活动地点</th>
                            <th class="v">活动标题</th>
                            <th class="v">活动简介</th>
                            <th class="v">截止时间</th>
                            <th class="v">活动类型</th>
                            <th class="v">主办方</th>
                            <th class="v">发布者</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="t1" items="${eventList}">
                            <tr>
                                <td>${t1.eventId}</td>
                                <td><fmt:formatDate value="${t1.startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${t1.eventPlace}</td>
                                <td><div class="all_w">${t1.eventTitle}</div></td>
                                <td><div class="all_w2">${t1.eventArticle}</div></td>
                                <td><fmt:formatDate value="${t1.endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${t1.eventType}</td>
                                <td>${t1.eventBy}</td>
                                <td>${t1.eventWriter}</td>
                                <td><a href="${pageContext.request.contextPath}/Event/eventEdit.emp?eventId=${t1.eventId}">修改</a></td>
                                <td><a onclick="go(${t1.eventId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="eventPage" type="hidden" name="page" value="${page}">
                            <page:paging length="10" page="${page}" pages="${pages}"/>
                        </ul>
                    </c:if>
                </div>
            </form>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">删除信息</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>你确定要删除这条信息么？</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
                    <button class="btn btn-danger" data-dismiss="modal">删除</button>
                </div>
            </div>

            <footer>
                <hr>
                <p>&copy; 2017 <a href="#" target="_blank">先知蓝创</a></p>
            </footer>
        </div>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datetime.js"></script>

</body>
</html>
