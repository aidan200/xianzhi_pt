<%--
  Created by IntelliJ IDEA.
  User: SYHT
  Date: 2017/7/19
  Time: 11:57
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
<body style="background-color: #f0f0f0">

<jsp:include page="headerforeEnd.jsp"/>
<jsp:include page="companynav.jsp"/>

<div class="pup_container">
    <div class="pup_allin">
        <form action="" class="ac-boxfill">
            <div class="pup_alltop">
                <h4>职位发布</h4>
                <p> 您可同时运作 <span>0</span> 个职位，当前还可以发布 <span>0</span> 个职位，职位有效期 <span>0</span> 天</p>
                <span style="float: right;margin-right: 20px">*为必填项</span>
            </div>
            <!--职位基本信息-->
            <div class="pup_allcenter">
                <h5><span class="fa fa-calendar-o"></span>&emsp;职位基本信息</h5>
                <div class="pup_center1">
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>职位名称：</span>
                        <input type="text" class="pup_input" style="width: 380px">
                        <span>注：职位发布后职位名称不可以修改</span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作地址：</span>
                        <input type="text" class="pup_input" style="width: 250px">
                        <input type="text" class="pup_input" style="width: 250px" placeholder="请填写街道、楼宇详细地址">
                        <div class="pup_text">注：1.职位发布后省/市/区不可以修改。2.填写街道、楼宇详细地址，有利于职位曝光。</div>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>职能分类：</span>
                        <input type="text" class="pup_input" style="width: 380px" placeholder="请输入或选择职能">
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>所属部门：</span>
                        <input type="text" class="pup_input" style="width: 380px">
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>职位月薪：</span>
                        <input type="text" class="pup_input" style="width: 120px">千元至
                        <input type="text" class="pup_input" style="width: 120px">千元
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="sample8">
                            <label for="sample8">
                                <i>
                                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         width="50px" height="50px" viewBox="0 0 50 50" enable-background="new 0 0 50 50" xml:space="preserve">
							<circle fill="none" stroke="#B7B7B7" stroke-width="3" stroke-miterlimit="10" cx="25.11" cy="24.883" r="23.519"/>
                                        <path fill="none" stroke-width="3" stroke-miterlimit="10" d="M48.659,25c0,12.998-10.537,23.534-23.534,23.534
							S1.591,37.998,1.591,25S12.127,1.466,25.125,1.466c9.291,0,17.325,5.384,21.151,13.203L19,36l-9-14"/>
			            </svg>
                                </i>
                                面议
                            </label>
                        </div>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>发放月数：</span>
                        <input type="text" class="pup_input" style="width: 180px" value="12">个月
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作年限：</span>
                        <input type="text" class="pup_input" style="width: 180px">以上
                        <input type="checkbox" style="margin-left: 10px"> 不限
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>学历要求：</span>
                        <select name="" id="" class="pup_input" style="width: 200px">
                            <option value="">请选择</option>
                            <option value="">不限</option>
                            <option value="">博士</option>
                            <option value="">硕士</option>
                            <option value="">本科</option>
                            <option value="">大专</option>
                        </select>
                        是否是全日制统招：
                        <input type="radio" name="education" value="是">是
                        <input type="radio" name="education" value checked="checked" style="margin-left: 20px">不限
                    </div>
                    <div class="pup_form">
                        <span style="float: left"> <span class="pup_span1">*</span>职位描述：</span>
                        <textarea class="pup_textarea"></textarea>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>职位亮点：</span>
                        <p style="display: inline-block;margin-left: 5px">增加职位亮点可以吸引求职者快速应聘职位，<a href="">立即增加职位亮点</a>
                        </p>
                    </div>
                </div>
            </div>
            <hr style="border-bottom: 1px dashed #fc6866">
            <!--职位要求-->
            <div class="pup_allcenter">
                <h5><span class="fa fa-calendar-o"></span>&emsp;职位要求</h5>
                <div class="pup_center1">
                    <div class="pup_form">
                        <span> 基本要求：</span>
                        <input type="checkbox" style="margin-left: 20px"> 只允许完全符合以下条件人选投递
                    </div>
                    <div class="pup_form">
                        <span>语言要求：</span>
                        <input type="checkbox" style="margin-left: 20px"> 英语
                        <input type="checkbox" style="margin-left: 20px"> 日语
                        <input type="checkbox" style="margin-left: 20px"> 法语
                        <input type="checkbox" style="margin-left: 20px"> 普通话
                        <input type="checkbox" style="margin-left: 20px"> 粤语
                        <input type="checkbox" style="margin-left: 20px"> 其他
                    </div>
                    <div class="pup_form">
                        <span>专业要求：</span>
                        <input type="text" class="pup_input" style="width: 280px" placeholder="不限">
                    </div>
                    <!--<div class="pup_form">-->
                    <!--<span>期望人所在行业：</span>-->
                    <!--<input type="text" class="pup_input" style="width: 380px">-->
                    <!--</div>-->
                    <div class="pup_form">
                        <span>年龄要求：</span>
                        <select name="" class="pup_input">
                            <option value="">请选择</option>
                            <option value="">20</option>
                            <option value="">25</option>
                            <option value="">30</option>
                            <option value="">35</option>
                            <option value="">40</option>
                            <option value="">45</option>
                            <option value="">50</option>
                        </select>
                        至
                        <select name="" class="pup_input">
                            <option value="">请选择</option>
                            <option value="">25</option>
                            <option value="">30</option>
                            <option value="">35</option>
                            <option value="">40</option>
                            <option value="">45</option>
                            <option value="">50</option>
                            <option value="">55</option>
                        </select>
                    </div>
                    <div class="pup_form">
                        <span>性别要求：</span>
                        <input type="radio" name="sex" value checked="checked">不限
                        <input type="radio" name="sex" value="男" style="margin-left: 20px">男
                        <input type="radio" name="sex" value="女" style="margin-left: 20px">女

                    </div>

                </div>
            </div>
            <hr style="border-bottom: 1px dashed #fc6866">
            <div class="pup_allcenter">
                <h5><span class="fa fa-calendar-o"></span>&emsp;附加信息</h5>
                <div class="pup_center1">
                    <!--<div class="pup_form">-->
                    <!--<span> 应聘简历发送至：</span>-->
                    <!--<input type="text" style="width: 380px" class="pup_input">-->
                    <!--</div>-->
                    <div class="pup_form">
                        <span>自动回复应聘者：</span>
                        <input type="radio" style="margin-left: 20px" value="是" name="answer"> 是
                        <input type="radio" style="margin-left: 20px" value="否" checked="checked" name="answer"> 否
                    </div>
                    <div class="pup_form">
                        <span>应聘反馈时长：</span>
                        <input type="text" class="pup_input" style="width: 180px" placeholder="请填写数字">个工作日
                    </div>
                </div>
            </div>
            <div class="pup_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/nbv.png" alt="" class="pup_img">
                提示：对于发布虚假招聘信息的企业及账号，先知网有权进行封号处理，造成先知网损失的，需对先知网进行赔偿；同时，先知网保留诉讼的权利。
            </div>
            <div style="text-align: center;margin-bottom: 80px;margin-top: 40px">
                <button class="pup_but1">发布职位</button>
                <button class="pup_but2">保存为草稿职位</button>
            </div>

        </form>
    </div>
</div>



</body>
</html>