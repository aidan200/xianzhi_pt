<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/24
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myPage" uri="/xianzhiOA/pageTag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>全国</title>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
    <script>
        var cityRollBack;
        $(function () {
            //   省市联动开始
            $("#this_space").on('click', function () {                            //点击事件
                var width = $(window).width();
                $('#zp_gsxq_bd_tck').css({
                    "display": "block",
                    "width": width,
                });
                $("#zp_gsxq_bd_tck_cont2").css({
                    "display": "block"
                });
                $('#zp_gsxq_bd_tck_cont2').animate({
                    "width": "700",
                    "height": "650"
                })
            });
            $('.zp_gsxq_bd_tck_bottom > a').on("click", function () {         //确认
                var a = $('.zp_gsxq_bd_tck_cont2_cont select').eq(0).find("option:selected").text();
                var b = $('.zp_gsxq_bd_tck_cont2_cont select').eq(1).find("option:selected").text();
                $('.zp_lb_ssk_left span').html(a + "/" + b);
                $('#zp_gsxq_bd_tck').css({
                    "display": "none"
                });
                $(this).parent().parent().css({
                    "display": "none",
                    "width": "0",
                    "height": "0"
                })
            });
            $('.zp_gsxq_bd_tck_bottom > button').on("click", function () {   //取消
                $('#zp_gsxq_bd_tck').css({
                    "display": "none"
                });
                $(this).parent().parent().css({
                    "display": "none",
                    "width": "0",
                    "height": "0"
                })
            });
            $('.zp_gsxq_bd_tck_top > a').on("click", function () {   //取消
                $('#zp_gsxq_bd_tck').css({
                    "display": "none"
                });
                $(this).parent().parent().css({
                    "display": "none",
                    "width": "0",
                    "height": "0"
                })
            });
            $('.cd-popup-trigger').on('click',function () {
                var t = $(this).attr("adata");
                var str = '<div style="padding-left: 20px">' + this.innerHTML + '</div><ul class="zp_ul">';
                 for (var i = 0; i < map[t].length; i++) {
                 str += "<li><a onclick='got(\""+this.innerHTML+"\"," + t + "," + i + ")' class='ohoh'>" + map[t][i] + "</a></li>";
                 }
                 str += "</ul>"
                 var uul = document.getElementById("gggui");
                 uul.innerHTML = str;
                $('.cd-popup').addClass('is-visible');
            })
            $('.hotCity').on('click', function (event) {
                var div6 = document.getElementById("div6");
                div6.innerHTML = $(this).html();
                $('.cd-popup').removeClass('is-visible');
                div6.style.background = '#FC9A2F';
            });
        })
            function got(sheng,t, i) {
                var div6 = document.getElementById("div6");
                //div6.innerHTML = sheng+"-"+map[t][i];
                div6.innerHTML = map[t][i];
                $('.cd-popup').removeClass('is-visible');
                div6.style.background = '#FC9A2F';
            }
            function theEnter() {
                var div6 = document.getElementById("div6");
                var str = div6.innerHTML;
                cityBoxInit(str);
            }
            function cityBoxInit(val) {
                var space = document.getElementById('this_space');
                if(space.tagName=="INPUT"){
                    space.value = val;
                }else{
                    /*if(val.split("-").length>1){
                        space.innerHTML = val.split("-")[1];
                    }else{
                    }*/
                    space.innerHTML = val;
                    $('#workspace').val(val);
                }
                var div6 = document.getElementById("div6")
                div6.style.background = '#FC9A2F';
                div6.innerHTML = val;
                if(cityRollBack){
                    cityRollBack();
                }
            }

    </script>
    <script type="text/javascript">
        var map = ['', ['朝阳区', '海淀区', '通州区', '房山区', '丰台区', '昌平区', '大兴区', '顺义区', '西城区', '延庆县', '石景山区', '宣武区', '怀柔区', '崇文区', '密云县', '东城区', '平谷区', '门头沟区'],

            ['东莞市', '广州市', '中山市', '深圳市', '惠州市', '江门市', '珠海市', '汕头市', '佛山市', '湛江市', '河源市', '肇庆市', '清远市', '潮州市', '韶关市', '揭阳市', '阳江市', '梅州市', '云浮市', '茂名市', '汕尾市'],

            ['济南市', '青岛市', '临沂市', '济宁市', '菏泽市', '烟台市', '淄博市', '泰安市', '潍坊市', '日照市', '威海市', '滨州市', '东营市', '聊城市', '德州市', '莱芜市', '枣庄市'],

            ['苏州市', '徐州市', '盐城市', '无锡市', '南京市', '南通市', '连云港市', '常州市', '镇江市', '扬州市', '淮安市', '泰州市', '宿迁市'],

            ['郑州市', '南阳市', '新乡市', '安阳市', '洛阳市', '信阳市', '平顶山市', '周口市', '商丘市', '开封市', '焦作市', '驻马店市', '濮阳市', '三门峡市', '漯河市', '许昌市', '鹤壁市', '济源市'],

            ['松江区', '宝山区', '金山区', '嘉定区', '南汇区', '青浦区', '浦东新区', '奉贤区', '徐汇区', '静安区', '闵行区', '黄浦区', '杨浦区', '虹口区', '普陀区', '闸北区', '长宁区', '崇明区', '卢湾区'],

            ['石家庄市', '唐山市', '保定市', '邯郸市', '邢台市', '河北区', '沧州市', '秦皇岛市', '张家口市', '衡水市', '廊坊市', '承德市'],

            ['温州市', '宁波市', '杭州市', '台州市', '嘉兴市', '金华市', '湖州市', '绍兴市', '舟山市', '丽水市', '衢州市'],

            ['中国香港'],

            ['西安市', '咸阳市', '宝鸡市', '汉中市', '渭南市', '安康市', '榆林市', '商洛市', '延安市', '铜川市'],

            ['长沙市', '邵阳市', '常德市', '衡阳市', '株洲市', '湘潭市', '永州市', '岳阳市', '怀安市', '郴州市', '娄底市', '益阳市', '张家界市', '湘西州'],

            ['江北区', '渝北区', '沙坪坝区', '九龙坡区', '万州区', '永川区', '南岸区', '酉阳县', '北碚区', '涪陵区', '秀山县', '巴南区', '渝中区', '石柱县', '忠县', '合川市', '大渡口区', '开县', '长寿区', '荣昌县', '云阳县', '梁平县', '潼南县', '江津市', '彭水县', '綦江县', '璧山县', '黔江区', '大足县', '巫山县', '巫溪县', '垫江县', '丰都县', '武隆县', '万盛区', '铜梁县', '南川市', '奉节县', '双桥区', '城口县'],

            ['漳州市', '厦门市', '泉州市', '福州市', '莆田市', '宁德市', '三明市', '南平市', '龙岩市'],

            ['和平区', '北辰区', '河北区', '河西区', '西青区', '津南区', '东丽区', '武清区', '宝坻区', '红桥区', '大港区', '汉沽区', '静海县', '塘沽区', '宁河县', '蓟县', '南开区', '河东区'],

            ['昆明市', '红河州', '大理州', '文山州', '德宏州', '曲靖市', '昭通市', '楚雄州', '保山市', '玉溪市', '丽江地区', '临沧地区', '思茅地区', '西双版纳州', '怒江州', '迪庆州'],

            ['成都市', '绵阳市', '广元市', '达州市', '南充市', '德阳市', '广安市', '阿坝州', '巴中市', '遂宁市', '内江市', '凉山州', '攀枝花市', '乐山市', '自贡市', '泸州市', '雅安市', '宜宾市', '资阳市', '眉山市', '甘孜州'],

            ['贵港市', '玉林市', '北海市', '南宁市', '柳州市', '桂林市', '梧州市', '钦州市', '来宾市', '河池市', '百色市', '贺州市', '防城港市'],

            ['芜湖市', '合肥市', '六安市', '宿州市', '阜阳市', '安庆市', '马鞍山市', '蚌埠市', '淮北市', '淮南市', '宣城市', '黄山市', '铜陵市', '亳州市', '池州市', '巢湖市', '滁州市'],

            ['三亚市', '海口市', '琼海市', '文昌市', '东方市', '昌江县', '陵水县', '乐东县', '保亭县', '五指山市', '澄迈县', '万宁市', '儋州市', '临高县', '白沙县', '定安县', '琼中县', '屯昌县'],

            ['南昌市', '赣州市', '上饶市', '吉安市', '九江市', '新余市', '抚州市', '宜春市', '景德镇市', '萍乡市', '鹰潭市'],

            ['武汉市', '宜昌市', '襄樊市', '荆州市', '恩施州', '黄冈市', '孝感市', '十堰市', '咸宁市', '黄石市', '仙桃市', '天门市', '随州市', '荆门市', '潜江市', '鄂州市', '神农架林区'],

            ['太原市', '大同市', '运城市', '长治市', '晋城市', '忻州市', '临汾市', '吕梁市', '晋中市', '阳泉市', '宿州市'],

            ['大连市', '沈阳市', '丹东市', '辽阳市', '葫芦岛市', '锦州市', '朝阳市', '营口市', '鞍山市', '抚顺市', '阜新市', '盘锦市', '本溪市', '铁岭市'],

            ['台北市', '高雄市', '台中市', '新竹市', '基隆市', '台南市', '嘉义市'],

            ['齐齐哈尔市', '哈尔滨市', '大庆市', '佳木斯市', '双鸭山市', '牡丹江市', '鸡西市', '黑河市', '绥化市', '鹤岗市', '伊春市', '大兴安岭地区', '七台河市'],

            ['赤峰市', '包头市', '通辽市', '呼和浩特市', '鄂尔多斯市', '乌海市', '呼伦贝尔市', '兴安盟', '巴彦淖尔盟', '锡林郭勒盟', '阿拉善盟', '大兴安岭地区', '七台河市'],

            ['中国澳门'],

            ['贵阳市', '黔东南州', '黔南州', '遵义市', '黔西南州', '毕节地区', '铜仁地区', '安顺市', '六盘水市'],

            ['兰州市', '天水市', '庆阳市', '武威市', '酒泉市', '张掖市', '陇南地区', '白银市', '定西地区', '平凉市', '嘉峪关市', '临夏回族自治州', '金昌市', '甘南州'],

            ['西宁市', '海西州', '海东地区', '海北州', '果洛州', '玉树州', '黄南藏族自治州'],

            ['乌鲁木齐市', '伊犁州', '昌吉州', '石河子市', '哈密地区', '阿克苏地区', '巴音郭楞州', '喀什地区', '塔城地区', '克拉玛依市', '和田地区', '阿勒泰州', '吐鲁番地区', '阿拉尔市', '博尔塔拉州', '五家渠市', '克孜勒苏州', ' 图木舒克市'],

            ['拉萨市', '山南地区', '林芝地区', '日喀则地区', '阿里地区', '昌都地区', '那曲地区'],

            ['吉林市', '长春市', '白山市', '延边州', '白城市', '松原市', '辽源市', '通化市', '四平市'],

            ['银川市', '吴忠市', '中卫市', '石嘴山市', '固原市']
        ];
    </script>
    <style>

        /*---全国----*/
        #zp_gsxq_bd_tck {
            display: none;
            width: 0;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            position: fixed;
            left: 0;
            top: 0;
            z-index: 1111111111;
        }

        #zp_gsxq_bd_tck > div {
            position: relative;
            width: 0px;
            height: 0px;
            margin: 60px auto;
            background: #ffffff;
        }

        .zp_gsxq_bd_tck_top {
            height: 40px;
            padding: 0 20px;
            line-height: 40px;
            border-bottom: 1px solid #EDEDED;
        }

        .zp_gsxq_bd_tck_cont2_cont {
            /*width: 60%;*/
            margin: 0 auto;
            margin-top: 100px;
        }

        .gb {
            display: block;
            width: 40px;
            height: 40px;
            text-align: right;
            cursor: pointer;
        }

        .zp_gsxq_bd_tck_cont2_cont {
            /*width: 60%;*/
            margin: 0 auto;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 20px;
            /*margin-top: 100px;*/
        }

        .zp_gsxq_bd_tck_cont2_cont select {
            width: 49%;
        }

        .zp_gsxq_bd_tck_bottom {
            height: 50px;
            border-top: 1px solid #EDEDED;
            margin-top: 20px;
            text-align: right;
            line-height: 50px;
            position: absolute;
            bottom: 0;
            width: 100%;
            padding-right: 40px;
        }

        .zp_gsxq_bd_tck_bottom > button {
            margin-right: 10px;
        }

        .zp_ul, .zp_ul1 {
            width: 100%;
            height: auto;
            overflow: hidden;
            padding-left: 20px;
            padding-right: 20px;
            padding-bottom: 15px;
            padding-top: 10px;
            margin-top: 5px;
            background-color: #fcfcfc;
            cursor: pointer;
        }

        .zp_ul li {
            float: left;
            display: inline-block;
            margin-right: 10px;
            width: 140px;
            padding-left: 20px;
            margin-top: 8px;
        }

        .zp_ul1 li {
            float: left;
            display: inline-block;
            margin-right: 10px;
            width: 140px;
            padding-left: 25px;
            margin-top: 5px;
        }

        .zp_button1 {
            width: 80px;
            height: 30px;
            outline: none;
            border: 1px solid #FC9A2F;
            background-color: #FFFFFF;
            display: inline-block;
            text-align: center;
            line-height: 30px;
            color: #FC9A2F;
            margin-right: 15px;
            cursor: pointer;
            border-radius: 3px;
        }

        .zp_button1:hover {
            width: 80px;
            height: 30px;
            outline: none;
            border: 1px solid #FC9A2F;
            background-color: #FC9A2F;
            display: inline-block;
            text-align: center;
            line-height: 30px;
            color: #FFFFFF;
            margin-right: 15px;
        }

        .zp_button {
            width: 80px;
            height: 30px;
            outline: none;
            border: none;
            background-color: #FC9A2F;
            text-align: center;
            line-height: 30px;
            overflow: hidden;
            color: #FFFFFF;
            border-radius: 3px;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
            border: none;
        }

        .nav-tabs > li > a {
            border: none;
        }

        .zp_one {
            display: inline-block;
            margin-left: 35px;
            margin-top: 15px;
            margin-bottom: 10px;
            height: 30px;
        }

        .zp_one .zp_one_a {
            color: #000000;
            display: inline-block;
            padding: 3px 15px;
        }

        .zp_one .zp_one_b {
            display: inline-block;
            background-color: #ffffff;
            color: #FFFFFF;
            padding: 3px 15px;
            border-radius: 3px;
        }

        .cd-popup {
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            opacity: 0;
            visibility: hidden;
            -webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
            -moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
            transition: opacity 0.3s 0s, visibility 0s 0.3s;
            z-index: 999999;
        }

        .cd-popup.is-visible {
            opacity: 1;
            visibility: visible;
            -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
            -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
            transition: opacity 0.3s 0s, visibility 0s 0s;
        }

        .cd-popup-container {
            position: relative;
            max-width: 700px;
            margin: 0 auto;
            margin-top: 305px;
            height: 405px;
            background: #FFF;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            -webkit-transform: translateY(-40px);
            -moz-transform: translateY(-40px);
            -ms-transform: translateY(-40px);
            -o-transform: translateY(-40px);
            transform: translateY(-40px);
            /* Force Hardware Acceleration in WebKit */
            -webkit-backface-visibility: hidden;
            -webkit-transition-property: -webkit-transform;
            -moz-transition-property: -moz-transform;
            transition-property: transform;
            -webkit-transition-duration: 0.3s;
            -moz-transition-duration: 0.3s;
            transition-duration: 0.3s;
        }

        .cd-popup-container p {
            padding: 1em 1em;
        }

        .cd-popup-container .cd-buttons:after {
            content: "";
            display: table;
            clear: both;
        }

        .cd-popup-container .cd-buttons li {
            float: right;
            width: 100px;
            margin: 10px 10px 20px;
        }

        .cd-popup-container .cd-buttons a {
            display: block;
            height: 40px;
            line-height: 40px;
            text-transform: uppercase;
            color: #FFF;
            -webkit-transition: background-color 0.2s;
            -moz-transition: background-color 0.2s;
            transition: background-color 0.2s;
        }

        .cd-popup-container .cd-buttons li:first-child a {
            background: #fc7169;
            border-radius: 0 0 0 .15em;
        }

        .no-touch .cd-popup-container .cd-buttons li:first-child a:hover {
            background-color: #fc8982;
        }

        .cd-popup-container .cd-buttons li:last-child a {
            background: #b6bece;
            /*border-radius: 0 0 .25em 0;*/
        }

        .no-touch .cd-popup-container .cd-buttons li:last-child a:hover {
            background-color: #c5ccd8;
        }

        .cd-popup-container .cmd_close {
            position: absolute;
            top: 8px;
            right: 8px;
            width: 30px;
            height: 30px;
        }

        .cd-popup-container .cmd_close::before, .cd-popup-container .cmd_close::after {
            content: '';
            position: absolute;
            top: 12px;
            width: 14px;
            height: 3px;
            background-color: #8f9cb5;
        }

        .cd-popup-container .cmd_close::before {
            -webkit-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -o-transform: rotate(45deg);
            transform: rotate(45deg);
            left: 8px;
        }

        .cd-popup-container .cmd_close::after {
            -webkit-transform: rotate(-45deg);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -o-transform: rotate(-45deg);
            transform: rotate(-45deg);
            right: 8px;
        }

        .is-visible .cd-popup-container {
            -webkit-transform: translateY(0);
            -moz-transform: translateY(0);
            -ms-transform: translateY(0);
            -o-transform: translateY(0);
            transform: translateY(0);
        }

    </style>
