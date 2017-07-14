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
<div class="zp_lb_top">
    <div class="container zp_lb_ssk">
        <div class="zp_lb_ssk_left">
            <span>全国</span>
        </div>
        <div class="zp_lb_ssk_right">
            <form action="">
                <input type="text" placeholder="请输入职位关键词：如 项目经理等">
                <button type="submit">搜索</button>
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
                        <li><a href="###" rel="aspect" id="ww" class="divSmall"> 电子·通信·硬件</a></li>
                        <li><a href="###" rel="aspect2" id="xx" class="divSmall">互联网·电商</a></li>
                        <li><a href="###" rel="aspect3" id="yy" class="divSmall">网络游戏</a></li>
                        <li><a href="###" rel="aspect4" id="zz" class="divSmall">计算机软件</a></li>
                        <li><a href="###" rel="aspect5" id="aaa" class="divSmall">IT服务</a></li>
                        <li><a href="###" rel="aspect6" id="bbb" class="divSmall">通信服务</a></li>

                    </ul>
                </div>
            </div>

            <div style="clear: both"></div>
            <div class="zp_lb_cont_top_1">
                <div class="pull-left" style="width: 42px;color: #999">薪资：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li><a href="###" rel="type" id="aa" class="divSmall">10-15万</a></li>
                        <li><a href="###" rel="type" id="bb" class="divSmall">15-20万</a></li>
                        <li><a href="###" rel="type" id="cc" class="divSmall">20-30万</a></li>
                        <li><a href="###" rel="type" id="dd" class="divSmall">50-100万</a></li>
                        <li><a href="###" rel="type" id="ee" class="divSmall">100万以上</a></li>
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
                                <li><a href="###" rel="one" id="gg" class="divSmall">一天以内</a></li>
                                <li><a href="###" rel="one" id="hh" class="divSmall">三天以内</a></li>
                                <li><a href="###" rel="one" id="ii" class="divSmall">一周以内</a></li>
                                <li><a href="###" rel="one" id="jj" class="divSmall">一个月以内</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业规模</a>
                            <ul>
                                <li><a href="###" rel="three" id="oo" class="divSmall">50人以下</a></li>
                                <li><a href="###" rel="three" id="pp" class="divSmall">50-100人</a></li>
                                <li><a href="###" rel="three" id="qq" class="divSmall">100-500人</a></li>
                                <li><a href="###" rel="three" id="rr" class="divSmall">1000人以上</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业性质</a>
                            <ul>
                                <li><a href="###" rel="four" id="ss" class="divSmall">政府</a></li>
                                <li><a href="###" rel="four" id="tt" class="divSmall">事业单位</a></li>
                                <li><a href="###" rel="four" id="uu" class="divSmall">私企</a></li>
                                <li><a href="###" rel="four" id="vv" class="divSmall">国企</a></li>
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
                                    私
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
                                        ${p.postionMm*12/10000}万
                                    </c:when>
                                    <c:otherwise>
                                        ${p.postionMm*12/10000}万-${p.postionYm*12/10000}万
                                    </c:otherwise>
                                </c:choose>
                            </span>&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionExp}
                            </p>
                            <span><fmt:formatDate value="${p.postionTime}" pattern="yyyy-MM-dd"/></span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p>${p.company.companyName}</p>
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
                <%--<li>
                    <i><b>国</b></i>
                    <div class="zp_index_cont_left_zwtj_cont_left">
                        <h4>WEB前端研发工程师</h4>
                        <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                        <span>2017-06-08</span>
                    </div>
                    <div class="zp_index_cont_left_zwtj_cont_right">
                        <p>东软集团</p>
                        <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                        <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                    </div>
                </li>
                <li>
                    <i><b>外</b></i>
                    <div class="zp_index_cont_left_zwtj_cont_left">
                        <h4>WEB前端研发工程师</h4>
                        <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                        <span>2017-06-08</span>
                    </div>
                    <div class="zp_index_cont_left_zwtj_cont_right">
                        <p>东软集团</p>
                        <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                        <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                    </div>
                </li>--%>
            </ul>
            <div class="zp_botv">
                <div class="zp_pl">
                    <ul class="pagination zp_pa">
                        <li class="b"><a href="#">上一页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li class="a"><a href="#">2</a></li>
                        <li class="a"><a href="#">3</a></li>
                        <li class="a"><a href="#">4</a></li>
                        <li class="a"><a href="#">5</a></li>
                        <li class="a"><a href="#">下一页</a></li>
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
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端WEB前端WEB前端WEB前端WEB前端WEB前端</a></span>
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

</section>

<script type="text/javascript">
    $(document).ready(function () {
        $(".divSmall").click(function () {
            var isAlreadyHave = false;
            var thisID = $(this).attr("id");
            var classType = $(this).attr("rel");

            $(".divSmall2").each(function () {
                if ($(this).attr("rel") == thisID) {
                    isAlreadyHave = true;
                }
                if ($(this).attr("ttype") == classType) {
                    goBegin($(this).attr("rel"));
                    $(this).remove();
                }
            });

            if (!isAlreadyHave) {
                $(this).css({
                    "background-color": "#FFA500",
                    "color": "white"
                });
                writeDiv($(this).html(), $(this).attr("id"), $(this).attr("rel"));
            }
        });
        $(".zp_img").live('click', function () {
            goBegin($(this).parent().attr("rel"));
            $(this).parent().remove();
        });
    });
    //输出一个div
    function writeDiv(name, id, classONE) {
        var divShow = "<div class='divSmall2' rel='" + id + "' ttype='" + classONE + "'>" + name + "<span class='fa fa-remove zp_img'></span></div>";
        $("#mainSelect").html($("#mainSelect").html() + divShow);
    }
    function goBegin(ID) {
        $("#" + ID).css({
            "background-color": "transparent",
            "color": "#666666"
        });
    }
</script>


</body>
</html>