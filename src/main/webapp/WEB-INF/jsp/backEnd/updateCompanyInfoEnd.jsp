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
    <title>公司信息</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <jsp:include page="backEndCss.jsp"/>
    <script type="application/javascript">
        $(document).ready(function () {
            var prevDiv = document.getElementById('preview');
            var lj = "${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}";
//            alert(lj);
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
        <h1 id="titleID" class="page-title"><span id="loginInfoSpan">公司信息</span></h1>
    </div>

    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/XzLogin/goIndex.emp">首页</a></li>
        <li class="active">公司信息</li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">


                <div class="well">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane active in" id="home" style="margin-top: 20px">
                            <sf:form id="tab" action="${pageContext.request.contextPath}/CompanyInfo/updateCompanyInfo.emp"
                                     method="post"
                                     modelAttribute="xzCompany" enctype="multipart/form-data">
                            <sf:hidden path="loginID"/>
                            <sf:hidden path="companyID"/>
                            <div class="col-md-12 col-xs-12">
                                <div class="imgt" style="margin-bottom: 20px">
                                    <div class="img" id="preview"></div>
                                    <span class="choose"></span>
                                    <input id="previewPhoto" type="file" class="file" onchange="preview(this)"
                                           name="photoFile"/>
                                        <%--path="memberPicture"--%>
                                    <sf:hidden id="ptAddress" path="companyPicture"/>
                                </div>
                                企业用户信息表ID:<br/>
                                <input type="text" placeholder="企业用户信息表ID *" class="input-xlarge"
                                       value="${xzCompany.companyID}"
                                       disabled="disabled"><br/>
                                公司名:<br/>
                                <sf:input placeholder="公司名 *" cssClass="input-xlarge" path="companyName"/><br/>
                                公司地址:<br/>
                                <sf:input placeholder="公司地址 *" cssClass="input-xlarge" path="companyLocation"/><br/>



                                公司电话:<br/>
                                <sf:input placeholder="公司电话 *" cssClass="input-xlarge" path="companyPhone"/>
                                <span>${pho}</span><br/>


                                公司规模:<br/>
                                <sf:select path="companyScale" cssClass="input-xlarge">
                                    <sf:option value="1-19人">1-19人</sf:option>
                                    <sf:option value="20-49人">20-49人</sf:option>
                                    <sf:option value="50-99人">50-99人</sf:option>
                                    <sf:option value="100-499人">100-499人</sf:option>
                                    <sf:option value="500-999人">500-999人</sf:option>
                                    <sf:option value="1000-1999人">1000-1999人</sf:option>
                                    <sf:option value="2000人以上">2000人以上</sf:option>
                                </sf:select>
                                <br/>
                                公司性质:<br/>
                                <sf:select path="companyNature" autocomplete="off" cssClass="input-xlarge">
                                    <sf:option value="1">国企</sf:option>
                                    <sf:option value="2">私企</sf:option>
                                </sf:select>
                                <br/>
                                所属行业:<br/>
                                <sf:input placeholder="所属行业 *" cssClass="input-xlarge" path="industry"/>
                                <sf:errors path="industry"/>
                                <br/>

                                公司简介:<br/>
                                <sf:textarea placeholder="公司简介 *" cssClass="input-xlarge" path="companyIntro"/>
                                <sf:errors path="companyIntro"/>
                                <br/>

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
        document.getElementById("ptAddress").value = file.value;
        var prevDiv = document.getElementById('preview');
        var lj = "${pageContext.request.contextPath}/dist/photo/${xzCompany.companyPicture}"
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