<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>


    <title>首页</title>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/loading.css">
    <script type="application/javascript" src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script>//搜索框焦点事件
    $(function () {
        $('#zp_index_xxk').on('focus', function () {
            $(this).css({
                "borderColor": "#ff6363",
                "borderWidth": "2"
            })
            $(".zp_index_arrow").css({
                "borderColor": "#ff6363",
                "border-bottom-width": "2px",
                "border-left-width": "2px"
            })
        });
        $('#zp_index_xxk').on('blur', function () {
            $(this).css({
                "borderColor": "#ffa500",
                "borderWidth": "2"
            })
            $(".zp_index_arrow").css({
                "borderColor": "#ffa500",
                "border-bottom-width": "2px",
                "border-left-width": "2px"
            })
        })
    })
    </script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>
<section class="zp_indextop">
    <div class="zp_index_cont">

        <div class="zp_index_cont_left">
            <div class="zp_index_cont_left_top">
                <div class="zp_index_cont_wbk">
                    <form action="${pageContext.request.contextPath}/Postion/selPostionIndex.do" onsubmit="toSerch()">
                        <input id="zp_index_xxk" type="text" name="likeStr" placeholder="${resume.resumePosition}">
                        <div class="zp_index_arrow"></div>
                        <button class="zp_index_xxk_btn">
                            <span class="fa fa-search fa-2x" style="color: #ffffff"></span>
                        </button>
                    </form>


                </div>
                <p><span>默认条件: ${resume.resumeWorkspace}</span><span> ${resume.resumePosition}</span> <a
                        href="${pageContext.request.contextPath}/Postion/selPostionIndex.do">更多搜索条件</a></p>
            </div>
            <div class="zp_index_cont_left_zwtj">
                <h3 style="font-size: 20px;letter-spacing: 1px">职位推荐&nbsp;&nbsp;<span class="fa fa-caret-down"></span></h3>
            </div>
            <div class="zp_index_cont_left_zwtj_cont">
                <ul id="postionRs">

                </ul>
            </div>
            <div id="serchPostionButton" class="zp_index_cont_left_zwtj_gdzw">
                <a href="javascript:void(0)" onclick="serchPostion()" style="color: rgba(128,128,128,0.91)">查看更多职位</a>
            </div>
        </div>

        <div class="zp_index_cont_right">
            <div class="zp_index_cont_right_top">
                <div>
                    <div class="zp_index_cont_right_top_left">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" width="100%"
                             height="100%">
                    </div>
                    <div class="zp_index_cont_right_top_right">
                        <span>${resume.resumeName}</span>
                        <p>${resume.resumePosition}</p>
                        <p>${resume.resumeField}</p>
                    </div>
                </div>
                <p style="display: inline-block">
                    <c:if test="${resume.resumeWorkspace!=undefined}">
                        <span>${resume.resumeWorkspace}</span>
                    </c:if>
                    <c:if test="${resume.resumeIntentYm!=undefined}">
                        &nbsp;|&nbsp;<span>工作${resume.resumeIntentYm}年</span>
                    </c:if>
                </p>
                <p style="display: inline-block;margin-left: 10px">
                    <c:if test="${resume.fields!=undefined}">
                        <c:forEach items="${resume.fields}" varStatus="sss" var="f">
                            <c:if test="${f.fieldType==2}">
                                <span>${f.fieldName}</span>
                            </c:if>
                            <c:if test="${sss.index==5}">
                                <c:set var="exitId" value="0"></c:set>
                                <span>更多</span>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </p>
                <ul>
                    <li class="zp_small">
                        <a onclick="flashResume()">
                            <span class="fa fa-refresh" style="font-size: 20px;color: #FFA500"></span>
                            <span style="margin-top: 5px">刷新简历</span>
                        </a>
                    </li>
                    <li class="zp_small">
                        <a href="${pageContext.request.contextPath}/Resume/goEditResume.do">
                            <span class="fa fa-pencil-square-o" style="font-size: 20px;color: #FFA500"></span>
                            <span style="margin-top: 5px">编辑简历</span>
                        </a>
                    </li>
                    <li class="zp_small">
                        <a href="">
                            <span class="fa fa-gear" style="font-size: 20px;color: #FFA500"></span>
                            <span style="margin-top: 5px">账号设置</span>
                        </a>
                    </li>
                    <li class="zp_small">
                        <a href="">
                            <span class="fa fa-diamond" style="font-size: 20px;color: #FFA500"></span>
                            <span style="margin-top: 5px">钻石服务</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="zp_index_cont_right_bottom">
                <div class="zp_index_cont_right_bottom_top">
                    <p>简&emsp;历</p>
                    <div>
                        <div class="col-lg-7">
                            <h4>${resume.resumeCompletion}%&nbsp;&nbsp;<span id="theFlash"><fmt:formatDate value="${resume.resumeFlash}" pattern="MM-dd HH:mm"/></span></h4>
                        </div>
                        <div class="col-lg-5 zp_index_cont_right_bottom_right">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/Resume/selResumeInformation.do?resumeId=${resume.resumeId}" target="_blank"><span class="fa fa-eye"></span></a></li>
                                <li><span class="fa fa-download"></span></li>
                                <li><span class="fa fa-refresh"></span></li>
                                <li><span class="fa fa-pencil"></span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="zp_index_cont_right_middle" style="border: none;border-bottom: 1px solid #e5e5e5">
                    <p><span> 隐私设置</span></p>
                    <ul>
                        <li>
                            <span>求职简历:</span>
                            <div>
                                <select class="form-control" onchange="ysChange(this)">
                                    <option value="0" <c:if test="${resume.resumeYm=='0'}"> selected </c:if> >开放简历</option>
                                    <option value="1" <c:if test="${resume.resumeYm=='1'}"> selected </c:if> >隐藏简历</option>
                                </select>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="zp_index_cont_right_bottom_middle">
                    <p><span>谁看过我的简历</span></p>
                    <ul>
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>个人看过你的简历</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>家企业HR查看过</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="zp_index_cont_right_bottom_bottom">
                    <p><span>每日投递数量</span></p>
                    <div>
                        <div class="zp_index_ww1"><span>0</span></div>
                        <div class="zp_index_ww2">
                            <p><a href="">今日已投递<span>0</span>个职位</a></p>
                            <p><span>0</span>每天最多投递50个</p>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

