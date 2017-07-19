<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_gsxq.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<div class="zp_gsxq_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/gsxq_bg.jpg')"></div>
<section class="container zp_spxq_cont">
    <div class="row zp_spxq_cont_top">
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_img1.png">
        <div>
            <h3><span>${xzCompany.companyName}</span> <a href="">关注</a> <div class="zp_gsxq_gzrs">121人关注</div></h3>
            <ul>
                <c:forEach var="w1" items="${xzCompany.welfares}">
                <li>${w1.welfareName}</li>
                </c:forEach>
                <li>更多...</li>
            </ul>
        </div>

    </div>
    <div class="row zp_spxq_cont_cont">
        <div class="col-md-8">
            <div class="zp_gsxq_gsjs">
                <h2 class="company-title">公司介绍</h2>
                <p class="profile" data-selector="detail" style="display: block;">
                    &nbsp; &nbsp;${xzCompany.companyIntro}</p>
                <a class="link-more" href="javascript:;" style="display: block;">点击展开更多详情</a>
            </div>
            <div class="zp_gsxq_cpjs">
                <h2 class="product-title">产品介绍</h2>
                <c:forEach var="p1" items="${xzCompany.products}">
                <dl class="clearfix" style="display: block;">
                    <dt><img src="https://image0.lietou-static.com/img/57d2632962f0550b9450e1d706a.jpg" alt=""></dt>
                    <dd>
                        <p data-selector="detail">${p1.productIntro}</p>
                    </dd>
                </dl>
                </c:forEach>
                <a class="link-more" href="javascript:;" style="display: block;">点击展开更多详情</a>
            </div>
            <form id="f1" action="/CompanyInfo/selectByConditions">
            <div class="zp_gsxq_zpzw">
                <h2>招聘职位<span>&nbsp;( 共${xzCompany.pcount}个 )</span></h2>
                <div>
                    <div class="zp_gsxq_zpzw_left">
                        <select class="form-control" name="postionSpace">
                            <option value="">工作地点</option>
                            <c:forEach var="p2" items="${plist}">
                                <option value="${p2.postionSpace}">${p2.postionSpace}</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width: 140px">
                        <select class="form-control">
                            <option>工作地点</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width: 250px">
                        <input type="text"  name="postionName" class="form-control"placeholder="职位名称">
                    </div>
                    <div class="zp_gsxq_zpzw_left" style="width:auto; float: right; margin-right: 0">
                        <button type="button" class="btn btn-primary" onclick="sel()">确定</button>
                    </div>
                </div>
                <hr>
                <ul>
                    <c:forEach var="po" items="${plist}">
                    <li>
                        <div class="zp_gsxq_zpzw_li_left">
                            <p><a href="">${po.postionName}</a></p>
                            <p><span>
                            ${fn:replace((po.postionMm*12/10000),".0","")}-${fn:replace((po.postionYm*12/10000),".0","")}万</span>&nbsp;&nbsp;${po.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${po.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${po.postionExp}工作经验 </p>
                            <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                        </div>
                        <div class="zp_gsxq_zpzw_li_right">
                            <button  type="button" class="btn btn-primary btn-large">立即应聘</button>
                        </div>
                    </li>
                    </c:forEach>

                </ul>
            </div>
            <div class="zp_botv">
                <div class="zp_pl">
                    <ul class="pagination zp_pa">
                                      <%-- <li class="b"><a href="#">上一页</a></li>
                                                <li class="active"><a href="#">1</a></li>
                                                <li class="a"><a href="#">2</a></li>
                                                <li class="a"><a href="#">3</a></li>
                                                <li class="a"><a href="#">4</a></li>
                                                <li class="a"><a href="#">5</a></li>
                                                <li class="a"><a href="#">下一页</a></li>--%>
                        <input id="infPage" type="hidden" name="page" value="${page}">
                        <input id="companyId" type="hidden" name="companyId" value="${xzCompany.companyId}">
                        <myPage:paging length="4" page="${page}" pages="${pages}"/>
                    </ul>
                    <div class="zp_page">共 <span>${pages}</span> 页</div>
                </div>
            </div>
            </form>
        </div>

        <div class="col-md-4 zp_spxq_cont_right" style=" padding-left: 20px;">
            <div class="zp_spxq_cont_right_cont">
                <div class="zp_spxq_cont_right_top">
                    <h2 class="base-title relative">投递查看<hr></h2>
                    <div>
                        <div>
                            <h3>90%</h3>
                            <span>简历查看率</span>
                        </div>
                        <div>
                            <h3>1天</h3>
                            <span>简历查看用时</span>
                        </div>
                    </div>
                </div>
                <div class="zp_spxq_cont_right_middle">
                    <h2>
                        基本信息<hr>
                    </h2>
                    <ul>
                        <li>行业：
                            <c:forEach  var="po" items="${xzCompany.postions}">
                                <span>${po.postionName}/</span>
                            </c:forEach></li>
                        <li>领域：<span>IT</span></li>
                        <li>融资：<span>${xzCompany.financing}</span></li>
                        <li>规模：<span>${xzCompany.companyScale}人</span></li>
                        <li style="height: auto">地址：<span>${xzCompany.companyLocation}</span></li>
                    </ul>
                    <div class="zp_spxq_dt" style="background-image: url('img/zp_gsxq_dt.png')">
                    </div>
                </div>
                <div class="zp_spxq_cont_right_bottom">
                    <h2>
                        企业风采<hr>
                    </h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_gsfc.png" alt="">
                    <h2>
                        企业风采<hr>
                    </h2>
                    <ul>
                        <c:forEach var="m1" items="${xzCompany.miens}">
                        <li>
                            <a href="">
                                ${m1.mienIntro}
                            </a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>



<script>
    function pToSub(page) {
        var infpage=parseInt(document.getElementById("infPage").value);
        if(page!=infpage){
            document.getElementById("infPage").value=page
            document.getElementById("f1").submit();
        }
    }
    function sel() {
        document.getElementById("infPage").value=1;
        document.getElementById("f1").submit();
    }

</script>


</body>
</html>