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
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_jianli.js"></script>
    <script>
        var path='${pageContext.request.contextPath}/';
        var usersex = '${userLogin.member.memberSex}';
    </script>

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
                    <h3>谁谁谁 <a class="zp_jianli_xg" href="javascript:;"></a></h3>
                    <p>前端开发 - 沈阳先知蓝创</p>
                    <p>沈阳-苏家屯 |  互联网/移动互联网/电子商务 |  WEB前端开发工程师 |  工作 3 年以上</p>
                </div>
                <div class="zp_jianli_zl_1">
                    <div class="zp_jianli_zl_1_left">
                        <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/boy.png" alt="" width="102" height="102">
                        <div>
                            <a href="">删除</a>
                            <a href="">修改</a>
                        </div>
                    </div>
                    <div class="zp_jianli_zl_1_right">
                        <ul>
                            <li>
                                姓名 <input id="jl_name" type="text"  class="form-control zp_jianli_input1">
                            </li>
                            <li id="jl_xb">
                                性别 <input id="nan"  name="xb" type="radio" value="男" ><label for="nan">男</label><input value="女" type="radio" name="xb" id="nan2"><label for="nan2">女</label>
                            </li>
                            <li>
                                当前行业 <input id="jl_dqhy" type="text" class="form-control zp_jianli_input2" >
                            </li>
                            <li>
                                工作年份&nbsp;&nbsp;&nbsp;<input id="jl_gznf" type="text"  class="form-control zp_jianli_input3" style="margin-right: 27px">   职位名称&nbsp;&nbsp;&nbsp;<input id="jl_zwmc" type="text" class="form-control zp_jianli_input3" >
                            </li>
                            <li>
                                当前城市 <input id="jl_dqcs" type="text" class="form-control zp_jianli_input2" >
                            </li>
                        </ul>
                        <button type="button" id="zp_jianli_bd_1_qd" class="btn btn-primary ">确定</button>
                        <button class="btn btn-default" id="zp_jianli_bd_1_qx" type="button">取消</button>
                    </div>
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
                                <div class="pull-left">&nbsp; 出生年份: &nbsp; <span>1997年</span></div>
                                <div class="pull-right">婚姻状况: &nbsp; <span>保密</span></div>
                            </div>
                            <div class="zp_jianli_cont_left_jbzl_sjh">
                                <div>
                                    手机：<span>	131****1497</span>
                                </div>
                                <div>
                                    邮箱：<span>11924****4@qq.com</span>
                                </div>
                                <div>
                                    状态：<span>在职，看看新机会</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="zp_jianli_zl_2">
                        <div class="pull-left">
                            <ul>
                                <li>
                                    出生年月
                                    <select class="form-control" id="jl_cstime">
                                    </select>
                                </li>
                                <li class="zp_jianli_zl_2_li2" >
                                    <span >手机</span>
                                    <input id="jl_sj" type="text" class="form-control zp_jianli_zl_2_input1 ">
                                </li>
                                <li>
                                    <span>状态</span>
                                    <select class="form-control" id="jl_zt">
                                        <option>就职</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </li>
                            </ul>
                        </div>
                        <div class="pull-right">
                            <ul>
                                <li>
                                    婚姻状况
                                    <select class="form-control" id="jl_hyzk">
                                        <option>保密</option>
                                        <option >2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </li>
                                <li class="zp_jianli_zl_2_li2" >
                                    <span>邮箱</span>
                                    <input id="jl_yx" type="text" class="form-control zp_jianli_zl_2_input1 ">
                                </li>

                            </ul>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="zp_jianli_zl_2_bottom">
                            <button type="button" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" id="jbzl_2_qx"  type="button">取消</button>
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
                        <p>期望地点：沈阳</p>
                        <p>目前年薪：6.00 万</p>
                    </div>
                    <div class="zp_jianli_zl_3">
                        <ul>
                            <li>
                                期望行业 <input id="jl_qwhy" type="text" class="form-control zp_jianli_zl_3_input1 ">
                                <em></em>
                            </li>
                            <li>
                                期望职能 <input id="jl_qwzn" type="text" class="form-control zp_jianli_zl_3_input1">
                                <em></em>
                            </li>
                            <li>
                                期望地点 <input id="jl_qwdd" type="text" class="form-control zp_jianli_zl_3_input1">
                                <em></em>
                            </li>
                            <li id="jl_qwnx">
                                期望年薪 <input  type="text" class="form-control zp_jianli_zl_3_input2">
                                元/月x
                                <input type="text" class="form-control zp_jianli_zl_3_input3">
                                个月= <span>0.00</span> 万
                            </li>
                            <li id="jl_mqnx">
                                目前年薪 <input type="text" class="form-control zp_jianli_zl_3_input2">
                                元/月x
                                <input type="text" class="form-control zp_jianli_zl_3_input3">
                                个月= <span>0.00</span> 万
                            </li>
                        </ul>
                        <div class="zp_jianli_zl_2_bottom">
                            <button type="button" class="btn btn-primary">确定</button>
                            <button class="btn btn-default" id="zp_jianli_zl_3_qx" type="button">取消</button>
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
                    <div>
                        <p class="zp_index_p_left">
                            国家开放大学（2017/09–至今）
                            <a class="zp_jianli_xg" href="javascript:;"></a>
                        </p>
                        <ul>
                            <li>专业名称<span>行政管理</span></li>
                            <li>学历<span>大专</span></li>
                            <li>是否统招<span>是</span></li>
                        </ul>
                    </div>
                    <div class="zp_jianli_div1">
                        添加教育经历
                    </div>
                </div>
                <div class="zp_jianli_cont_left_yynl">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>语言能力</span>
                    </div>
                    <p class="zp_index_p_left">
                        语言能力：<span>普通话</span>
                        <a class="zp_jianli_xg" href="javascript:;"></a>
                    </p>
                </div>
                <div class="zp_jianli_cont_left_xmjy">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>项目经验</span>

                    </div>
                    <p class="zp_index_p_left">项目经验是用人单位衡量人才能力的重要指标哦！</p>
                    <p class="zp_index_p_left">来说说令你难忘的项目经历吧！</p>
                    <div class="zp_jianli_div1">
                        添加项目经验
                    </div>

                </div>
                <div class="zp_jianli_cont_left_zopj">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>自我评价</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2">建议您对自己做一个简短评价，简明扼要的描述您的职业优势，让猎头顾问和企业HR快速了解您！填写文字限1000字以内</p>
                    <div class="zp_jianli_div1">
                        添加自我评价
                    </div>

                </div>
                <div class="zp_jianli_cont_left_fjxx">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>附加信息</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2">如：获奖项、技能资格证书、专利等，填写文字1000字以内</p>
                    <div class="zp_jianli_div1">
                        添加附加信息
                    </div>

                </div>
                <div class="zp_jianli_cont_left_scjn">
                    <div class="zp_jianli_cont_left_jbzl_top">
                        <div class="zp_jianli_cont_left_jbzl_top_bg" style="background-image: url('${pageContext.request.contextPath}/dist/foreEnd3/img/zp_jianli_img5.png')"></div>
                        <span>擅长技能</span>

                    </div>
                    <p class="zp_index_p_left zp_index_p_2">更准确的技能标签，让HR/猎头找到你？</p>
                    <div class="zp_jianli_div1">
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