</body>
<script>
    var page;
    function serchPostion() {
        var aaa = $('#serchPostionButton').html();
        $('#serchPostionButton').html('<div class="spinner">' +
            '<div class="rect1"></div>' +
            '<div class="rect2"></div>' +
            '<div class="rect3"></div>' +
            '<div class="rect4"></div>' +
            '<div class="rect5"></div>' +
            '</div>');
        var serch = {};
        if ('${resume.resumeWorkspace}') {
            serch.workspace = '${resume.resumeWorkspace}';
        }
        if ('${resume.resumePosition}') {
            serch.likeStr = '${resume.resumePosition}';
        }
        if (page) {
            serch.page = page;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/Postion/selPostionIndexAjax.do",
            data: serch,
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.postionList.length; i++) {
                    var companyNature;//公司类别
                    if (data.postionList[i].company.companyNature == 1) {
                        companyNature = "国";
                    } else if (data.postionList[i].company.companyNature == 2) {
                        companyNature = "民";
                    } else if (data.postionList[i].company.companyNature == 3) {
                        companyNature = "外";
                    }
                    var salary;//薪资
                    if (data.postionList[i].postionMm == -1) {
                        salary = '面议';
                    } else if (data.postionList[i].postionMm == data.postionList[i].postionYm) {
                        salary = ((data.postionList[i].postionMm * 12 / 10000) + '').replace('.0', '') + '万';
                    } else {
                        salary = ((data.postionList[i].postionMm * 12 / 10000) + '').replace('.0', '') + '万-' + ((data.postionList[i].postionYm * 12 / 10000) + '').replace('.0', '') + '万';
                    }
                    var time;//发布时间
                    var date = new Date(data.postionList[i].postionTime);
                    time = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                    var fields = '';//领域
                    for (var j = 0; j < data.postionList[i].company.fields.length; j++) {
                        fields += data.postionList[i].company.fields[j].fieldName + "/";
                    }
                    var welfares = '';//福利
                    for (var j = 0; j < data.postionList[i].company.welfares.length; j++) {
                        welfares += '<span>' + data.postionList[i].company.welfares[j].welfareName + "</span>";
                    }

                    $('#postionRs').append(
                        '<li>' +
                        '<i><b>' + companyNature + '</b></i>' +
                        '<div class="zp_index_cont_left_zwtj_cont_left">' +
                        '<h4>' + data.postionList[i].postionName + '</h4>' +
                        '<p> <span>' + salary + '</span>&nbsp;&nbsp;|&nbsp;&nbsp;' + data.postionList[i].postionSpace + '&nbsp;&nbsp;|&nbsp;&nbsp;' + data.postionList[i].postionEducation + '及以上&nbsp;&nbsp;|&nbsp;&nbsp;' + data.postionList[i].postionExp + '</p>' +
                        '<span>' + time + '</span>' +
                        '</div>' +
                        '<div class="zp_index_cont_left_zwtj_cont_right">' +
                        '<p>' + data.postionList[i].company.companyName + '</p>' +
                        '<p>' + fields + '</p>' +
                        '<p class="zp_index_cont_bz">' + welfares + '</p>' +
                        '</div>' +
                        '</li>');

                }
                if (data.page == data.pages) {
                    $('#serchPostionButton').remove();
                } else {
                    page = data.page + 1;
                    $('#serchPostionButton').html(aaa);
                }
            }
        });
    }
    function toSerch() {
        if ($('#zp_index_xxk').val() == '') {
            $('#zp_index_xxk').val($('#zp_index_xxk').attr('placeholder'));
        }
    }
    function ysChange(ys) {
        var dd = {resumeId: '${resume.resumeId}', resumeYm: ys.value};
        console.log(dd);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/Resume/updateResume.do',
            contentType: "application/json",
            data: JSON.stringify(dd)
        });
    }
    function flashResume() {
        $.ajax({
            type: 'get',
            url: '${pageContext.request.contextPath}/Resume/flashResume.do',
            contentType: "application/json",
            data: {resumeId: '${resume.resumeId}'},
            success:function (data) {
                if(data.msg=='ok'){
                    var date = new Date(data.resumeFlash);//刷新简历时间
                    var completion = data.resumeCompletion;//完成度
                    $('#theFlash').html(getNowFormatDateSS(date));
                    alert("简历刷新成功");
                }
            }
        });
    }
    $(function () {
        serchPostion();
    })
</script>
</html>
