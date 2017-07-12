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
    <title>评论回复</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("replyPage");
                pageInp.value = page;
                var form = document.getElementById("replyForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？",function (choose) {
                if(choose){
                    window.location.href = "${pageContext.request.contextPath}/Discuss/deleteReply.emp?discussId="+id;
                }
            });
        }
    </script>
</head>


<body class="">


<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">回复评论</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active"><a href="${pageContext.request.contextPath}/Discuss/selectDiscussAndReply.emp">评论</a> <span class="divider">/</span></li>
        <li class="active">回复评论</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="replyForm" action="${pageContext.request.contextPath}/Discuss/selectReplySelective.emp" method="post">
                <div class="well">
                    <div>&nbsp;&nbsp;&nbsp;
                        <input type="hidden" name="blogId" value="${discuss.blogId}">
                        回复人：  <input name="discussWriter" value="${discuss.discussWriter}" style="width:145px;" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        回复时间：<input name="startTime" value="<fmt:formatDate  value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss" />" style="width:145px;"class="sang_Calender" type="text">&nbsp;&nbsp;&nbsp;&nbsp;
                        --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="endTime" value="<fmt:formatDate  value="${endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" style="width:145px;"class="sang_Calender" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        回复内容：<input name="discussArticle" value="${discuss.discussArticle}" style="width:197px;" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" class="btn btn-warning" value="搜索"><br><br>
                    </div>
                    <%--<a href="${pageContext.request.contextPath}/Discuss/discussEdit.emp" id="bo">添加</a>--%>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">评论编号</th>
                            <th class="v">回复人</th>
                            <th class="v">回复时间</th>
                            <th class="v">回复内容</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="r1" items="${replyList}">
                            <tr>
                                <td>${r1.discussId}</td>
                                <td>${discuss.blogId}</td>
                                <td>${r1.discussWriter}</td>
                                <td><fmt:formatDate value="${r1.discussTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td><div class="all_w2">${r1.discussArticle}</div></td>
                                <td><a href="${pageContext.request.contextPath}/Discuss/replyEdit.emp?replyId=${r1.discussId}&addDiscussId=0">修改</a></td>
                                <td><a onclick="go(${r1.discussId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/Discuss/deleteReply.emp?discussId=${r1.discussId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                    <ul>
                        <input id="replyPage" type="hidden" name="page" value="${page}">
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
<%--<script type="text/javascript">--%>
<%--$("[rel=tooltip]").tooltip();--%>
<%--$(function() {--%>
<%--$('.demo-cancel-click').click(function(){return false;});--%>
<%--});--%>
<%--</script>--%>

</body>
</html>