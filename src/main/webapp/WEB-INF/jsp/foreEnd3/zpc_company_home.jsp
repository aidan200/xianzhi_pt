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
    <script>

        var path = '${pageContext.request.contextPath}/';     //全局路径
        var companyId = '${userLogin.company.companyId}';     //公司ID


        $(document).ready(function () {
            $(".allboolean").fadeIn(2000);
            $(".bremove").click(function () {
                $(".allboolean").fadeOut(1000);
            })
        });
    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jeDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/echarts.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zpc_company_home.js"></script>

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
            <li><a href="#pop_three" data-toggle="tab">意向沟通</a></li>
            <li><a href="#pop_four" data-toggle="tab">面试邀约</a></li>
        </ul>

        <div class="comh_alla">
            <div id="myTabContent" class="tab-content">

                <!--新应聘简历-->
                <div class="tab-pane fade in active" id="pop_one">
                    <div class="comh_top">
                        <span class="comh_span">新应聘的简历（<span>10</span>）</span>
                    </div>


                    <div class="zp_botv">

                    </div>

                </div>


                <!--意向沟通-->
                <div class="tab-pane fade" id="pop_three">
                    <div class="comh_top">
                        <span class="comh_span">意向沟通的简历（<span>0</span>）</span>
                    </div>
                    <div class="zp_botv">

                    </div>
                </div>

                <!--面试邀约-->
                <div class="tab-pane fade" id="pop_four">
                    <div class="comh_top">
                        <span class="comh_span">面试邀约的简历（<span>0</span>）</span>
                    </div>
                    <div class="zp_botv">

                    </div>
                </div>


            </div>
        </div>
        <div class="comh_rightall">
            <div class="comh_rz">
                <h4>近七天投递简历次数</h4>
                <div id="mapall" style="width: 230px;height: 300px"></div>
            </div>
            <div class="comh_rz">
                <h4>公司审核状态</h4>
                <div class="comh_rr" style="padding-bottom: 20px">
                    <a href="###">
                        <div class="comh_cir">已提交</div>
                    </a>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/arrowx.png" alt="" class="comh_arr">
                    <a href="###">
                        <div class="comh_cir">审核中</div>
                    </a>
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/arrowx.png" alt="" class="comh_arr">
                    <a href="###">
                        <div class="comh_cir">已完成</div>
                    </a>
                </div>

            </div>
        </div>


    </div>
</div>

<%--<div class="allboolean">--%>
<%--<div class="b_out">--%>
<%--<div class="booleanin">--%>
<%--请完善你的简历哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈--%>
<%--<span class="fa fa-remove bremove"></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<jsp:include page="behindforeEnd.jsp"/>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mapall'));


    $(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/PostionSend/count7.do',
            data: {selId:${userLogin.company.companyId}, type: 1, day: 6},
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


</body>
</html>
