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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <form action="${pageContext.request.contextPath}/Postion/insertPostion.do" class="ac-boxfill" id="f1">
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
                        <input type="text" class="pup_input" style="width: 380px" name="postionName" id="postionName">
                        <div class="pup_text">注：职位发布后职位名称不可以修改</div>
                        <span class="tag_bubble"><div class="tag2">hahahahhahahh</div></span>
                    </div>

                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作地址：</span>
                        <input type="text" class="pup_input" style="width: 380px" name="postionSpace">
                        <div class="pup_text">注：1.职位发布后省/市/区不可以修改。2.填写街道、楼宇详细地址，有利于职位曝光。</div>
                        <span class="tag_bubble"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>所属部门：</span>
                        <input type="text" class="pup_input" style="width: 380px" name="postionDepartment">
                        <span class="tag_bubble"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>部门人数：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="peopleNumber">人
                        <span class="tag_bubble2"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>职位月薪：</span>
                        <input type="text" class="pup_input" style="width: 120px" name="postionMm" id="postionMm">元至
                        <input type="text" class="pup_input" style="width: 120px" name="postionYm" id="postionYm">元
                        <%--checkbox--%>
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="pupnum1">
                            <label id="checkLabel" for="pupnum1" style="font-weight: normal;margin-bottom: 0">
                                <jsp:include page="checksvg.jsp"/>
                                面议
                            </label>
                        </div>
                        <span class="tag_bubble"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>发放月数：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="publishMonth">个月
                        <span class="tag_bubble2"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作经验：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="postionExp" id="postionExp">以上
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="pupnum2">
                            <label for="pupnum2" style="font-weight: normal;margin-bottom: 0">
                                <jsp:include page="checksvg.jsp"/>
                                不限
                            </label>
                        </div>
                        <span class="tag_bubble2"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>学历要求：</span>
                        <select id="" class="pup_input" style="width: 200px" name="postionEducation">
                            <option value="">请选择</option>
                            <option value="不限">不限</option>
                            <option value="博士">博士</option>
                            <option value="硕士">硕士</option>
                            <option value="本科">本科</option>
                            <option value="大专">大专</option>
                        </select>
                        是否是全日制统招：
                        <input type="radio" name="educationEntrance" value="0">是
                        <input type="radio" name="educationEntrance" checked="checked" style="margin-left: 20px"
                               value="1">不限
                        <span class="tag_bubble3"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <div class="pup_form">
                        <span style="float: left"> <span class="pup_span1">*</span>职位描述：</span>
                        <textarea id="status" class="pup_textarea" name="postionDescription"
                                  onkeydown="countChar('status','counter');"
                                  onkeyup="countChar('status','counter');"></textarea>
                        已经输入<span id="counter">0</span>字
                        <%--<textarea class="pup_textarea"></textarea>--%>
                        <span class="tag_bubble3"><div class="tag2">hahahahhahahh</div></span>
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
                    <div class="pup_form" style="padding-top: 9px">
                        <span> 基本要求：</span>
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="pupnum3" name="check" value="1">
                            <label for="pupnum3" style="font-weight: normal;margin-bottom: 0">
                                <jsp:include page="checksvg.jsp"/>
                                只允许完全符合以下条件人选投递
                            </label>
                        </div>
                        <span class="tag_bubble5"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <%--<div class="pup_form">--%>
                    <%--<span>语言要求：</span>--%>
                    <%--<div class="checkboxWrapper theme3 extraSmallCheckboxSize">--%>
                    <%--<input type="checkbox" id="pupnum4">--%>
                    <%--<label for="pupnum4" style="font-weight: normal;margin-bottom: 0">--%>
                    <%--<jsp:include page="checksvg.jsp"/>--%>
                    <%--英语--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--<div class="checkboxWrapper theme7 extraSmallCheckboxSize">--%>
                    <%--<input type="checkbox" id="pupnum5">--%>
                    <%--<label for="pupnum5" style="font-weight: normal;margin-bottom: 0">--%>
                    <%--<jsp:include page="checksvg.jsp"/>--%>
                    <%--日语--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--<div class="checkboxWrapper theme7 extraSmallCheckboxSize">--%>
                    <%--<input type="checkbox" id="pupnum6">--%>
                    <%--<label for="pupnum6" style="font-weight: normal;margin-bottom: 0">--%>
                    <%--<jsp:include page="checksvg.jsp"/>--%>
                    <%--法语--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--<div class="checkboxWrapper theme7 extraSmallCheckboxSize">--%>
                    <%--<input type="checkbox" id="pupnum7">--%>
                    <%--<label for="pupnum7" style="font-weight: normal;margin-bottom: 0">--%>
                    <%--<jsp:include page="checksvg.jsp"/>--%>
                    <%--普通话--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--<div class="checkboxWrapper theme7 extraSmallCheckboxSize">--%>
                    <%--<input type="checkbox" id="pupnum8">--%>
                    <%--<label for="pupnum8" style="font-weight: normal;margin-bottom: 0">--%>
                    <%--<jsp:include page="checksvg.jsp"/>--%>
                    <%--粤语--%>
                    <%--</label>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <div class="pup_form">
                        <span>专业要求：</span>
                        <input type="text" class="pup_input" style="width: 280px" placeholder="不限"
                               name="postionSpecialty" id="postionSpecialty">
                        <input type="hidden" name="forceSpecialty" id="forceSpecialty">
                        <span class="tag_bubble5"><div class="tag2">hahahahhahahh</div></span>
                    </div>
                    <!--<div class="pup_form">-->
                    <!--<span>期望人所在行业：</span>-->
                    <!--<input type="text" class="pup_input" style="width: 380px">-->
                    <!--</div>-->
                    <div class="pup_form">
                        <span>年龄要求：</span>
                        <select name="postionAgeMin" class="pup_input" id="postionAgeMin">
                            <option value="不限">请选择</option>
                            <option value="20">20</option>
                            <option value="25">25</option>
                            <option value="30">30</option>
                            <option value="35">35</option>
                            <option value="40">40</option>
                            <option value="45">45</option>
                            <option value="50">50</option>
                        </select>
                        至
                        <select name="postionAgeMax" class="pup_input" id="postionAgeMax">
                            <option value="不限">请选择</option>
                            <option value="25">25</option>
                            <option value="30">30</option>
                            <option value="35">35</option>
                            <option value="40">40</option>
                            <option value="45">45</option>
                            <option value="50">50</option>
                            <option value="55">55</option>
                        </select>
                        <span class="tag_bubble4"><div class="tag2">hahahahhahahh</div></span>
                    </div>

                </div>
            </div>
            <div class="pup_bottom">
                <img src="${pageContext.request.contextPath}/dist/foreEnd3/img/xianzhi1.png" alt="" class="pup_img">
                提示：对于发布虚假招聘信息的企业及账号，先知网有权进行封号处理，造成先知网损失的，需对先知网进行赔偿；同时，先知网保留诉讼的权利。
            </div>
            <div style="text-align: center;margin-bottom: 80px;margin-top: 40px">
                <%--<input type="hidden" name="companyId" value="2">--%>
                <button class="pup_but1"  id="sub">发布职位</button>
                <button class="pup_but2">保存为草稿职位</button>
            </div>

        </form>
    </div>
</div>
<jsp:include page="behindforeEnd.jsp"/>
<script language="javascript">
    function countChar(textareaNamezzjs, spanName) {
        document.getElementById(spanName).innerHTML = document.getElementById(textareaNamezzjs).value.length;
    }
</script>
<script>
    $('#pupnum1').click(function () {
        if ($(this).is(":checked") == true) {
            $('#postionMm').attr("disabled", "disabled");
            $('#postionYm').attr("disabled", "disabled");
            $('#postionMm').val(null);
            $('#postionYm').val(null);
        } else {
            $('#postionMm').removeAttr("disabled", "disabled");
            $('#postionYm').removeAttr("disabled", "disabled");
        }
    })
    $('#pupnum2').click(function () {
        if ($(this).is(":checked") == true) {
            $('#postionExp').attr("disabled", "disabled");
            $('#postionExp').val(null);
        } else {
            $('#postionExp').removeAttr("disabled", "disabled");
        }
    })
</script>
<script>
    $(function () {
        $('#postionName').on('blur',function () {
            if($('#postionName').val()==null||$('#postionName').val()=='') {
                $(this).next().next().children().css('display', 'block');
            }
        })
    })
</script>
</body>
</html>