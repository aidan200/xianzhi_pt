<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/echarts.js"></script>
    <script>
        $(document).ready(function () {
            $(".allboolean").fadeIn(2000);
            $(".bremove").click(function () {
                $(".allboolean").fadeOut(1000);
            })
        });
    </script>
</head>
<body style="background-color: #F0F0F0;position: relative">

<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>


<div class="pup_container">
    <div class="comh_allin">


        <!--上面标签-->
        <ul id="myTab" class="nav nav-tabs comh_topul">
            <li class="active">
                <a href="#pop_one" data-toggle="tab" class="pop_tab">
                    新应聘简历
                </a>
            </li>
            <li><a href="#pop_two" data-toggle="tab">待处理的推荐简历</a></li>
            <li><a href="#pop_three" data-toggle="tab">意向沟通</a></li>
            <li><a href="#pop_four" data-toggle="tab">面试快</a></li>
        </ul>

        <div class="comh_alla">
            <div id="myTabContent" class="tab-content">

                <!--新应聘简历-->
                <div class="tab-pane fade in active" id="pop_one">
                    <div class="comh_top">
                        <span class="comh_span">新应聘的简历（<span>10</span>）</span>
                    </div>

                    <div class="comh_have">
                        <div class="comh_left">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/small.jpg" alt=""
                                 class="comh_head">
                            <div class="comh_test">
                                <h4>金泰妍</h4>
                                <div class="comh_in">
                                    <span>女</span>|
                                    <span>28</span>|
                                    <span class="comh_more" style="max-width: 83px">呼和浩特哈哈哈哈</span>|
                                    <span>本科</span>
                                </div>
                                <div class="comh_in">
                                    <span class="comh_more" style="max-width: 130px">web前端hahahahahahfkj</span>|
                                    <span>1年经验</span>
                                </div>
                            </div>
                        </div>

                        <div class="comh_right">
                            <div class="comh_rt">
                                <span>2015-至今</span>|
                                <span class="comh_more" style="max-width: 185px">阿里巴巴有限公司ahtsrtgfkajfhkadf</span>|
                                <span class="comh_more" style="max-width: 135px">资深产品经理adsertssfasd</span>
                            </div>
                            <div class="comh_rt">
                                <span>2007-2011</span>|
                                <span class="comh_more" style="max-width: 133px">复旦大学aewrwerfdfadfadfad</span>|
                                <span class="comh_more" style="max-width: 131px">信息管理werfweaewe与信息系统a</span>|
                                <span>本科</span>
                            </div>
                            <div style="margin-top: 10px;margin-right: 3px;float: right;color: #a8a8a8">
                                <span><span>4</span>个小时前</span>
                            </div>
                        </div>
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
                            <div class="zp_page">共 <span>100</span> 页</div>
                        </div>
                    </div>

                </div>

                <!--待处理的推荐简历-->
                <div class="tab-pane fade" id="pop_two">
                    <div class="comh_top">
                        <span class="comh_span">待处理的推荐简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <!--意向沟通-->
                <div class="tab-pane fade" id="pop_three">
                    <div class="comh_top">
                        <span class="comh_span">意向沟通的简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
                        </div>
                    </div>
                </div>

                <!--面试快-->
                <div class="tab-pane fade" id="pop_four">
                    <div class="comh_top">
                        <span class="comh_span">面试快的简历（<span>10</span>）</span>
                    </div>
                    <div class="comh_no">
                        <div class="pop_allimg">
                            <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/no.png" alt=""
                                 class="pop_img">
                            <p>暂无简历记录</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="comh_rz">
            <h4>近七天投递简历次数</h4>
            <div id="mapall" style="width: 230px;height: 300px"></div>

        </div>

    </div>
</div>

<div class="allboolean">
    <div class="b_out">
        <div class="booleanin">
            请完善你的简历哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈
            <span class="fa fa-remove bremove"></span>
        </div>
    </div>
</div>

<jsp:include page="behindforeEnd.jsp"/>
<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mapall'));


    $(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/PostionSend/count7.do',
            data: {selId:${userLogin.company.companyId}, type: 1},
            dataType: 'json',
            success: function (data) {
                var send = data.theCount;
                var times = new Array();
                var datas = new Array();
                var myDate = new Date(); //获取今天日期
                var myDate2;
                myDate.setDate(myDate.getDate() - 6);
                var dateTemp;
                var dateTemp2;
                var flag = 1;
                for (var i = 0; i < 7; i++) {
                    datas[i] = 0;
                    dateTemp = (myDate.getMonth() + 1) + "-" + myDate.getDate();
                    for (var j = 0; j < send.length; j++) {
                        myDate2 = new Date(send[j].sendTime);
                        dateTemp2 = (myDate2.getMonth() + 1) + "-" + myDate2.getDate();
                        if (dateTemp2 == dateTemp) {
                            datas[i] = send[j].ct;
                        }
                    }
                    times.push(dateTemp);
                    myDate.setDate(myDate.getDate() + flag);
                }
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: ''
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    legend: {
                        data: ['投递简历次数']
                    },
                    xAxis: [{
                        type: 'category',
                        boundaryGap: false,
                        //data: ['0718','0719','0720','0721','0722','0723','0724'],
                        data: times,
                        show: false,
                    }],
                    yAxis: [{
                        type: 'value',
                        data: ['0', '10', '20'],
                    }],
                    series: [
                        {
                            name: '投递简历次数',
                            type: 'line',
                            symbol: 'emptyCircle',
                            symbolSize: function (v) {
                                return 8 + v / 100
                            },
                            stack: '总量',
                            //data:[20, 2, 1, 14, 15, 3, 8],
                            data: datas,
                            itemStyle: {
                                normal: {
                                    color: '#3fb1e3',
                                    lineStyle: {
                                        color: '#3fb1e3'
                                    }
                                }
                            },
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);

            }
        })

    })
</script>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>

</body>
</html>
