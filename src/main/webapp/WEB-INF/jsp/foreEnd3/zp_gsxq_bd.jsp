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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="distforeEnd.jsp"/>
    <title>企业登录首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/zp_gsxq_bd.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/foreEnd3/css/fileUpload.css">
    <script>
        var ID=2;
        var dkh="http://localhost:8080";        //端口号
        var path="${pageContext.request.contextPath}/"

    </script>

    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/template-web.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/uploadUtil.js"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/zp_gsxq_bd.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=8VuO5m4tgo3GWNiS6sQaBjNo2lG38D1C" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/dist/foreEnd3/js/mapUtil.js" type="text/javascript"></script>
    <style type="text/css">
        .skilldiv {
            border: 1px solid #E6E6E6;
            float: left;
            height: 30px;
            margin-right: 15px;
            margin-bottom: 10px;
        }

        .skilldiv > div {
            line-height: 30px;
            padding: 0 15px;
            height: 28px;
            float: left;
            text-align: center;
        }

        .skilldiv > a{
            float: left;
            display: inline-block;
            width: 20px;
            height: 28px;
            background: #E9F1F5;
            text-align: center;
            line-height: 28px;
            color: #85B4CC;
        }
        .addInpt{
            display: block;
            position: absolute;
        }
        .addBut{
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
<jsp:include page="headerforeEnd.jsp"/>
<form action="${pageContext.request.contextPath}/CompanyInfo/editCompany.do" id="zp_gsxq_form" method="get"></form>

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
                    <div class="_left">
                        <input id="gsxq_gsmc" form="zp_gsxq_form" class="text" size="60" type="text" name="companyName" maxlength="70" placeholder="如：沈阳先知蓝创有限公司"  value="${company.companyName}"><ul  class="ejob-list" style="display: none;"></ul>
                    </div>
                    <div class="_right">
                        <span class="addtions text-muted">注：名称发布后不可以修改</span>
                    </div>


                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>领域：</label>
                <div class="_left">
                    <div class="zp_gsxq_hy">
                        <div class='skilldiv'>
                            <div>awadw</div>
                            <a class="skillBtn">x</a>
                            <input form='zp_gsxq_form' type="hidden" name="companySkill">
                        </div>
                        <em></em>
                    </div>
                </div>
                <div class="_right"></div>


            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>应用技术：</label>
                <div class="_left">
                    <div class="group-content">
                        <div class='skilldiv'>
                            <div>awadw</div>
                            <a class="skillBtn">x</a>
                            <input form='zp_gsxq_form' type="hidden" name="companySkill">
                        </div>
                    </div>
                    <button class="addBut">+</button>
                    <input class="addInpt" inpName="companySkill"/>
                </div>
                <div class="_right">
                    <span class="addtions text-muted">例：java，c++ 等</span>
                </div>

            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司规模：</label>
                <div class="_left">
                    <div class="zp_gsxq_gm">
                        <select form="zp_gsxq_form" name="companyScale"  id="gsxq_gsgm">
                            <option value="0-50">0-50人</option>
                            <option value="50-500">50-500人</option>
                            <option value="500-1000">500-1000人</option>
                            <option value="1000以上">1000人以上</option>
                        </select>
                    </div>
                </div>
                <div class="_right"></div>

            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司待遇：</label>
                <div class="_left">
                    <div class="group-content">
                        <div class='skilldiv'>
                            <div>awadw</div>
                            <a class="skillBtn">x</a>
                            <input form='zp_gsxq_form' type="hidden" name="companyWelfare">
                        </div>
                    </div>
                    <button class="addBut">+</button>
                    <input inpName="companyWelfare"/>
                </div>
                <div class="_right">
                    <span class="addtions text-muted">例：带薪年假，十三薪 等</span>
                </div>

            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司性质：</label>
                <div class="_left">
                    <div class="zp_gsxq_dz">
                        <div class="zp_gsxq_gm">
                            <select form="zp_gsxq_form" name="financing"  id="gsxq_rzqk">
                                <option data-value="种子轮">种子轮</option>
                                <option data-value="天使轮">天使轮</option>
                                <option data-value="A轮">A轮</option>
                                <option data-value="B轮">B轮</option>
                                <option data-value="C轮">C轮</option>
                                <option data-value="D轮及以上">D轮及以上</option>
                                <option data-value="未融资">未融资</option>
                            </select>
                            <select form="zp_gsxq_form" name="companyNature"  id="gsxq_gsxz">
                                <option value="1">国企</option>
                                <option value="2">民营</option>
                                <option value="3">外企</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="_right"></div>

            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司地址：</label>


                <div class="zp_gsxq_dz gsdd__">
                    <div class="_left">
                        <input  id="this_space" form="zp_gsxq_form" name="companyCity" type="text" value="${company.companyCity}" placeholder="请选择省/市/区"><em></em>
                        <input  id="gsdh" form="zp_gsxq_form" style="float: right" name="companyPhone" type="text" value="${company.companyPhone}" placeholder="公司座机电话">
                        <input  id="gsdz_ssk" form="zp_gsxq_form" name="companyLocation" type="text" value="${company.companyLocation}" placeholder="请输入大致区域如：同方广场">
                        <input  form="zp_gsxq_form" style="float: right" name="companySpace" type="text" value="${company.companySpace}" placeholder="请填写街道、楼宇详细地址">
                    </div>
                    <div class="_right"></div>


                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title">地图定位：</label>
                <div class="_left">
                <input id="companyX" form="zp_gsxq_form" name="companyX" value="${company.companyX}" type="hidden">
                <input id="companyY" form="zp_gsxq_form" name="companyY" value="${company.companyY}" type="hidden">
                <div id="gsdz" class="ditu"></div>
                </div>
                <div class="_right"><span class="addtions text-muted">注：如搜索不能准确定位，可手动点击地图定位公司地点</span></div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>公司图标：</label>
                <div class="zp_gsxq_logo gstb">
                    <p>请您上传一张公司标志图片作为公司展示头像</p>
                    <div id="gstb_bg" <c:if test="${company.companyPicture!=undefined}">style="background-image: url("${pageContext.request.contextPath}/uploadImg/${company.companyPicture}")" </c:if> ></div>
                    <input id="gstb_inp1" form="zp_gsxq_form" type="hidden" name="companyPicture" value="${company.companyPicture}" >
                </div>
            </div>
            <div class="control-group clearfix">
                <label class="group-title"><span class="text-error">* </span>企业风采：</label>
                <div class="qyfc">
                    <p>企业风采照片</p>
                    <script id="qyfc_mb" type="text/html">

                        <div data-id={{companyId}}>
                            <h3><a href="javascript:;" class="fa fa-check-square a1_gb_tj"></a><a href="javascript:;" class="fa fa-window-close a1_gb_sc"></a></h3>
                            <div id=qyfc_bg_{{mienId}} data-id="{{mienId}}" class="qyfc_bg" style="background-image: url('{{dkh}}{{path}}{{mienUrl}}')" ></div>
                            <input type="text" style="display: none" value="" id=qyfc_{{mienId}}>
                            <textarea>{{mienIntro}}</textarea>
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



</body>
<jsp:include page="cityUtil.jsp"/>
<script>
    cityRollBack = function () {
        var postion = {};
        postion.city = $('#this_space').val();
        postion.input = "gsdz_ssk";
        postion.container = "gsdz";
        myMap.setCity(postion);
    }

    var postion = {};
    postion.city = $('#this_space').val();
    postion.input = "gsdz_ssk";
    postion.container = "gsdz";
    postion.x = $('#companyX').val();
    postion.y = $('#companyY').val();
    postion.rollback = function (rs) {
        ///console.log(rs);
        $('#companyX').val(rs.point.lng);
        $('#companyY').val(rs.point.lat);
    };
    console.log(postion);
    var myMap = new myMap(postion);
    myMap.init();
</script>
</html>