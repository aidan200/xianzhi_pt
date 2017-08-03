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
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/mapUtil.js" type="text/javascript"></script>

    <script src="${pageContext.request.contextPath}/dist/foreEnd3/lib/jquery/jquery-3.2.1.min.js"></script>
    <style>
        *{
            -webkit-box-sizing: inherit;
            -moz-box-sizing: inherit;
            box-sizing: inherit;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            var slideHeight = 70; // px
            var defHeight = $('.wrap2').height();
            if (defHeight >= slideHeight) {
                $('.wrap2').css('height', slideHeight + 'px');
                $('.read-more').append('<a href="###" class="new_a">点击展开更多详情</a>');
                $('.read-more .new_a').click(function () {
                    var curHeight = $('.wrap2').height();
                    if (curHeight == slideHeight) {
                        $('.wrap2').animate({
                            height: defHeight
                        }, "normal");
                        $('.read-more .new_a').html('点击隐藏');
//                        $('#gradient').fadeOut();
                    } else {
                        $('.wrap2').animate({
                            height: slideHeight
                        }, "normal");
                        $('.read-more .new_a').html('点击展开更多详情');
//                        $('#gradient').fadeIn();
                    }
                    return false;
                });
            }
        });
        $(function () {
            var slideHeight1 = 70; // px
            var defHeight1 = $('.wrap3').height();
            if (defHeight1 >= slideHeight1) {
                $('.wrap3').css('height', slideHeight1 + 'px');
                $('.read-more3').append('<a href="###" class="new_a3">点击展开更多详情</a>');
                $('.read-more3 .new_a3').click(function () {
                    var curHeight1 = $('.wrap3').height();
                    if (curHeight1 == slideHeight1) {
                        $('.wrap3').animate({
                            height: defHeight1
                        }, "normal");
                        $('.read-more3 .new_a3').html('点击隐藏');
//                        $('#gradient').fadeOut();
                    } else {
                        $('.wrap3').animate({
                            height: slideHeight1
                        }, "normal");
                        $('.read-more3 .new_a3').html('点击展开更多详情');
//                        $('#gradient').fadeIn();
                    }
                    return false;
                });
            }
        });
    </script>


</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<div class="zp_gsxq_bg"
     style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/gsxq_bg.jpg')"></div>
