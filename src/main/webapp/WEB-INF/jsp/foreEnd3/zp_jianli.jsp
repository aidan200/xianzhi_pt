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
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>简历编辑</title>
    <jsp:include page="distforeEnd.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_jianli.css">
    <script>
        var path='${pageContext.request.contextPath}/';
        var usersex = '${userLogin.member.memberSex}';

    </script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_jianli.js"></script>


</head>
<body>

<jsp:include page="headerforeEnd.jsp"/>
<section class="container zp_jianli_cont">
    <div class="row">
        <div class="col-md-8 zp_jianli_cont_left">
            <div class="zp_jianli_cont_left_top">
                <div>
                    <div  class="zp_jianli_mc">
                        <em title="中文简历_20170704">中文简历_201...</em>
                        <a href="javascript:;" class="icons16 icons16-redit" ></a>
                    </div>
                    <div class="zp_jianli_wcd">
                        <span>完成度60%</span>
                        <div></div>
                    </div>
                    <div class="zp_jianli_yl">
                        &nbsp;<a href="">预览</a> &nbsp;<span>|</span> &nbsp;<a href="">下载</a> &nbsp;<span>|</span> &nbsp;<a href="">刷新</a>
                    </div>

                </div>
            </div>
            <div class="zp_jianli_cont_left_top2">
                <div class="zp_jianli_cont_left_top2_top">
                    <div class="zp_jianli_cont_left_top2_left"></div>
                    <h3><span id="grxx_name">谁谁谁</span> <a class="zp_jianli_xg" href="javascript:;"></a></h3>
                    <p><span id="grxx_zwmc">前端开发</span> - <span id="grxx_szgs">沈阳先知蓝创</span></p>
                    <p><span id="grxx_dqcs">沈阳-苏家屯</span> |  <span id="grxx_dqhy">互联网/移动互联网/电子商务</span>  |  <span id="grxx_gznf">工作 3 年以上</span></p>
                </div>

            </div>
            <div class="zp_jianli_cont_left_middle">
                <div class="zp_jianli_cont_left_jbzl">
                    <div class="zp_jianli_cont_left_jbzl_yl">
                        <div class="zp_jianli_cont_left_jbzl_top">
                            <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                            <span>基本资料</span>
                            <em class="tips-required">必填<i></i></em>
                            <a class="zp_jianli_xg" href="javascript:;"></a>
                        </div>
                        <div class="zp_jianli_cont_left_jbzl_middle">
                            <div class="zp_jianli_cont_left_jbzl_csny">
                                <div class="pull-left">&nbsp; 出生年份: &nbsp; <span id="csnf">1997年</span></div>
                                <div class="pull-right">婚姻状况: &nbsp; <span id="hyzk">保密</span></div>
                            </div>
                            <div class="zp_jianli_cont_left_jbzl_sjh">
                                <div>
                                    手机：<span id="sj">	131****1497</span>
                                </div>
                                <div>
                                    邮箱：<span id="yx">11924****4@qq.com</span>
                                </div>
                                <div>
                                    状态：<span id="zt">在职，看看新机会</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="zp_jianli_cont_left_zyyx">
                    <div class="zp_jianli_cont_left_zyyx_yl">
                        <div class="zp_jianli_cont_left_jbzl_top">
                            <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                            <span>职业意向</span>
                            <em class="tips-required">必填<i></i></em>
                            <a class="zp_jianli_xg" href="javascript:;"></a>
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
                                <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                                <span>工作经历</span>
                                <em class="tips-required">必填<i></i></em>

                            </div>
                        </div>
                    </div>
                    <div class="zp_jianli_div1" id="tj_gzjl">
                        添加工作经历
                    </div>
                </div>
                <div class="zp_jianli_cont_left_xl">
                    <div id="zp_jyjl" class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>教育经历</span>
                        <em class="tips-required">必填<i></i></em>
                    </div>

                    <div class="zp_jianli_div1" id="zp_tjjyjl">
                        添加教育经历
                    </div>
                </div>
                <div class="zp_jianli_cont_left_xmjy">
                    <div class="zp_jianli_cont_left_jbzl_top" id="zp_xmjy">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>项目经验</span>
                    </div>

                    <div class="zp_jianli_div1" id="zp_tjxmjy">
                        添加项目经验
                    </div>

                </div>
                <div class="zp_jianli_cont_left_zopj">
                    <a class="zp_jianli_xg" href="javascript:;"></a>
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>自我评价</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2" id="zp_zopj"></p>
                    <div class="zp_jianli_div1" id="zp_tjzopj">
                        添加自我评价
                    </div>

                </div>
                <div class="zp_jianli_cont_left_fjxx">
                    <a class="zp_jianli_xg" href="javascript:;"></a>
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>附加信息</span>
                    </div>
                    <p class="zp_index_p_left zp_index_p_2" id="zp_fjxx"></p>
                    <div class="zp_jianli_div1" id="zp_tjfjxx">
                        添加附加信息
                    </div>

                </div>
                <div class="zp_jianli_cont_left_scjn">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>擅长技能</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2">更准确的技能标签，让HR/猎头找到你？</p>
                    <div class="zp_jianli_div1" id="jl_tjscjn">
                        添加擅长技能
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-4 zp_index_cont_right">
            <div class="zp_index_cont_right_middle">
                <p><i></i>隐私设置</p>
                <ul>
                    <li>
                        <span>社交名片:</span>
                        <div>
                            <select class="form-control">
                                <option>所有人都能看到</option>
                                <option></option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </li>
                    <li>
                        <span>求职简历:</span>
                        <div>
                            <select class="form-control">
                                <option>开放简历</option>
                                <option></option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="zp_index_cont_right_bottom">
                <div class="zp_index_cont_right_bottom_top">
                    <p>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</p>
                    <div>
                        <div class="col-lg-7">
                            <h4>60%&nbsp;&nbsp;<span>06-29&nbsp;13:07</span></h4>
                        </div>
                        <div class="col-lg-5 zp_index_cont_right_bottom_right">
                            <ul>
                                <li>2</li>
                                <li>2</li>
                                <li>2</li>
                                <li>2</li>
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
                        <li>
                            <div class="zp_index_ww1"><span>0</span></div>
                            <div class="zp_index_ww2">
                                <p><a href=""><span>0</span>家企业HR查看过</a></p>
                                <p><span>0</span>刷新简历能增加被查看概率</p>

                            </div>
                        </li>
                    </ul>
                </div>
                <div class="zp_index_cont_right_bottom_bottom">
                    <p><span>谁看过我的简历</span></p>
                    <div>
                        <div class="zp_index_ww1"><span>0</span></div>
                        <div class="zp_index_ww2">
                            <p><a href=""><span>0</span>家企业HR查看过</a></p>
                            <p><span>0</span>刷新简历能增加被查看概率</p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
</html>
