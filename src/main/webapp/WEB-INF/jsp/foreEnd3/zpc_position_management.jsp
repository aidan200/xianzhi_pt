<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/20
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/jedate.css">
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            background-color: #ffffff;
        }
        table {
            table-layout: fixed;
        }

    </style>
    <script>
        var companyId=1;        //公司Id
    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jeDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/position_management.js"></script>


</head>
<body style="background-color: #F0F0F0">

<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="pom_container">
    <div class="pom_allin">

        <!--上面标签-->
        <ul id="myTab" class="nav nav-tabs pom_tab">
            <li class="active">
                <a href="#pom_one" data-toggle="tab" class="pop_tab">
                    正在招聘
                </a>
            </li>
            <li><a href="#pom_two" data-toggle="tab">审核未通过</a></li>
            <li><a href="#pom_three" data-toggle="tab">草稿职位</a></li>
            <li><a href="#pom_five" data-toggle="tab">已暂停</a></li>
            <li><a href="#pom_six" data-toggle="tab">已结束</a></li>
            <li><a href="#pom_seven" data-toggle="tab">全部职位</a></li>
        </ul>

        <div class="pom_top">
            <div id="myTabContent" class="tab-content">

                <!--正在招聘-->
                <div class="tab-pane fade in active" id="pom_one">
                    <form action="">
                        <%--上面查询条件--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="职位名称">职位名称</option>
                            <option value="工作地点">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" id="xxk_01" type="button">搜索</button></span>
                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="fa-border table table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="160">职位名称</th>
                                    <th width="80">应聘人选</th>
                                    <th width="80">未处理</th>
                                    <th width="80">主动下载</th>
                                    <th width="80">意向沟通</th>
                                    <th width="80">刷新时间</th>
                                    <th width="80">结束时间</th>
                                    <th width="100">操作</th>
                                </tr>
                                </thead>
                                <tbody id="zzzp_tbody">
                                <tr>
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom101" class="choose2">
                                            <label for="pom101" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no"><a href="">web前端</a></td>
                                    <td class="all_no">10</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">3</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">0725</td>
                                    <td class="all_no">0726</td>
                                    <td class="all_no">
                                        <a href="javascript:" class="dg_xg">暂停</a>
                                        <a href="javascript:" class="dg_sc">结束</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom102" class="choose2">
                                            <label for="pom102" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no"><a href="">web前端</a></td>
                                    <td class="all_no">10</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">3</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">0725</td>
                                    <td class="all_no">0726</td>
                                    <td class="all_no">
                                        <a href="javascript:;">修改</a>
                                        <a href="javascript:;">删除</a>
                                    </td>
                                </tr>

                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="pom_bottom">
                                <input type="checkbox" class="qxan" name="choose1" onclick="DoCheck3(this)"/>
                                <button class="scan" type="button">删除</button>
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


                    <%--抱歉没有找到--%>
                    <%--<div class="comh_no2">--%>
                    <%--<div class="pom_allimg">--%>
                    <%--<img src="${pageContext.request.contextPath}/dist/foreEnd3/img/sfs.png" alt=""--%>
                    <%--class="rem_img">--%>
                    <%--<p class="all_p">抱歉没有找到符合条件的职位</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                </div>

                <!--审核未通过-->
                <div class="tab-pane fade" id="pom_two">
                    <form action="">

                        <%--条件查询--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="">职位名称</option>
                            <option value="">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" type="button">搜索</button></span>

                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="fa-border table table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="150">职位名称</th>
                                    <th width="100">审核时间</th>
                                    <th width="400">未通过原因</th>
                                    <th width="100">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom201" class="choose2">
                                            <label for="pom201" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no"><a href="">java</a></td>
                                    <td class="all_no">2017-07-26</td>
                                    <td class="all_no">工资太少了</td>
                                    <td class="all_no">
                                        <a href="javascript:;">修改</a>
                                        <a href="javascript:;">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="pom_bottom">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>删除</button>
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

                <!--草稿职位-->
                <div class="tab-pane fade" id="pom_three">
                    <form action="">

                        <%--条件查询--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="">职位名称</option>
                            <option value="">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" type="button">搜索</button></span>

                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="340">职位名称</th>
                                    <th width="200">创建</th>
                                    <th width="200">更新</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom301" class="choose2">
                                            <label for="pom301" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">
                                        <span>技术总监</span>
                                    </td>
                                    <td class="all_no">2017-07-19</td>
                                    <td class="all_no">2017-07-19</td>
                                    <td class="all_no"><a href="">修改</a>
                                        <a href="">预览</a>
                                        <a href="">发布</a>
                                        <a href="">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="pom_bottom">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>删除</button>
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


                <!--已暂停-->
                <div class="tab-pane fade" id="pom_five">
                    <form action="">

                        <%--条件查询--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="">职位名称</option>
                            <option value="">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" type="button">搜索</button></span>

                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="250">职位名称</th>
                                    <th width="80">应聘人选</th>
                                    <th width="80">主动下载</th>
                                    <th width="80">意向沟通</th>
                                    <th width="100">暂停时间</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom401" class="choose2">
                                            <label for="pom401" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">Java工程师</td>
                                    <td class="all_no">10</td>
                                    <td class="all_no">2</td>
                                    <td class="all_no">4</td>
                                    <td class="all_no">2017-07-19</td>
                                    <td class="all_no">
                                        <a href="">修改</a>
                                        <a href="">预览</a>
                                        <a href="">发布</a>
                                        <a href="">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <div class="pom_bottom">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>删除</button>
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

                <!--已结束-->
                <div class="tab-pane fade" id="pom_six">
                    <form action="">

                        <%--条件查询--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="">职位名称</option>
                            <option value="">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" type="button">搜索</button></span>

                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="300">职位名称</th>
                                    <th width="80">应聘人选</th>
                                    <th width="80">主动下载</th>
                                    <th width="80">推荐简历</th>
                                    <th width="80">意向沟通</th>
                                    <th width="100">结束时间</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom501" class="choose2">
                                            <label for="pom501" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">Java工程师</td>
                                    <td class="all_no">10</td>
                                    <td class="all_no">2</td>
                                    <td class="all_no">4</td>
                                    <td class="all_no">5</td>
                                    <td class="all_no">2017-07-19</td>
                                    <td class="all_no">
                                        <a href="javascript:;">预览</a>
                                        <a href="javascript:;">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="pom_bottom">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>删除</button>
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

                <!--全部职位-->
                <div class="tab-pane fade" id="pom_seven">
                    <form action="">
                        <%--条件查询--%>
                        <div class="pom_cen">
                        <span style="margin-left: 20px">
                        <span>关键字</span>
                        <select name="" id="" class="pom_input1">
                            <option value="">职位名称</option>
                            <option value="">工作地点</option>
                        </select>
                        <input type="text" placeholder="关键字" class="pom_input">
                        </span>

                            <span>
                        <span style="margin-left: 10px">发布日期</span>
                        <input type="text" class="pom_input">
                            <input type="text" class="pom_input">
                        </span>
                            <span>
                        <button class="pom_b" type="button">搜索</button></span>

                        </div>

                        <%--表格--%>
                        <div class="pom_table">
                            <table class="table fa-border table-striped" style="width: 100%">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="280">职位名称</th>
                                    <th width="120">职位状态</th>
                                    <th width="100">应聘人选</th>
                                    <th width="100">主动下载</th>
                                    <th width="100">意向沟通</th>
                                    <th width="150">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr class="pom_h">
                                    <td>
                                        <div class="checkboxWrapper theme3 extraSmallCheckboxSize">
                                            <input type="checkbox" id="pom601" class="choose2">
                                            <label for="pom601" style="font-weight: normal;margin-bottom: 0">
                                                <jsp:include page="checksvg.jsp"/>
                                            </label>
                                        </div>
                                    </td>
                                    <td class="all_no">Java工程师</td>
                                    <td class="all_no">已结束</td>
                                    <td class="all_no">4</td>
                                    <td class="all_no">2</td>
                                    <td class="all_no">6</td>
                                    <td class="all_no">
                                        <a href="javascript:;">预览</a>
                                        <a href="javascript:;">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                            <%--全选删除--%>
                            <div class="pom_bottom">
                                <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                                <button>删除</button>
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
