<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/18
  Time: 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</div>

<script type="text/javascript">
    $(function () {
//        $a = $(window).height();
//        $("#left").height($a);
        $(".center_btn").click(function () {
            $(".all_center").animate({left: '-100px'});
            $(".center_btn").animate({left: '-150px'});
            $(".center_btn2").animate({left: '120px'});
            $("#all_right").animate({left: '0'});
        });
        $(".center_btn2").click(function () {
            $(".center_btn2").animate({left: '-50px'});
            $(".center_btn").animate({left: '120px'});
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
                $(".center_btn").animate({left: '120px'});
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
</script>
</body>
</html>