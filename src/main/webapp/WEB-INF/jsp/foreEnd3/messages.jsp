<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/4
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>
<div class="news_all">
    <div class="new_center">
        <div class="news_top">
            <span class="news_en">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/env2.png" alt="" class="new_img"></span>
            <span class="news_span">我的消息（<span>${total}</span>）</span>
        </div>

        <ul class="news_ul">
            <c:forEach items="${msgList}" var="msg">
                <li>
                    <span class="new_s" style="width: 50px"><input type="checkbox" class="choose2" value="${msg.msgId}"></span>
                    <span class="new_s" style="width: 400px"><a href="${pageContext.request.contextPath}/xzMsg/selMsgById.do?msgId=${msg.msgId}">${msg.msgContent}</a></span>
                    <span class="new_s" style="width: 200px">
                        <fmt:formatDate value="${msg.msgTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                    </span>
                    <span class="new_s" style="width: 100px">
                        <c:choose>
                            <c:when test="${msg.msgType==0}">
                                系统消息
                            </c:when>
                            <c:when test="${msg.msgType==1}">
                                面试通知
                            </c:when>
                        </c:choose>
                    </span>
                    <span class="new_s" style="width: 100px">
                        <c:choose>
                            <c:when test="${msg.msgIsread==0}">
                                <span class="fa fa-envelope news_have"></span>
                            </c:when>
                            <c:when test="${msg.msgIsread==1}">
                                <span class="fa fa-envelope-open-o news_em"></span>
                            </c:when>
                        </c:choose>
                    </span>
                    <span class="new_s" style="width: 100px"><a class="news_bu" href="${pageContext.request.contextPath}/xzMsg/deleteById.do?msgId=${msg.msgId}">删除</a></span>
                </li>
            </c:forEach>
        </ul>
        <%--全选删除--%>
        <div class="news_bottom">
            <input type="checkbox" class="qxan" name="choose1" onclick="DoCheck3(this)"/>
            <button type="button" onclick="deleteAll()" class="scan">删除</button>
            <span style="float: right;margin: 15px;color: #999">共 <span style="color: #fc6866">${total} </span>条消息</span>
        </div>
        <%--分页--%>
        <div class="zp_botv">
            <div class="zp_pl">
                <ul class="pagination zp_pa">
                    <myPage:paging length="10" page="${page}" pages="${pages}"/>
                    <%--<li class="b"><a href="#">上一页</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li class="a"><a href="#">2</a></li>
                    <li class="a"><a href="#">3</a></li>
                    <li class="a"><a href="#">4</a></li>
                    <li class="a"><a href="#">5</a></li>
                    <li class="a"><a href="#">下一页</a></li>--%>
                </ul>
                <div class="zp_page">共 <span>${pages}</span> 页</div>
            </div>
        </div>
    </div>
</div>
<form id="hform" action="${pageContext.request.contextPath}/xzMsg/selMsgAll.do" method="post">
    <input type="hidden" id="hmid" name="page" value="${page}">
</form>

<%--多选--%>
<script>
    function DoCheck3(n) {
        // alert(n);
        var p1 = n.parentNode.parentNode;
        var ch = p1.getElementsByClassName("choose2");
        if (n.checked == true) {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = true;
            }
        } else {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = false;
            }
        }
    }
    function pToSub(page) {
        if(page){
            $('#hmid').val(page);
            $('#hform').submit();
        }
    }
    //批量删除
    function deleteAll() {
        var ids = [];
        $('.choose2').each(function () {
            if($(this).is(':checked')){
                ids.push($(this).val())
            }
        });
        $.ajax({
            url:'${pageContext.request.contextPath}/xzMsg/deleteAll.do',
            type:'post',
            data:{ids:ids},
            traditional: true,
            success:function (data) {
                window.location.reload();
            }
        })
    }
</script>
</body>
</html>
