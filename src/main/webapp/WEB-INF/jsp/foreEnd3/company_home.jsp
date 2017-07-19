<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 14:53
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

<div class="pup_container">
    <div class="pop_allin">


        <!--上面标签-->
        <ul id="myTab" class="nav nav-tabs comh_topul">
            <li class="active">
                <a href="#pop_one" data-toggle="tab" class="pop_tab">
                    新应聘简历
                </a>
            </li>
            <li><a href="#pop_two" data-toggle="tab">待处理的推荐简历</a></li>
            <li><a href="#pop_three" data-toggle="tab">意向沟通</a></li>
            <li><a href="#pop_four" data-toggle="tab">面试快</a></li>
        </ul>

        <div class="pop_top">
            <div id="myTabContent" class="tab-content">

                <!--新应聘简历-->
                <div class="tab-pane fade in active" id="pop_one">
                    <div class="comh_top">
                        <span class="comh_span">新应聘的简历（<span>10</span>）</span>
                    </div>

                    <div class="comh_have">
                        <div class="comh_left">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="comh_head">
                            <div class="comh_test">
                                <h4>金泰妍</h4>
                                <div class="comh_in">
                                    <span>女</span>|
                                    <span>28</span>|
                                    <span>沈阳</span>|
                                    <span>本科</span>|
                                    <span>1年经验</span>
                                </div>
                                <div style="margin-top: 10px;margin-left: 10px">
                                    <span>web前端</span>
                                </div>
                            </div>
                        </div>

                        <div class="comh_right">
                            <div class="comh_rt">
                                <span>2015-至今</span>|
                                <span>阿里巴巴有限公司</span>|
                                <span>资深产品经理</span>
                            </div>
                            <div class="comh_rt">
                                <span>2007-2011</span>|
                                <span>复旦大学</span>|
                                <span>信息管理与信息系统</span>|
                                <span>本科</span>
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                    </div>

                    <div class="comh_have">
                        <div class="comh_left">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="comh_head">
                            <div class="comh_test">
                                <h4>金泰妍</h4>
                                <div class="comh_in">
                                    <span>女</span>|
                                    <span>28</span>|
                                    <span>沈阳</span>|
                                    <span>本科</span>|
                                    <span>1年经验</span>
                                </div>
                                <div style="margin-top: 10px;margin-left: 10px">
                                    <span>web前端</span>
                                </div>
                            </div>
                        </div>

                        <div class="comh_right">
                            <div class="comh_rt">
                                <span>2015-至今</span>|
                                <span>阿里巴巴有限公司</span>|
                                <span>资深产品经理</span>
                            </div>
                            <div class="comh_rt">
                                <span>2007-2011</span>|
                                <span>复旦大学</span>|
                                <span>信息管理与信息系统</span>|
                                <span>本科</span>
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                    </div>

                    <div class="comh_have">
                        <div class="comh_left">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="comh_head">
                            <div class="comh_test">
                                <h4>金泰妍</h4>
                                <div class="comh_in">
                                    <span>女</span>|
                                    <span>28</span>|
                                    <span>沈阳</span>|
                                    <span>本科</span>|
                                    <span>1年经验</span>
                                </div>
                                <div style="margin-top: 10px;margin-left: 10px">
                                    <span>web前端</span>
                                </div>
                            </div>
                        </div>

                        <div class="comh_right">
                            <div class="comh_rt">
                                <span>2015-至今</span>|
                                <span>阿里巴巴有限公司</span>|
                                <span>资深产品经理</span>
                            </div>
                            <div class="comh_rt">
                                <span>2007-2011</span>|
                                <span>复旦大学</span>|
                                <span>信息管理与信息系统</span>|
                                <span>本科</span>
                            </div>
                            <div style="margin-top: 15px;margin-right: 10px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
                    </div>


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

                <!--待处理的推荐简历-->
                <div class="tab-pane fade" id="pop_two">
                    <div class="comh_top">
                        <span class="comh_span">待处理的推荐简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <!--意向沟通-->
                <div class="tab-pane fade" id="pop_three">
                    <div class="comh_top">
                        <span class="comh_span">意向沟通的简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <!--面试快-->
                <div class="tab-pane fade" id="pop_four">
                    <div class="comh_top">
                        <span class="comh_span">面试快的简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
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

<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>
</body>
</html>
