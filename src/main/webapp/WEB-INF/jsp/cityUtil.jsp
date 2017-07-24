<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/24
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id='zp_gsxq_bd_tck'>
    <div id='zp_gsxq_bd_tck_cont2'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择城市信息</span>
            <a class="pull-right gb"><span class="fa fa-close"></span></a>
        </div>

        <div class="zp_one"> 最多选择一项：<span id="div6"></span>
        </div>

        <%--热门城市--%>
        <div class="zp_gsxq_bd_tck_cont2_cont" style="padding-top: 10px">
            <div style="padding-left: 20px;height: 30px">热门城市</div>
            <ul class="zp_ul1">
                <li><a href="javascript:void(0)" class="hotCity">北京市</a></li>
                <li><a class="hotCity">上海市</a></li>
                <li><a class="hotCity">广州市</a></li>
                <li><a class="hotCity">深圳市</a></li>
                <li><a class="hotCity">天津市</a></li>
                <li><a class="hotCity">苏州市</a></li>
                <li><a class="hotCity">重庆市</a></li>
                <li><a class="hotCity">南京市</a></li>
                <li><a class="hotCity">杭州市</a></li>
                <li><a class="hotCity">大连市</a></li>
                <li><a class="hotCity">成都市</a></li>
                <li><a class="hotCity">武汉市</a></li>
            </ul>
        </div>

        <hr style="width: 90%;margin: 0 auto">

        <div id="div2"></div>
        <%--全部省份--%>
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <div style="padding-left: 20px">请选择省份</div>
            <ul class="zp_ul">
                <li><a class="cd-popup-trigger" onclick="change(1,this)">北京市</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(2,this)">广东省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(3,this)">山东省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(4,this)">江苏省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(5,this)">河南省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(6,this)">上海市</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(7,this)">河北省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(8,this)">浙江省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(9,this)">香港特别行政区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(10,this)">陕西省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(11,this)">湖南省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(12,this)">重庆市</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(13,this)">福建省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(14,this)">天津市</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(15,this)">云南省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(16,this)">四川省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(17,this)">广西壮族自治区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(18,this)">安徽省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(19,this)">海南省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(20,this)">江西省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(21,this)">湖北省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(22,this)">山西省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(23,this)">辽宁省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(24,this)">台湾省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(25,this)">黑龙江</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(26,this)">内蒙古自治区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(27,this)">澳门特别行政区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(28,this)">贵州省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(29,this)">甘肃省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(30,this)">青海省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(31,this)">新疆维吾尔自治区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(32,this)">西藏区</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(33,this)">吉林省</a></li>
                <li><a  class="cd-popup-trigger" onclick="change(34,this)">宁夏回族自治区</a></li>
            </ul>
            <script>
                function change(t, _self) {
                    var str = '<div style="padding-left: 20px">' + _self.innerHTML + '</div><ul class="zp_ul">';
                    for (var i = 0; i < map[t].length; i++) {
                        str += "<li><a onclick='got(" + t + "," + i + ")' class='ohoh'>" + map[t][i] + "</a></li>";
                    }
                    str += "</ul>"
                    var uul = document.getElementById("gggui");
                    uul.innerHTML = str;
                }
            </script>
        </div>


        <div class="zp_gsxq_bd_tck_bottom">
            <a class="zp_button1" onclick="theEnter()">确定</a>
            <button type="button" class="zp_button">取消</button>
        </div>

        <%--再一个弹出--%>
        <div class="cd-popup" role="alert">
            <div class="cd-popup-container">
                <div class="zp_gsxq_bd_tck_cont2_cont" id="gggui">
                    <%--<div style="padding-left: 20px" id="sheng123">江苏省</div>--%>
                    <%--<ul class="zp_ul">
                        &lt;%&ndash;<li><a href="">南京</a></li>
                        <li><a href="">常熟</a></li>
                        <li><a href="">盐城</a></li>&ndash;%&gt;
                    </ul>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