</head>
<body>


<%--<div id="this_space" style="cursor: pointer">全国</div><input id="workspace">--%>



<div id='zp_gsxq_bd_tck'>
    <div id='zp_gsxq_bd_tck_cont2'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择城市信息</span>
            <a class="pull-right gb"><span class="fa fa-close"></span></a>
        </div>

        <div class="zp_one"> <span class="zp_one_a">最多选择一项：</span><span class="zp_one_b" id="div6"></span>
        </div>

        <%--热门城市--%>
        <div class="zp_gsxq_bd_tck_cont2_cont" style="padding-top: 10px">
            <div style="padding-left: 20px;height: 30px">热门城市</div>
            <ul class="zp_ul1">
                <li><a href="javascript:void(0)" class="hotCity">北京市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">上海市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">广州市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">深圳市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">天津市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">苏州市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">重庆市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">南京市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">杭州市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">大连市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">成都市</a></li>
                <li><a href="javascript:void(0)" class="hotCity">武汉市</a></li>
            </ul>
        </div>

        <hr style="width: 90%;margin: 0 auto">

        <div id="div2"></div>
        <%--全部省份--%>
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <div style="padding-left: 20px">请选择省份</div>
            <ul class="zp_ul">
                <li><a class="cd-popup-trigger" adata="1">北京市</a></li>
                <li><a class="cd-popup-trigger" adata="2">广东省</a></li>
                <li><a class="cd-popup-trigger" adata="3">山东省</a></li>
                <li><a class="cd-popup-trigger" adata="4">江苏省</a></li>
                <li><a class="cd-popup-trigger" adata="5">河南省</a></li>
                <li><a class="cd-popup-trigger" adata="6">上海市</a></li>
                <li><a class="cd-popup-trigger" adata="7">河北省</a></li>
                <li><a class="cd-popup-trigger" adata="8">浙江省</a></li>
                <li><a class="cd-popup-trigger" adata="9">香港特别行政区</a></li>
                <li><a class="cd-popup-trigger" adata="10">陕西省</a></li>
                <li><a class="cd-popup-trigger" adata="11">湖南省</a></li>
                <li><a class="cd-popup-trigger" adata="12">重庆市</a></li>
                <li><a class="cd-popup-trigger" adata="13">福建省</a></li>
                <li><a class="cd-popup-trigger" adata="14">天津市</a></li>
                <li><a class="cd-popup-trigger" adata="15">云南省</a></li>
                <li><a class="cd-popup-trigger" adata="16">四川省</a></li>
                <li><a class="cd-popup-trigger" adata="17">广西壮族自治区</a></li>
                <li><a class="cd-popup-trigger" adata="18">安徽省</a></li>
                <li><a class="cd-popup-trigger" adata="19">海南省</a></li>
                <li><a class="cd-popup-trigger" adata="20">江西省</a></li>
                <li><a class="cd-popup-trigger" adata="21">湖北省</a></li>
                <li><a class="cd-popup-trigger" adata="22">山西省</a></li>
                <li><a class="cd-popup-trigger" adata="23">辽宁省</a></li>
                <li><a class="cd-popup-trigger" adata="24">台湾省</a></li>
                <li><a class="cd-popup-trigger" adata="25">黑龙江</a></li>
                <li><a class="cd-popup-trigger" adata="26">内蒙古自治区</a></li>
                <li><a class="cd-popup-trigger" adata="27">澳门特别行政区</a></li>
                <li><a class="cd-popup-trigger" adata="28">贵州省</a></li>
                <li><a class="cd-popup-trigger" adata="29">甘肃省</a></li>
                <li><a class="cd-popup-trigger" adata="30">青海省</a></li>
                <li><a class="cd-popup-trigger" adata="31">新疆维吾尔自治区</a></li>
                <li><a class="cd-popup-trigger" adata="32">西藏区</a></li>
                <li><a class="cd-popup-trigger" adata="33">吉林省</a></li>
                <li><a class="cd-popup-trigger" adata="34">宁夏回族自治区</a></li>
            </ul>
        </div>


        <div class="zp_gsxq_bd_tck_bottom">
            <a class="zp_button1" onclick="theEnter()">确定</a>
            <button type="button" class="zp_button">取消</button>
        </div>

        <%--再一个弹出--%>
        <div class="cd-popup" role="alert">
            <div class="cd-popup-container">
                <div class="zp_gsxq_bd_tck_cont2_cont" id="gggui">
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>