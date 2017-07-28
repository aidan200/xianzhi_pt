<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #F0F0F0">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<div class="pup_container">
    <div class="pop_allin">

        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#pop_one" data-toggle="tab" class="pop_tab">
                    全部状态
                </a>
            </li>
            <li><a href="#pop_two" data-toggle="tab">已投递</a></li>
            <li><a href="#pop_three" data-toggle="tab">已查看</a></li>
            <li><a href="#pop_four" data-toggle="tab">面试邀约</a></li>
        </ul>

        <div class="pop_top">
            <div id="myTabContent" class="tab-content">

                <%--全部状态--%>
                <div class="tab-pane fade in active" id="pop_one">
                    <div class="pop_top2">
                        <span class="pop_span">全部状态（<span>10</span>）</span>
                    </div>

                    <%--每个公司列表--%>
                    <div class="pop_have">
                        <div class="pop_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="pop_head">
                            <div class="pop_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div class="pop_in2">
                                    <span style="color: #fc6866">10万</span>|
                                    <span class="pop_sp">都有什么市呀哈哈</span>|
                                    <span>大专及以上</span>
                                </div>
                                <div class="pop_in3">
                                    <span>1年经验</span>
                                </div>

                            </div>
                        </div>
                        <div class="pop_right2">
                            <div class="pop_rt">
                                吉林省江山网络科技公司
                            </div>
                            <div class="pop_rt">
                                互联网/移动联网/电子商务
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>
                    <div class="pop_have">
                        <div class="pop_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="pop_head">
                            <div class="pop_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div class="pop_in2">
                                    <span style="color: #fc6866">10万</span>|
                                    <span>沈阳</span>|
                                    <span>大专及以上</span>|
                                    <span>1年经验</span>
                                </div>

                            </div>
                        </div>
                        <div class="pop_right2">
                            <div class="pop_rt">
                                吉林省江山网络科技公司
                            </div>
                            <div class="pop_rt">
                                互联网/移动联网/电子商务
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>
                    <div class="pop_have">
                        <div class="pop_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="pop_head">
                            <div class="pop_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div class="pop_in2">
                                    <span style="color: #fc6866">10万</span>|
                                    <span>沈阳</span>|
                                    <span>大专及以上</span>|
                                    <span>1年经验</span>
                                </div>

                            </div>
                        </div>
                        <div class="pop_right2">
                            <div class="pop_rt">
                                吉林省江山网络科技公司
                            </div>
                            <div class="pop_rt">
                                互联网/移动联网/电子商务
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>


                    <%--分页--%>
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
                            <div class="zp_page">共 <span>100</span> 页</div>
                        </div>
                    </div>
                </div>

                <%--已投递--%>
                <div class="tab-pane fade" id="pop_two">
                    <div class="pop_top2">
                        <span class="pop_span">已投递（<span>10</span>）</span>
                    </div>
                    <div class="pop_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <%--已查看--%>
                <div class="tab-pane fade" id="pop_three">
                    <div class="pop_top2">
                        <span class="comh_span">已查看（<span>10</span>）</span>
                    </div>
                    <div class="pop_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <%--面试邀约--%>
                <div class="tab-pane fade" id="pop_four">
                    <div class="pop_top2">
                        <span class="pop_span">面试邀约（<span>10</span>）</span>
                    </div>
                    <div class="pop_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">暂无简历记录</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>
<jsp:include page="behindforeEnd.jsp"/>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>
</body>
</html>
