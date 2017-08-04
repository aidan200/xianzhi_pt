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
    <script>
        var companyId = '${userLogin.company.companyId}';     //公司ID
        var path = '${pageContext.request.contextPath}/';     //全局路径
    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jeDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zpc_resume_manage.js"></script>
    <style>
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            background-color: #ffffff;
        }
    </style>

    <%--汉堡小按钮--%>
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

                        <%--条件搜索--%>
                        <div class="rem_cen">
                            <span style="margin-left: 20px">职位</span>
                            <select name="" id="" class="rem_input1">
                                <option value="全部职位">全部职位</option>
                                <option value="啦啦啦">啦啦啦</option>
                            </select>
                            <span style="margin-left: 10px">学历</span>
                            <select name="" id="" class="rem_input1">
                                <option value="不限">不限</option>
                                <option value="博士">博士</option>
                                <option value="博士后">博士后</option>
                                <option value="MBA/EMBA">MBA/EMBA</option>
                                <option value="硕士">硕士</option>
                                <option value="本科">本科</option>
                                <option value="大专">大专</option>
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
                            <button class="rem_b" type="button">搜索</button>
                            <button class="rem_b1" type="button">清空</button>
                            <div class="hamburger hamburger--elastic">
                                <div class="hamburger-box">
                                    <div class="hamburger-inner"></div>
                                </div>
                            </div>
                        </div>

                        <%--条件处理--%>
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

                        <%--表格--%>
                        <div class="rem_table">
                            <div class="rem_blue">
                                <a href="">未处理</a>
                                <a href="">目标人选</a>
                                <a href="">待定</a>
                                <a href="">不合适</a>
                                <a href="">被过滤的简历</a>
                            </div>
                            <table class="table fa-border table-striped" style="width: 100%;border-top:none ">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="100">姓名</th>
                                    <th width="60">性别</th>
                                    <th width="60">年龄</th>
                                    <th width="70">学历</th>
                                    <th width="90">工作年限</th>
                                    <th width="130">目前职位</th>
                                    <th width="130">目前公司</th>
                                    <th width="100">应聘职位</th>
                                    <th width="160">操作</th>
                                </tr>
                                </thead>

                                <tbody class="tbody">
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="rem101" class="choose2">
                                            <label for="rem101" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">本科</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">过滤</a>
                                        <a href="">待定</a>
                                        <a href="">不合适</a>
                                        <a href="">目标</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button type="button">导出简历</button>
                                <button type="button">浏览简历</button>
                                <button type="button">删除简历</button>
                                <button type="button">收藏简历</button>
                                <button type="button">批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>简历</span>
                            </div>

                            <%--分页--%>
                            <%--<div class="zp_botv">--%>
                                <%--<div class="zp_pl">--%>
                                    <%--<ul class="pagination zp_pa">--%>
                                        <%--<li class="b"><a href="#">上一页</a></li>--%>
                                        <%--<li class="active"><a href="#">1</a></li>--%>
                                        <%--<li class="a"><a href="#">2</a></li>--%>
                                        <%--<li class="a"><a href="#">3</a></li>--%>
                                        <%--<li class="a"><a href="#">4</a></li>--%>
                                        <%--<li class="a"><a href="#">5</a></li>--%>
                                        <%--<li class="a"><a href="#">下一页</a></li>--%>
                                    <%--</ul>--%>
                                    <%--<div class="zp_page">共 <span>38</span> 页</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                    </form>

                    <%--<div class="rem_no2">--%>
                    <%--<div class="rem_allimg">--%>
                    <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                    <%--class="rem_img">--%>
                    <%--<p class="all_p"> 你暂时没有未处理的简历</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                </div>

                <!--主动下载-->
                <div class="tab-pane fade" id="rem_three">
                    <form action="">

                        <%--条件查询--%>
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

                            <%--表格--%>
                        <div class="rem_table">
                            <table class="table fa-border table-striped" style="width: 100%;border-top:none ">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="100">姓名</th>
                                    <th width="60">性别</th>
                                    <th width="60">年龄</th>
                                    <th width="70">学历</th>
                                    <th width="130">目前职位</th>
                                    <th width="200">目前公司</th>
                                    <th width="100">应聘职位</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="rem201" class="choose2">
                                            <label for="rem201" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">本科</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">哈哈</a>
                                        <a href="">哈哈</a>
                                        <a href="">哈哈</a>
                                        <a href="">哈哈</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>导出简历</button>
                                <button>浏览简历</button>
                                <button>删除简历</button>
                                <button>收藏简历</button>
                                <button>批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>简历</span>
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
                                    <div class="zp_page">共 <span>38</span> 页</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!--我的收藏-->
                <div class="tab-pane fade" id="rem_four">
                    <form action="">

                        <%--条件搜索--%>
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

                        <%--表格--%>
                        <div class="rem_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="100">姓名</th>
                                    <th width="60">性别</th>
                                    <th width="60">年龄</th>
                                    <th width="100">学历</th>
                                    <th width="130">目前职位</th>
                                    <th width="200">目前公司</th>
                                    <th width="100">收藏时间</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="rem301" class="choose2">
                                            <label for="rem301" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">本科</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">预览</a>
                                        <a href="">删除</a>
                                        <a href="">这个</a>
                                        <a href="">那个</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>导出简历</button>
                                <button>浏览简历</button>
                                <button>删除简历</button>
                                <button>收藏简历</button>
                                <button>批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>职位</span>
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
                                    <div class="zp_page">共 <span>38</span> 页</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!--意向沟通-->
                <div class="tab-pane fade" id="rem_five">
                    <form action="">
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
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="80">人选编号</th>
                                    <th width="80">姓名</th>
                                    <th width="50">性别</th>
                                    <th width="50">年龄</th>
                                    <th width="110">目前职位</th>
                                    <th width="110">目前公司</th>
                                    <th width="110">沟通职位</th>
                                    <th width="60">意向度</th>
                                    <th width="90">沟通时间</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="res401" class="choose2">
                                            <label for="res401" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">001</td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">设计师</td>
                                    <td class="all_no">10</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">预览</a>
                                        <a href="">删除</a>
                                        <a href="">这个</a>
                                        <a href="">那个</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>导出简历</button>
                                <button>浏览简历</button>
                                <button>删除简历</button>
                                <button>收藏简历</button>
                                <button>批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>职位</span>
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
                                    <div class="zp_page">共 <span>38</span> 页</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!--面试快-->
                <div class="tab-pane fade" id="rem_six">
                    <form action="">
                        <%--条件搜索--%>
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

                        <%--表格--%>
                        <div class="rem_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="70">人选编号</th>
                                    <th width="70">姓名</th>
                                    <th width="50">性别</th>
                                    <th width="50">年龄</th>
                                    <th width="50">学历</th>
                                    <th width="100">目前职位</th>
                                    <th width="100">目前公司</th>
                                    <th width="100">面试职位</th>
                                    <th width="50">状态</th>
                                    <th width="80">推荐日期</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="rem501" class="choose2">
                                            <label for="rem501" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">001</td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">本科</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">设计师</td>
                                    <td class="all_no">在职</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">预览</a>
                                        <a href="">删除</a>
                                        <a href="">这个</a>
                                        <a href="">那个</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>导出简历</button>
                                <button>浏览简历</button>
                                <button>删除简历</button>
                                <button>收藏简历</button>
                                <button>批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>职位</span>
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
                                    <div class="zp_page">共 <span>38</span> 页</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <!--面试通知-->
                <div class="tab-pane fade" id="rem_seven">
                    <form action="">
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
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="rem_tr">
                                    <th width="50"></th>
                                    <th width="80">姓名</th>
                                    <th width="50">性别</th>
                                    <th width="50">年龄</th>
                                    <th width="50">学历</th>
                                    <th width="70">工作年限</th>
                                    <th width="100">目前职位</th>
                                    <th width="110">目前公司</th>
                                    <th width="100">面试职位</th>
                                    <th width="90">发送时间</th>
                                    <th width="90">面试时间</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="rem601" class="choose2">
                                            <label for="rem601" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">郑秀妍</td>
                                    <td class="all_no">女</td>
                                    <td class="all_no">28</td>
                                    <td class="all_no">本科</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">设计师发生尽快答复哈经费和巴基二环附近爱的嘎哈反抗军</td>
                                    <td class="all_no">小除号</td>
                                    <td class="all_no">设计师</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">2017-7-25</td>
                                    <td class="all_no">
                                        <a href="">预览</a>
                                        <a href="">删除</a>
                                        <a href="">这个</a>
                                        <a href="">那个</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="rem_bb">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>导出简历</button>
                                <button>浏览简历</button>
                                <button>删除简历</button>
                                <button>收藏简历</button>
                                <button>批量标记</button>
                                <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>职位</span>
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
                                    <div class="zp_page">共 <span>38</span> 页</div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="behindforeEnd.jsp"/>
<%--汉堡小按钮--%>
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
<script>
    function DoCheck3(n) {
        // alert(n);
        var p1 = n.parentNode.parentNode;
        var ch = p1.getElementsByClassName("choose2");
        if (n.checked == true) {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = true;
            }
        } else {
            for (var i = 0; i < ch.length; i++) {
                ch[i].checked = false;
            }
        }
    }
</script>
</body>
</html>
