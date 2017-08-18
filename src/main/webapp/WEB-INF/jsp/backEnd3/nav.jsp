<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/18
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>导航</title>
</head>
<body>

<!--导航-->
<div class="left" id="all_left">
    <div class="left_in">
        <div class="nav1">
            <div class="panel-group" id="accordion">
                <!---->
                <div class="panel panel-default">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseOne" class="nav_all">
                        <span class="fa fa-"></span>在线直播
                    </a>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="nav_ul">
                                <li class="home_nav"><a href="###" id="tab1" onclick="changeTab1()"
                                                        class="all_t">1</a></li>
                                <li class="home_nav"><a href="###" id="tab2" onclick="changeTab2()"
                                                        class="all_t">2</a></li>
                                <li class="home_nav"><a href="###" id="tab3" onclick="changeTab3()"
                                                        class="all_t">3</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!---->
                <div class="panel panel-default">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseTwo" class="nav_all">
                        会员中心
                    </a>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>
                                <li class="home_nav"><a href="">1</a></li>
                                <li class="home_nav"><a href="">2</a></li>
                                <li class="home_nav"><a href="">3</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!---->
                <div class="panel panel-default">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseThree" class="nav_all">
                        先知社区
                    </a>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>
                                <li class="home_nav"><a href="###">1</a></li>
                                <li class="home_nav"><a href="###">2</a></li>
                                <li class="home_nav"><a href="###">3</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!---->
                <div class="panel panel-default">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFour" class="nav_all">
                        招聘中心
                    </a>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>
                                <li class="home_nav"><a href="###">1</a></li>
                                <li class="home_nav"><a href="###">2</a></li>
                                <li class="home_nav"><a href="###">3</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!---->
                <div class="panel panel-default">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseFive" class="nav_all">
                        活动中心
                    </a>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul>
                                <li class="home_nav"><a href="###">1</a></li>
                                <li class="home_nav"><a href="###">2</a></li>
                                <li class="home_nav"><a href="###">3</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!---->
            </div>
        </div>
    </div>
</div>
<!--导航结束-->

<!--隐藏的三级菜单-->
<div class="all_center">
    <div id="c1">
        <button class="center_arrow center_btn">
            <span class="fa fa-chevron-left"></span>
        </button>
        <button class="center_arrow center_btn2">
            <span class="fa fa-chevron-right"></span>
        </button>
        <ul class="center_ul">
            <li><a href="">one</a></li>
            <li><a href="">two</a></li>
            <li><a href="">three</a></li>
            <li><a href="">four</a></li>
            <li><a href="">five</a></li>
        </ul>
    </div>
    <div id="c2"><button class="center_arrow center_btn">
        <span class="fa fa-chevron-left"></span>
    </button>
        <button class="center_arrow center_btn2">
            <span class="fa fa-chevron-right"></span>
        </button>
        <ul class="center_ul">
            <li><a href="">one</a></li>
            <li><a href="">two</a></li>
            <li><a href="">three</a></li>
            <li><a href="">four</a></li>
            <li><a href="">five</a></li>
        </ul></div>
    <div id="c3"><button class="center_arrow center_btn">
        <span class="fa fa-chevron-left"></span>
    </button>
        <button class="center_arrow center_btn2">
            <span class="fa fa-chevron-right"></span>
        </button>
        <ul class="center_ul">
            <li><a href="">one</a></li>
            <li><a href="">two</a></li>
            <li><a href="">three</a></li>
            <li><a href="">four</a></li>
            <li><a href="">five</a></li>
        </ul></div>
</div>


</body>
</html>
