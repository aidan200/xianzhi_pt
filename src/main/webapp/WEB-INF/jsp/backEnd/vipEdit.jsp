<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>会员信息</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if('${msg}'=='添加成功'||'${msg}'=='修改成功') {
                window.location.href = "${pageContext.request.contextPath}/Vip/selectVipAllEnd.emp";
            }
        });
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改会员信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">会员信息${msg}</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Vip/updateVip.emp" modelAttribute="leaguer" >
                            <sf:hidden  path="vipId" />
                            会员姓名:<br>
                            <sf:input id="ga" disabled="true" path="loginCount"/><br>
                            会员等级:<br>
                            <sf:select  path="vipLevel" ><option disabled>请选择</option><sf:option value="1">1</sf:option><sf:option value="2">2</sf:option><sf:option value="3">3</sf:option><sf:option value="4">4</sf:option><sf:option value="5">5</sf:option><sf:option value="6">6</sf:option><sf:option value="7">7</sf:option><sf:option value="8">8</sf:option><sf:option value="9">9</sf:option><sf:option value="10">10</sf:option><sf:option value="11">11</sf:option><sf:option value="12">12</sf:option></sf:select><br>
                            到期时间:<br>
                            <sf:input path="expireTime" type="text" class="sang_Calender"/><br>
                            会员积分:<br>
                            <sf:input type="number" path="vipScore"/><br>
                            账户余额:<br>
                            <sf:input path="vipRest" type="number"/><br>
                            会员类型:<br>
                            <c:if test="${leaguer.loginType=='1'}">
                                <input type="text" disabled="disabled" value="个人用户" name="loginType"><br></c:if>
                            <c:if test="${leaguer.loginType=='2'}">
                                <input type="text" disabled="disabled" value="企业用户" name="loginType"><br></c:if>
                            <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                        </sf:form>
                    </div>
                </div>
            </div>

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
