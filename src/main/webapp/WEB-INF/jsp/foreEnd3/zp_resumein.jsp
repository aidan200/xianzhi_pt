<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/8/7
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="distforeEnd.jsp"/>
</head>
<body style="background-color: #EEEEEE">
<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>


<div class="rei_all">
    <div class="rei_center">


        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/tutu.png" alt="" class="rei_top">

        <div class="rei_very">
            <div class="rei_left">
                <div class="rei_headout">
                    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="rei_head">
                    <h4>郑秀妍</h4>
                </div>
                <div class="rei_leftop">
                    <div>性&emsp;&emsp;别：<span></span></div>
                    <div>出生年份：<span></span></div>
                    <div>婚姻状况：<span></span></div>
                    <div>状&emsp;&emsp;态：<span></span></div>
                    <div>手&emsp;&emsp;机：<span></span></div>
                    <div>邮&emsp;&emsp;箱：<span>1224685820@qq.com</span></div>
                    <div>职位名称：<span></span></div>
                    <div>当前城市：<span></span></div>
                    <div>工作年限：<span></span></div>
                </div>

                <div class="rei_leftop" style="border-bottom: none">
                    <div style="margin-bottom: 10px">擅长技能：</div>
                    <span class="rei_ji">JAVA</span>
                    <span class="rei_ji">JAVA</span>
                    <span class="rei_ji">JAVA</span>
                    <span class="rei_ji">JAVA</span>

                </div>
            </div>


            <div class="rei_right">
                <div class="rei_topr">
                    <h4><span class="fa fa-map-signs rei_col"></span> 职业意向</h4>
                    <div>目前行业：<span></span></div>
                    <div>期望行业：<span></span></div>

                    <div class="rei_two">期望地点：<span></span></div>
                    <div class="rei_two2">期望职位：<span></span></div>

                    <div class="rei_two">目前年薪：<span></span></div>
                    <div class="rei_two2">期望年薪：<span></span></div>

                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-calendar-minus-o rei_col"></span> 工作经历</h4>
                    <div><span>2017-08-08</span> 至 <span style="margin-right: 40px">2017-08-08</span>
                        <span style="margin-right: 40px">沈阳</span>
                        <span>先知蓝创</span>
                    </div>
                    <div>公司领域：<span></span></div>
                    <div class="rei_two">职位名称：<span></span></div>
                    <div class="rei_two2">下属人数：<span></span></div>
                    <div>职位业绩：<span></span></div>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-graduation-cap rei_col"></span> 教育经历</h4>
                    <div><span>2017-08-08</span> 至 <span style="margin-right: 40px">2017-08-08</span>
                        <span>东北大学</span>
                    </div>
                    <div><span style="width: 32%;display: inline-block">专业：<span>服装设计工程</span></span>
                        <span style="width: 32%;display: inline-block">学历： <span>小学</span></span>
                        <span style="width: 32%;display: inline-block">非统招</span>
                    </div>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-navicon rei_col"></span> 项目经验</h4>
                    <div>
                        <span>2017-08-08</span> 至 <span>2017-08-08</span>
                        <span style="margin-left: 40px">先知蓝创平台</span>
                    </div>
                    <div>项目职位：<span></span></div>
                    <div>项目描述：<span></span></div>
                    <div>项目职责：<span></span></div>
                </div>

                <div class="rei_topr">
                    <h4><span class="fa fa-pencil-square-o rei_col"></span> 自我评价</h4>
                    <div>afaqeewfgwe</div>
                </div>
                <div class="rei_topr" style="border-bottom: none">
                    <h4><span class="fa fa-tags rei_col"></span> 附加信息</h4>
                    <div>ajhcfbajh</div>
                </div>

            </div>
            <div style="clear: both"></div>
            <div class="rei_bottom">
                <button class="rei_button">收藏简历</button>
                <button class="rei_button">下载简历</button>
            </div>
        </div>
    </div>
</div>
<jsp:include page="behindforeEnd.jsp"/>
</body>
</html>
