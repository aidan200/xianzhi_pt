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
    <title>行业动态</title>
    <jsp:include page="backEndCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/datedropper.css">
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/bootstrap.min.css">--%>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("newsPage");
                pageInp.value = page;
                var form = document.getElementById("newsForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？",function (choose) {
                if(choose){
                    window.location.href = "${pageContext.request.contextPath}/News/deleteNews.emp?newsId="+id;
                }
            });
        }
    </script>
</head>

<jsp:include page="backEndHeader.jsp"/>
<body>


<div class="content">

    <div class="header">
        <h1 class="page-title">行业动态</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">行业动态</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="newsForm" action="${pageContext.request.contextPath}/News/selectNewsAll.emp">
                <div style="margin: 10px 0">

                    发布者： <input name="newsWriter" type="text"
                                value="${news.newsWriter}" style="width: 9%;margin-right: 10px">
                    动态标题：<input name="newsTitle" type="text" value="${news.newsTitle}" style="width:9%;margin-right: 10px">
                    发布日期：<input name="startDate" type="text" id="pickdate"
                                value="<fmt:formatDate  value='${startDate}' pattern='yyyy-MM-dd'/>"
                                style="width:9%;">
                    -<input name="endDate" type="text" id="pickdate2"
                            value="<fmt:formatDate  value='${endDate}' pattern='yyyy-MM-dd' />" style="width:9%;margin-right: 10px">
                    动态内容：<input name="newsArticle" type="text" value="${news.newsArticle}" style="width:11%;margin-right: 10px">
                    <input type="submit" class="btn btn-warning" value="搜索" style="margin-top: -10px">
                </div>

                <div class="well">


                    <a href="${pageContext.request.contextPath}/News/newsEdit.emp" id="bo">添加</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">发布者</th>
                            <th class="v">动态标题</th>
                            <th class="v">发布日期</th>
                            <th class="v">动态内容</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="t1" items="${newsList}">
                            <tr>
                                <td>${t1.newsId}</td>
                                <td>${t1.newsWriter}</td>
                                <td><div class="all_w">${t1.newsTitle}</div></td>
                                <td><fmt:formatDate value="${t1.newsDate}" type="both" pattern="yyyy-MM-dd"/></td>
                                <td><div class="all_w2">${t1.newsArticle}</div></td>
                                <td><a href="${pageContext.request.contextPath}/News/newsEdit.emp?newsId=${t1.newsId}">修改</a></td>
                                <td><a onclick="go(${t1.newsId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/News/deleteNews.emp?newsId=${t1.newsId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="newsPage" type="hidden" name="page" value="${page}">
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
                <p>&copy; 2017 <a href="###" target="_blank">先知蓝创</a></p>
            </footer>
        </div>
    </div>
</div>

<%--<script src="${pageContext.request.contextPath}/dist/backEnd/js/bootstrap.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/dist/backEnd/js/jquery-1.12.3.min.js"></script>--%>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/datedropper.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/backEnd/js/timedropper.min.js"></script>
<script>
    $("#pickdate").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '2020'
    });
    $("#pickdate2").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '2020'
    });
</script>

</body>
</html>
