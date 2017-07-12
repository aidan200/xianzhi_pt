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
<html lang="en">
<head>
    <title>博客</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("blogPage");
                pageInp.value = page;
                var form = document.getElementById("blogForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Blog/deleteBlog.emp?blogId=" + id;
                }
            });
        }
    </script>
</head>

<body class="">
<jsp:include page="backEndHeader.jsp"/>

<div class="content">
    <div class="header">
        <h1 class="page-title">博客</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">博客</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="blogForm" action="${pageContext.request.contextPath}/Blog/selectBlogAll.emp">
                <div style="margin: 10px 0">
                    发帖人： <input name="blogWriter" value="${blog.blogWriter}"  style="width: 9%;margin-right: 10px" type="text">&nbsp;&nbsp;&nbsp;
                    发帖时间：<input name="startTime"
                                value="<fmt:formatDate  value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
                                class="sang_Calender" style="width: 12%" type="text">
                    -<input name="endTime"
                            value="<fmt:formatDate  value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"  />"
                            class="sang_Calender" style="width: 12%;margin-right: 10px" type="text">
                    博客标题：<input name="blogTitle" value="${blog.blogTitle}" style="width: 9%;margin-right: 10px" type="text">
                    博客内容：<input name="blogArticle" value="${blog.blogArticle}" style="width: 9%;margin-right: 10px" type="text">
                    <input class="btn btn-warning" type="submit" value="搜索" style="margin-top: -10px">
                </div>
                <div class="well">
                    <a href="${pageContext.request.contextPath}/Blog/blogEdit.emp" id="bo">添加博客</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="vv">发帖人</th>
                            <th class="v2">发帖时间</th>
                            <th class="v">博客标题</th>
                            <th class="v">博客内容</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="t1" items="${blogList}">
                            <tr>
                                <td>${t1.blogId}</td>
                                <td>${t1.blogWriter}</td>
                                <td><fmt:formatDate value="${t1.blogTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><div class="all_w">${t1.blogTitle}</div></td>
                                <td><div class="all_w3">${t1.blogArticle}</div></td>
                                <c:choose><c:when test="${t1.ifExist == 2}">
                                    <td><a href="${pageContext.request.contextPath}/Discuss/selectOnlyDiscuss.emp?blogId=${t1.blogId}">查看评论</a></td>
                                </c:when><c:otherwise><td></td></c:otherwise></c:choose>
                                <td><a href="${pageContext.request.contextPath}/Discuss/discussEdit.emp?blogId=${t1.blogId}">添加评论</a></td>
                                <td><a href="${pageContext.request.contextPath}/Blog/blogEdit.emp?blogId=${t1.blogId}">修改</a></td>
                                <td><a onclick="go(${t1.blogId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="blogPage" type="hidden" name="page" value="${page}">
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
<%--<script type="text/javascript">--%>
    <%--$("[rel=tooltip]").tooltip();--%>
    <%--$(function() {--%>
        <%--$('.demo-cancel-click').click(function(){return false;});--%>
    <%--});--%>
<%--</script>--%>

</body>
</html>