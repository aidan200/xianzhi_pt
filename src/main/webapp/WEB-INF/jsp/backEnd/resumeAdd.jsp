<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>个人简历</title>
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        //跳转页面
        $(document).ready(function () {
            if('${msg}'=='修改成功')
                window.location.href = "${pageContext.request.contextPath}/Resume/selectAllPersonalResume.emp";
            });
        //工作年限输入检查
        function checkResumeYear() {
            var year = document.getElementById("rYear").value;
            var saveForm = document.getElementById("saveForm");
            if(year >50 || year < 0){
                alert("工作年限必须在0-50年之间!");
                saveForm.action = "${pageContext.request.contextPath}/Resume/selectResumeByLogin.emp?loginId=${loginId}";
            }else {
                var reSum = document.getElementById("resumeSubmit");
                reSum.submit();
            }
        }
    </script>
</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>


<div class="content">
    <div class="header">
        <h1 class="page-title">添加/修改简历信息</h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/Teacher/backEndIndex">首页</a></li>
        <li class="active">简历</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="well">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">基本信息${resumeId}</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active in" id="home">
                        <form id="saveForm" action="${pageContext.request.contextPath}/Resume/saveResume.emp" method="post">
                            <input type="hidden" name="resumeMember" value="${member.memberID}">
                            姓名:<br>
                            <input id="ga" name="memberName" type="text" value="${member.memberName}" readonly="readonly"><br>
                            求职意向:<br>
                            <select name="resumeJob">
                                <option disabled>请选择</option>
                                <option value="JAVA开发">JAVA开发</option>
                                <option value="软件测试">软件测试</option>
                                <option value="PHP开发">PHP开发</option>
                                <option value="Oracle维护">Oracle维护</option>
                                <option value="ASP.NET开发">ASP.NET开发</option>
                                <option value="大数据">大数据</option>
                                <option value="日语翻译">日语翻译</option>
                            </select><br>
                            期望薪资:<br>
                            <input name="resumeSalary" type="number"><br>
                            期望工作地:<br>
                            <input name="resumePlace" type="text"><br>
                            工作年限:<br>
                            <input name="resumeYear" type="number" id="rYear"><br>
                            目前状态:<br>
                            <select name="resumeState">
                                <option disabled>请选择</option>
                                <option value="找工作">找工作</option>
                                <option value="跳槽">准备跳槽</option>
                            </select><br>
                             职位类型:<br>
                            <select name="resumeType">
                                <option disabled>请选择</option>
                                <option value="全职">全职</option>
                                <option value="兼职">兼职</option>
                                <option value="实习">实习</option>
                            </select><br>
                            <button class="btn btn-warning" onclick="checkResumeYear()" id="resumeSubmit"><i class="icon-ok"></i>保存</button>
                        </form>
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
