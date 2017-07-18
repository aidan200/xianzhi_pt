<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/7/5
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--解析表达式--%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>企业登录首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_gsxq_bd.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/fileUpload.css">
    <script>
        var dkh="http://localhost:8080";        //端口号
        var path="${pageContext.request.contextPath}/"

    </script>

    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/template-web.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/uploadUtil.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_gsxq_bd.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C" type="text/javascript"></script>

</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<form action="${pageContext.request.contextPath}/CompanyInfo/addCompany.do" id="zp_gsxq_form" enctype="multipart/form-data" method="post"></form>

<section class="container zp_gsxq_bd_cont">
    <div class="zp_gsxq_bd_js">
        <h4>请填写公司的信息<em class="pull-right"><span>*</span>为必填</em></h4>
    </div>
    <div class="zp_gsxq_bd_cont_1" style="border: none">
        <h2><span class="number">1</span>公司基本信息</h2>
        <div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司名称：</label>
                <div class="group-content valid-row relative">
                    <input id="gsxq_gsmc" form="zp_gsxq_form" class="text" size="60" type="text" name="companyName" maxlength="70" placeholder="如：沈阳先知蓝创有限公司"  value=""><ul  class="ejob-list" style="display: none;"></ul>
                    <span class="addtions text-muted">注：名称发布后不可以修改</span>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>领域：</label>
                <div class="zp_gsxq_hy">
                    <input id="gsxq_gshy" form="zp_gsxq_form" name="domain" type="text" placeholder="请输入或者选择领域">
                    <em></em>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>应用技术：</label>
                <div class="group-content valid-row relative">
                    <input id="gsxq_yyjs" form="zp_gsxq_form" class="text" size="60" type="text" name="skill" maxlength="70" placeholder="如：大数据" validate-title="职位名称" validate-rules="[['required','请填写$'],['reallength',{'max':140},'$1长度不能大于70个字'],['repeat',{'max':5},'请准确填写您的$1信息'],['not',{'type':['email','mobile']},'请勿在$里填写手机号码、QQ、MSN等联系方式']]" value=""><ul data-selector="ejob-list" class="ejob-list" style="display: none;"></ul>
                    <span class="addtions text-muted">注：应用技术</span>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司规模：</label>
                <div class="zp_gsxq_gm">
                    <select form="zp_gsxq_form" name="companyScale"  id="gsxq_gsgm">
                        <option data-value="0">50-100人</option>
                        <option data-value="1">100-500人</option>
                        <option data-value="2">500-2000人</option>
                        <option data-value="3">2000-1W人</option>
                        <option data-value="4">1W人以上</option>
                    </select>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司待遇：</label>
                <div class="zp_gsxq_dy"  id="gsxq_gsdy">
                    <label>
                        <input form="zp_gsxq_form" type="checkbox"  data-value="0"> 绩效奖金
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox"   data-value="1"> 带薪年假
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox"   data-value="2"> 交通补助
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox"  data-value="3"> 定期体检
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="4"> 年度旅游
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="5"> 免费班车
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="6"> 管理规范
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="7"> 技能培训
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="8"> 岗位晋升
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="9"> 五险一金
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="10"> 生育补贴
                    </label>
                    &nbsp;
                    <label>
                        <input  form="zp_gsxq_form" type="checkbox" data-value="11"> 上市公司
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="12"> 形态多样
                    </label>
                    &nbsp;
                    <label>
                        <input form="zp_gsxq_form" type="checkbox" data-value="13"> 平台广阔
                    </label>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司地址：</label>
                <div class="zp_gsxq_dz">
                    <input  id="gsxq_gsdz" form="zp_gsxq_form" name="companyLocation" type="text" placeholder="请选择省/市/区"><br>
                    <em></em>
                    <input  id="gsdz_ssk" form="zp_gsxq_form" name="filed1" type="text" placeholder="请输入大致区域如：同方广场">
                    <input  form="zp_gsxq_form" name="filed1" type="text" placeholder="请填写街道、楼宇详细地址">
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>企业地址：</label>
                <div id="gsdz" class="ditu"></div>
            </div>

            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司图标：</label>
                <div class="zp_gsxq_logo gstb">
                    <p>请您上传一张公司标志图片作为公司展示头像</p>
                    <div id="gstb_bg"></div>
                    <input id="gstb_inp1" form="zp_gsxq_form" type="text" style="display: none">
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>企业风采：</label>
                <div class="qyfc">
                    <p>企业风采照片</p>
                    <script id="qyfc_mb" type="text/html">
                        <div>
                            <h3><a href="javascript:;" class="fa fa-check-square a1_gb_tj"></a><a href="javascript:;" class="fa fa-window-close a1_gb_sc"></a></h3>
                            <div id=qyfc_bg_{{qyfc_id}} class="qyfc_bg" style="background-image: url('{{dkh}}{{path}}{{qyfc_url}}')" ></div>
                            <input type="text" style="display: none" value="" id=qyfc_{{qyfc_id}}>
                            <textarea>{{qyfc_ms}}</textarea>
                        </div>
                    </script>
                    <h4 id="tj_gsfc">添加公司风采图片</h4>
               </div>
            </div>


        </div>
    </div>
    <div class="zp_gsxq_bd_cont_1">
        <h2><span class="number">2</span>公司介绍</h2>
        <div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司介绍：</label>
                <div class="zp_gsxq_js">
                    <textarea  id="gsxq_gsjs" form="zp_gsxq_form"></textarea>
                    <p>注：职位描述中请勿填写涉及歧视的内容，例如：女性优先，只招男士，残疾，乙肝等</p>
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error"></span>产品介绍：</label>
                <div class="zp_gsxq_cpjs" id="gsxq_cpjs">


                    <script id="tj_gscp" type="text/html">
                        <div class="zp_gsxq_cpjs_cp">
                            <div class="zp_gsxq_cpjs_cp_left">
                                <h3>请上传一张产品图片</h3>
                                <div id=cpjs_{{index}} class="zp_gsxq_ttbg cpjs_bg"></div>
                                <input id=cpjs_inp{{index}} type="text" style="display: none">
                            </div>
                            <div class="zp_gsxq_cpjs_cp_right"><input form="zp_gsxq_form" type="text" placeholder="请输入产品名称">
                                <textarea form="zp_gsxq_form">请输入产品信息</textarea>
                            </div>
                            <div style="clear:both"></div><span>X</span>
                        </div>
                    </script>


                    <div id="tjcpjs" class="zp_gsxq_cpjs_div1">
                        添加公司产品
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="zp_gsxq_bd_cont_1 zp_aa">
        <h2><span class="number">3</span>确认提交</h2>
        <div>
            <button form="zp_gsxq_form" type="reset" class="btn btn-large btn-light">重置</button>
            <button form="zp_gsxq_form" type="submit" class="btn btn-large btn-light" >提交</button>
        </div>
    </div>
