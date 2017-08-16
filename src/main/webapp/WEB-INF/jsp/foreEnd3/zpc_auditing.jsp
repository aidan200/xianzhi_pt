<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/8
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>公司未审核状态</title>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/fileUpload.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/uploadUtil.js"></script>
    <script>
        $(document).ready(function () {
            $(".aud_sa").hover(function () {
                $(".aud_oi").css("display", "block");
            }, function () {
                $(".aud_oi").css("display", "none");
            });
        });

        var flag = 0;
        /**
         * 校验表单
         */
        function checkForm() {
            //获取上传的文件信息
            var f = document.getElementById("file").files;
            var check_flag = false;
            if (f.length == 0) {
                alert("请上传图片！");
            } else {
                getImageSize();
                if (flag == 1) {
                    alert("您只能输入GIF,BMP,PNG,JPG,JPEG格式的文件!");
                } else if (flag == 2) {
                    alert("请上传小于500KB的文件!");
                } else {
                    check_flag = true;
                }
            }
            return check_flag;
        }
        ;

        /**
         * 校验图片尺寸
         */
        function getImageSize() {
            var f = document.getElementById("file").files;
            var i = f[0].name.lastIndexOf('.');
//            alert(i);
            var len = f[0].name.length;
            var extEndName = f[0].name.substring(i + 1, len);
            var extName = "GIF,BMP,PNG,JPG,JPEG";
            if (extName.indexOf(extEndName.toUpperCase()) == -1) {
                flag = 1;
            } else {
                var AllowImgFileSize = 50000;
//                alert(f[0].size);
                if (f[0].size > AllowImgFileSize) {
                    flag = 2;
                } else {
                    flag = 0;
                }
            }
            ;
        }
        ;

    </script>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="aud_all">
    <div class="aud1_all">
        <form action="${pageContext.request.contextPath}/CompanyInfo/updateCompanyLic.do" method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
            <%--<form action="${pageContext.request.contextPath}/CompanyInfo/updateCompanyLic.do" method="post" enctype="multipart/form-data" onsubmit="return check()">--%>
            <div class="aud_in">
                <div class="aud_left" style="margin-top: 100px">
                    <div class="aud_ne">
                        <%--<input type="hidden" name="companyId" value="">--%>
                        <div class="aud_every">
                            <span>公司名称</span>&emsp;<input type="text" name="companyName" placeholder="请填写公司营业执照上的公司名称全称" <c:if test="${company.companyName!=undefined}">readonly</c:if>  value="${company.companyName}" class="aud_g">
                        </div>
                        <div style="position: relative">
                            <span class="aud_span" style="">营业执照&nbsp;</span>&emsp;
                            <input type="file" id="file" name="file" class="nicefile" style="float: left"/>
                            <span style="margin-left: 40px">
                                <span style="color: #fc6866">请上传加盖公司公章（红章）的营业执照扫描件</span> 查看示例
                                <span class="fa fa-exclamation-triangle aud_sa"></span></span>
                        </div>
                        <button class="aud_button" type="submit">提 交</button>
                    </div>
                </div>
            </div>
            <div class="aud_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/bvbv.png" alt="">
                <div>
                    <h4>先知承诺</h4>
                    <p>企业资料仅用于资质审核，先知平台绝不向第三方泄露，请您放心填写。</p>
                </div>
            </div>
        </form>

        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ying.jpg" alt="" class="aud_oi">
    </div>
</div>
<jsp:include page="behindforeEnd.jsp"/>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery.nice-file-input.js"></script>
<script type="text/javascript">
    $('document').ready(function () {
        $(".nicefile").niceFileInput({
            'width': '390',
            'height': '35',
            'btnText': '浏 览',
            'btnWidth': '100',
            'margin': '20',
            'background-color': '#f8a91e'
        });

    });
</script>
</body>
</html>
