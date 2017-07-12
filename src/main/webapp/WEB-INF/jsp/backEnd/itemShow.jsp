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
<!DOCTYPE HTML>
<html>
<head>
    <title>项目</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("itemPage");
                pageInp.value = page;
                var form = document.getElementById("itemForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Item/deleteItem.emp?itemId=" + id;
                }
            });
        }
    </script>
</head>

<body class="">
<jsp:include page="backEndHeader.jsp"/>

<div class="content">
    <div class="header">
        <h1 class="page-title">项目</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">项目</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="itemForm" action="${pageContext.request.contextPath}/Item/selectItemAll.emp">
                <div style="margin: 10px 0">
                    发布者： <input name="itemWriter" value="${item.itemWriter}" style="width: 9%;margin-right: 10px" type="text">
                    发布时间：<input name="startTime"
                                value="<fmt:formatDate  value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                class="sang_Calender" style="width: 12%" type="text">
                    -<input name="endTime"
                            value="<fmt:formatDate  value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"  />"
                            class="sang_Calender" style="width: 12%;margin-right: 10px" type="text">
                    项目标题：<input name="itemTitle" value="${item.itemTitle}" style="width: 9%;margin-right: 10px" type="text">
                    项目简介：<input name="itemArticle" value="${item.itemArticle}" style="width: 9%;margin-right: 10px" type="text">
                    <input type="submit" class="btn btn-warning" value="搜索" style="margin-top: -10px">
                </div>
                <div class="well">

                    <a href="${pageContext.request.contextPath}/Item/itemEdit.emp" id="bo">添加</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">发布者</th>
                            <th class="v">发布时间</th>
                            <th class="v">项目标题</th>
                            <th class="v">项目简介</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="i1" items="${itemList}">
                            <tr>
                                <td>${i1.itemId}</td>
                                <td>${i1.itemWriter}</td>
                                <td><fmt:formatDate value="${i1.itemTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><div class="all_w">${i1.itemTitle}</div></td>
                                <td><div class="all_w2">${i1.itemArticle}</div></td>
                                <td><a href="${pageContext.request.contextPath}/Item/itemEdit.emp?itemId=${i1.itemId}">修改</a></td>
                                <td><a onclick="go(${i1.itemId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/Item/deleteItem.emp?itemId=${i1.itemId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="itemPage" type="hidden" name="page" value="${page}">
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


<script src="${pageContext.request.contextPath}/dist/backEnd/js/datetime.js"></script>
<!--<script type="text/javascript">-->
<!--$("[rel=tooltip]").tooltip();-->
<!--$(function() {-->
<!--$('.demo-cancel-click').click(function(){return false;});-->
<!--});-->
<!--</script>-->

</body>
</html>