</section>

<div id='zp_gsxq_bd_tck'>
    <div id='zp_gsxq_bd_tck_cont1'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择职能</span>
            <a class="pull-right gb">x</a>
        </div>
        <div class="zp_gsxq_bd_tck_middle">
            <p>通用职能</p>
            <ul>
                <li><a href="javascript:;">高级管理</a></li>
                <li><a href="javascript:;">人力资源</a></li>
                <li><a href="javascript:;">财务/审计/税务</a></li>
                <li><a href="javascript:;">市场</a></li>
            </ul>
            <p>专业职能</p>
            <ul>
                <li><a href="javascript:;">IT/互联网/通信</a></li>
                <li><a href="javascript:;">房地产/建筑/物业</a></li>
                <li><a href="javascript:;">金融</a></li>
                <li><a href="javascript:;">生产/制造</a></li>
                <li><a href="javascript:;">质量管理/项目管理</a></li>
                <li><a href="javascript:;">教育/咨询/翻译</a></li>
                <li><a href="javascript:;">广告/传媒/设计</a></li>
                <li><a href="javascript:;">市场</a></li>
                <li><a href="javascript:;">高级管理</a></li>
                <li><a href="javascript:;">人力资源</a></li>
                <li><a href="javascript:;">财务/审计/税务</a></li>
                <li><a href="javascript:;">市场</a></li>
            </ul>
        </div>
        <div class="zp_gsxq_bd_tck_bottom">
            <button type="button" class="btn btn-primary">取消</button>
        </div>
    </div>
    <div id='zp_gsxq_bd_tck_cont2'>
        <div class="zp_gsxq_bd_tck_top">
            <span class="pull-left">选择职能</span>
            <a class="pull-right gb">x</a>
        </div>
        <div class="zp_gsxq_bd_tck_cont2_cont">
            <select name="pro" id="pro" onchange="change();">
                <option value="">请选择省份</option>
                <option value="1">北京市</option>
                <option value="2">广东省</option>
                <option value="3">山东省</option>
                <option value="4">江苏省</option>
                <option value="5">河南省</option>
                <option value="6">上海市</option>
                <option value="7">河北省</option>
                <option value="8">浙江省</option>
                <option value="9">香港特别行政区</option>
                <option value="10">陕西省</option>
                <option value="11">湖南省</option>
                <option value="12">重庆市</option>
                <option value="13">福建省</option>
                <option value="14">天津市</option>
                <option value="15">云南省</option>
                <option value="16">四川省</option>
                <option value="17">广西壮族自治区</option>
                <option value="18">安徽省</option>
                <option value="19">海南省</option>
                <option value="20">江西省</option>
                <option value="21">湖北省</option>
                <option value="22">山西省</option>
                <option value="23">辽宁省</option>
                <option value="24">台湾省</option>
                <option value="25">黑龙江</option>
                <option value="26">内蒙古自治区</option>
                <option value="27">澳门特别行政区</option>
                <option value="28">贵州省</option>
                <option value="29">甘肃省</option>
                <option value="30">青海省</option>
                <option value="31">新疆维吾尔自治区</option>
                <option value="32">西藏区</option>
                <option value="33">吉林省</option>
                <option value="34">宁夏回族自治区</option>
            </select>
            <select name="city" id="city">
                <option value="">请选择城市</option>
            </select>
        </div>
        <div class="zp_gsxq_bd_tck_bottom">
            <a class="btn btn-primary ">确定</a>
            <button type="button" class="btn btn-primary">取消</button>
        </div>
    </div>
</div>


</body>
</html>
