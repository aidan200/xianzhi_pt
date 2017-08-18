<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/18
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<%@ taglib prefix="age" uri="/xianzhipt/ageTag" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="dist.jsp"/>
</head>

<body>
<div class="all">
    <jsp:include page="foreEnd.jsp"/>

    <div class="center">
        <jsp:include page="nav.jsp"/>
        <!--内容-->
        <div class="right" id="all_right">
            <!--<div class="allblue">-->
            <!--<h4>业务总览</h4>-->
            <!--</div>-->

            <form action="${pageContext.request.contextPath}/Resume/selAllResume.emp" class="big" id="f1">
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
                            <th width="120">姓名</th>
                            <th width="120">性别</th>
                            <th width="120">年龄</th>
                            <th width="120">工作地点</th>
                            <th width="120">当前状态</th>
                            <th width="120">婚姻状况</th>
                            <th width="120">现在的职位</th>
                            <th width="120">简历完成度</th>
                            <th width="150">操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${list}" var="l1">
                        <tr>
                            <td class="ww">${l1.resumeName}</td>
                            <td class="ww">${l1.resumeSex eq 0?"男":''}${l1.resumeSex eq 1?"女":''}</td>
                            <td class="ww"><age:getAge year="${l1.resumeBirth.year+1900}"/></td>
                            <td class="ww">${l1.resumeWorkspace}</td>
                            <td class="ww">${l1.resumeState eq 0?"未工作":''}${l1.resumeState eq 1?"在职":''}${l1.resumeState eq 2?"离职":''}</td>
                            <td class="ww">${l1.resumeMarriage eq 0?"未婚":''}${l1.resumeMarriage eq 1?"已婚":''}${l1.resumeMarriage eq 2?"保密":''}</td>
                            <td class="ww">${l1.resumePosition}</td>
                            <td class="ww">${l1.resumeCompletion}</td>
                            <td class="ww">
                                <a href="" class="all_a">分配</a>
                                <a href="" class="all_a">详情</a>
                                <a href="" class="all_a">修改</a>
                                <a href="#" class="all_a">下载</a></td>
                        </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>



            <!--分页符-->
            <ul class="pagination">
                <%--<li><a href="#" class="a">&laquo;</a></li>--%>
                <%--<li class="active"><a href="#">1</a></li>--%>
                <%--<li><a href="#">2</a></li>--%>
                <%--<li><a href="#">3</a></li>--%>
                <%--<li><a href="#">4</a></li>--%>
                <%--<li><a href="#">5</a></li>--%>
                <%--<li><a href="#">&raquo;</a></li>--%>
                    <input id="infPage" type="hidden" name="page" value="${page}">
                    <myPage:paging length="8" page="${page}" pages="${pages}"/>
            </ul>
            </form>
        </div>


    </div>
</div>

<script type="text/javascript">
    $(function () {
//        $a = $(window).height();
//        $("#left").height($a);
        $(".center_btn").click(function () {
            $(".all_center").animate({left: '-100px'});
            $(".center_btn").animate({left: '-150px'});
            $(".center_btn2").animate({left: '105px'});
            $("#all_right").animate({left: '0'});
        });
        $(".center_btn2").click(function () {
            $(".center_btn2").animate({left: '-50px'});
            $(".center_btn").animate({left: '100px'});
            $(".all_center").animate({left: '0'});
            $("#all_right").animate({left: '110px'});
        });

        $(".all_t").click(function () {
            if($(".all_center").is(":hidden")){
                $(".all_center").fadeIn(500);
                $("#all_right").animate({left: '110px'});
            }else{
                $(".all_center").animate({left: '0'});
                $("#all_right").animate({left: '110px'});
                $(".center_btn2").animate({left: '-50px'});
                $(".center_btn").animate({left: '100px'});
            }

        });
    });

</script>
<script>
    var tab1 = document.getElementById('tab1'),
        tab2 = document.getElementById('tab2'),
        tab3 = document.getElementById('tab3'),
        c1 = document.getElementById('c1'),
        c2 = document.getElementById('c2'),
        c3 = document.getElementById('c3');

    function changeTab1() {
        tab1.className = 'selected';
        tab2.className = '';
        tab3.className = '';
        c1.className = 'show'
        c2.className = '';
        c3.className = '';
    }

    function changeTab2() {
        tab1.className = '';
        tab2.className = 'selected';
        tab3.className = '';
        c1.className = '';
        c2.className = 'show';
        c3.className = '';
    }

    function changeTab3() {
        tab1.className = '';
        tab2.className = '';
        tab3.className = 'selected';
        c1.className = ''
        c2.className = '';
        c3.className = 'show';
    }
    function pToSub(page) {
        var infpage = parseInt(document.getElementById("infPage").value);
        if (page != infpage && page - infpage > 0 || page != infpage && page - infpage < 0) {
            document.getElementById("infPage").value = page;
            document.getElementById("f1").submit();
        }
    }
</script>
</body>
</html>