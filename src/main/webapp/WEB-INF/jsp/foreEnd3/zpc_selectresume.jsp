<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/20
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="age" uri="/xianzhipt/ageTag" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
</head>
<body style="background-color: #f0f0f0">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="ses_top">
    <div class="container ses_select">
        <div class="ses_selectl">
            <span id="this_space">默认</span>
        </div>
        <div class="ses_selectr">
                <input type="text" placeholder="请输入职能关键词：如 项目经理等" id="resumePosition">
                <button type="submit" form="hidForm" onclick="p()">搜索</button>
        </div>
    </div>
</div>

<section class="ses_center">
        <div class="ses_every">
            <div class="ses_one" id="name2">
                <div class="pull-left" style="width: 70px">学&emsp;&emsp;历：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a  id="本科" class="divSmall5" rel="type1" inpName="educationLevel" inpValue="本科">本科</a></li>
                        <li><a  id="硕士" class="divSmall5" rel="type1" inpName="educationLevel" inpValue="硕士">硕士</a></li>
                        <li><a  id="博士" class="divSmall5" rel="type1" inpName="educationLevel" inpValue="博士">博士</a></li>
                        <li><a  id="博士后" class="divSmall5" rel="type1" inpName="educationLevel" inpValue="博士后">博士后</a></li>
                        <li><a  id="大专" class="divSmall5" rel="type1" inpName="educationLevel" inpValue="大专">大专</a></li>
                    </ul>
                </div>
            </div>
            <div class="ses_one">
                <div class="pull-left" style="width: 70px">领&emsp;&emsp;域：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a  id="教育培训" class="divSmall5" rel="type2" inpName="fieldName" inpValue="教育培训" >教育培训</a></li>
                        <li><a  id="游戏开发" class="divSmall5" rel="type2" inpName="fieldName" inpValue="游戏开发" >游戏开发</a></li>
                        <li><a  id="政府医疗" class="divSmall5" rel="type2"inpName="fieldName" inpValue="政府医疗" >政府医疗</a></li>
                        <li><a  id="电子商务" class="divSmall5" rel="type2"inpName="fieldName" inpValue="电子商务" >电子商务</a></li>
                        <li><a  id="社交通讯" class="divSmall5" rel="type2"inpName="fieldName" inpValue="社交通讯" >社交通讯</a></li>
                        <li><a  id="新闻资讯" class="divSmall5" rel="type2"inpName="fieldName" inpValue="新闻资讯" >新闻资讯</a></li>
                    </ul>
                </div>
            </div>
            <div class="ses_one">
                <div class="pull-left" style="width: 70px">年&emsp;&emsp;薪：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a  id="10-15万" class="divSmall5" rel="type3" inpName="resumeMm" inpValue="10-15万">10-15万</a></li>
                        <li><a  id="15-20万" class="divSmall5" rel="type3" inpName="resumeMm" inpValue="15-20万">15-20万</a></li>
                        <li><a  id="20-30万" class="divSmall5" rel="type3" inpName="resumeMm" inpValue="20-30万">20-30万</a></li>
                        <li><a  id="50-100万" class="divSmall5" rel="type3" inpName="resumeMm" inpValue="50-100万">50-100万</a></li>
                        <li><a  id="100万以上" class="divSmall5" rel="type3" inpName="resumeMm" inpValue="100万以上">100万以上</a></li>
                    </ul>
                </div>
            </div>


            <div class="ses_two">
                <div class="pull-left" style="width: 70px">其&emsp;&emsp;他：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li class="zp_lb_li">
                            <a>工作年限</a>
                            <ul>
                                <%--<li><a  id="d1" class="divSmall5" rel="type4">不限</a></li>--%>
                                <li><a  id="1" class="divSmall5" rel="type4" inpName="resumeIntentYm" inpValue="1" >一年</a></li>
                                <li><a  id="3" class="divSmall5" rel="type4" inpName="resumeIntentYm" inpValue="3">三年</a></li>
                                <li><a  id="5" class="divSmall5" rel="type4" inpName="resumeIntentYm" inpValue="5">五年</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>年龄</a>
                            <ul>
                                <%--<li><a  id="e1" class="divSmall5" rel="type5">不限</a></li>--%>
                                <li><a  id="18-22" class="divSmall5" rel="type5"  inpName="resumeBirth" inpValue="18-22">18-22</a></li>
                                <li><a  id="23-30" class="divSmall5" rel="type5"  inpName="resumeBirth" inpValue="23-30">23-30</a></li>
                                <li><a  id="31-40" class="divSmall5" rel="type5"  inpName="resumeBirth" inpValue="31-40">31-40</a></li>
                                <li><a  id="41-50" class="divSmall5" rel="type5"  inpName="resumeBirth" inpValue="41-50">41-50</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>性别</a>
                            <ul>
                                <%--<li><a  id="f1" class="divSmall5" rel="type6">不限</a></li>--%>
                                <li><a  id="男" class="divSmall5" rel="type6"  inpName="resumeSex" inpValue="男">男</a></li>
                                <li><a  id="女" class="divSmall5" rel="type6"  inpName="resumeSex" inpValue="女">女</a></li>

                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>更新时间</a>
                            <ul>
                                <%--<li><a  id="g1" class="divSmall5" rel="type7">不限</a></li>--%>
                                <li><a  id="1天" class="divSmall5" rel="type7" inpName="createTime" inpValue="1天">一天以内</a></li>
                                <li><a  id="3天" class="divSmall5" rel="type7" inpName="createTime" inpValue="3天">三天以内</a></li>
                                <li><a  id="7天" class="divSmall5" rel="type7" inpName="createTime" inpValue="7天">一周以内</a></li>
                                <li><a  id="30天" class="divSmall5" rel="type7" inpName="createTime" inpValue="30天">一个月以内</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>求职状态</a>
                            <ul>
                                <%--<li><a  id="h1" class="divSmall5" rel="type8">不限</a></li>--%>
                                <li><a  id="在职" class="divSmall5" rel="type8" inpName="resumeState" inpValue="在职">在职</a></li>
                                <li><a  id="离职" class="divSmall5" rel="type8" inpName="resumeState" inpValue="离职">离职</a></li>

                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
            <div style="clear: both"></div>
            <div class="ses_three">
                <div class="ses_tl">
                    <span>已选条件：</span>
                </div>
                <div class="ses_tr" id="mainSelect5">
                </div>
                <div class="ses_tr2">
                    共找到 <span>10000+</span>简历
                </div>
            </div>

        </div>

        <select name="" id="" style="float: right;margin: 10px 10px 0 10px;outline: none">
            <option value="">按更新时间</option>
            <option value="">按。。。</option>
            <option value="">按。。。</option>
            <option value="">按。。。</option>
        </select>
    <div style="clear: both"></div>
    <c:forEach var="r1" items="${resumeList}">
    <div class="ses_have">
        <div class="ses_left">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="comh_head">
            <div class="ses_test">
                <h4>${r1.resumeName}</h4>
                <div class="ses_in">
                    <span>${r1.resumeSex eq 0?'男':''}${r1.resumeSex eq 1?'女':''}</span>|
                    <span><age:getAge year="${r1.resumeBirth.year+1900}"/></span>|
                    <span>${r1.resumeWorkspace}</span>|
                    <c:forEach var="e1" items="${r1.xzResumeEducations}">
                    <span>${e1.educationLevel}</span>
                    </c:forEach>

                </div>
                <div style="margin-top: 10px;margin-left: 10px">
                    <span style="color: #fc6866;margin-right: 10px">${r1.resumeIntentPosition}</span>|
                    <span style="margin-left: 10px"><age:getAge year="${r1.resumeWorkinglife}"/>年经验</span>
                </div>
            </div>
        </div>

        <div class="ses_right">
            <div class="ses_rt">
                <c:forEach var="j3" items="${r1.jobExps}">
                <span><fmt:formatDate value="${j3.jobexpBeginTime}" pattern="yyyy.MM"/>-<fmt:formatDate value="${j3.jobexpEndTime}" pattern="yyyy.MM"/></span>|
                <span>${j3.jobexpCompanyName}</span>|
                <span>${j3.jobexpPostion}</span>
                </c:forEach>
            </div>
            <c:forEach var="e2" items="${r1.xzResumeEducations}">
            <div class="ses_rt">
                <span><fmt:formatDate value="${e2.enrollmentDate}" pattern="yyyy.MM"/>-<fmt:formatDate value="${e2.graduateDate}" pattern="yyyy.MM"/></span>|
                <span>${e2.educationSchool}</span>|
                <span>${e2.educationMajor}</span>|
                <span>${e2.educationLevel}</span>
            </div>
            </c:forEach>
            <div class="ses_time">
                <span><span>4</span>个小时前</span>
            </div>
        </div>
    </div>
    </c:forEach>

    <%--分页--%>
    <div class="zp_botv">
        <div class="zp_pl">
            <ul class="pagination zp_pa">
                <%--<li class="b"><a href="#">上一页</a></li>--%>
                <%--<li class="active"><a href="#">1</a></li>--%>
                <%--<li class="a"><a href="#">2</a></li>--%>
                <%--<li class="a"><a href="#">3</a></li>--%>
                <%--<li class="a"><a href="#">4</a></li>--%>
                <%--<li class="a"><a href="#">5</a></li>--%>
                <%--<li class="a"><a href="#">下一页</a></li>--%>
                <myPage:paging length="4" page="${page}" pages="${pages}"/>
            </ul>
            <div class="zp_page">共 <span>${pages}</span> 页</div>
        </div>
    </div>
