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
    <div class="row zp_lb_cont_top">
        <div class="zp_lb_cont_top_1">
            <div class="pull-left" style="width: 42px">薪资：</div>
            <div class="pull-left" style="width: 766px">
                <ul>
                    <li><a href="">10-15万</a></li>
                    <li><a href="">15-20万</a></li>
                    <li><a href="">20-30万</a></li>
                    <li><a href="">50-100万</a></li>
                    <li><a href="">100万以上</a></li>
                    <li><a href="">自定义</a></li>
                </ul>
            </div>
        </div>
        <div class="zp_lb_cont_top_2">
            <div class="pull-left" style="width: 42px">更多：</div>
            <div class="pull-left" style="width: 766px">
                <ul>
                    <li class="zp_lb_li">
                        <a >三天以内</a>
                        <ul>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                        </ul>
                    </li>
                    <li class="zp_lb_li">
                        <a >三天以内</a>
                        <ul>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                        </ul>
                    </li>
                    <li class="zp_lb_li">
                        <a >三天以内</a>
                        <ul>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                        </ul>
                    </li>
                    <li class="zp_lb_li">
                        <a >三天以内</a>
                        <ul>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                            <li><a href="">三天以内</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
        <div class="zp_lb_cont_top_3">
            <div class="zp_lb_cont_top_3_left">
                <span>已选条件：</span>
            </div>
            <div class="zp_lb_cont_top_3_right">
                <a href="">三天之内&nbsp;&nbsp;<span>x</span></a>
                <a href="">三天之内&nbsp;&nbsp;<span>x</span></a>
                <a href="">三天之内&nbsp;&nbsp;<span>x</span></a>
            </div>
            <div class="zp_lb_cont_top_3_right2">
                共找到 <span>10000+</span>职位
            </div>
        </div>
    </div>
    <div class="row zp_lb_cont_middle">
        <div class="col-md-8 zp_lb_cont_middle_left">
            <ul>
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
                            </span>&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionExp}</p>
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
            <div class="zp_lb_fy">
                <div></div>
                <a href="" class="fa fa-angle-double-left zp_lb_fy_a1"></a>
                <a href="" class="zp_lb_fy_a2">上一页</a>
                <div>
                    <a href="">1</a>
                    <a href="">22</a>
                    <a href="">333</a>
                </div>
                <a href="" class="zp_lb_fy_a2">下一页</a>
                <a href="" class="fa fa-angle-double-right zp_lb_fy_a1"></a>
                <form action="">
                    跳转到<input type="text">页
                    <button type="submit">确定</button>
                </form>
            </div>
        </div>
        <div class="col-md-4 zp_lb_cont_middle_right " style="padding-left: 30px;">
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





</body>
</html>