<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入日期格式--%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--分页--%>
<%@ taglib prefix="page" uri="/xianzhiOA/pageTag" %>
<html lang="en">
<head>
    <title>会员信息</title>
    <jsp:include page="backEndCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dist/backEnd/css/datedropper.css">
    <script type="application/javascript">
        var tis = new tis(300);
        //分页
        function pToSub(page) {
            if (page != undefined) {
                var pageInp = document.getElementById("vipPage");
                pageInp.value = page;
                var form = document.getElementById("vipForm");
                form.submit();
            }
        }
        //删除提示框
        function go(id) {
            tis.confirm("你确定要删除这条信息么？", function (choose) {
                if (choose) {
                    window.location.href = "${pageContext.request.contextPath}/Vip/deleteVip.emp?vipId="+id;
                }
            });
        }
    </script>
</head>

<jsp:include page="backEndHeader.jsp"/>
<body>


<div class="content">

    <div class="header">
        <h1 class="page-title">会员信息</h1>
    </div>
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">会员信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form id="vipForm" action="${pageContext.request.contextPath}/Vip/selectVipAllEnd.emp">
                <div style="margin: 10px 0">
                    会员姓名：<input name="loginCount" type="text" value="${leaguer.loginCount}" style="width: 10%;margin-right: 10px">
                    会员等级：<select name="vipLevel" style="width: 11%;margin-right: 10px"><option value="">请选择</option><option value="1" <c:if test="${leaguer.vipLevel=='1'}">selected="selected"</c:if>>1</option><option value="2" <c:if test="${leaguer.vipLevel=='2'}">selected="selected"</c:if>>2</option><option value="3" <c:if test="${leaguer.vipLevel=='3'}">selected="selected"</c:if>>3</option><option value="4" <c:if test="${leaguer.vipLevel=='4'}">selected="selected"</c:if>>4</option><option value="5" <c:if test="${leaguer.vipLevel=='5'}">selected="selected"</c:if>>5</option><option value="6" <c:if test="${leaguer.vipLevel=='6'}">selected="selected"</c:if>>6</option><option value="7" <c:if test="${leaguer.vipLevel=='7'}">selected="selected"</c:if>>7</option><option value="8" <c:if test="${leaguer.vipLevel=='8'}">selected="selected"</c:if>>8</option><option value="9" <c:if test="${leaguer.vipLevel=='9'}">selected="selected"</c:if>>9</option><option value="10" <c:if test="${leaguer.vipLevel=='10'}">selected="selected"</c:if>>10</option><option value="11" <c:if test="${leaguer.vipLevel=='11'}">selected="selected"</c:if>>11</option><option value="12" <c:if test="${leaguer.vipLevel=='12'}">selected="selected"</c:if>>12</option></select>
                    到期时间：<input name="startTime" type="text" id="pickdate" class="sang_Calender" value="<fmt:formatDate value='${startTime}' pattern='yyyy-MM-dd HH:mm:ss' />" style="width: 12%">-
                    <input name="endTime" type="text" id="pickdate2" class="sang_Calender" value="<fmt:formatDate value='${endTime}' pattern='yyyy-MM-dd HH:mm:ss' />" style="width: 12%;margin-right: 10px">

                    <input type="submit" class="btn btn-warning" value="搜索"><br>
                    会员类型：<select name="loginType"  style="width: 11%;margin-right: 10px"><option value="">请选择</option><option value="1" <c:if test="${leaguer.loginType=='1'}"> selected="selected"</c:if>>个人用户</option><option value="2" <c:if test="${leaguer.loginType=='2'}"> selected="selected"</c:if>>企业用户</option></select>
                    会员积分：<input name="minScore" type="number" value="<c:if test="${minScore!='0'}">${minScore}</c:if>" style="width: 12%;margin-right: 10px">-
                    <input name="maxScore" type="number" value="<c:if test="${maxScore!='0'}">${maxScore}</c:if>" style="width: 12%;margin-right: 10px">
                    账户余额：<input name="minRest" type="number" value="<c:if test="${minRest!='0'}">${minRest}</c:if>" style="width: 10%;margin-right: 10px">-
                    <input name="maxRest" type="number" value="<c:if test="${maxRest!='0'}">${maxRest}</c:if>" style="width: 10%;margin-right: 10px">
                </div>
                <div class="well">

                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th class="v">用户名</th>
                            <th class="v">会员等级</th>
                            <th class="v">到期时间</th>
                            <th class="v">会员积分</th>
                            <th class="v">账户余额</th>
                            <th class="v">会员类型</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="ll" items="${leaguerList}">
                            <tr>
                                <td>${ll.vipId}</td>
                                <td>${ll.loginCount}</td>
                                <td>${ll.vipLevel}级</td>
                                <c:if test="${ll.expireTime!=null}">
                                <td><fmt:formatDate value="${ll.expireTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></td></c:if>
                                <c:if test="${ll.expireTime==null}"><td>该用户不是会员</td></c:if>
                                <td>${ll.vipScore}</td>
                                <td>${ll.vipRest}</td>
                                <c:if test="${ll.loginType=='1'}"><td>个人用户</td></c:if>
                                <c:if test="${ll.loginType=='2'}"><td>企业用户</td></c:if>
                                <td><a href="${pageContext.request.contextPath}/Vip/vipEdit.emp?vipId=${ll.vipId}">修改</a></td>
                                <td><a onclick="go(${ll.vipId})" style="cursor: pointer"><i class="fa fa-cloud-upload"></i>删除</a></td>
                                <%--<td><a href="${pageContext.request.contextPath}/Vip/deleteVip.emp?vipId=${v1.vipId}">删除</a></td>--%>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="pagination">
                    <c:if test="${pages > 1}">
                        <ul>
                            <input id="vipPage" type="hidden" name="page" value="${page}">
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


<script src="${pageContext.request.contextPath}/dist/backEnd/js/datetime.js"></script>

</body>
</html>
