<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/5
  Time: 13:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="j" uri="/xianzhipt/jsonTag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>简历编辑</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/jedate.css">
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_jianli.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/xzdd.css">

    <script>
        var path = '${pageContext.request.contextPath}/';     //全局路径
        var ID = '${resume.resumeId}';                                          //ID
        var memberId;
        var wanchengdu;                                         //完成度

    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/xzdd.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/myDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/jeDate.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_jianli.js"></script>

</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="personnav.jsp"/>

<section class="zp_jianli_tt">
    <div class="zp_jianli_cont">
        <div class="zp_jianli_cont_left">
            <div class="zp_jianli_cont_left_top">
                <div>
                    <div class="zp_jianli_mc">
                        <em title="中文简历_20170704">中文简历_201...</em>
                        <a href="javascript:;" class="fa fa-edit"></a>
                    </div>
                    <div class="zp_jianli_wcd">
                        <span>完成度<span class="zl_wcd"></span>%</span>
                        <div></div>
                    </div>
                    <div class="zp_jianli_yl">
                        &nbsp;<a href="${pageContext.request.contextPath}/Resume/selResumeInformation.do?resumeId=${resume.resumeId}" target="_blank">预览</a> &nbsp;<span>|</span> &nbsp;<a href="${pageContext.request.contextPath}/Resume/ResumeDownload.do?resumeId=${resume.resumeId}">下载</a> &nbsp;<span>|</span> &nbsp;<a
                            onclick="flashResume()">刷新</a>
                    </div>

                </div>
            </div>
            <div class="zp_jianli_cont_left_top2">
                <div class="zp_jianli_cont_left_top2_top jbxx2">
                    <div class="zp_jianli_cont_left_top2_left"></div>
                    <h3><span id="grxx_name"></span> <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a></h3>
                    <p>职位名称：<span id="grxx_zwmc" style="margin-right: 15px"></span>
                        当前城市：<span id="grxx_dqcs"></span>
                    </p>
                    <p>当前行业：<span id="grxx_dqhy" style="margin-right: 15px"></span>
                        工作年限：<span id="grxx_gznf"></span>
                    </p>
                </div>

            </div>
            <div class="zp_jianli_cont_left_middle">
                <div class="zp_jianli_cont_left_jbzl">
                    <div class="zp_jianli_cont_left_jbzl_yl">
                        <div class="zp_jianli_cont_left_jbzl_top">
                            <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-user-circle-o"></div>
                            <span>基本资料</span>
                            <em class="tips-required">必填<i></i></em>
                            <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a>
                        </div>
                        <div class="zp_jianli_cont_left_jbzl_middle">
                            <div class="xb">
                                <span class="every_test">
                                性&emsp;&emsp;别：<span id="xb"></span>
                                </span>

                                <span class="every_test">
                                出生年份：<span id="csnf"></span>
                                </span>

                                <span class="every_test">
                                    婚姻状况： &nbsp; <span id="hyzk"></span>
                                </span>

                                <span class="every_test">
                                状态：<span id="zt"></span>
                                </span>

                                <span class="every_test">
                                手机：<span id="sj">	</span>
                                </span>

                                <span class="every_test">
                                邮箱：<span id="yx"></span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="zp_jianli_cont_left_zyyx">
                    <div class="zp_jianli_cont_left_zyyx_yl">
                        <div class="zp_jianli_cont_left_jbzl_top">
                            <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-map-signs"></div>
                            <span>职业意向</span>
                            <em class="tips-required">必填<i></i></em>
                            <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a>
                        </div>
                        <div id="zyyx_cont">
                            <p>期望地点：沈阳</p>
                            <p>目前年薪：6.00 万</p>
                        </div>

                    </div>
                </div>
                <div class="zp_jianli_cont_left_gzjl">
                    <div>
                        <div class="zp_jianli_cont_left_gzjl_yl">
                            <div class="zp_jianli_cont_left_jbzl_top" id="gzjl">
                                <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-calendar-minus-o"></div>
                                <span>工作经历</span>
                                <em class="tips-required">必填<i></i></em>
                            </div>

                        </div>
                    </div>
                    <div class="zp_jianli_div1" id="tj_gzjl">
                        添加工作经历
                    </div>
                </div>
                <div class="zp_jianli_cont_left_xl" id="gzjl_parent">
                    <div id="zp_jyjl" class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-graduation-cap"></div>
                        <span>教育经历</span>
                        <em class="tips-required">必填<i></i></em>
                    </div>

                    <div class="zp_jianli_div1" id="zp_tjjyjl">
                        添加教育经历
                    </div>
                </div>
                <div class="zp_jianli_cont_left_xmjy" id="xmjy_parent">
                    <div class="zp_jianli_cont_left_jbzl_top" id="zp_xmjy">
                        <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-map-signs"></div>
                        <span>项目经验</span>
                    </div>

                    <div class="zp_jianli_div1" id="zp_tjxmjy">
                        添加项目经验
                    </div>

                </div>
                <div class="zp_jianli_cont_left_zopj">
                    <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a>
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-pencil-square-o"></div>
                        <span>自我评价</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2" id="zp_zopj"></p>
                    <div class="zp_jianli_div1" id="zp_tjzopj">
                        添加自我评价
                    </div>

                </div>
                <div class="zp_jianli_cont_left_fjxx">
                    <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a>
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-tags"></div>
                        <span>附加信息</span>
                    </div>
                    <p class="zp_index_p_left zp_index_p_2" id="zp_fjxx"></p>
                    <div class="zp_jianli_div1" id="zp_tjfjxx">
                        添加附加信息
                    </div>

                </div>
                <div class="zp_jianli_cont_left_scjn">
                    <div class="zp_jianli_cont_left_jbzl_top" id="scjn">
                        <div class="zp_jianli_cont_left_jbzl_top_bg fa fa-motorcycle"></div>
                        <span>擅长技能</span>
                        <a class="zp_jianli_xg fa fa-edit" href="javascript:;"></a>
                    </div>

                    <div class="zp_index_p_left zp_index_p_2" id="scjn_cont">


                    </div>
                    <div class="zp_jianli_div1" id="jl_tjscjn">
                        添加擅长技能
                    </div>

                </div>
            </div>
        </div>
        <div class="zp_index_cont_right">
            <div class="zp_index_cont_right_middle">
                <p><i></i>隐私设置</p>
                <ul>
                    <li>
                        <span>求职简历:</span>
                        <div>
                            <select class="form-control" onchange="ysChange(this)">
                                <option <c:if test="${resume.resumeYm==0}"> selected </c:if> value="0">开放简历</option>
                                <option <c:if test="${resume.resumeYm==1}"> selected </c:if>value="1">隐藏简历</option>
                            </select>
                        </div>
                    </li>
                </ul>
                <div class="cksc">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title scay_ck">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                       aria-expanded="true" aria-controls="collapseOne">
                                        查看我屏蔽的企业
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse " role="tabpanel"
                                 aria-labelledby="headingOne">
                                <div class="panel-body" id="pbqy">
                                    <div>
                                        <ul id="pb_gs">

                                        </ul>
                                    </div>
                                    <%--<div>搜索公司</div>--%>
                                    <span style="display: inline-block;margin-top: 10px">
                                    <button type="button" class="jianli_s"><span class="fa fa-search"
                                                                                 style="color: #3d9ccc"></span> 搜索</button>
                                    <button type="button" class="jianli_s2"><span class="fa fa-times"
                                                                                  style="color: #3d9ccc"></span> 取消</button>
                                    <input id="gs_ssk" type="text" style="display: none;padding-left: 10px">
                                    <div id="gs_cont" style="display:none;"></div>
                                    <button id="qr" type="button" class="jianli_s3"><span class="fa fa-check" style="color: #fc6866"></span>确认</button></span>
                                    <div id="sy">
                                        <ul class="jianli_ul" style="margin-left: 48px">

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="zp_index_cont_right_bottom">
                <div class="zp_index_cont_right_bottom_top">
                    <p>简&emsp;历</p>
                    <div>
                        <div class="col-lg-7">
                            <h4><span id="jl_wcd"></span>%&nbsp;&nbsp;<span id="js_sxsj"></span></h4>
                        </div>
                        <div class="col-lg-5 zp_index_cont_right_bottom_right">
                            <ul>
                                <li><a href=""><span class="fa fa-eye" style="color: rgba(128,128,128,0.91)"></span></a></li>
                                <li><a href=""><span class="fa fa-download" style="color: rgba(128,128,128,0.91)"></span></a></li>
                                <li><a href=""><span class="fa fa-refresh" style="color: rgba(128,128,128,0.91)"></span></a></li>
                                <li><a href=""><span class="fa fa-pencil" style="color: rgba(128,128,128,0.91)"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="zp_index_cont_right_bottom_middle">
                    <p><span>谁看过我的简历</span></p>
                    <ul>
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>个人看过你的简历</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                        <%--<li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>家企业HR查看过</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>--%>
                    </ul>
                </div>
                <div class="zp_index_cont_right_bottom_bottom">
                    <p><span>每日投递数量</span></p>
                    <div>
                        <div class="zp_index_ww1"><span>0</span></div>
                        <div class="zp_index_ww2">
                            <p><a href="">今日已投递<span>0</span>个职位</a></p>
                            <p><span>0</span>每天最多投递50个</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="behindforeEnd.jsp"/>
