<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 10:00
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
<body>

<jsp:include page="headerforeEnd.jsp"/>


<div class="resume_container">
    <div class="resume_all">
        <!--上面基本信息-->
        <div class="resume_top">
            <div class="resume_outimg">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" class="resume_head">
            </div>
            <div class="resume_right">
                <h3>郑秀妍</h3>
                <div style="margin-top: 20px">
                    <span class="resume_outs">
                    目前公司: <span>先知蓝创科技有限公司</span>
                    </span>
                    <span class="resume_outs">
                    所在地点: <span>沈阳-苏家屯</span>
                    </span>
                </div>

                <div style="margin-top: 10px">
                    <span class="resume_outs">
                    目前职位: <span>web前端</span>
                    </span>
                    <span class="resume_outs">
                    工作年限: <span>1年以上</span>
                    </span>
                </div>
            </div>
        </div>


        <div class="resume_center">
            <!--基本资料-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-user-circle-o"></span>基本资料</h4>
                    <div class="resume_two">
                        <div class="resume_every">
                            性&emsp;&emsp;别：<span>女</span>
                        </div>
                        <div class="resume_every">
                            手&emsp;&emsp;机：<span>168571561872</span>
                        </div>
                        <div class="resume_every">
                            性&emsp;&emsp;别：<span>女</span>
                        </div>
                        <div class="resume_every">
                            出生日期： <span>1989-04-18</span>
                        </div>
                        <div class="resume_every">
                            婚姻状况： <span>保密</span>
                        </div>
                        <div class="resume_every">
                            目前状态： <span>在职，看看新机会</span>
                        </div>
                    </div>

                </div>
            </div>
            <div style="clear: both"></div>

            <!--职业意向-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-map-signs"></span>职业意向</h4>
                    <div class="resume_two">
                        <div class="resume_every">
                            期望行业：<span>计算机</span>
                        </div>
                        <div class="resume_every">
                            期望地点：<span>沈阳</span>
                        </div>
                    </div>

                    <div class="resume_two">
                        <div class="resume_every">
                            期望职位： <span>cfo</span>
                        </div>
                        <div class="resume_every">
                            期望年薪： <span>100万</span>
                        </div>

                    </div>
                </div>

            </div>
            <div style="clear: both"></div>

            <!--工作经历-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-calendar-minus-o"></span>工作经历</h4>
                    <b>
                        <div class="resume_self">
                            <span style="padding-left: 20px">2015.01</span>-<span>至今</span>
                            <span style="padding-left: 20px">先知蓝创科技有限公司</span>
                        </div></b>
                    <div class="resume_two">
                        <div class="resume_every">
                            公司描述：<span>女</span>
                        </div>
                        <div class="resume_every">
                            公司性质：<span>国企</span>
                        </div>
                        <div class="resume_every">
                            公司规模：<span>2000人</span>
                        </div>
                        <div class="resume_every">
                            公司行业：<span>计算机</span>
                        </div>
                        <div class="resume_every">
                            工作职位：<span>web前端</span>
                        </div>
                        <div class="resume_every">
                            薪酬状况：<span>10000</span>
                        </div>
                        <div class="resume_every">
                            工作地点：<span>沈阳</span>
                        </div>
                        <div class="resume_every">
                            所在部门：<span> </span>
                        </div>
                        <div class="resume_every3">
                            <span style="display: inline-block;float: left">职责业绩：</span>
                            <span class="resume_many">hhahhahahahhahaha</span>
                        </div>
                    </div>


                </div>

            </div>
            <div style="clear: both"></div>

            <!--教育经历-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-graduation-cap"></span>教育经历</h4>
                    <div class="resume_two">
                        <div class="resume_every3">
                            <b><span>辽东学院</span><span style="margin-left: 20px">2014.09-2016.07</span></b>
                        </div>
                        <div class="resume_every2">
                            专业名称：<span>信息管理与信息系统</span>
                        </div>
                        <div class="resume_every2">
                            学历：<span>本科</span>
                        </div>
                        <div class="resume_every2">
                            是否是统招：<span>是</span>
                        </div>

                    </div>


                </div>

            </div>
            <div style="clear: both"></div>

            <!--项目经验-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-map-signs"></span>项目经验</h4>
                    <div class="resume_two">
                        <div class="resume_every3">
                            项目名称：<span>balbbaliba</span>
                        </div>
                        <div class="resume_every3">
                            <span style="display: inline-block;float: left">项目职务：</span>
                            <span class="resume_many">baliabali</span>
                        </div>
                        <div class="resume_every3">
                            <span style="display: inline-block;float: left">项目职责：</span>
                            <span class="resume_many">abakakabnaofh</span>
                        </div>
                        <div class="resume_every3">
                            <span style="display: inline-block;float: left">项目描述：</span>
                            <span class="resume_many">hhahhahahahhahaha</span>
                        </div>
                    </div>

                </div>

            </div>
            <div style="clear: both"></div>

            <!--自我评价-->
            <div class="r_out">
                <div class="resume_more">
                    <h4> <span class="fa fa-pencil-square-o"></span>自我评价</h4>
                    <div class="resume_two">
                        巴拉巴拉巴拉巴拉巴拉巴拉巴拉巴拉
                    </div>
                </div>
            </div>
            <div style="clear: both"></div>

            <!--附加信息-->
            <div class="r_out">
                <div class="resume_more">
                    <h4><span class="fa fa-tags"></span>附加信息</h4>
                    <div class="resume_two">
                        哈哈啊哈哈哈哈哈哈
                    </div>


                </div>

            </div>
            <div style="clear: both"></div>

            <!--擅长技能-->
            <div class="r_out" style="border-bottom:none">
                <div class="resume_more">
                    <h4><span class="fa fa-motorcycle"></span>擅长技能</h4>
                    <div class="resume_two">
                        <span class="res_sp">java</span>
                        <span class="res_sp">java</span>
                        <span class="res_sp">java</span>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div id="index_bb">
    <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/dfdf.png" alt="" id="goTopBtn">
</div>
<a href="###"><img src="${pageContext.request.contextPath}/dist/foreEnd3/img/ghh.png" alt="" class="index_gh"></a>

<script src="${pageContext.request.contextPath}/dist/foreEnd3/js/gotop.js"></script>

</body>
</html>