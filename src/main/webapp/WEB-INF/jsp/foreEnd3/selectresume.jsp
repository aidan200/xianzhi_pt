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
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
</head>
<body style="background-color: #f0f0f0">
<jsp:include page="headerforeEnd.jsp"/>
<div class="ses_top">
    <div class="container ses_select">
        <div class="ses_selectl">
            <span>默认</span>
        </div>
        <div class="ses_selectr">
            <form action="">
                <input type="text" placeholder="请输入职位关键词：如 项目经理等">
                <button type="submit">搜索</button>
            </form>
        </div>
    </div>
</div>

<section class="ses_center">
    <form action="" style="height: auto;overflow: hidden">
        <div class="ses_every">
            <div class="ses_one" id="name2">
                <div class="pull-left" style="width: 70px">学&emsp;&emsp;历：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a href="###" id="a1" class="divSmall5" rel="type1">本科</a></li>
                        <li><a href="###" id="a2" class="divSmall5" rel="type11">硕士</a></li>
                        <li><a href="###" id="a3" class="divSmall5" rel="type12">博士</a></li>
                        <li><a href="###" id="a4" class="divSmall5" rel="type13">MBA/EMBA</a></li>
                        <li><a href="###" id="a5" class="divSmall5" rel="type14">博士后</a></li>
                        <li><a href="###" id="a6" class="divSmall5" rel="type15">大专</a></li>
                    </ul>
                </div>
            </div>
            <div class="ses_one">
                <div class="pull-left" style="width: 70px">职&emsp;&emsp;能：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a href="###" id="b1" class="divSmall5" rel="type2">软件工程师</a></li>
                        <li><a href="###" id="b2" class="divSmall5" rel="type2">UI设计师</a></li>
                        <li><a href="###" id="b3" class="divSmall5" rel="type2">人力资源主管</a></li>
                        <li><a href="###" id="b4" class="divSmall5" rel="type2">移动开发工程师</a></li>
                        <li><a href="###" id="b5" class="divSmall5" rel="type2">产品经理</a></li>
                        <li><a href="###" id="b6" class="divSmall5" rel="type2">运营总监</a></li>
                        <li><a href="###" id="b7" class="divSmall5" rel="type2">软件工程师</a></li>
                        <li><a href="###" id="b8" class="divSmall5" rel="type2">UI设计师</a></li>
                        <li><a href="###" id="b9" class="divSmall5" rel="type2">人力资源主管</a></li>
                        <li><a href="###" id="b10" class="divSmall5" rel="type2">移动开发工程师</a></li>
                        <li><a href="###" id="b11" class="divSmall5" rel="type2">产品经理</a></li>
                        <li><a href="###" id="b12" class="divSmall5" rel="type2">运营总监</a></li>
                    </ul>
                </div>
            </div>
            <div class="ses_one">
                <div class="pull-left" style="width: 70px">年&emsp;&emsp;薪：</div>
                <div class="pull-left" style="width: 840px">
                    <ul>
                        <li><a href="###" id="c1" class="divSmall5" rel="type3">10-15万</a></li>
                        <li><a href="###" id="c2" class="divSmall5" rel="type3">15-20万</a></li>
                        <li><a href="###" id="c3" class="divSmall5" rel="type3">20-30万</a></li>
                        <li><a href="###" id="c4" class="divSmall5" rel="type3">50-100万</a></li>
                        <li><a href="###" id="c5" class="divSmall5" rel="type3">100万以上</a></li>
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
                                <%--<li><a href="###" id="d1" class="divSmall5" rel="type4">不限</a></li>--%>
                                <li><a href="###" id="d2" class="divSmall5" rel="type4">一年</a></li>
                                <li><a href="###" id="d3" class="divSmall5" rel="type4">三年</a></li>
                                <li><a href="###" id="d4" class="divSmall5" rel="type4">五年</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>年龄</a>
                            <ul>
                                <%--<li><a href="###" id="e1" class="divSmall5" rel="type5">不限</a></li>--%>
                                <li><a href="###" id="e2" class="divSmall5" rel="type5">18-22</a></li>
                                <li><a href="###" id="e3" class="divSmall5" rel="type5">23-30</a></li>
                                <li><a href="###" id="e4" class="divSmall5" rel="type5">31-40</a></li>
                                <li><a href="###" id="e5" class="divSmall5" rel="type5">41-50</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>性别</a>
                            <ul>
                                <%--<li><a href="###" id="f1" class="divSmall5" rel="type6">不限</a></li>--%>
                                <li><a href="###" id="f2" class="divSmall5" rel="type6">男</a></li>
                                <li><a href="###" id="f3" class="divSmall5" rel="type6">女</a></li>

                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>更新时间</a>
                            <ul>
                                <%--<li><a href="###" id="g1" class="divSmall5" rel="type7">不限</a></li>--%>
                                <li><a href="###" id="g2" class="divSmall5" rel="type7">一小时以内</a></li>
                                <li><a href="###" id="g3" class="divSmall5" rel="type7">一天以内</a></li>
                                <li><a href="###" id="g4" class="divSmall5" rel="type7">三天以内</a></li>
                                <li><a href="###" id="g5" class="divSmall5" rel="type7">一周以内</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>求职状态</a>
                            <ul>
                                <%--<li><a href="###" id="h1" class="divSmall5" rel="type8">不限</a></li>--%>
                                <li><a href="###" id="h2" class="divSmall5" rel="type8">在职</a></li>
                                <li><a href="###" id="h3" class="divSmall5" rel="type8">离职</a></li>

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
    </form>
    <div style="clear: both"></div>

    <div class="comh_have">
        <div class="comh_left">
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="comh_head">
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

        <div class="comh_right" style="width: 460px">
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
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="comh_head">
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

        <div class="comh_right" style="width: 460px">
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
            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt="" class="comh_head">
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

        <div class="comh_right" style="width: 460px">
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

</section>


<script type="text/javascript">
    $(document).ready(function () {
        $(".divSmall5").click(function () {
            var isAlreadyHave = false;
            var thisID = $(this).attr("id");
            var classType = $(this).attr("rel")
            $(".divSmall6").each(function () {
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
                    "background-color": "#3D9CCC",
                    "color": "white"
                });
                writeDiv($(this).html(), $(this).attr("id"), $(this).attr("rel"));
            }
        });
        $(".image").live('click', function () {
            goBegin($(this).parent().attr("rel"));
            $(this).parent().remove();
        });
    });
    //输出一个div
    function writeDiv(name, id, classONE) {
        var divShow = "<div class='divSmall6' rel='" + id + "' ttype='" + classONE + "'>" + name + "<span class='image fa fa-remove'></span></div>";
        $("#mainSelect5").html($("#mainSelect5").html() + divShow);
    }
    function goBegin(ID) {
        $("#" + ID).css({
            "background-color": "#FFFFFF",
            "color": "#666666"
        });
    }
</script>


</body>
</html>