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
        <form action="${pageContext.request.contextPath}/Postion/insertPostion.do" class="ac-boxfill" id="f1" onsubmit="return sub()">
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
                        <span class="tag_bubble"><div class="tag2">职位名不能为空</div></span>
                    </div>

                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作地址：</span>
                        <input type="text" class="pup_input" style="width: 380px" name="postionSpace" id="postionSpace">
                        <div class="pup_text">注：1.职位发布后省/市/区不可以修改。2.填写街道、楼宇详细地址，有利于职位曝光。</div>
                        <span class="tag_bubble"><div class="tag2">工作名不能为空</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>所属部门：</span>
                        <input type="text" class="pup_input" style="width: 380px" name="postionDepartment" id="postionDepartment">
                        <span class="tag_bubble"><div class="tag2">所属部门不能为空</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>部门人数：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="peopleNumber" id="peopleNumber">人
                        <span class="tag_bubble2"><div class="tag2">部门人数不能为空</div></span>
                        <span class="tag_bubble2"><div class="tag2">请输入数字</div></span>
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
                        <span class="tag_bubble" id="postionMmnull"><div class="tag2">月薪不能为空</div></span>
                        <span class="tag_bubble" id="postionMmsz"><div class="tag2">请输入数字</div></span>
                        <span class="tag_bubble" id="postionMmdx"><div class="tag2">最低月薪不能高于最高月薪</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>发布月数：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="publishMonth" id="publishMonth">个月
                        <span class="tag_bubble2"><div class="tag2">发放月数不能为空</div></span>
                        <span class="tag_bubble2"><div class="tag2">请输入数字</div></span>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>工作经验：</span>
                        <input type="text" class="pup_input" style="width: 180px" name="postionExp" id="postionExp">年以上
                        <span class="tag_bubble2"><div class="tag2">工作经验不能为空</div></span>
                        <span class="tag_bubble2"><div class="tag2">请输入数字</div></span>
                        <div class="checkboxWrapper theme7 extraSmallCheckboxSize">
                            <input type="checkbox" id="pupnum2">
                            <label for="pupnum2" style="font-weight: normal;margin-bottom: 0">
                                <jsp:include page="checksvg.jsp"/>
                                不限
                            </label>
                        </div>
                    </div>
                    <div class="pup_form">
                        <span> <span class="pup_span1">*</span>学历要求：</span>
                        <select id="postionEducation" class="pup_input" style="width: 200px" name="postionEducation">
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
                        <span class="tag_bubble3"><div class="tag2">学历要求不能为空</div></span>
                    </div>
                    <div class="pup_form">
                        <span style="float: left"> <span class="pup_span1">*</span>职位描述：</span>
                        <textarea id="status" class="pup_textarea" name="postionDescription"
                                  onkeydown="countChar('status','counter');"
                                  onkeyup="countChar('status','counter');"></textarea>
                        已经输入<span id="counter">0</span>字
                        <%--<textarea class="pup_textarea"></textarea>--%>
                        <span class="tag_bubble3"><div class="tag2">职位描述不能为空</div></span>
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
                        <span class="tag_bubble5"><div class="tag2"></div></span>
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
                            <option value="25" id="25">25</option>
                            <option value="30" id="30">30</option>
                            <option value="35" id="35">35</option>
                            <option value="40" id="40">40</option>
                            <option value="45" id="45">45</option>
                            <option value="50" id="50">50</option>
                            <option value="55" id="55">55</option>
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
                <input type="hidden" name="postionWelfare" id="postionWelfare">
                <input type="button" id="sub1"  class="pup_but1" value="发布职位"/>
                <input type="button" id="sub2" class="pup_but2" value="保存为草稿职位"/>
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
            $('#postionMmnull').children().css('display','none');
        } else {
            $('#postionMm').removeAttr("disabled", "disabled");
            $('#postionYm').removeAttr("disabled", "disabled");
        }
    })
    $('#pupnum2').click(function () {
        if ($(this).is(":checked") == true) {
            $('#postionExp').attr("disabled", "disabled");
            $('#postionExp').val(null);
            $('#postionExp').next().children().css('display','none');
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
            }else {
                $(this).next().next().children().css('display','none');
            }
        })
        $('#postionSpace').on('blur',function () {
            if($('#postionSpace').val()==null||$('#postionSpace').val()==''){
                $(this).next().next().children().css('display','block');
            }else {
                $(this).next().next().children().css('display','none');
            }
        })
        $('#postionDepartment').on('blur',function () {
            if($('#postionDepartment').val()==null||$('#postionDepartment').val()==''){
                $(this).next().children().css('display','block');
            }else {
                $(this).next().children().css('display','none');
            }
        })
        $('#peopleNumber').on('blur',function () {
            var reg=/^[0-9]*$/;
            if($('#peopleNumber').val()==null||$('#peopleNumber').val()==''){
                $(this).next().children().css('display','block');
            }else if(!reg.test($('#peopleNumber').val())){
                $(this).next().next().children().css('display','block');
            }else {
                $(this).next().children().css('display','none');
                $(this).next().next().children().css('display','none');
            }
        })
        $('#postionMm').on('blur',function () {
            var reg=/^[0-9]*$/;
            var a=parseInt($('#postionMm').val());
            var b=parseInt($('#postionYm').val());
            if($('#postionMm').val()==null||$('#postionMm').val()==''){
                $('#postionMmnull').children().css('display','block');
            }else if(!reg.test($('#postionMm').val())){
                $('#postionMmsz').children().css('display','block');
            }else if(a>b){
                $('#postionMmdx').children().css('display','block');
            }else {
                $('#postionMmnull').children().css('display','none');
                $('#postionMmsz').children().css('display','none');
                $('#postionMmdx').children().css('display','none');
            }
        })
        $('#postionYm').on('blur',function () {
            var reg=/^[0-9]*$/;
            var a=parseInt($('#postionMm').val());
            var b=parseInt($('#postionYm').val());
            if($('#postionYm').val()==null||$('#postionYm').val()==''){
                $('#postionMmnull').children().css('display','block');
            }else if(!reg.test($('#postionYm').val())){
                $('#postionMmsz').children().css('display','block');
            }else if (a>b){
                $('#postionMmdx').children().css('display','block');
            }else {
                $('#postionMmnull').children().css('display','none');
                $('#postionMmsz').children().css('display','none');
                $('#postionMmdx').children().css('display','none');
            }
        })
        $('#publishMonth').on('blur',function () {
            var reg=/^[0-9]*$/;
            if($('#publishMonth').val()==null||$('#publishMonth').val()==''){
                $('#publishMonth').next().children().css('display','block');
            }else if(!reg.test($('#publishMonth').val())){
                $('#publishMonth').next().next().children().css('display','block');
            }else {
                $('#publishMonth').next().children().css('display','none');
                $('#publishMonth').next().next().children().css('display','none');
            }
        })
        $('#postionExp').on('blur',function () {
            var reg=/^[0-9]*$/;
            if($('#postionExp').val()==null||$('#postionExp').val()==''){
                $('#postionExp').next().children().css('display','block');
            }else if(!reg.test($('#postionExp').val())){
                $('#postionExp').next().next().children().css('display','block');
            }else {
                $('#postionExp').next().children().css('display','none');
                $('#postionExp').next().next().children().css('display','none');
            }
        })
        $('#postionEducation').on('blur',function () {
           if($('#postionEducation').val()==null||$('#postionEducation').val()==''){
               $(this).next().next().next().children().css('display','block');
           }else {
               $(this).next().next().next().children().css('display','none');
           }
        })
        $('#status').on('blur',function () {
            if($('#status').val()==null||$('#status').val()==''){
                $(this).next().next().children().css('display','block');
            }else {
                $(this).next().next().children().css('display','none');
            }
        })
        $('#postionAgeMin').change(function () {
            var a=parseInt($('#postionAgeMin').val());
            $('#postionAgeMax > option ').each(function (i,e){
                if($(e).val()<a){
                    $(e).css({"display":"none"})
                }else{
                    $(e).css({"display":"block"})
                }
            })
        })
        $('#postionAgeMax').change(function () {
            var a=parseInt($('#postionAgeMax').val());
            $('#postionAgeMin > option ').each(function (i,e){
                if($(e).val()>a){
                    $(e).css({"display":"none"})
                }else{
                    $(e).css({"display":"block"})
                }
            })
        })
    })