<div id='zp_gsxq_bd_tck'>
    <div id='zp_gsxq_bd_tck_cont2'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择城市信息</span>
            <a class="pull-right gb"><span class="fa fa-close"></span></a>
        </div>

        <div class="zp_one"> 最多选择一项：<span id="div6"></span>
        </div>

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
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <div style="padding-left: 20px">请选择省份</div>
            <ul class="zp_ul">
                <li><a class="cd-popup-trigger" >北京市</a></li>
                <li><a href="#0" class="cd-popup-trigger" >广东省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >山东省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >江苏省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >河南省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >上海市</a></li>
                <li><a href="#0" class="cd-popup-trigger" >河北省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >浙江省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >香港特别行政区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >陕西省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >湖南省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >重庆市</a></li>
                <li><a href="#0" class="cd-popup-trigger" >福建省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >天津市</a></li>
                <li><a href="#0" class="cd-popup-trigger" >云南省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >四川省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >广西壮族自治区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >安徽省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >海南省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >江西省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >湖北省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >山西省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >辽宁省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >台湾省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >黑龙江</a></li>
                <li><a href="#0" class="cd-popup-trigger" >内蒙古自治区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >澳门特别行政区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >贵州省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >甘肃省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >青海省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >新疆维吾尔自治区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >西藏区</a></li>
                <li><a href="#0" class="cd-popup-trigger" >吉林省</a></li>
                <li><a href="#0" class="cd-popup-trigger" >宁夏回族自治区</a></li>
            </ul>

        </div>

        <div class="yp_cs">

        </div>

        <div class="zp_gsxq_bd_tck_bottom">
            <a class="zp_button1" >确定</a>
            <button type="button" class="zp_button">取消</button>
        </div>

    </div>
