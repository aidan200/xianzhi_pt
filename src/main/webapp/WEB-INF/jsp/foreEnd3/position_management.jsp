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
    <jsp:include page="distforeEnd.jsp"/>
    <style>
        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            background-color: #ffffff;
        }
    </style>

</head>
<body style="background-color: #F0F0F0">

<jsp:include page="headerforeEnd.jsp"/>

<div class="pup_container">
    <div class="pop_allin">

        <!--上面标签-->
        <ul id="myTab" class="nav nav-tabs pom_tab">
            <li class="active">
                <a href="#pom_one" data-toggle="tab" class="pop_tab">
                    正在招聘
                </a>
            </li>
            <li><a href="#pom_two" data-toggle="tab">审核未通过</a></li>
            <li><a href="#pom_three" data-toggle="tab">草稿职位</a></li>
            <li><a href="#pom_four" data-toggle="tab">保密职位</a></li>
            <li><a href="#pom_five" data-toggle="tab">已暂停</a></li>
            <li><a href="#pom_six" data-toggle="tab">已结束</a></li>
            <li><a href="#pom_seven" data-toggle="tab">全部职位</a></li>
        </ul>

        <div class="pom_top">
            <div id="myTabContent" class="tab-content">

                <!--正在招聘-->
                <div class="tab-pane fade in active" id="pom_one">
                    <form action="">
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
                        <button class="pom_b">搜索</button></span>

                        </div>
                    </form>
                    <div class="pom_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="pom_tr">
                                <th width="50"></th>
                                <th width="160">职位名称</th>
                                <th width="80">应聘人选</th>
                                <th width="80">未处理</th>
                                <th width="80">主动下载</th>
                                <th width="80">推荐简历</th>
                                <th width="80">意向沟通</th>
                                <th width="80">面试快</th>
                                <th width="80">职位推广</th>
                                <th width="80">刷新时间</th>
                                <th width="80">结束时间</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <div class="comh_no2">
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--审核未通过-->
                <div class="tab-pane fade" id="pom_two">
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
                        <button class="pom_b">搜索</button></span>

                    </div>
                    <div class="pom_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="pom_tr">
                                <th width="400">职位名称</th>
                                <th width="100">应聘人选</th>
                                <th width="100">主动下载</th>
                                <th width="100">推荐简历</th>
                                <th width="100">意向沟通</th>
                                <th width="100">面试快</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="comh_no2">
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--草稿职位-->
                <div class="tab-pane fade" id="pom_three">
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
                        <button class="pom_b">搜索</button></span>

                    </div>
                    <div class="pom_table">
                        <table class="table fa-border table-striped">
                            <thead>
                            <tr class="pom_tr">
                                <th width="50"></th>
                                <th width="540">职位名称</th>
                                <th width="150">创建</th>
                                <th width="150">更新</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            <tr class="pom_h">
                                <td><input type="checkbox" name="choose2" class="choose2" style="margin-left: 10px">
                                </td>
                                <td>
                                    <span>技术总监</span>
                                    <span style="color: #999;margin-left: 10px">沈阳市-和平区</span>
                                    (<span class="pom_s"><a href="">预览</a></span>
                                    <span class="pom_s"><a href="">发布</a></span>
                                    <span class="pom_s"><a href="">修改</a></span>)
                                </td>
                                <td>2017-07-19</td>
                                <td>2017-07-19</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="pom_bottom">
                            <input type="checkbox" name="choose1" onclick="DoCheck3(this)"/>
                            <button>删除</button>
                            <span style="float: right;margin: 15px;color: #999">共 <span>1个</span>职位</span>
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
                                <div class="zp_page">共 <span>38</span> 页</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--保密职位-->
                <div class="tab-pane fade" id="pom_four">
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
                        <button class="pom_b">搜索</button></span>

                    </div>

                    <div class="pom_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="pom_tr">
                                <th width="50"></th>
                                <th width="400">职位名称</th>
                                <th width="100">应聘人选</th>
                                <th width="100">主动下载</th>
                                <th width="100">推荐简历</th>
                                <th width="100">意向沟通</th>
                                <th width="100">面试快</th>
                            </tr>
                            </thead>
                        </table>

                    </div>
                    <div class="comh_no2">
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--已暂停-->
                <div class="tab-pane fade" id="pom_five">
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
                        <button class="pom_b">搜索</button></span>

                    </div>
                    <div class="comh_no2">
                        <div class="pom_table">
                            <table class="table fa-border">
                                <thead>
                                <tr class="pom_tr">
                                    <th width="50"></th>
                                    <th width="350">职位名称</th>
                                    <th width="100">应聘人选</th>
                                    <th width="100">主动下载</th>
                                    <th width="100">推荐简历</th>
                                    <th width="100">意向沟通</th>
                                    <th width="100">面试快</th>
                                    <th width="100">暂停时间</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--已结束-->
                <div class="tab-pane fade" id="pom_six">
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
                        <button class="pom_b">搜索</button></span>

                    </div>
                    <div class="pom_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="pom_tr">
                                <th width="50"></th>
                                <th width="350">职位名称</th>
                                <th width="100">应聘人选</th>
                                <th width="100">主动下载</th>
                                <th width="100">推荐简历</th>
                                <th width="100">意向沟通</th>
                                <th width="100">面试快</th>
                                <th width="100">结束时间</th>
                            </tr>
                            </thead>
                        </table>
                    </div>

                    <div class="comh_no2">
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
                </div>

                <!--全部职位-->
                <div class="tab-pane fade" id="pom_seven">
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
                        <button class="pom_b">搜索</button></span>

                    </div>
                    <div class="pom_table">
                        <table class="table fa-border">
                            <thead>
                            <tr class="pom_tr">
                                <th width="50"></th>
                                <th width="320">职位名称</th>
                                <th width="90">职位状态</th>
                                <th width="90">应聘人选</th>
                                <th width="90">主动下载</th>
                                <th width="90">推荐简历</th>
                                <th width="90">意向沟通</th>
                                <th width="90">面试快</th>
                                <th width="120">操作记录</th>
                            </tr>
                            </thead>
                        </table>

                    </div>

                    <div class="comh_no2">
                        <div class="pom_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pom_img2">
                            <p>抱歉没有找到符合条件的职位</p>
                        </div>
                    </div>
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
