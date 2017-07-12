<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>交易中心</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            var saveForm = document.getElementById("saveForm");
            if('${msg}'=='添加成功'||'${msg}'=='修改成功') window.location.href = "${pageContext.request.contextPath}/Cost/selectCostAll.emp";
            if('${cost.costId}'!=0){
                saveForm.action = "${pageContext.request.contextPath}/Cost/updateCost.emp";
            }
        });
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改会员交易记录</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">交易中心</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <sf:form id="saveForm" action="${pageContext.request.contextPath}/Cost/saveCost.emp" modelAttribute="cost" >
                            <sf:hidden  path="costId" />
                            会员编号:<br>
                            <sf:input id="ga" path="vipId"/><br>
                            交易类型:<br>
                            <sf:select path="costType"><option disabled>请选择</option><sf:option value="支出">支出</sf:option><sf:option value="收入">收入</sf:option></sf:select><br>
                            交易金额:<br>
                            <sf:input path="costMoney" type="number"/><br>
                            交易原因:<br>
                            <sf:input path="costReason"/><br>
                            交易时间:<br>
                            <sf:input path="costTime" class="sang_Calender"/><br>
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
