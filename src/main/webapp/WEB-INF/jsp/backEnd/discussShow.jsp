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
    <title>评论</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("discussPage");
                pageInp.value = page;
                var form = document.getElementById("discussForm");
                form.submit();
            }
        }
        //删除提示框
        function go(dId, bId) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Discuss/deleteDiscuss.emp?discussId=" + dId + "&blogId=" + bId;
                }
            });
        }
    </script>
</head>


<body class="">


<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">评论</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">评论</li>
    </ul>


    <div class="container-fluid">
        <div class="row-fluid">
            <form id="discussForm" action="${pageContext.request.contextPath}/Discuss/selectDiscussSelective.emp"
                  method="post">
                <div style="margin: 10px 0">
                    评论人： <input name="discussWriter" value="${discuss.discussWriter}" style="width: 12%;margin-right: 10px"
                                type="text">
                    评论时间：<input name="startTime"
                                value="<fmt:formatDate value="${startTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />"
                                style="width: 12%" class="sang_Calender" type="text">
                    -<input name="endTime"
                            value="<fmt:formatDate value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" />"
                            style="width: 12%;margin-right: 10px" class="sang_Calender" type="text">
                    评论内容：<input name="discussArticle" value="${discuss.discussArticle}" style="width: 12%;margin-right: 10px"
                                type="text">
                    <input class="btn btn-warning" type="submit" value="搜索" style="margin-top: -10px">
                </div>
                <div class="well">

                    <%--<a href="${pageContext.request.contextPath}/Discuss/discussEdit" id="bo">添加</a>--%>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="vvv">评论人</th>
                            <th class="v">评论时间</th>
                            <th class="ov">评论内容</th>
                            <th class="vvv"></th>
                            <th class="vvv"></th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="t1" items="${discussList}">
                            <tr>
                                <td>${t1.discussId}</td>
                                <td>${t1.discussWriter}</td>
                                <td><fmt:formatDate value="${t1.discussTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td><div class="all_w2">${t1.discussArticle}</div></td>
                                <c:choose><c:when test="${t1.exist != 1}">
                                    <td><a href="${pageContext.request.contextPath}/Discuss/selectReplySelective.emp?blogId=${t1.discussId}">查看回复</a></td>
                                </c:when><c:otherwise><td></td></c:otherwise></c:choose>
                                <td><a href="${pageContext.request.contextPath}/Discuss/replyEdit.emp?addDiscussId=${t1.discussId}">添加回复</a></td>
                                <td><a href="${pageContext.request.contextPath}/Discuss/discussEdit.emp?discussId=${t1.discussId}&blogId=0">修改</a></td>
                                <td><a onclick="go(${t1.discussId},${t1.blogId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/Discuss/deleteDiscuss.emp?discussId=${t1.discussId}&blogId=${t1.blogId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>


                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="discussPage" type="hidden" name="page" value="${page}">
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