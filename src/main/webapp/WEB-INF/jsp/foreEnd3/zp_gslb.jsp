<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/3
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%--引入jstl--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--引入jstl日期类型--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>公司列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_lb.css">
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_lb.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jquery-v1.8.2.js"></script>
    <script>
        $(function () {
            var width = $(window).width();
            var height = $(window).height();
//   省市联动开始
            $(".zp_lb_ssk_left span").on('click', function () {                            //点击事件
                $('#zp_gsxq_bd_tck').css({
                    "display": "block",
                    "width": width,
//                    "height": height
                });
                $("#zp_gsxq_bd_tck_cont2").css({
                    "display": "block"
                });
                $('#zp_gsxq_bd_tck_cont2').animate({
                    "width": "700",
                    "height": "600"
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
        })
    </script>

</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<div class="zp_lb_top">
    <div class="container zp_lb_ssk">
        <div class="zp_lb_ssk_left">
            <span>全国</span>
        </div>
        <div class="zp_lb_ssk_right">
            <form action="">
                <input type="text" placeholder="请输入职位关键词：如 项目经理等">
                <button type="submit">搜索</button>
            </form>
        </div>
    </div>
</div>
<section class="container zp_lb_cont">

    <form action="">
        <div class="row zp_lb_cont_top">

            <div class="zp_lb_cont_top_0">
                <div class="pull-left" style="width: 42px;color: #999">行业：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li><a href="###" rel="aspect" id="ww" inpName="ccc" inpValue="ggg" class="divSmall"> 电子·通信·硬件</a></li>
                        <li><a href="###" rel="aspect2" id="xx" class="divSmall">互联网·电商</a></li>
                        <li><a href="###" rel="aspect3" id="yy" class="divSmall">网络游戏</a></li>
                        <li><a href="###" rel="aspect4" id="zz" class="divSmall">计算机软件</a></li>
                        <li><a href="###" rel="aspect5" id="aaa" class="divSmall">IT服务</a></li>
                        <li><a href="###" rel="aspect6" id="bbb" class="divSmall">通信服务</a></li>

                    </ul>
                </div>
            </div>

            <div style="clear: both"></div>
            <div class="zp_lb_cont_top_1">
                <div class="pull-left" style="width: 42px;color: #999">薪资：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li><a href="###" rel="type" id="aa" class="divSmall">10-15万</a></li>
                        <li><a href="###" rel="type" id="bb" class="divSmall">15-20万</a></li>
                        <li><a href="###" rel="type" id="cc" class="divSmall">20-30万</a></li>
                        <li><a href="###" rel="type" id="dd" class="divSmall">50-100万</a></li>
                        <li><a href="###" rel="type" id="ee" class="divSmall">100万以上</a></li>
                    </ul>
                </div>
            </div>
            <div class="zp_lb_cont_top_2">
                <div class="pull-left" style="width: 42px;color: #999">更多：</div>
                <div class="pull-left" style="width: 766px">
                    <ul>
                        <li class="zp_lb_li">
                            <a>发布时间</a>
                            <ul>
                                <li><a href="###" rel="one" id="gg" class="divSmall">一天以内</a></li>
                                <li><a href="###" rel="one" id="hh" class="divSmall">三天以内</a></li>
                                <li><a href="###" rel="one" id="ii" class="divSmall">一周以内</a></li>
                                <li><a href="###" rel="one" id="jj" class="divSmall">一个月以内</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业规模</a>
                            <ul>
                                <li><a href="###" rel="three" id="oo" class="divSmall">50人以下</a></li>
                                <li><a href="###" rel="three" id="pp" class="divSmall">50-100人</a></li>
                                <li><a href="###" rel="three" id="qq" class="divSmall">100-500人</a></li>
                                <li><a href="###" rel="three" id="rr" class="divSmall">1000人以上</a></li>
                            </ul>
                        </li>
                        <li class="zp_lb_li">
                            <a>企业性质</a>
                            <ul>
                                <li><a href="###" rel="four" id="ss" class="divSmall">政府</a></li>
                                <li><a href="###" rel="four" id="tt" class="divSmall">事业单位</a></li>
                                <li><a href="###" rel="four" id="uu" class="divSmall">私企</a></li>
                                <li><a href="###" rel="four" id="vv" class="divSmall">国企</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="zp_lb_cont_top_3">
                <div class="zp_lb_cont_top_3_left">
                    <span>已选条件：</span>
                </div>
                <div class="zp_lb_cont_top_3_right" id="mainSelect">
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                    <%--<a href="">三天之内&nbsp;&nbsp;<span>x</span></a>--%>
                </div>
                <div class="zp_lb_cont_top_3_right2">
                    共找到 <span>10000+</span>职位
                </div>
            </div>
        </div>
    </form>
    <div class="row zp_lb_cont_middle">
        <div class="col-md-9 zp_lb_cont_middle_left">
            <ul class="zp_u">
                <c:forEach items="${postionList}" var="p">
                    <li>
                        <i><b>
                            <c:choose>
                                <c:when test="${p.company.companyNature=='1'}">
                                    国
                                </c:when>
                                <c:when test="${p.company.companyNature=='2'}">
                                    私
                                </c:when>
                                <c:when test="${p.company.companyNature=='3'}'">
                                    外
                                </c:when>
                            </c:choose>
                        </b></i>
                        <div class="zp_index_cont_left_zwtj_cont_left">
                            <h4>${p.postionName}</h4>
                            <p> <span>
                                <c:choose>
                                    <c:when test="${p.postionMm==p.postionYm}">
                                        ${p.postionMm*12/10000}万
                                    </c:when>
                                    <c:otherwise>
                                        ${p.postionMm*12/10000}万-${p.postionYm*12/10000}万
                                    </c:otherwise>
                                </c:choose>
                            </span>&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionSpace}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionEducation}&nbsp;&nbsp;|&nbsp;&nbsp;${p.postionExp}
                            </p>
                            <span><fmt:formatDate value="${p.postionTime}" pattern="yyyy-MM-dd"/></span>
                        </div>
                        <div class="zp_index_cont_left_zwtj_cont_right">
                            <p>${p.company.companyName}</p>
                            <p>
                                <c:forEach items="${p.company.fields}" var="f">
                                    ${f.fieldName}
                                    <c:choose>
                                        <c:when test="${status.index==2}">

                                        </c:when>
                                        <c:otherwise>
                                            ,
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </p>
                            <p class="zp_index_cont_bz">
                                <c:forEach items="${p.company.welfares}" var="w">
                                    <span>${w.welfareName}</span>
                                    <c:if test="${status.index==2}">
                                        <c:set var="exitId" value="0"></c:set>
                                    </c:if>
                                </c:forEach>
                            </p>
                        </div>
                    </li>
                </c:forEach>
                <%--<li>
                    <i><b>国</b></i>
                    <div class="zp_index_cont_left_zwtj_cont_left">
                        <h4>WEB前端研发工程师</h4>
                        <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                        <span>2017-06-08</span>
                    </div>
                    <div class="zp_index_cont_left_zwtj_cont_right">
                        <p>东软集团</p>
                        <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                        <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                    </div>
                </li>
                <li>
                    <i><b>外</b></i>
                    <div class="zp_index_cont_left_zwtj_cont_left">
                        <h4>WEB前端研发工程师</h4>
                        <p> <span>面议</span>&nbsp;&nbsp;|&nbsp;&nbsp;沈阳&nbsp;&nbsp;|&nbsp;&nbsp;本科&nbsp;&nbsp;及以上&nbsp;&nbsp;|&nbsp;&nbsp;3年经验</p>
                        <span>2017-06-08</span>
                    </div>
                    <div class="zp_index_cont_left_zwtj_cont_right">
                        <p>东软集团</p>
                        <p>互联网/移动互联网/电子商务,IT服务/系统集成,计算机软件</p>
                        <p class="zp_index_cont_bz"><span>带薪年假</span><span>交通补助</span><span>定期体检</span></p>
                    </div>
                </li>--%>
            </ul>
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
        <div class="col-md-3 zp_lb_cont_middle_right " style="padding-left: 15px;">
            <div class="zp_rt">
                <h4>最近浏览</h4>
                <ul>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端</a></span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="" class="zp_na">上海融链科技有限公司</a>
                            <span class="zp_na2"><a href="">WEB前端WEB前端WEB前端WEB前端WEB前端WEB前端</a></span>
                        </div>
                    </li>


                </ul>

            </div>
            <ul>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb1.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb2.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb3.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb4.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb1.png')"></li>
                <li style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_lb_gb2.png')"></li>
            </ul>
        </div>
    </div>
    <form id="hidForm"></form>
</section>


<div id='zp_gsxq_bd_tck'>
    <div id='zp_gsxq_bd_tck_cont2'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择城市信息</span>
            <a class="pull-right gb"><span class="fa fa-close"></span></a>
        </div>
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <div style="padding-left: 20px">热门城市</div>
            <ul class="zp_ul1">
                <li><a href="">北京</a></li>
                <li><a href="">上海</a></li>
                <li><a href="">广州</a></li>
                <li><a href="">深圳</a></li>
                <li><a href="">天津</a></li>
                <li><a href="">苏州</a></li>
                <li><a href="">重庆</a></li>
                <li><a href="">南京</a></li>
                <li><a href="">杭州</a></li>
                <li><a href="">大连</a></li>
                <li><a href="">成都</a></li>
                <li><a href="">武汉</a></li>


            </ul>
        </div>
        <hr style="width: 90%;margin: 0 auto">
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <div style="padding-left: 20px">请选择省份</div>
            <ul class="zp_ul">
                <li><a href="">北京市</a></li>
                <li><a href="">广东省</a></li>
                <li><a href="">山东省</a></li>
                <li><a href="">江苏省</a></li>
                <li><a href="">河南省</a></li>
                <li><a href="">上海市</a></li>
                <li><a href="">河北省</a></li>
                <li><a href="">浙江省</a></li>
                <li><a href="">香港特别行政区</a></li>
                <li><a href="">陕西省</a></li>
                <li><a href="">湖南省</a></li>
                <li><a href="">重庆市</a></li>
                <li><a href="">福建省</a></li>
                <li><a href="">天津市</a></li>
                <li><a href="">云南省</a></li>
                <li><a href="">四川省</a></li>
                <li><a href="">广西壮族自治区</a></li>
                <li><a href="">安徽省</a></li>
                <li><a href="">海南省</a></li>
                <li><a href="">江西省</a></li>
                <li><a href="">湖北省</a></li>
                <li><a href="">山西省</a></li>
                <li><a href="">辽宁省</a></li>
                <li><a href="">台湾省</a></li>
                <li><a href="">黑龙江</a></li>
                <li><a href="">内蒙古自治区</a></li>
                <li><a href="">澳门特别行政区</a></li>
                <li><a href="">贵州省</a></li>
                <li><a href="">甘肃省</a></li>
                <li><a href="">青海省</a></li>
                <li><a href="">新疆维吾尔自治区</a></li>
                <li><a href="">西藏区</a></li>
                <li><a href="">吉林省</a></li>
                <li><a href="">宁夏回族自治区</a></li>
            </ul>
            <script>
                function change() {
                    var map = ['', ['朝阳区', '海淀区', '通州区', '房山区', '丰台区', '昌平区', '大兴区', '顺义区', '西城区', '延庆县', '石景山区', '宣武区', '怀柔区', '崇文区', '密云县', '东城区', '平谷区', '门头沟区'],

                        ['东莞市', '广州市', '中山市', '深圳市', '惠州市', '江门市', '珠海市', '汕头市', '佛山市', '湛江市', '河源市', '肇庆市', '清远市', '潮州市', '韶关市', '揭阳市', '阳江市', '梅州市', '云浮市', '茂名市', '汕尾市'],

                        ['济南市', '青岛市', '临沂市', '济宁市', '菏泽市', '烟台市', '淄博市', '泰安市', '潍坊市', '日照市', '威海市', '滨州市', '东营市', '聊城市', '德州市', '莱芜市', '枣庄市'],

                        ['苏州市', '徐州市', '盐城市', '无锡市', '南京市', '南通市', '连云港市', '常州市', '镇江市', '扬州市', '淮安市', '泰州市', '宿迁市'],

                        ['郑州市', '南阳市', '新乡市', '安阳市', '洛阳市', '信阳市', '平顶山市', '周口市', '商丘市', '开封市', '焦作市', '驻马店市', '濮阳市', '三门峡市', '漯河市', '许昌市', '鹤壁市', '济源市'],

                        ['松江区', '宝山区', '金山区', '嘉定区', '南汇区', '青浦区', '浦东新区', '奉贤区', '徐汇区', '静安区', '闵行区', '黄浦区', '杨浦区', '虹口区', '普陀区', '闸北区', '长宁区', '崇明区', '卢湾区'],

                        ['石家庄市', '唐山市', '保定市', '邯郸市', '邢台市', '河北区', '沧州市', '秦皇岛市', '张家口市', '衡水市', '廊坊市', '承德市'],

                        ['温州市', '宁波市', '杭州市', '台州市', '嘉兴市', '金华市', '湖州市', '绍兴市', '舟山市', '丽水市', '衢州市'],

                        ['无'],

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

                        ['无'],

                        ['贵阳市', '黔东南州', '黔南州', '遵义市', '黔西南州', '毕节地区', '铜仁地区', '安顺市', '六盘水市'],

                        ['兰州市', '天水市', '庆阳市', '武威市', '酒泉市', '张掖市', '陇南地区', '白银市', '定西地区', '平凉市', '嘉峪关市', '临夏回族自治州', '金昌市', '甘南州'],

                        ['西宁市', '海西州', '海东地区', '海北州', '果洛州', '玉树州', '黄南藏族自治州'],

                        ['乌鲁木齐市', '伊犁州', '昌吉州', '石河子市', '哈密地区', '阿克苏地区', '巴音郭楞州', '喀什地区', '塔城地区', '克拉玛依市', '和田地区', '阿勒泰州', '吐鲁番地区', '阿拉尔市', '博尔塔拉州', '五家渠市', '克孜勒苏州', ' 图木舒克市'],

                        ['拉萨市', '山南地区', '林芝地区', '日喀则地区', '阿里地区', '昌都地区', '那曲地区'],

                        ['吉林市', '长春市', '白山市', '延边州', '白城市', '松原市', '辽源市', '通化市', '四平市'],

                        ['银川市', '吴忠市', '中卫市', '石嘴山市', '固原市']
                    ];
                    var pro = document.getElementById('pro');
                    var city = document.getElementById('city');
                    var citys = map[pro.value];
                    for (var i = 0, len = citys.length, str = ''; i < len; i++) {
                        str = str + '<option>' + citys[i] + '</option>';
                    }
                    city.innerHTML = str;
                }</script>
        </div>
        <div class="zp_gsxq_bd_tck_bottom">
            <a class="zp_button1">确定</a>
            <button type="button" class="zp_button">取消</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".divSmall").click(function () {
            var isAlreadyHave = false;
            var thisID = $(this).attr("id");
            var classType = $(this).attr("rel");
            var inpName = $(this).attr("inpName");
            var inpValue = $(this).attr("inpValue");

            $(".divSmall2").each(function () {
                if ($(this).attr("rel") == thisID) {
                    isAlreadyHave = true;
                }
                if ($(this).attr("ttype") == classType) {
                    goBegin($(this).attr("rel"));
                    $(this).remove();
                }
            });

            if (!isAlreadyHave) {
                $(this).css({
                    "background-color": "#FFA500",
                    "color": "white"
                });
                writeDiv($(this).html(), $(this).attr("id"), $(this).attr("rel"),inpName,inpValue);

            }
        });
        $(".zp_img").live('click', function () {
            goBegin($(this).parent().attr("rel"));
            removeMyInp($(this).attr("rel"));
            $(this).parent().remove();
        });
    });
    //输出一个div
    function writeDiv(name, id, classONE, inpName, inpValue) {
        var divShow = "<div class='divSmall2' rel='" + id + "' ttype='" + classONE + "'>" + name + "<span class='fa fa-remove zp_img' rel='"+id+"inp'></span></div>";
        var inputShow = "<input id='"+id+"inp'  type='hidden'  name='"+inpName+"' value='"+inpValue+"'/>";
        $("#mainSelect").html($("#mainSelect").html() + divShow);
        $("#hidForm").html($("#hidForm").html()+inputShow);
    }
    function goBegin(ID) {
        $("#" + ID).css({
            "background-color": "transparent",
            "color": "#666666"
        });
    }
    function removeMyInp(id) {
        $("#" + id).remove();
    }
</script>


</body>
</html>