</script>
<script>
    function sub() {
        var reg=/^[0-9]*$/;
        if($('#postionName').val()==null||$('#postionName').val()=='') {
            $('#postionName').next().next().children().css('display', 'block');
            return false;
        }
        if($('#postionSpace').val()==null||$('#postionSpace').val()==''){
            $('#postionSpace').next().next().children().css('display','block');
            return false;
        }
        if($('#postionDepartment').val()==null||$('#postionDepartment').val()==''){
            $('#postionDepartment').next().children().css('display','block');
            return false;
        }
        if($('#peopleNumber').val()==null||$('#peopleNumber').val()==''){
            $('#peopleNumber').next().children().css('display','block');
            return false;
        }else if(!reg.test($('#peopleNumber').val())){
            $('#peopleNumber').next().next().children().css('display','block');
            return false;
        }
        if($('#pupnum1').is(':checked')==false){
        var a=parseInt($('#postionMm').val());
        var b=parseInt($('#postionYm').val());
        if($('#postionMm').val()==null||$('#postionMm').val()==''){
            $('#postionMmnull').children().css('display','block');
            return false;
        }else if(!reg.test($('#postionMm').val())){
            $('#postionMmsz').children().css('display','block');
            return false;
        }
        if($('#postionYm').val()==null||$('#postionYm').val()==''){
            $('#postionMmnull').children().css('display','block');
            return false;
        }else if(!reg.test($('#postionYm').val())){
            $('#postionMmsz').children().css('display','block');
            return false;
        }
        if(a>b){
            $('#postionMmdx').children().css('display','block');
            return false;
        }
        }
        if($('#publishMonth').val()==null||$('#publishMonth').val()==''){
            $('#publishMonth').next().children().css('display','block');
            return false;
        }else if(!reg.test($('#publishMonth').val())){
            $('#publishMonth').next().next().children().css('display','block');
            return false;
        }
        if($('#pupnum2').is(':checked')==false) {
            if ($('#postionExp').val() == null || $('#postionExp').val() == '') {
                $('#postionExp').next().children().css('display', 'block');
                return false;
            } else if (!reg.test($('#postionExp').val())) {
                $('#postionExp').next().next().children().css('display', 'block');
                return false;
            }
        }
        if ($('#postionEducation').val() == null || $('#postionEducation').val() == '') {
            $('#postionEducation').next().next().next().children().css('display', 'block');
            return false
        }
        if($('#status').val()==null||$('#status').val()==''){
            $('#status').next().next().children().css('display','block');
            return false;
        }
    }
</script>
<script>
    var da=new Date();
    $('#sub1').click(function () {
        $('#postionWelfare').val(1);
        $('#f1').submit();
    })
    $('#sub2').click(function () {
        $('#postionWelfare').val(0)
        $('#f1').submit();
    })
</script>

</body>
</html>