</section>


<form id="hidForm" action="${pageContext.request.contextPath}/Resume/selResumeByConditions.do">
    <input id="infPage" type="hidden" name="page" value="${page}">
    <input id="Position" type="hidden" name="resumePosition">
    <input id="workspace" form="hidForm" type="hidden" name="workspace" value="" >
</form>

<jsp:include page="behindforeEnd.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $(".divSmall5").click(function () {
            var isAlreadyHave = false;
            var inputAlreadyHave = false;
            var thisID = $(this).attr("id");
            var classType = $(this).attr("rel");
            var inpName = $(this).attr("inpName");
            var inpValue = $(this).attr("inpValue");
            $(".divSmall6").each(function () {
                if ($(this).attr("rel") == thisID) {
                    isAlreadyHave = true;
                    inputAlreadyHave = true;
                }
                if ($(this).attr("ttype") == classType) {
                    goBegin($(this).attr("rel"));
                    $(this).remove();
                    removeMyInp($(this).attr("rel") + "inp")
                }
            });
            if (!isAlreadyHave) {
                $(this).css({
                    "background-color": "rgb(204,204,204)",
                    "color": "white"
                });
                writeDiv($(this).html(), $(this).attr("id"), $(this).attr("rel"), inpName, inpValue);
            }
        });
        $(".image").live('click', function () {
            goBegin($(this).parent().attr("rel"));
            removeMyInp($(this).attr("rel"));
            $(this).parent().remove();
        });
    });
    //输出一个div
    function writeDiv(name, id, classONE, inpName, inpValue) {
        var divShow = "<div class='divSmall6' rel='" + id + "' ttype='" + classONE + "'>" + name + "<span class='image fa fa-remove' rel='" + id + "inp'></span></div>";
        var inputShow = "<input id='" + id + "inp'  type='hidden'  name='" + inpName + "' value='" + inpValue + "'/>";
        $("#mainSelect5").html($("#mainSelect5").html() + divShow);
        $("#hidForm").html($("#hidForm").html() + inputShow);
    }
    function goBegin(ID) {
        $("#" + ID).css({
            "background-color": "#FFFFFF",
            "color": "#666666"
        });
    }
    function removeMyInp(id) {
        $("#" + id).remove();
    }
    function pToSub(page) {
        var infpage=parseInt(document.getElementById("infPage").value);
        if(page!=infpage&&page-infpage>0||page!=infpage&&page-infpage<0){
            document.getElementById("infPage").value=page;
            document.getElementById("hidForm").submit();
        }
    }
    function p() {
       var aa=$('#resumePosition').val();
       $('#Position').val(aa);
    }
</script>
<script>
    $(document).ready(function () {
        <c:forEach items="${flist}" var="fff">
        $('#${fff}').click();
    </c:forEach>});
    function pToSub(page) {
        var infpage=parseInt(document.getElementById("infPage").value);
        if(page!=infpage&&page-infpage>0||page!=infpage&&page-infpage<0){
            document.getElementById("infPage").value=page;
            document.getElementById("hidForm").submit();
        }
    }

</script>
<jsp:include page="cityUtil.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        if('${queryPostion.workspace}'){
            cityBoxInit('${queryPostion.workspace}');
        }
        if('后台的值'){
            $('#').val()
        }
    });
</script>
</body>
</html>