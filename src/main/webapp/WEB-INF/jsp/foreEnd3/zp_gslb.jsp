<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>公司列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_lb.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>
<div class="zp_lb_top">
    <div class="container zp_lb_ssk">
        <div class="zp_lb_ssk_left">
            <div id="this_space" style="cursor: pointer">全国</div>
        </div>
        <div class="zp_lb_ssk_right">
            <form action="">
                <input id="workspace" form="hidForm" type="hidden" name="workspace" value="" >
                <input id="likeStr" form="hidForm" type="text" name="likeStr" placeholder="请输入职位关键词：如 项目经理等">
                <button form="hidForm"  type="submit">搜索</button>
            </form>
        </div>
    </div>
</div>
<section class="container zp_lb_cont">
    <form action="">
        <div class="row zp_lb_cont_top">

            <div class="zp_lb_cont_top_0">
                <div class="pull-left" style="width: 42px;color: #999">行业：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li><a  rel="aspect" id="教育培训" inpName="fields" inpValue="教育培训" class="divSmall">
                            教育培训</a></li>
                        <li><a  rel="aspect2" id="游戏开发" inpName="fields" inpValue="游戏开发"
                                class="divSmall">游戏开发</a></li>
                        <li><a  rel="aspect3" id="政府医疗" inpName="fields" inpValue="政府医疗"
                                class="divSmall">政府医疗</a></li>
                        <li><a  rel="aspect4" id="电子商务" inpName="fields" inpValue="电子商务"
                                class="divSmall">电子商务</a></li>
                        <li><a  rel="aspect5" id="社交通讯" inpName="fields" inpValue="社交通讯"
                                class="divSmall">社交通讯</a></li>
                        <li><a  rel="aspect6" id="新闻资讯" inpName="fields" inpValue="新闻资讯"
                                class="divSmall">新闻资讯</a></li>
                        <li><a  rel="aspect7" id="金融财务" inpName="fields" inpValue="金融财务"
                                class="divSmall">金融财务</a></li>
                        <li><a  rel="aspect8" id="娱乐应用" inpName="fields" inpValue="娱乐应用"
                                class="divSmall">娱乐应用</a></li>
                        <li><a  rel="aspect9" id="企业管理" inpName="fields" inpValue="企业管理"
                                class="divSmall">企业管理</a></li>
                    </ul>
                </div>
            </div>

            <div style="clear: both"></div>
            <div class="zp_lb_cont_top_1">
                <div class="pull-left" style="width: 42px;color: #999">薪资：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li><a  rel="type" id="s_x_10000" inpName="salary" inpValue="s_x_10000"
                                class="divSmall">12万以下</a></li>
                        <li><a  rel="type" id="s_10000_25000" inpName="salary" inpValue="s_10000_25000"
                                class="divSmall">12-30万</a></li>
                        <li><a  rel="type" id="s_25000_50000" inpName="salary" inpValue="s_25000_50000"
                                class="divSmall">30-60万</a></li>
                        <li><a  rel="type" id="s_50000_100000" inpName="salary" inpValue="s_50000_100000"
                                class="divSmall">60-120万</a></li>
                        <li><a  rel="type" id="s_100000_x" inpName="salary" inpValue="s_100000_x"
                                class="divSmall">120万以上</a></li>
                    </ul>
                </div>
            </div>
            <div class="zp_lb_cont_top_2">
                <div class="pull-left" style="width: 42px;color: #999">更多：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li class="zp_lb_li">
                            <a>发布时间</a>
                            <ul>
                                <li><a  rel="one" id="d_1" inpName="fadate" inpValue="d_1" class="divSmall">一天以内</a>
                                </li>
                                <li><a  rel="one" id="d_3" inpName="fadate" inpValue="d_3" class="divSmall">三天以内</a>
                                </li>
                                <li><a  rel="one" id="d_7" inpName="fadate" inpValue="d_7" class="divSmall">一周以内</a>
                                </li>
                                <li><a  rel="one" id="d_30" inpName="fadate" inpValue="d_30" class="divSmall">一个月以内</a>
                                </li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业规模</a>
                            <ul>
                                <li><a  rel="three" id="g_0-50" inpName="company_scale" inpValue="g_0-50"
                                        class="divSmall">50人以下</a></li>
                                <li><a  rel="three" id="g_50-500" inpName="company_scale" inpValue="g_50-500"
                                        class="divSmall">50-500人</a></li>
                                <li><a  rel="three" id="g_500-1000" inpName="company_scale"
                                        inpValue="g_500-1000" class="divSmall">500-1000人</a></li>
                                <li><a  rel="three" id="g_1000以上" inpName="company_scale" inpValue="g_1000以上"
                                        class="divSmall">1000人以上</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业性质</a>
                            <ul>
                                <li><a  rel="four" id="n_1" inpName="company_nature" inpValue="n_1"
                                        class="divSmall">国企</a></li>
                                <li><a  rel="four" id="n_2" inpName="company_nature" inpValue="n_2"
                                        class="divSmall">民营</a></li>
                                <li><a  rel="four" id="n_3" inpName="company_nature" inpValue="n_3"
                                        class="divSmall">外企</a></li>
                                <li><a  rel="four" id="n_4" inpName="company_nature" inpValue="n_4"
                                        class="divSmall">政府</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="zp_lb_cont_top_3">
                <div class="zp_lb_cont_top_3_left">
                    <span>已选条件：</span>
                </div>
                <div class="zp_lb_cont_top_3_right" id="mainSelect">
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                </div>
                <div class="zp_lb_cont_top_3_right2">
                    共找到 <span>10000+</span>职位
                </div>
            </div>
        </div>
    </form>
    <div class="row zp_lb_cont_middle">
        <div class="col-md-9 zp_lb_cont_middle_left">
            <ul class="zp_u">
                <c:forEach items="${postionList}" var="p">
                    <li>
                        <i><b>
                            <c:choose>
                                <c:when test="${p.company.companyNature=='1'}">
                                    国
                                </c:when>
                                <c:when test="${p.company.companyNature=='2'}">
                                    民
                                </c:when>
                                <c:when test="${p.company.companyNature=='3'}'">
                                    外
                                </c:when>
                            </c:choose>
                        </b></i>
                        <div class="zp_index_cont_left_zwtj_cont_left">
                            <h4>${p.postionName}</h4>
                            <p> <span>
                                <c:choose>
                                    <c:when test="${p.postionMm==p.postionYm}">
                                        ${fn:replace((p.postionMm*12/10000),".0","")}万
                                    </c:when>
                                    <c:otherwise>
                                        ${fn:replace((p.postionMm*12/10000),".0","")}万-${fn:replace((p.postionYm*12/10000),".0","")}万
                                    </c:otherwise>
                                </c:choose>
                            </span>&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionExp}
                            </p>
                            <span><fmt:formatDate value="${p.postionTime}" pattern="yyyy-MM-dd"/></span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p><a href="${pageContext.request.contextPath}/CompanyInfo/selCompanyInf.do?companyId=${p.company.companyId}">${p.company.companyName}</a></p>
                            <p>
                                <c:forEach items="${p.company.fields}" var="f">
                                    ${f.fieldName}
                                    <c:choose>
                                        <c:when test="${status.index==2}">

                                        </c:when>
                                        <c:otherwise>
                                            ,
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </p>
                            <p class="zp_index_cont_bz">
                                <c:forEach items="${p.company.welfares}" var="w">
                                    <span>${w.welfareName}</span>
                                    <c:if test="${status.index==2}">
                                        <c:set var="exitId" value="0"></c:set>
                                    </c:if>
                                </c:forEach>
                            </p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="zp_botv">
                <div class="zp_pl">
                    <ul class="pagination zp_pa">
                        <myPage:paging length="10" page="${page}" pages="${pages}"/>
                    </ul>
                    <div class="zp_page">共 <span>38</span> 页</div>
                </div>
            </div>
        </div>
        <div class="col-md-3 zp_lb_cont_middle_right " style="padding-left: 15px;">
            <div class="zp_rt">
                <h4>最近浏览</h4>
                <ul>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">WEB前端</a>
                            <span class="zp_na2"><a href="">上海融链科技有限公司</a></span>
                        </div>
                    </li>


                </ul>

            </div>
            <ul>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb1.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb2.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb3.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb4.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb1.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb2.png')"></li>
            </ul>
        </div>
    </div>
    <form id="hidForm" action="${pageContext.request.contextPath}/Postion/selPostionIndex.do"></form>