<section class="container zp_spxq_cont">
    <div class="row zp_spxq_cont_top">
        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_img1.png">
        <div>
            <h3><span>${xzCompany.companyName}</span> <a href="">关注</a>
                <div class="zp_gsxq_gzrs">121人关注</div>
            </h3>
            <ul>
                <c:forEach var="w1" items="${xzCompany.welfares}">
                    <li>${w1.welfareName}</li>
                </c:forEach>
                <li>更多...</li>
            </ul>
        </div>

    </div>
    <div class="row zp_spxq_cont_cont">
        <div style="width: 600px;float: left">
            <div class="zp_gsxq_gsjs">
                <h2 class="company-title">公司介绍</h2>
                <div class="wrap2">
                    <div>
                        ${xzCompany.companyIntro}
                    </div>
                </div>
                <div class="read-more"></div>
            </div>


            <div class="zp_gsxq_cpjs">
                <h2 class="product-title">产品介绍</h2>

                <%----%>
                <div class="wrap3">
                    <div>
                        我说还打客服哈困窘安徽科技发货快开始的风景好久发卡机打发卡夫卡开发家安全诶护肤支持女款企鹅
                        安琪儿移入蓬蓬裙of懒得看VB你你说的你说雅虎搜易1划分及爱好你吓唬俺谁真谁假额你洗涮沈你细化三年
                        沈设计巴菲赶赴案发hi在你家啊谁家的几番哈哈哈哈哈哈泥塑那你读哈大佛哦i你读书单杀你短信金额你签了了多少Ian
                        多少钱哈哈和哈佛豪富爱恩和我你你是事故皇后三个球 我说还打客服哈困窘安徽科技发货快开始的风景好久发卡机打发卡夫卡开发家安全诶护肤支持女款企鹅
                        安琪儿移入蓬蓬裙of懒得看VB你你说的你说雅虎搜易1划分及爱好你吓唬俺谁真谁假额你洗涮沈你细化三年
                        沈设计巴菲赶赴案发hi在你家啊谁家的几番哈哈哈哈哈哈泥塑那你读哈大佛哦i你读书单杀你短信金额你签了了多少Ian
                    </div>
                </div>
                <div class="read-more3"></div>
                <%----%>

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




            <form id="f1" action="${pageContext.request.contextPath}/CompanyInfo/selectByConditions.do">
                <div class="zp_gsxq_zpzw">
                    <h2>招聘职位<span>&nbsp;( 共${xzCompany.pcount}个 )</span></h2>
                    <div>
                        <div class="zp_gsxq_zpzw_left">
                            <select class="form-control" name="postionSpace" id="postionSpace">
                                <option value="">工作地点</option>
                                <c:forEach var="p2" items="${clist}">
                                    <c:if test="${p2.postionSpace!=null}">
                                        <option value="${p2.postionSpace}"
                                                <c:if test="${p2.postionSpace==xzPostion.postionSpace}">selected="selected"</c:if> >${p2.postionSpace}</option>
                                    </c:if>
                                </c:forEach>
                            </select>

                        </div>
                        <div class="zp_gsxq_zpzw_left" style="width: 250px">
                            <input type="text" name="postionName" class="form-control" placeholder="职位名称"
                                   value="${xzPostion.postionName}">
                        </div>
                        <div class="zp_gsxq_zpzw_left" style="width:auto; float: left; margin-left: 20px">
                            <button type="button" class="zp_but" onclick="sel()">确定</button>
                        </div>
                    </div>
                    <hr>
                    <ul>
                        <c:forEach var="po" items="${plist}">
                            <li>
                                <div class="zp_gsxq_zpzw_li_left">
                                    <p><a href="">${po.postionName}</a></p>
                                    <p><span>
                            ${fn:replace((po.postionMm*12/10000),".0","")}-${fn:replace((po.postionYm*12/10000),".0","")}万</span>&nbsp;&nbsp;${po.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${po.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${po.postionExp}工作经验
                                    </p>
                                    <p><span style="color: #999999; font-size: 10px;">23小时前 投递后：24小时反馈</span></p>
                                </div>
                                <div class="zp_gsxq_zpzw_li_right">
                                    <button type="button" class="btn btn-primary btn-large">立即应聘</button>
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
                            <input id="forPostionSpace" type="hidden" name="forPostionSpace">
                            <input id="infPage" type="hidden" name="page" value="${page}">
                            <input id="companyId" type="hidden" name="companyId" value="${xzCompany.companyId}">
                            <myPage:paging length="4" page="${page}" pages="${pages}"/>
                        </ul>
                        <div class="zp_page">共 <span>${pages}</span> 页</div>
                    </div>
                </div>
            </form>
        </div>

        <div class="zp_spxq_cont_right" style="width: 300px;float: left">
            <div class="zp_spxq_cont_right_cont">
                <div class="zp_spxq_cont_right_top">
                    <h2 class="base-title relative">投递查看
                        <hr>
                    </h2>
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
                        基本信息
                        <hr>
                    </h2>
                    <ul>
                        <li style="overflow: visible">行业：
                            <c:forEach var="f" items="${xzCompany.fields}" varStatus="s">
                                <span>${f.fieldName}</span>
                                <c:if test="${(s.index+1)%3==0}">
                                    <br>
                                </c:if>
                            </c:forEach></li>
                        <li>融资：<span>${xzCompany.financing}</span></li>
                        <li>规模：<span>${xzCompany.companyScale}人</span></li>
                        <li style="height: auto">地址：<span>${xzCompany.companyCity}</span><br>
                            <span>${xzCompany.companyLocation}</span><br>
                            <span>${xzCompany.companySpace}</span></li>
                    </ul>
                    <div id="zp_spxq_dts" class="zp_spxq_dt">
                    </div>
                </div>
                <div class="zp_spxq_cont_right_bottom">
                    <h2>
                        企业风采
                        <hr>
                    </h2>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/zp_gsxq_gsfc.png" alt="">
                    <h2>
                        企业风采
                        <hr>
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

<jsp:include page="behindforeEnd.jsp"/>


<script>
    function pToSub(page) {
        var infpage = parseInt(document.getElementById("infPage").value);
        if (page != infpage && page - infpage > 0 || page != infpage && page - infpage < 0) {
            document.getElementById("infPage").value = page;
            document.getElementById("f1").submit();
        }
    }
    function sel() {
        document.getElementById("infPage").value = 1;
        document.getElementById("f1").submit();
    }
    var postion = {};
    postion.container = "zp_spxq_dts";
    postion.x = '${xzCompany.companyX}';
    postion.y = '${xzCompany.companyY}';
    console.log(postion);
    var myMap = new myMap(postion);
    $(function () {
        myMap.init();
    })
</script>


</body>
</html>