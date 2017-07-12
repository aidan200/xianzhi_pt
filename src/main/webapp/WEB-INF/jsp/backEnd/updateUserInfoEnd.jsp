<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入springMVC form--%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>用户信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var prevDiv = document.getElementById('preview');
            var lj = "${pageContext.request.contextPath}/dist/photo/${xzMember.memberPicture}";
            if (lj != null && lj != "") {
                prevDiv.innerHTML = '<img src=\'' + lj + '\' width="150xp" height="150px"/>';
            }
        });
    </script>


</head>


<body class="">
<jsp:include page="backEndHeader.jsp"/>

<div class="content">

    <div class="header">
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">用户信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">用户信息</li>
    </ul>

        <div class="container-fluid">
            <div class="row-fluid">

                <div class="well">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="home" style="margin-top: 20px">
                            <sf:form id="tab" action="${pageContext.request.contextPath}/UserInfo/updateUserInfo.emp"
                                     method="post" modelAttribute="xzMember" enctype="multipart/form-data">
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="memberID"/>
                            <div class="col-md-12 col-xs-12">
                                <div class="imgt">
                                    <div class="img" id="preview"></div>
                                    <span class="choose"></span>

                                    <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                                           name="photoFile" />
                                        <%--path="memberPicture"--%>
                                    <sf:hidden path="memberPicture"/>
                                </div><br/>


                                用户信息表ID:<br/>
                                <input type="text" placeholder="用户信息表ID *" class="input-xlarge" value="${xzMember.memberID}"
                                       disabled="disabled"><br/>
                                姓名；<br/>
                                <sf:input placeholder="姓名 *" cssClass="input-xlarge" path="memberName"/><br/>
                                性别：<br/>
                                <sf:select  cssClass="input-xlarge" path="memberSex">
                                    <sf:option value="1">男</sf:option>
                                    <sf:option value="2">女</sf:option>
                                </sf:select><br/>
                                年龄：<br/>
                                <sf:input placeholder="年龄 *" cssClass="input-xlarge" path="memberAge"/><br/>
                                身份证号：<br/>
                                <span>${peID}</span>
                                <sf:input placeholder="身份证号 *" cssClass="input-xlarge" path="memberIDcard"/><br/>
                                电话：<br/>
                                <sf:input placeholder="电话 *" cssClass="input-xlarge" path="memberPhone"/>
                                <span>${mob}</span><br/>
                                <div class="btn-toolbar">
                                    <button class="btn btn-warning" type="submit"><i class="icon-ok"></i>保存</button>
                                </div>
                                </sf:form>
                            </div>

                        </div>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/dist/foreEnd/js/jquery-1.12.3.min.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd/js/datedropper.min.js"></script>
<script>
    $("#pickdate").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
    $("#pickdate2").dateDropper({
        animate: false,
        format: 'Y-m-d',
        maxYear: '3000'
    });
</script>
<script type="text/javascript">

    //选择封面图片
    function preview(file) {
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/photo/${xzMember.memberPicture}"
        if (file.files && file.files[0]) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                prevDiv.innerHTML = '<img src="' + evt.target.result + '" width="150xp" height="150px"/>';
            };
            reader.readAsDataURL(file.files[0]);
        } else {
            prevDiv.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
        }
    }
</script>
</body>
</html>