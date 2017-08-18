<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/18
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Title</title>
</head>
<body>
<div class="header">
    <img src="${pageContext.request.contextPath}/dist/backEnd3/img/LOGOn.png" alt="Logo" class="home_logo">

    <ul class="home_username">
        <li class="dropdown">
            <a href="#" data-toggle="dropdown"><span class="fa fa-user"> ： </span><span>用户名</span></a>
            <ul class="dropdown-menu">
                <li><a href="###" class="home_uu">注销</a></li>
            </ul>
        </li>
    </ul>
</div>

<div class="clearfix"></div>

<div class="center">
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


    <!--内容-->
    <div class="right" id="all_right">
        <!--<div class="allblue">-->
        <!--<h4>业务总览</h4>-->
        <!--</div>-->

        <form action="" class="big">
            <div class="every_top">
                <h3>招聘中心</h3> <span>招聘中心</span> &nbsp;/ &nbsp;<span>个人首页</span>

            </div>
            <div style="font-size: 14px">

            </div>
            <div class="all_select">
                <input type="text" class="all_input" placeholder="按什么搜索">
                <input type="text" class="all_input" placeholder="按什么搜索">
                <input type="text" class="all_input" placeholder="按什么搜索">
                <input type="text" class="all_input" placeholder="按什么搜索">
                <button class="all_button" type="submit">搜索</button>
            </div>

            <div class="allform">

                <table class="table-fix table table-striped">
                    <thead>
                    <tr>
                        <th width="120">1</th>
                        <th width="120">2</th>
                        <th width="120">3</th>
                        <th width="120">4</th>
                        <th width="120">5</th>
                        <th width="120">6</th>
                        <th width="120">7</th>
                        <th width="120">8</th>
                        <th width="150">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td class="ww">金泰妍</td>
                        <td class="ww">郑秀妍</td>
                        <td class="ww">黄美英</td>
                        <td class="ww">金孝渊</td>
                        <td class="ww">权侑莉</td>
                        <td class="ww">崔秀英</td>
                        <td class="ww">林允儿</td>
                        <td class="ww">徐珠贤</td>
                        <td class="ww">
                            <a href="" class="all_a">分配</a>
                            <a href="" class="all_a">详情</a>
                            <a href="" class="all_a">修改</a>
                            <a href="#" class="all_a">下载</a></td>
                    </tr>
                    <tr>
                        <td class="ww">金泰妍</td>
                        <td class="ww">郑秀妍</td>
                        <td class="ww">黄美英</td>
                        <td class="ww">金孝渊</td>
                        <td class="ww">权侑莉</td>
                        <td class="ww">崔秀英</td>
                        <td class="ww">林允儿</td>
                        <td class="ww">徐珠贤</td>
                        <td class="ww">
                            <a href="" class="all_a">分配</a>
                            <a href="" class="all_a">详情</a>
                            <a href="" class="all_a">修改</a>
                            <a href="#" class="all_a">下载</a></td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </form>


        <!--分页符-->
        <ul class="pagination">
            <li><a href="#" class="a">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>


</div>
</body>
</html>
