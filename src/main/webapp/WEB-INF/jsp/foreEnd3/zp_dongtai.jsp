<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/4
  Time: 8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<div class="pup_container">
    <div class="dot_allin">


        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#dot_one" data-toggle="tab" class="dot_tab">
                    我收藏的职位
                </a>
            </li>
            <li><a href="#dot_two" data-toggle="tab">谁查看了我的简历</a></li>
            <li><a href="#dot_three" data-toggle="tab">我关注的企业</a></li>
        </ul>

        <div class="dot_top">
            <div id="myTabContent" class="tab-content">

                <%--我收藏的职位--%>
                <div class="tab-pane fade in active" id="dot_one">
                    <div class="dot_top2">
                        <span class="dot_span">我收藏的职位（<span>10</span>）</span>
                    </div>

                    <%--每个公司列表--%>
                    <div class="dot_have">
                        <div class="dot_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="dot_head">
                            <div class="dot_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div>
                                    <span class="dot_sp" style="color: #fc6866;margin-left: 10px">10万</span>|
                                    <span class="dot_sp">沈阳</span>|
                                    <span class="dot_sp">1年经验</span>|
                                    <span class="dot_sp">本科</span>
                                </div>
                            </div>
                            <div class="dot_test3">
                                <div class="dot_t3s">吉林省江山网络科技公司</div>
                                <div class="dot_t3s" style="margin-top: 5px">互联网/移动联网/电子商务</div>
                                <span style="margin-left: 190px;color: #666">4小时前</span>
                            </div>
                            <div style="float: left;width: 100px;height: auto;overflow: hidden">
                                <button class="dot_but">取消收藏</button>

                            </div>
                        </div>

                        <div class="pop-right-bottom">
                            <b>国</b>
                        </div>
                    </div>
                    <div class="dot_have">
                        <div class="dot_left2">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="dot_head">
                            <div class="dot_test2">
                                <h4>网站美工/网页设计师</h4>
                                <div>
                                    <span class="dot_sp" style="color: #fc6866;margin-left: 10px">10万</span>|
                                    <span class="dot_sp">沈阳</span>|
                                    <span class="dot_sp">1年经验</span>|
                                    <span class="dot_sp">本科</span>
                                </div>
                            </div>
                            <div class="dot_test3">
                                <div class="dot_t3s">吉林省江山网络科技公司</div>
                                <div class="dot_t3s" style="margin-top: 5px">互联网/移动联网/电子商务</div>
                                <span style="margin-left: 190px;color: #666">4小时前</span>
                            </div>
                            <div style="float: left;width: 100px;height: auto;overflow: hidden">
                                <button class="dot_but">取消收藏</button>

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

                <%--谁查看了我的简历--%>
                <div class="tab-pane fade" id="dot_two">
                    <div class="dot_top2">
                    <span class="dot_span">谁看了我的简历（<span>10</span>）</span>
                </div>
                <div class="dot_have">
                    <div class="dot_left2">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                             class="dot_head">
                        <div class="dot_test2">
                            <h4>网站美工/网页设计师</h4>
                            <div>
                                <span class="dot_sp" style="color: #fc6866;margin-left: 10px">10万</span>|
                                <span class="dot_sp">沈阳</span>|
                                <span class="dot_sp">1年经验</span>|
                                <span class="dot_sp">本科</span>
                            </div>
                        </div>
                        <div class="dot_test3">
                            <div class="dot_t3s">吉林省江山网络科技公司</div>
                            <div class="dot_t3s" style="margin-top: 5px">互联网/移动联网/电子商务</div>
                            <span style="margin-left: 190px;color: #666">4小时前</span>
                        </div>
                        <div style="float: left;width: 100px;height: auto;overflow: hidden">
                            <button class="dot_but">查看</button>

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
                <%--<div class="pop_no">--%>
                <%--<div class="pop_allimg">--%>
                <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                <%--class="rem_img">--%>
                <%--<p class="all_p">暂无简历记录</p>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>

            <%--我关注的企业--%>
            <div class="tab-pane fade" id="dot_three">
                <div class="pop_top2">
                    <span class="comh_span">已查看（<span>10</span>）</span>
                </div>

                <div class="pop_tou">
                    <ul>
                        <li class="pop_tl">公司名：<span>发嘎达嘎梵蒂冈梵蒂冈大师国防大厦的风格</span></li>
                        <li class="pop_tl1">职位名：<span></span></li>
                        <li class="pop_tl2">查看时间：<span>2017-07-08</span></li>
                    </ul>
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
                <%--<div class="pop_no">--%>
                <%--<div class="pop_allimg">--%>
                <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                <%--class="rem_img">--%>
                <%--<p class="all_p">暂无简历记录</p>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>


        </div>
    </div>
</div>

</div>
</div>
</body>
</html>
