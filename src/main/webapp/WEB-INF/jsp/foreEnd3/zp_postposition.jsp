<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script>
        var path = '${pageContext.request.contextPath}/';     //全局路径
        var resumeId = '${resume.resumeId}';                  //ID
        var type='${param.type}'
    </script>
    <script>





        $(document).ready(function () {


            $(".pop_but").click(function () {
                $(".pop_more").slideToggle(500);
            });
            $(".pop_d").click(function () {
                $(".pop_dd").slideToggle(500);
            });
        });
    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_postposition.js"></script>
</head>
<body style="background-color: #F0F0F0">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<div class="pup_container">
    <div class="pop_allin">

        <div class="pop_left3">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#pop_one" data-toggle="tab" class="pop_tab">
                        全部状态
                    </a>
                </li>
                <li><a href="#pop_two" data-toggle="tab">已投递</a></li>
                <li><a href="#pop_three" data-toggle="tab">已查看</a></li>
                <li><a href="#pop_four" data-toggle="tab">面试邀约</a></li>
            </ul>

            <div class="pop_top">
                <div id="myTabContent" class="tab-content">

                    <%--全部状态--%>
                    <div class="tab-pane fade in active" id="pop_one">
                        <div class="pop_top2">
                            <span class="pop_span">全部状态（<span>10</span>）</span>
                        </div>

                        <%--分页--%>
                        <div class="zp_botv">

                        </div>
                    </div>

                    <%--已投递--%>
                    <div class="tab-pane fade" id="pop_two">
                        <div class="pop_top2">
                            <span class="pop_span">已投递（<span>10</span>）</span>
                        </div>

                        <%--分页--%>
                        <div class="zp_botv">

                        </div>

                    </div>

                    <%--已查看--%>
                    <div class="tab-pane fade" id="pop_three">
                        <div class="pop_top2">
                            <span class="comh_span">已查看（<span>0</span>）</span>
                        </div>

                        <div class="pop_tou">
                            <ul>
                                <li class="pop_tl">公司名：<span>发嘎达嘎梵蒂冈梵蒂冈大师国防大厦的风格</span></li>
                                <li class="pop_tl1">职位名：<span></span></li>
                                <li class="pop_tl2">查看时间：<span>2017-07-08</span></li>
                            </ul>
                        </div>
                        <%--分页--%>
                        <div class="zp_botv">

                        </div>
                    </div>
                    <%--面试邀约--%>
                    <div class="tab-pane fade" id="pop_four">
                        <div class="pop_top2">
                            <span class="pop_span">面试邀约（<span>10</span>）</span>
                        </div>

                        <%--<div class="pop_tou">--%>
                            <%--<ul>--%>
                                <%--<li class="pop_tl3">公司名：<span>发嘎达嘎梵蒂冈梵蒂冈大师国防大厦的风格</span></li>--%>
                                <%--<li class="pop_tl3">职位名：<span></span></li>--%>
                            <%--</ul>--%>
                            <%--<span class="fa fa-chevron-down pop_d"></span>--%>
                        <%--</div>--%>
                        <%--<div class="pop_dd">--%>
                            <%--<ul>--%>
                                <%--<li class="pop_tl4">面试信息：<span>afgagaeggfgga</span></li>--%>
                                <%--<li class="pop_tl5">--%>
                                    <%--<button>同意</button>--%>
                                    <%--<button>拒绝</button>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                        <%--分页--%>
                        <div class="zp_botv">

                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="pop_right3">
            <h4 style="padding-top: 5px;padding-left: 20px">近15天投递记录</h4>

            <div id="main2" style="width: 290px;height:300px;margin-top: 30px"></div>

        </div>
    </div>
</div>

<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>
<jsp:include page="behindforeEnd.jsp"/>
<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main2'));

    $(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/PostionSend/count7.do',
            data: {selId:${resume.resumeId}, type: 2, day: 14},
            dataType: 'json',
            success: function (data) {
                var send = data.theCount;
                var times = new Array();
                var datas = new Array();
                var myDate = new Date(); //获取今天日期
                var myDate2;
                myDate.setDate(myDate.getDate() - 14);
                var dateTemp;
                var dateTemp2;
                var flag = 1;
                for (var i = 0; i < 15; i++) {
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
                console.log(times);
                console.log(datas);
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: ''
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['投递简历次数']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        //data: ['0718', '0719', '0720', '0721', '0722', '0723', '0724', '0725', '0726', '0727', '0728', '0729', '0730', '0731', '0732',]
                        data: times
                    },
                    yAxis: {
                        type: 'value',
                        show: 'false'
                    },
                    series: [
                        {
                            name: '投递简历次数',
                            type: 'line',
                            smooth: 'true',
                            symbol: 'emptyCircle',
                            symbolSize: function (v) {
                                return 8 + v / 100
                            },
                            stack: '总量',
                            data: datas,
                            //data: [20, 32, 1, 34, 15, 3, 8, 10, 1, 4, 10, 5, 6, 8, 2],
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


    /*// 指定图表的配置项和数据
     var option = {
     title: {
     text: ''
     },
     tooltip: {
     trigger: 'axis'
     },
     legend: {
     data: ['投递简历次数']
     },
     grid: {
     left: '3%',
     right: '4%',
     bottom: '3%',
     containLabel: true
     },
     xAxis: {
     type: 'category',
     boundaryGap: false,
     data: ['0718', '0719', '0720', '0721', '0722', '0723', '0724', '0725', '0726', '0727', '0728', '0729', '0730', '0731', '0732',]
     },
     yAxis: {
     type: 'value',
     show: 'false'
     },
     series: [
     {
     name: '投递简历次数',
     type: 'line',
     smooth: 'true',
     symbol: 'emptyCircle',
     symbolSize: function (v) {
     return 8 + v / 100
     },
     stack: '总量',
     data: [20, 32, 1, 34, 15, 3, 8, 10, 1, 4, 10, 5, 6, 8, 2],
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
     myChart.setOption(option);*/
</script>
</body>
</html>
