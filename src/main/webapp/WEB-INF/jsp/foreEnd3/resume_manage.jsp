<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/21
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            background-color: #ffffff;
        }
    </style>
    <script>
        $(document).ready(function () {
            $(".hamburger").click(function () {
                $(".rem_cen2").slideToggle(500);
            });

        });
    </script>

</head>
<body style="background-color: #F0F0F0">

<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="rem_container">
    <div class="rem_allin">

        <!--上面标签-->
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#rem_one" data-toggle="tab" class="rem_tab">
                    经理人应聘
                </a>
            </li>
            <li><a href="#rem_two" data-toggle="tab">推荐简历</a></li>
            <li><a href="#rem_three" data-toggle="tab">主动下载</a></li>
            <li><a href="#rem_four" data-toggle="tab">我的收藏</a></li>
            <li><a href="#rem_five" data-toggle="tab">意向沟通</a></li>
            <li><a href="#rem_six" data-toggle="tab">面试快</a></li>
            <li><a href="#rem_seven" data-toggle="tab">面试通知</a></li>
        </ul>

        <div class="rem_top">
            <div id="myTabContent" class="tab-content">

                <!--经理人应聘-->
                <div class="tab-pane fade in active" id="rem_one">
                    <form action="">
                        <div class="rem_cen">
                            <span style="margin-left: 20px">职位</span>
                            <select name="" id="" class="rem_input1">
                                <option value="">全部职位</option>
                                <option value=""></option>
                            </select>
                            <span style="margin-left: 10px">学历</span>
                            <select name="" id="" class="rem_input1">
                                <option value="">不限</option>
                                <option value="">博士</option>
                                <option value="">博士后</option>
                                <option value="">MBA/EMBA</option>
                                <option value="">硕士</option>
                                <option value="">本科</option>
                                <option value="">大专</option>
                            </select>
                            <input type="checkbox">及以上
                            <span style="margin-left: 10px">性别</span>
                            <select name="" id="" class="rem_input1">
                                <option value="">不限</option>
                                <option value="">男</option>
                                <option value="">女</option>

                            </select>
                            <span style="margin-left: 10px">姓名</span>
                            <input type="text" class="rem_input">
                            <button class="rem_b">搜索</button>
                            <button class="rem_b1">清空</button>
                            <div class="hamburger hamburger--elastic">
                                <div class="hamburger-box">
                                    <div class="hamburger-inner"></div>
                                </div>
                            </div>
                        </div>

                        <div class="rem_cen2">
                            <span style="margin-left: 20px">所在地</span>
                            <input type="text" class="rem_input3">
                            <span style="margin-left: 10px">年龄</span>
                            <input type="text" class="rem_input2">
                            <span>至</span>
                            <input type="text" class="rem_input2">
                            <span style="margin-left: 10px">工作年限</span>
                            <input type="text" class="rem_input2">
                            <span>至</span>
                            <input type="text" class="rem_input2">
                            <span style="margin-left: 20px">目前公司</span>
                            <input type="text" class="rem_input3">
                            <span style="margin-left: 20px">目前职位</span>
                            <input type="text" class="rem_input3">
                        </div>

                    </form>
                    <div class="rem_table">
                        <div class="rem_blue">
                            <a href="">未处理</a>
                            <a href="">目标人选</a>
                            <a href="">待定</a>
                            <a href="">不合适</a>
                            <a href="">被过滤的简历</a>
                        </div>

                        <div class="rem_no2">
                            <div class="rem_allimg">
                                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                                <p class="all_p"> 你暂时没有未处理的简历</p>
                            </div>
                        </div>
                        <div class="rem_bb">
                            <input type="checkbox" style="margin-left: 20px">
                            <button>导出简历</button>
                            <button>浏览简历</button>
                            <button>删除简历</button>
                            <button>收藏简历</button>
                            <button>批量标记</button>
                        </div>
                    </div>

                </div>

                <!--推荐简历-->
                <div class="tab-pane fade" id="rem_two">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input1">
                            <option value="">全部职位</option>
                            <option value=""></option>
                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">目前任职</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">目前公司</span>
                        <input type="text" class="rem_input3">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <div class="rem_blue">
                            <a href="">待处理 (<span>0</span>)</a>
                            <a href="">满意 (<span>0</span>)</a>
                            <a href="">暂不满意 (<span>0</span>)</a>
                            <a href="">全部推荐简历 (<span>0</span>)</a>
                        </div>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--主动下载-->
                <div class="tab-pane fade" id="rem_three">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input3">
                            <option value="">下载时间由近到远</option>
                            <option value="">下载时间由远到近</option>
                            <option value="">更新时间从近到远</option>
                            <option value="">更新时间从远到近</option>
                            <option value="">年龄从大到小</option>
                            <option value="">年龄从小到大</option>
                            <option value="">工作年限从长到短</option>
                            <option value="">工作年限从短到长</option>

                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">目前任职</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">目前公司</span>
                        <input type="text" class="rem_input3">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <table class="table fa-border">
                            <div class="rem_blue">

                            </div>
                        </table>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--我的收藏-->
                <div class="tab-pane fade" id="rem_four">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input3">
                            <option value="">下载时间由近到远</option>
                            <option value="">下载时间由远到近</option>
                            <option value="">更新时间从近到远</option>
                            <option value="">更新时间从远到近</option>
                            <option value="">年龄从大到小</option>
                            <option value="">年龄从小到大</option>
                            <option value="">工作年限从长到短</option>
                            <option value="">工作年限从短到长</option>

                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">目前任职</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">目前公司</span>
                        <input type="text" class="rem_input3">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="rem_tr">
                                <th width="50"><input type="checkbox"/></th>
                                <th width="100">姓名</th>
                                <th width="80">性别</th>
                                <th width="80">年龄</th>
                                <th width="100">学历</th>
                                <th width="130">目前职位</th>
                                <th width="220">目前公司</th>
                                <th width="100">收藏时间</th>
                                <th width="80">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--意向沟通-->
                <div class="tab-pane fade" id="rem_five">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input1">
                            <option value="">全部职位</option>
                            <option value=""></option>
                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">目前任职</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">目前公司</span>
                        <input type="text" class="rem_input3">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="rem_tr">
                                <th width="150">意向人选编号</th>
                                <th width="80">姓名</th>
                                <th width="80">性别</th>
                                <th width="80">年龄</th>
                                <th width="150">目前职位</th>
                                <th width="150">目前公司</th>
                                <th width="100">沟通职位</th>
                                <th width="100">职位地点</th>
                                <th width="200">意向度</th>
                                <th width="100">沟通时间</th>
                                <th width="80">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--面试快-->
                <div class="tab-pane fade" id="rem_six">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input1">
                            <option value="">全部职位</option>
                            <option value=""></option>
                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">目前任职</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">目前公司</span>
                        <input type="text" class="rem_input3">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="rem_tr">
                                <th width="100">人选编号</th>
                                <th width="80">姓名</th>
                                <th width="80">性别</th>
                                <th width="80">年龄</th>
                                <th width="100">学历</th>
                                <th width="130">目前职位</th>
                                <th width="130">目前公司</th>
                                <th width="130">面试职位</th>
                                <th width="130">职位地点</th>
                                <th width="100">状态</th>
                                <th width="100">推荐日期</th>
                                <th width="80">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--面试通知-->
                <div class="tab-pane fade" id="rem_seven">
                    <div class="rem_cen">
                        <span style="margin-left: 20px">查看</span>
                        <select name="" id="" class="rem_input1">
                            <option value="">全部职位</option>
                            <option value=""></option>
                        </select>

                        <span style="margin-left: 10px">简历编号</span>
                        <input type="text" class="rem_input3">
                        <span style="margin-left: 10px">姓名</span>
                        <input type="text" class="rem_input4">
                        <span style="margin-left: 10px">面试时间</span>
                        <input type="text" class="rem_input">
                        <button class="rem_b">搜索</button>

                    </div>
                    <div class="rem_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="rem_tr">
                                <th width="80">姓名</th>
                                <th width="80">性别</th>
                                <th width="80">年龄</th>
                                <th width="80">学历</th>
                                <th width="100">工作年限</th>
                                <th width="120">目前职位</th>
                                <th width="120">目前公司</th>
                                <th width="120">面试职位</th>
                                <th width="120">职位地点</th>
                                <th width="120">发送时间</th>
                                <th width="120">面试时间</th>
                                <th width="80">操作</th>

                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="rem_no2">
                        <div class="rem_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt="" class="rem_img">
                            <p class="all_p">抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    var forEach = function (t, o, r) {
        if ("[object Object]" === Object.prototype.toString.call(t))for (var c in t)Object.prototype.hasOwnProperty.call(t, c) && o.call(r, t[c], c, t); else for (var e = 0, l = t.length; l > e; e++)o.call(r, t[e], e, t)
    };

    var hamburgers = document.querySelectorAll(".hamburger");
    if (hamburgers.length > 0) {
        forEach(hamburgers, function (hamburger) {
            hamburger.addEventListener("click", function () {
                this.classList.toggle("is-active");
            }, false);
        });
    }
</script>
<!--<script>-->
<!--function DoCheck3(n) {-->
<!--// alert(n);-->
<!--var p1 = n.parentNode.parentNode;-->
<!--var ch = p1.getElementsByClassName("choose2");-->
<!--if (n.checked == true) {-->
<!--for (var i = 0; i < ch.length; i++) {-->
<!--ch[i].checked = true;-->
<!--}-->
<!--} else {-->
<!--for (var i = 0; i < ch.length; i++) {-->
<!--ch[i].checked = false;-->
<!--}-->
<!--}-->
<!--}-->
<!--</script>-->

</body>
</html>
