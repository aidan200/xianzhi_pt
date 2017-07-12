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
    <title>交易中心</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if(page!=undefined){
                var pageInp = document.getElementById("costPage");
                pageInp.value = page;
                var form = document.getElementById("costForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Cost/deleteCost.emp?costId=" + id;
                }
            });
        }
    </script>
</head>

<body class="">
<jsp:include page="backEndHeader.jsp"/>

<div class="content">
    <div class="header">
        <h1 class="page-title">交易中心</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">交易中心</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="costForm" action="${pageContext.request.contextPath}/Cost/selectCostAll.emp" >
                <div class="well">
                    <div>&nbsp;&nbsp;
                        会员编号：<input name="vipId" value="<c:if test="${cost.vipId!='0'}">${cost.vipId}</c:if>" style="width:158px;" type="number">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        交易金额：<input name="costMoney" value="${cost.costMoney}" style="width:158px;" type="number">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        交易时间：<input name="startTime" value="<fmt:formatDate  value="${startTime}" pattern="yyyy-MM-dd HH:mm:ss"  />" class="sang_Calender" style="width:158px;" type="text">&nbsp;&nbsp;&nbsp;
                        --&nbsp;&nbsp;&nbsp;&nbsp;<input name="endTime" value="<fmt:formatDate  value="${endTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"  />" class="sang_Calender" style="width:158px;" type="text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input class="btn btn-warning" type="submit" value="搜索"><br>&nbsp;&nbsp;
                        交易类型：<select name="costType" style="width:172px;"><option value="">请选择</option><option value="支出" <c:if test="${cost.costType=='支出'}">selected="selected"</c:if>>支出</option><option value="收入" <c:if test="${cost.costType=='收入'}">selected="selected"</c:if>>收入</option></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        交易原因：<input name="costReason" value="${cost.costReason}" style="width:158px" type="text">
                    </div>
                    <a href="${pageContext.request.contextPath}/Cost/costEdit.emp" id="bo">添加</a>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">会员编号</th>
                            <th class="v">交易类型</th>
                            <th class="v">交易金额</th>
                            <th class="v">交易原因</th>
                            <th class="v">交易时间</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="c1" items="${costList}">
                            <tr>
                                <td>${c1.costId}</td>
                                <td>${c1.vipId}</td>
                                <td>${c1.costType}</td>
                                <td>${c1.costMoney}</td>
                                <td>${c1.costReason}</td>
                                <td><fmt:formatDate  value="${c1.costTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                <td><a href="${pageContext.request.contextPath}/Cost/costEdit.emp?costId=${c1.costId}">修改</a></td>
                                <td><a onclick="go(${c1.costId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/Cost/deleteCost.emp?costId=${c1.costId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                    <ul>
                        <input id="costPage" type="hidden" name="page" value="${page}">
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