</section>

<%--添加上面一堆标签--%>
<script type="text/javascript">
    $(document).ready(function () {
        $(".divSmall").click(function () {
            var isAlreadyHave = false;
            var inputAlreadyHave = false;
            var thisID = $(this).attr("id");
            var classType = $(this).attr("rel");
            var inpName = $(this).attr("inpName");
            var inpValue = $(this).attr("inpValue");

            $(".divSmall2").each(function () {
                if ($(this).attr("rel") == thisID) {
                    isAlreadyHave = true
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
                    "background-color": "#FFA500",
                    "color": "white"
                });
                writeDiv($(this).html(), $(this).attr("id"), $(this).attr("rel"), inpName, inpValue);

            }
        });
        $(".zp_img").live('click', function () {
            goBegin($(this).parent().attr("rel"));
            removeMyInp($(this).attr("rel"));
            $(this).parent().remove();
        })
    });
    //输出一个div
    function writeDiv(name, id, classONE, inpName, inpValue) {
        var divShow = "<div class='divSmall2' rel='" + id + "' ttype='" + classONE + "'>" + name + "<span class='fa fa-remove zp_img' rel='" + id + "inp'></span></div>";
        var inputShow = "<input id='" + id + "inp'  type='hidden'  name='" + inpName + "' value='" + inpValue + "'/>";
        $("#mainSelect").html($("#mainSelect").html() + divShow);
        $("#hidForm").html($("#hidForm").html() + inputShow);
    }
    function goBegin(ID) {
        $("#" + ID).css({
            "background-color": "transparent",
            "color": "#666666"
        });
    }
    function removeMyInp(id) {
        $("#" + id).remove();
    }
</script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/maini.js"></script>
<jsp:include page="cityUtil.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        <c:forEach items="${queryPostion.alist}" var="al">
        $('#${al}').click();
        </c:forEach>
        if('${queryPostion.workspace}'){
            cityBoxInit('${queryPostion.workspace}');
        }
        if('${queryPostion.likeStr}'){
            $('#likeStr').val('${queryPostion.likeStr}');
        }
    });

</script>
</body>
</html>