</div>
<div class="cd-popuph" id="qwhy__" role="alert">
    <div class="cd-popup-containerh">
        <p style="font-size: 16px">选择行业分类</p>

        <div class="comd_table" id="hy_tab">
            <h4>IT行业</h4>
            <ul class="zp_ulu">
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="1" data-value="互联网/移动互联网"/>互联网/移动互联网</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="2" data-value="网络游戏"/>网络游戏</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="3" data-value="计算机软件"/>计算机软件</li>
                <li><input type="checkbox" data-fieldtype="2" data-fieldId="4" data-value="IT服务/系统集成"/>IT服务/系统集成</li>
            </ul>
        </div>

        <ul class="cd-buttonsh">
            <li><a href="#0" class="cd-popup-closeh">取消</a></li>
            <li><a href="#0" id="xz_qwhy_qd">确定</a></li>
        </ul>
        <a href="#0" class="cd-popup-closeh cmd_closeh fa fa-remove"></a>
    </div>
</div>

<%--遮罩--%>
<div class="zhe">
    <a href="###" class="all_close">我知道了 </a>
    <button>akfjhajkfadjkf</button>
</div>
<%----%>
</body>
</html>

<script>
    jQuery(document).ready(function ($) {
        //close popup
        $('.zhe').on('click', function (event) {
            if ($(event.target).is('.all_close') || $(event.target).is('.zhe')) {
                event.preventDefault();
                $(this).addClass('nozhe');
            }
        });
    });
</script>
<script>
    function ysChange(ys) {
        var dd = {resumeId: ID, resumeYm: ys.value};
        console.log(dd);
        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/Resume/updateResume.do',
            contentType: "application/json",
            data: JSON.stringify(dd)
        });
    }
</script>
