/**
 * Created by Administrator on 2017/7/6.
 */
//个人信息开始
function obj_yhxx(){
    this.name='';                       //姓名
    this.dqhy='';                       //当前行业
    this.gznf='';                       //工作年份
    this.zwmc='';                       //职位名称
    this.dqcs='';                       //当前城市
    this.szgs='';                       //所在公司
    this.DOM={
        name:$('#grxx_name'),
        zwmc:$('#grxx_zwmc'),
        szgs:$('#grxx_szgs'),
        dqcs:$('#grxx_dqcs'),
        dqhy:$('#grxx_dqhy'),
        gznf:$('#grxx_gznf'),
    }
}
obj_yhxx.prototype.init=function (){
    var _self = this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',    //路径
        success:function (data){//data 就是数据 json

            memberId=data.resume.memberId;
            _self.name=data.resume.resumeName;         //姓名
            _self.gznf=data.resume.resumeWorkinglife; //工作年份
            _self.dqhy=data.resume.fields;           //行业
            _self.zwmc=data.resume.resumePosition;   //当前职位
            _self.dqcs=data.resume.resumeWorkspace;  //当前城市
            _self.szgs=data.resume.resumeField;
            _self.bindingDOM();
            _self.bindingSJ();
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });
};
obj_yhxx.prototype.bindingDOM=function (){ //个人信息绑定

    var _self=this;
    if(_self.name!=''&&_self.name!=null){
        _self.DOM.name.html(_self.name)           //名字
        _self.DOM.name.css({"color":"#000"})
    }else{
        _self.DOM.name.html('姓名:')           //名字
        _self.DOM.name.css({"color":"red"})
    }
    if(_self.zwmc!=''&&_self.zwmc!=null){
        _self.DOM.zwmc.html(_self.zwmc)          //职位名称
         _self.DOM.zwmc.css({"color":"#000"})
    }else{
        _self.DOM.zwmc.html("")          //职位名称
        _self.DOM.zwmc.css({"color":"red"})
    }
    if(_self.szgs!=''&&_self.szgs!=null){
        _self.DOM.szgs.html(_self.szgs)         //所在公司
        _self.DOM.szgs.css({"color":"#000"})
    }else{
        _self.DOM.szgs.html("")         //所在公司
        _self.DOM.szgs.css({"color":"red"})
    }
    if(_self.dqcs!=''&&_self.dqcs!=null){
        _self.DOM.dqcs.html(_self.dqcs)        //当前城市
        _self.DOM.dqcs.css({"color":"#000"})
    }else{
        _self.DOM.dqcs.html("")        //当前城市
        _self.DOM.dqcs.css({"color":"red"})
    }

    var int=0;
    var str='';
    for(var i=0;i<_self.dqhy.length;i++){
         if(_self.dqhy[i].fieldType=="2"){
             str+=_self.dqhy[i].fieldName+'/'
             int++
         }
    }
    var str2 = str.substr(0,str.length-1);
    if(int!=0){
        _self.DOM.dqhy.html(str2)         //当前行业
    }else{
        _self.DOM.dqhy.html('')
    }







    if(_self.gznf!=''&&_self.gznf!=null){
        _self.DOM.gznf.html(_self.gznf)         //工作年份
    }else{
        _self.DOM.gznf.html('')                 //如果时间是空那就显示为空
    }

};
obj_yhxx.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;
    $('.zp_jianli_cont_left_top2_top').find('.zp_jianli_xg').on('click',function (){  //点击修改的时候
        var str2='';
        for(var i=0;i<_self.dqhy.length;i++){
            if(_self.dqhy[i].fieldType=="2"){
                str2+=_self.dqhy[i].fieldName+'/'
            }
        }
        var str3 = str2.substr(0,str2.length-1);
        if(kg){
            kg=false;
            var str='';
            str+='<div class="zp_jianli_zl_1">'
            str+='<div class="zp_jianli_zl_1_left">'
            str+='<img src="/dist/foreEnd3/img/boy.png" alt="" width="102" height="102">'
            str+='<div>'
            str+='<a href="">删除</a>'
            str+='<a href="">修改</a>'
            str+='</div>'
            str+='</div>'
            str+='<div class="zp_jianli_zl_1_right">'
            str+='<ul>'
            str+='<li>'
            str+='姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名 <input id="jl_name" type="text" value="'+_self.name+'"  class="form-control zp_jianli_input1" placeholder="请输入姓名">'
            str+='</li>'
            str+='<li class="li_02" style="height:auto;">'

            str+='当前行业 <div id="dqhy_1" class="dqhy_1">'
            var qq=0;
            for(var i=0;i<_self.dqhy.length;i++){
                if(_self.dqhy[i].fieldType=="2"&&_self.dqhy[i].fieldName!=''){
                    qq++;        //检测有几个当前行业
                    str+='<div><div data-fieldId='+_self.dqhy[i].fieldId+' data-fieldtype='+_self.dqhy[i].fieldType+'>'+_self.dqhy[i].fieldName+'</div><a href="javascript:;">x</a></div>'
                }
            }
            if(qq==0){              //如果没有行业改变下样式
                $('#dqhy_1').css({
                    "height":"30px",
                    "line-height":"10px",
                    "color":"#999999"
                }).html('请选择当前行业')
            }
            str+='</div>'
            str+='<em class="em1"></em>'
            str+='</li>'


            str+='<li>'
            str+='工作年份&nbsp;&nbsp;&nbsp;'
            str+='<select name="" id="zp_select_time1" class="form-control zp_select1">'
            var date=new Date();
            var dq_n=date.getFullYear();        //获取到当前年
             for(var i=dq_n;i>=dq_n-50;i--){
                 str+='<option value="'+i+'">'+i+'年</option>'
             }
            str+='</select>'
            str+='职位名称&nbsp;&nbsp;&nbsp;<input id="jl_zwmc"  value="'+_self.zwmc+'" type="text" class="form-control zp_jianli_input3" placeholder="请输入职位名称" >'

            str+='</li>'

            str+='<li>'
            str+='当前城市 <input id="jl_dqcs" value="'+_self.dqcs+'" type="text" class="form-control zp_jianli_input2" placeholder="请选择当前城市" >'
            str+='</li>'
            str+='</ul>'
            str+='<button type="button" id="zp_jianli_bd_1_qd" class="btn btn-primary ">确定</button>'
            str+='<button class="btn btn-default" id="zp_jianli_bd_1_qx" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('.zp_jianli_cont_left_top2_top').after(str);              //插入
            $('#zp_select_time1 option').each(function (index,ele){
                if($(ele).val()==_self.gznf){               //判断如果等于数据库的时间
                    $(ele).attr('selected','selected')
                }
            });
            function sc(){                  //当前行业删除
                $('#dqhy_1 > div').find('a').on('click',function (){
                    $(this).parent().remove();
                    if($('#dqhy_1 > div').length==0){
                        $('#dqhy_1').css({
                            "height":"30px",
                            "line-height":"10px",
                            "color":"#999999"
                        }).html('请选择当前行业')
                        $('#dqhy_1').css({
                            "border-color":"#FF4600"
                        })
                    }else{
                        $('#dqhy_1').css({
                            "border-color":"#cccccc"
                        })
                    }
                })

            }
            sc();
            $('.zp_jianli_cont_left_top2_top').css({"display":"none"}); //隐藏
            //弹出框事件
            $('.em1').on('click',function (){
                $.ajax({
                    type:"get",
                    async:true,
                    data:{type:2},
                    url:path+'Field/selByType',
                    success:function (data){        //
                        var attr=[]
                        var str4=""
                        str4+='<tr>'
                        str4+='<td class="comd_td"><span>互联网·游戏·软件</span></td>'
                        str4+='<td>'
                        str4+='<ul class="comd_ul">'
                        for(var i=0;i<data.fieldList.length;i++){
                            str4+='<li><input type="checkbox" data-fieldtype="'+data.fieldList[i].fieldType+'" data-fieldId="'+data.fieldList[i].fieldId+'" data-value="'+data.fieldList[i].fieldName+'" />'+data.fieldList[i].fieldName+'</li>'
                        }
                        str4+='</ul>'
                        str4+='</td>'
                        str4+='</tr>'
                        $('#hy_tab').html(str4);            //将后台提供的数据保存到列表中
                        $('#hy_tab').find('input[type=checkbox]').each(function (index,ele){
                           var www= $(ele).attr('data-fieldid');
                            $('#dqhy_1 > div > div').each(function (index2,ele2){
                               var rrr= $(ele2).attr('data-fieldid');
                               if(www==rrr){
                                   $(ele).attr('checked','checked')
                               }
                            })
                        })
                        event.preventDefault();
                        $('.cd-popup').addClass('is-visible');

                        $('#xz_qwhy_qd').on('click',function (){                    //确认按钮

                            var attr_1=[];
                            $('#qwhy__').find('input[type=checkbox]:checked').each(function (index,ele){
                                attr_1[index]={value:$(ele).attr('data-value'),fieldId:$(ele).attr('data-fieldId'),fieldtype:$(ele).attr('data-fieldtype')}
                            })

                            var str_qwhy=''                 //所选的当前行业
                            for(var i=0;i<attr_1.length;i++){
                                str_qwhy+='<div><div data-fieldId='+attr_1[i].fieldId+' data-fieldtype='+attr_1[i].fieldtype+'>'+attr_1[i].value+'</div><a href="javascript:;">x</a></div>'
                            }
                            $('#dqhy_1').html(str_qwhy);        //赋值
                             $('.cd-popup').removeClass('is-visible');       //改变
                            sc();
                            $('#dqhy_1').css({
                                "height":"auto",
                                "line-height":"26px",
                            })
                            if($('#qwhy__').find('input[type=checkbox]:checked').length==0){        //判断是否
                                if($('#dqhy_1 > div').length==0){
                                    $('#dqhy_1').css({
                                        "height":"30px",
                                        "line-height":"10px",
                                        "color":"#999999"
                                    }).html('请选择当前行业')
                                }
                                $('#dqhy_1').css({
                                    "border-color":"#FF4600"
                                })
                            }else{
                                $('#dqhy_1').css({
                                    "border-color":"#CCCCCC"
                                })
                            }

                        });
                        //取消
                        $('#xz_qwhy_qx').on('click',function (){
                            $('.cd-popup').removeClass('is-visible');
                        })
                    },error:function (){ //报错执行的
                        alert('报错了报错了')
                    }

                })





            })

            eee('#jl_name')
            eee('#jl_zwmc')
            eee('#jl_dqcs')
            //修改的事件
            $('.zp_jianli_zl_1').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove()                           //自杀
                $('.zp_jianli_cont_left_top2_top').css({"display":"block"}); //显示
            })
            $('.zp_jianli_zl_1').find('button').eq(0).on('click',function (){
                var xgk=$(this).parent().parent();               //修改框
                var shuzu=[];                                   //存放的数组
                var dqhy=$('#dqhy_1 > div > div');
                for(var i=0;i<dqhy.length;i++){
                    shuzu[i]={
                        fieldId: $(dqhy).eq(i).attr('data-fieldid'),
                        fieldType:$(dqhy).eq(i).attr('data-fieldtype'),
                    }
                }
                var resume={
                    resumeName:trim($('#jl_name').val()),                  //姓名                 已非空
                    resumeWorkinglife:trim($('#zp_select_time1').val()),  //工作年份
                    fields:shuzu,                                          //当前行业
                    resumePosition:trim($('#jl_zwmc').val()),              //当前职位          已非空
                    resumeWorkspace:trim($('#jl_dqcs').val()),             //当前城市         已非空
                    resumeId:ID
                };
                function www(){                 //验证信息
                    if(resume.resumeName==''||resume.resumeName==null){ //姓名为空
                        $('#jl_name').addClass('jl_name');
                        $('#jl_name').focus()
                        return
                    }
                    if(dqhy.length==0){
                        $('#dqhy_1').css({
                            "border-color":"#FF4600"
                        })

                    }
                    if(resume.resumePosition==''||resume.resumePosition==null){ //当前职位为空
                        $('#jl_zwmc').addClass('jl_name');
                        $('#jl_zwmc').focus()
                        return
                    }
                    if(resume.resumeWorkspace==''||resume.resumeWorkspace==null){ //当前城市为空
                        $('#jl_dqcs').addClass('jl_name');
                        $('#jl_dqcs').focus();
                        return
                    }
                }
                www();


                if(resume.resumeName!=''&&resume.resumeName!=null&&resume.resumePosition!=''&&resume.resumePosition!=null&&resume.resumeWorkspace!=''&&resume.resumeWorkspace!=null&&dqhy.length!=0){
                    $(this).unbind('click')                           //清楚自身点击事件防止用户狂点
                    $.ajax({
                        type:"post",    //提交方式
                        async:true,  //是否异步
                        data:JSON.stringify(resume),
                        contentType: "application/json",
                        url:path+'Resume/updateResume.do',    //路径

                        success:function (data){//data 就是数据 json
                            xgk.remove();          //删除修改框
                            _self.init();           //重新加载数据
                            $('.zp_jianli_cont_left_top2_top').css({"display":"block"});//显示出来

                        },error:function (){ //报错执行的
                            alert('基本信息修改失败了')
                        }
                    })
                }

            })
        }else{

        }

    });
};
//个人信息结束
// 基本资料构造函数开始
function obj_zbzl(){
    this.cstime='';     //出生年月
    this.sj=0;          //手机号
    this.zt='';         //状态
    this.hyzk='';       //婚姻状况
    this.youxiang='';   //邮箱
    this.xb='';         //性别
    this.DOM={
        csnf:$('#csnf'),
        hyzk:$('#hyzk'),
        sj:$('#sj'),
        yx:$('#yx'),
        zt:$('#zt'),
        xb:$('#xb')
    }
}
obj_zbzl.prototype.init=function (){    //初始化赋值
    var _self = this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',             //路径
        success:function (data){                //data 就是数据 json
            _self.cstime=data.resume.resumeBirth;    //出生年月
            _self.sj=data.resume.resumePhone;          //手机号
            _self.xb=data.resume.resumeSex;            //性别
            _self.zt=data.resume.resumeState;       //状态
            _self.hyzk=data.resume.resumeMarriage; //婚姻状况
            _self.youxiang=data.resume.resumeEmail;    //邮箱

            _self.bindingDOM();
            _self.bindingSJ();
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });
};
obj_zbzl.prototype.bindingDOM=function (){//绑定基本信息
    var _self=this;
    if(getNowFormatDate(_self.cstime)!=''&&getNowFormatDate(_self.cstime)!=null){
        _self.DOM.csnf.html(getNowFormatDate(_self.cstime));      //出生年月
    }

    if(_self.hyzk==0){                                          //婚姻状况
        _self.DOM.hyzk.html("未婚");
    }else if(_self.hyzk==1){
        _self.DOM.hyzk.html("已婚");
    }else if(_self.hyzk==2){
        _self.DOM.hyzk.html("保密");
    }

    if(_self.sj!=''&&_self.sj!=null){
        _self.DOM.sj.html(_self.sj);            // 手机
    }

    if(_self.youxiang!=''&&_self.youxiang!=null){
        _self.DOM.yx.html(_self.youxiang);      //邮箱
    }

               //性别
    if(_self.xb==0){
        _self.DOM.xb.html("男")
    }else if(_self.xb==1){
        _self.DOM.xb.html("女")
    }else{
        _self.DOM.xb.html("")
    }


    if(_self.zt==0){                        //状态
        _self.DOM.zt.html("未就职");
    }else if(_self.zt==1){
        _self.DOM.zt.html("就职");
    }else if(_self.zt==2){
        _self.DOM.zt.html("保密");
    }else{
        _self.DOM.zt.html("adad");
    }

};
obj_zbzl.prototype.bindingSJ=function () {      //绑定的事件
    var _self=this;
    var kg=true;
    $('.zp_jianli_xg').eq(1).on('click',function (){
        if(kg){
            kg=false;
            var str='';
            str+='<div class="zp_jianli_zl_2">'

            if(_self.xb==0){
                str+='<div>性别 <input name="xb" checked  type="radio" id="xp_0" value="0"><label for="xp_0">男</label><input name="xb" value="1" id="xp_1" type="radio" ><label for="xp_1" >女</label></div>';
            }else{
                str+='<div>性别 <input name="xb"  type="radio" id="xp_0" value="0"><label for="xp_0">男</label><input name="xb" checked value="1" id="xp_1" type="radio" ><label for="xp_1" >女</label></div>';
            }

            str+='<div class="pull-left">'
            str+='<ul>'
            str+='<li class="csny__" style="position: relative;">'
            str+='出生年月'
            str+='<input class="form-control workinput wicon Date1 " value="'+getNowFormatDate(_self.cstime)+'" style="background-color: #ffffff;" id="jl_cstime" placeholder="请选择你的出生日期" readonly>'
            str+='<em class="em3"></em>'
            str+='</li>'
            str+='<li class="zp_jianli_zl_2_li2" >'
            str+='<span >手机</span>'
            str+='<input id="jl_sj" type="text"  value="'+_self.sj+'" class="form-control zp_jianli_zl_2_input1 " placeholder="请填写你的手机">'
            str+='</li>'
            str+='<li>'
            str+='<span>状态</span>'
            str+='<select class="form-control" id="jl_zt">'
            str+='<option value="0">就职</option>'
            str+='<option value="1">未就职</option>'
            str+='<option value="2">保密</option>'
            str+='</select>'
            str+='</li>'
            str+='</ul>'
            str+='</div>'
            str+='<div class="pull-right">'
            str+='<ul>'
            str+='<li>'
            str+='婚姻状况'
            str+='<select class="form-control" id="jl_hyzk">'
            str+='<option value="0">未婚</option>'
            str+='<option value="1" >已婚</option>'
            str+='<option value="2">保密</option>'
            str+='</select>'
            str+='</li>'
            str+='<li class="zp_jianli_zl_2_li2" >'
            str+='<span>邮箱</span>'
            str+='<input id="jl_yx" type="text" value="'+_self.youxiang+'" class="form-control zp_jianli_zl_2_input1 " placeholder="请填写您的邮箱">'
            str+='</li>'
            str+='</ul>'
            str+='</div>'
            str+='<div style="clear: both;"></div>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" id="jbzl_2_qx"  type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('.zp_jianli_cont_left_jbzl_yl').after(str);
            $('.csny__ > em').on('click',function (){
                jeDate({
                    dateCell:"#jl_cstime",  //目标元素。由于jedate.js封装了一个轻量级的选择器，因此dateCell还允许你传入class、tag这种方式 '#id .class'
                    format:"YYYY-MM-DD ",
                    isinitVal:true, //显示时间
                    isTime:true,
                    festival: true, //显示节日
                    minDate:"2014-09-19"
                })
            })
            eee('#jl_cstime')
            eee('#jl_sj')
            eee('#jl_yx')
        }else{

        }

        $('#jl_zt > option').each(function (index,ele){         //就职状态
            if($(ele).val()==_self.zt){
                $(ele).attr('selected',"selected")
            }
        });

        $('#jl_hyzk > option').each(function (index,ele){          //婚姻状态
            if($(ele).val()==_self.hyzk){
                $(ele).attr('selected',"selected")
            }
        });

        $('.zp_jianli_cont_left_jbzl_middle').css({"display":"none"});
                                               //修改框
        $('.zp_jianli_zl_2').find('button').eq(1).on('click',function (){
                kg=true;
                $('.zp_jianli_cont_left_jbzl_middle').css({"display":"block"});
                $(this).parent().parent().remove();
        })
        $('.zp_jianli_zl_2').find('button').eq(0).on('click',function (){       //基本状态提交事件
            var tck=$(this).parent().parent()
            var oxb = $('.zp_jianli_zl_2 input[name="xb"]:checked ').val();      //性别的值
            var ozt=$('select').eq(0).val();                                     //状态的值
            var ohyzt=$('select').eq(1).val();                                   //婚姻状态的值
            var resume = {
                resumeId:ID,                             //id号
                resumeState:trim(ozt),                         //状态           好使
                resumeMarriage:trim(ohyzt),                    //婚姻状况        好使
                resumeBirth:trim($('#jl_cstime').val()),      //出生年月
                resumePhone:trim($('#jl_sj').val()),          //手机
                resumeSex:trim(oxb),                           //性别
                resumeEmail:trim($('#jl_yx').val()),          //邮箱
            };
            function bdxy(){
                if(resume.resumeBirth==''||resume.resumeBirth==null){       //手机
                    $('#jl_cstime').addClass('jl_name');
                    $('#jl_cstime').focus()
                    return
                }
                if(resume.resumePhone==''||resume.resumePhone==null){       //手机
                    $('#jl_sj').addClass('jl_name');
                    $('#jl_sj').focus()
                    return
                }
                if(resume.resumeEmail==''||resume.resumeEmail==null){       //邮箱
                    $('#jl_yx').addClass('jl_name');
                    $('#jl_yx').focus()
                    return
                }

            }
            bdxy()
            if(resume.resumeState!=''&&resume.resumeState!=null&&resume.resumeMarriage!=''&&resume.resumeMarriage!=null&&resume.resumeBirth!=''&&resume.resumeBirth!=null&&resume.resumePhone!=''&&resume.resumePhone!=null&&resume.resumeSex!=''&&resume.resumeSex!=null&&resume.resumePhone!=null&&resume.resumeEmail!=''&&resume.resumeEmail!=null){
                $(this).unbind('click')
                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                    data:JSON.stringify(resume),        //转为JSON格式
                    url:path+'Resume/updateResume.do',    //路径
                    success:function (data){//data 就是数据 json
                        tck.remove();                           //删除修改框
                        _self.init();                           //重新加载
                        $('.zp_jianli_cont_left_jbzl_middle').css({"display":"block"})
                    },error:function (){ //报错执行的
                        alert('基本资料修改错误')
                    }

                })
            }

        })
    })

};
//基本资料结束
//职业意向开始
function obj_zyyx(){
    this.qwhy='';
    this.qwzn='';
    this.qwdd='';
    this.qwnx='';
    this.mqnx='';
    this.DOM={
        oqwhy:$('#jl_qwhy'),
        oqwzn:$('#jl_qwzn'),
        oqwdd:$('#jl_qwdd'),
        oqwnx:$('#jl_qwnx > input'),
        omqnx:$('#jl_mqnx > input'),
    }
}
obj_zyyx.prototype.init=function (){
    var _self=this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',      //路径
        success:function (data){    //data 就是数据 json
            _self.qwhy=data.resume.fields;                  //行业(包括当前 和期望 2是当前 3是期望的)
            _self.qwzn=data.resume.resumeIntentPosition;    //期望职能
            _self.qwdd=data.resume.resumeWorkspace;         //期望地点
            _self.qwnx=[data.resume.resumeIntentYm,12];     //期望年薪
            _self.mqnx=[data.resume.resumeYm,12];           //当前年薪
            _self.bindingDOM();
            _self.bindingSJ();
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });
};
obj_zyyx.prototype.bindingDOM=function (){
    var _self=this;
    var str='';
    var str2=''                 //期望行业变量
    var str3=''                 //当前行业变量
    var int=0;
    for(var i=0;i<_self.qwhy.length;i++){
        if(_self.qwhy[i].fieldType=="3"&&_self.qwhy[i].fieldName!=''){
            str2+=_self.qwhy[i].fieldName+'/'
            int++;
        }
    }

     str2=str2.substr(0,str2.length-1);             //去掉最后的/
    if(str2!=''&&str2!=null&&int!=0){
        str+='<p>期望行业：'+str2+'</p>';
    }else{
        str+='<p>期望行业：</p>';
    }
    if( _self.qwzn!=null&&_self.qwzn!=''){
        str+='<p>期望职能：'+_self.qwzn+'</p>'
    }else{
        str+='<p>期望职能：</p>'
    }
    if( _self.qwdd!=null&&_self.qwdd!=''){
        str+='<p>期望地点：'+_self.qwdd+'</p>'
    }else{
        str+='<p>期望地点：</p>'
    }

    if( _self.qwnx[0]!=null&& _self.qwnx[0]!=''){
        str+='<p>期望年薪：'+_self.qwnx[0]+'</p>'
    }else{
        str+='<p>期望年薪：</p>'
    }

    if( _self.mqnx[0]!=null&&_self.mqnx[0]!=''){
        str+='<p>目前年薪：'+_self.mqnx[0]+'</p>'
    }else{
        str+='<p>目前年薪：</p>'
    }
     $('#zyyx_cont').html(str);         //插入




};
obj_zyyx.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;
    $('.zp_jianli_cont_left_zyyx_yl').find('.zp_jianli_xg').on('click',function (){
        if(kg){
            kg=false;
            var str=''

            str+='<div class="zp_jianli_zl_3">'
            str+='<ul>'
            str+='<li  class="li_01">'
            str+='期望行业 <div id="zp_qwhy"  type="text" class="form-control zp_jianli_zl_3_input1 ">'
            //这块循环出来  需要判断是否有内容没有给li设置一个高度
            for(var i=0;i<_self.qwhy.length;i++){
                if(_self.qwhy[i].fieldType=="3"&&_self.qwhy[i].fieldName!=''){
                    str+='<div><div data-fieldId='+_self.qwhy[i].fieldId+' data-fieldtype='+_self.qwhy[i].fieldType+'>'+_self.qwhy[i].fieldName+'</div><a href="javascript:;">x</a></div>'
                }
            }
            str+='</div>'
            str+='<em></em>'
            str+='</li>'
            str+='<li>'
            str+='期望职能 <input id="jl_qwzn" value="'+_self.qwzn+'" type="text" class="form-control zp_jianli_zl_3_input1" placeholder="请输入你期望的智能">'
            str+=' <em></em>'
            str+='</li>'
            str+='<li>'
            str+='期望地点 <input id="jl_qwdd" value="'+_self.qwdd+'" type="text" class="form-control zp_jianli_zl_3_input1" placeholder="请输入期望地点">'
            str+='<em></em>'
            str+='</li>'
            str+='<li id="jl_qwnx">'
            if(_self.qwnx[0]!=''&&_self.qwnx[0]!=null){
                str+='期望年薪 <input id="_zwnx_" type="text" value="'+_self.qwnx[0]+'" class="form-control zp_jianli_zl_3_input2" placeholder="期望年薪">'
            }else{
                str+='期望年薪 <input id="_zwnx_" type="text" value="" class="form-control zp_jianli_zl_3_input2" placeholder="期望年薪">'
            }

            str+=' 元/月x '
            str+='<input type="text" id="nx_ym" value="'+_self.qwnx[1]+'" class="form-control zp_jianli_zl_3_input3" >'
            str+='个月= <span id="qwnx_cont">0.00</span> 万'
            str+='</li>'
            str+='<li id="jl_mqnx">'
            if(_self.mqnx[0]!=''&&_self.mqnx[0]!=null){
                str+='目前年薪 <input type="text" id="_mqnx_" value="'+_self.mqnx[0]+'" class="form-control zp_jianli_zl_3_input2" placeholder="目前年薪">'
            }else{
                str+='目前年薪 <input type="text" id="_mqnx_" value="" class="form-control zp_jianli_zl_3_input2" placeholder="目前年薪">'
            }
            str+=' 元/月x '
            str+='<input type="text" id="nx_mm" value="'+_self.mqnx[1]+'" class="form-control zp_jianli_zl_3_input3">'
            str+='个月= <span id="mqnx_cont">0.00</span> 万'
            str+='</li>'
            str+='</ul>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" id="zp_jianli_zl_3_qx" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('.zp_jianli_cont_left_zyyx_yl').after(str);
            eee('#jl_qwzn')
            eee('#jl_qwdd')
            eee('#_zwnx_')
            eee('#_mqnx_')
            zhisha_01()
            $('#zyyx_cont').css({"display":"none"});

            function zhisha_01(){                   //一些判断什么的
                if( $('#zp_qwhy div').length==0){
                    $('.li_01').css({"height":"30px"})
                    $('#zp_qwhy').css({
                        "border-color":"#FF4600",
                        "line-height":"10px",
                    }).html('请选择期望行业')
                }else{
                    $('.li_01').css({"height":"auto"})
                    $('#zp_qwhy').css({
                        "border-color":"#cccccc",
                        "line-height":"26px",
                    })
                }
                $('#zp_qwhy a').on('click',function (){
                    $(this).parent().remove();
                    if( $('#zp_qwhy div').length==0){
                        $('.li_01').css({"height":"30px"})
                        $('#zp_qwhy').css({
                            "border-color":"#FF4600",
                            "line-height":"10px",
                        }).html('请选择期望行业')
                    }else{
                        $('.li_01').css({"height":"auto"})
                        $('#zp_qwhy').css({
                            "border-color":"#cccccc",
                            "line-height":"26px",
                        })
                    }
                })
            }

            ////////////////////////////////选择行业//////////////////////////////////
            $('.zp_jianli_zl_3 em').eq(0).on("click",function (event){       //弹出框事件
                $.ajax({
                    type:"get",
                    async:true,
                    data:{type:3},
                    url:path+'Field/selByType',
                    success:function (data){        //
                        var attr=[]
                        var str4=""
                        str4+='<tr>'
                        str4+='<td class="comd_td"><span>互联网·游戏·软件</span></td>'
                        str4+='<td>'
                        str4+='<ul class="comd_ul">'
                        for(var i=0;i<data.fieldList.length;i++){
                            str4+='<li><input type="checkbox" data-fieldtype="'+data.fieldList[i].fieldType+'" data-fieldId="'+data.fieldList[i].fieldId+'" data-value="'+data.fieldList[i].fieldName+'" />'+data.fieldList[i].fieldName+'</li>'

                        }
                        str4+='</ul>'
                        str4+='</td>'
                        str4+='</tr>'

                        $('#hy_tab').html(str4);            //将后台提供的数据保存到列表中
                        $('#hy_tab').find('input[type=checkbox]').each(function (index,ele){
                            var www= $(ele).attr('data-fieldid');
                            $('#zp_qwhy > div > div').each(function (index2,ele2){
                                var rrr= $(ele2).attr('data-fieldid');
                                if(www==rrr){
                                    $(ele).attr('checked','checked')
                                }
                            })
                        })

                        event.preventDefault();
                        $('.cd-popup').addClass('is-visible');

                    },error:function (){ //报错执行的
                        alert('报错了报错了')
                    }

                })

            });
            $('.cd-popup').on('click', function(event){                    //返回按钮
                if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
                     event.preventDefault();
                    $('.cd-popup').removeClass('is-visible');

                }
            });
            $(document).keyup(function(event){                            //键盘关闭
                if(event.which=='27'){
                    $('.cd-popup').removeClass('is-visible');
                }
            });

            $('#xz_qwhy_qd').on('click',function (){                    //确认按钮
                //第一步获取所有选中的复选框
                var attr_1=[];
                $('#qwhy__').find('input[type=checkbox]:checked').each(function (index,ele){
                    attr_1[index]={value:$(ele).attr('data-value'),fieldId:$(ele).attr('data-fieldId'),fieldtype:$(ele).attr('data-fieldtype')}
                })

                var str_qwhy=''                 //所选的期望行业
                for(var i=0;i<attr_1.length;i++){
                    str_qwhy+='<div><div data-fieldId='+attr_1[i].fieldId+' data-fieldtype='+attr_1[i].fieldtype+'>'+attr_1[i].value+'</div><a href="javascript:;">x</a></div>'
                }
                $('#zp_qwhy').html(str_qwhy);        //赋值
                $('.cd-popup').removeClass('is-visible');
                if(attr_1.length==0){
                    $('#zp_qwhy').css({
                        "border-color":"#FF4600",
                        "line-height":"10px",
                    }).html('请选择期望行业')
                }else{
                    $('#zp_qwhy').css({
                        "border-color":"#cccccc",
                        "line-height":"26px",
                    })
                }
                zhisha_01();                         //删除技能自杀按钮
            });


            // $('#jl_qwnx input').keyup(function (event){         //鼠标抬起事件
            //     var aa_qwnx=$('#jl_qwnx').find('input').eq(0).val()*$('#jl_qwnx').find('input').eq(1).val(); //
            //     $('#qwnx_cont').html(aa_qwnx/10000);       //期望年薪
            // })
            // $('#jl_mqnx input').keyup(function (event){         //鼠标抬起事件
            //     var aa_qwnx=$('#jl_qwnx').find('input').eq(0).val()*$('#jl_qwnx').find('input').eq(1).val(); //
            //     $('#qwnx_cont').html(aa_qwnx/10000);             //目前年薪
            // })


            $('.zp_jianli_zl_3').find('button').eq(1).on('click',function (){
                kg=true;
                $('#zyyx_cont').css({"display":"block"});
                $(this).parent().parent().remove()
            })
            $('.zp_jianli_zl_3').find('button').eq(0).on('click',function (){       //职业意向修改事件
                var xgk=$(this).parent().parent();
                var shuzu=[];                                   //存放的数组
                var qwhy3=$('#zp_qwhy > div > div');
                for(var i=0;i<qwhy3.length;i++){
                    shuzu[i]={
                        fieldId: trim($(qwhy3).eq(i).attr('data-fieldid')),
                        fieldType:trim($(qwhy3).eq(i).attr('data-fieldtype')),
                    }
                }
                var pcont={
                    resumeId:ID,                                    //ID
                    fields:shuzu,                                   //行业
                    resumeIntentPosition:trim($('#jl_qwzn').val()),   //期望职能
                    resumeWorkspace:trim($('#jl_qwdd').val()),        //期望地点
                    resumeIntentYm:trim($('#jl_qwnx input').eq(0).val()),//期望年薪
                    resumeYm:trim($('#jl_mqnx input').eq(0).val())     //当前年息
                };
                function bdxy(){
                    if(pcont.fields.length==0){
                        $('#zp_qwhy').css({
                            "border-color":"#FF4600"
                        })
                        return
                    }
                    if(pcont.resumeIntentPosition==''||pcont.resumeIntentPosition==null){
                        $('#jl_qwzn').addClass('jl_name');
                        $('#jl_qwzn').focus();
                        return
                    }
                    if(pcont.resumeWorkspace==''||pcont.resumeWorkspace==null){
                        $('#jl_qwdd').addClass('jl_name');
                        $('#jl_qwdd').focus()
                        return
                    }
                    if(pcont.resumeIntentYm==''||pcont.resumeIntentYm==null){
                        $('#_zwnx_').addClass('jl_name');
                        $('#_zwnx_').focus()
                        return
                    }
                    if(pcont.resumeYm==''||pcont.resumeYm==null){
                        $('#_mqnx_').addClass('jl_name');
                        $('#_mqnx_').focus()
                        return
                    }
                }
                bdxy()
                if(pcont.fields.length!=0&&pcont.resumeIntentPosition!=''&&pcont.resumeIntentPosition!=null&&pcont.resumeWorkspace!=''&&pcont.resumeWorkspace!=null&&pcont.resumeIntentYm!=''&&pcont.resumeIntentYm!=null&&pcont.resumeYm!=''&&pcont.resumeYm!=null){
                    $(this).unbind('click')
                    $.ajax({
                        type:"post",    //提交方式
                        async:true,  //是否异步
                        contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                        data:JSON.stringify(pcont),        //转为JSON格式
                        url:path+'Resume/updateResume.do',    //路径
                        success:function (data){//data 就是数据 json
                            xgk.remove();//删除修改框
                            _self.init();//重新载入
                            $('#zyyx_cont').css({"display":"block"})   //显示

                        },error:function (){ //报错执行的
                            alert('基本资料修改错误')
                        }

                    })
                }

            })



        }else{

        }


    })
};
//职业意向结束
//工作经历开始
function obj_gzjl(){
    this.gsmc='';               //公司名称
    this.gshy='';               //公司领域
    this.zwmc2='';               //职位名称
    this.gzdd='';               //工作地点
    this.xxrs='';               //下属人数
    this.rzsj='';               //任职时间
    this.lzsj='';               //离职时间
    this.zzyj='';               //职责业绩
    this.yx=''                  //月薪
}
obj_gzjl.prototype.init=function (){

         var str='';
         var _self=this;

        $.ajax({
        type: "get",//数据发送的方式（post 或者 get）
        url: path+'JobExp/selByResumeId.do?resumeId='+ID,//要发送的后台地址
        success: function (data) {//ajax请求成功后触发的方法

            _self.obj_s=[];                           //放赋值后对象的列表
            for(var i=0;i<data.jobExpList.length;i++){
                var obj__gzjl=new obj_gzjl();       //循环创建对象
                obj__gzjl.gsmc=data.jobExpList[i].jobexpCompanyName;       //公司名
                obj__gzjl.gshy=data.jobExpList[i].fields;                  //公司行业
                obj__gzjl.zwmc2=data.jobExpList[i].jobexpPostion;          //职位名称
                obj__gzjl.gzdd=data.jobExpList[i].jobexpWorkspace;         //工作地点
                obj__gzjl.xxrs=data.jobExpList[i].jobexpSubordinate;       //下属人数
                obj__gzjl.rzsj=data.jobExpList[i].jobexpBeginTime;         //任职时间
                obj__gzjl.lzsj=data.jobExpList[i].jobexpEndTime;           //离职时间
                obj__gzjl.zzyj=data.jobExpList[i].jobexpDuty;              //职责业绩
                obj__gzjl.yx=data.jobExpList[i].jobexpMm;                //月薪
                obj__gzjl.gzjlID=data.jobExpList[i].jobexpId             //工作经历ID
                _self.obj_s[i]=obj__gzjl;                  //插进数组
            }
            var jlgs=0;                             //计算多少个工作经历
            for (var i=0;i<_self.obj_s.length;i++){       //绑定元素开始
                str+='<div id="gzjl_'+jlgs+++'">'
                str+='<div class="zp_jianli_cont_left_gzjl_cont">'
                str+='<h3>'
                str+='<span>'+_self.obj_s[i].zwmc2+'</span><span class="zp_jianli_color">&nbsp;|&nbsp;</span><span>'+_self.obj_s[i].gsmc+'</span>&nbsp;&nbsp;&nbsp;&nbsp;<time>（'+getNowFormatDate(_self.obj_s[i].rzsj)+' － '+getNowFormatDate(_self.obj_s[i].lzsj)+'）</time>'
                str+='<a class="zp_jianli_xg" href="javascript:;"></a>'
                str+='</h3>'
                if(_self.obj_s[i].yx!=''&&_self.obj_s[i].yx!=null){
                    str+='<p>工作地点：'+_self.obj_s[i].gzdd+' | 月薪：'+_self.obj_s[i].yx+'/月*12个月</p>'
                }else{
                    str+='<p>工作地点：'+_self.obj_s[i].gzdd+' | 月薪：/月*12个月</p>'
                }

                str+='<p>'+_self.obj_s[i].zzyj+'</p>'
                str+='</div>'
                str+='<p class="zp_jianli_p1">公司领域：'
                for(var j=0;j<_self.obj_s[i].gshy.length;j++){
                    if(_self.obj_s[i].gshy[j].fieldType==1){        //1是全局的2
                        str+='<span data-type="'+_self.obj_s[i].gshy[j].fieldType+'" data-id="'+_self.obj_s[i].gshy[j].fieldId+'">'+_self.obj_s[i].gshy[j].fieldName+'</span>&nbsp;&nbsp;&nbsp'
                    }
                }
                str+='</p>'
                str+='</div>'
            }
            $('#gzjl').after(str)          //插入简历
            _self.bindingSJ();              //触发事件
        },
        error: function () {//ajax请求失败后触发的方法
            alert('错误');//弹出错误信息
        }
    });

};
obj_gzjl.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;//这是修改开关
    var tj_kg=true;//   这是添开关
    function aaa(){
        if( $('.gsly_xg div').length==0){
            $('.li_03').css({"height":"30px"});
            $('.gsly_xg').css({
                "height":"30px",
                "line-height":"10px"
            }).html("请选择公司领域")

        }else{
            $('.li_03').css({"height":"auto"});
            $('.gsly_xg').css({
                "height":"auto",
                "line-height":"26px"
            })
        }
        $('.gsly_xg a').on('click',function (){
            $(this).parent().remove();
            if( $('.gsly_xg div').length==0){
                $('.li_03').css({"height":"30px"})
                $('.gsly_xg').css({
                    "height":"30px",
                    "line-height":"10px"
                }).html("请选择公司领域")

            }else{
                $('.li_03').css({"height":"auto"})
                $('.gsly_xg').css({
                    "height":"auto",
                    "line-height":"26px"
                })
            }
        })
    }
    function bbb(){
        $('.em2').on('click',function (){
            $.ajax({
                type:"post",    //提交方式
                async:true,  //是否异步
                dataType:'json',                   //定义返回data类型
                url:path+'Field/selByType?type=1',    //1是所有公司的
                success:function (data){//data 就是数据 json
                    var attr=[]
                    var str4=""
                    str4+='<tr>'
                    str4+='<td class="comd_td"><span>互联网·游戏·软件</span></td>'
                    str4+='<td>'
                    str4+='<ul class="comd_ul">'

                    for(var i=0;i<data.fieldList.length;i++){
                        str4+='<li><input type="checkbox" data-value="'+data.fieldList[i].fieldName+'" data-fieldid="'+data.fieldList[i].fieldId+'" data-fieldtype="'+data.fieldList[i].fieldType+'"/>'+data.fieldList[i].fieldName+'</li>'
                    }
                    str4+='</ul>'
                    str4+='</td>'
                    str4+='</tr>'
                    $('#hy_tab').html(str4);            //将后台提供的数据保存到列表中
                    $('#hy_tab').find('input[type=checkbox]').each(function (index,ele){        //验证是否选中
                        var www= $(ele).attr('data-fieldid');
                        $('.gsly_xg > div > div').each(function (index2,ele2){
                            var rrr= $(ele2).attr('data-fieldid');
                            if(www==rrr){
                                $(ele).attr('checked','checked')
                            }
                        })
                    })

                    //取消
                    $('#xz_qwhy_qx').on('click',function (){
                        $('.cd-popup').removeClass('is-visible');
                    })
                    $('#xz_qwhy_qd').on('click',function (){                    //确认按钮
                        //第一步获取所有选中的复选框
                        var attr_1=[];
                        $('#qwhy__').find('input[type=checkbox]:checked').each(function (index,ele){
                            attr_1[index]={value:$(ele).attr('data-value'),fieldId:$(ele).attr('data-fieldId'),fieldtype:$(ele).attr('data-fieldtype')}
                        })

                        var str_qwhy=''                 //所选的期望行业
                        for(var i=0;i<attr_1.length;i++){
                            str_qwhy+='<div><div data-fieldId='+attr_1[i].fieldId+' data-fieldtype='+attr_1[i].fieldtype+'>'+attr_1[i].value+'</div><a href="javascript:;">x</a></div>'
                        }
                        $('.gsly_xg').html(str_qwhy);
                        $('.cd-popup').removeClass('is-visible');
                        aaa();
                    });

                    event.preventDefault();
                    $('.cd-popup').addClass('is-visible');


                },error:function (){ //报错执行的
                    alert('基本资料修改错误')
                }

            })

        })
    }

    $('#gzjl').siblings('div').find('.zp_jianli_xg').each(function (index,ele){ //修改弹出框事件

        $(ele).on('click',function () {     //插入简历弹出框

            if(kg){
                kg=false;
                tj_kg=false;
                var str='';
                str+='<div class="zp_jianli_zl_4 ttk_jl" data-id="'+_self.obj_s[index].gzjlID+'">'
                str+='<ul>'
                str+=' <li>'
                str+=' 公司名称<input type="text" id="gsmc___" value="'+_self.obj_s[index].gsmc+'" class="gsmc_input form-control zp_jianli_zl_3_input1" placeholder="请输入公司名称">'
                str+='</li>'

                str+='<li class="li_03">'
                str+='公司领域<div class="gsly_xg" >'
                    for(var j=0;j<_self.obj_s[index].gshy.length;j++){
                        if(_self.obj_s[index].gshy[j].fieldType==1){        //1是公司
                            str+='<div><div data-fieldid="'+_self.obj_s[index].gshy[j].fieldId+'" data-fieldtype="'+_self.obj_s[index].gshy[j].fieldType+'">'+_self.obj_s[index].gshy[j].fieldName+'</div><a href="javascript:;">x</a></div>'
                        }
                    }

                str+='</div>'
                str+='<em class="em2"></em>'
                str+='</li>'
                str+='<li>'
                str+='职位名称<input type="text" id="zwmc___" value="'+_self.obj_s[index].zwmc2+'" class="zwmc_input form-control zp_jianli_zl_3_input1 " placeholder="请输入职位名称">'
                str+='</li>'
                str+='<li>'
                str+='工作地点'
                str+='<div class="zp_jianli_zl_4_div1">'
                str+='<input type="text" id="gzdd___" value="'+_self.obj_s[index].gzdd+'" class="gzdd_input form-control zp_jianli_zl_4_input2 "  placeholder="请输入工作地点">'
                str+='下属人数'
                if(_self.obj_s[index].xxrs!=''&&_self.obj_s[index].xxrs!=null){
                    str+='<input type="text" id="xxrs__" value="'+_self.obj_s[index].xxrs+'" class="ssrs_input form-control zp_jianli_zl_4_input3" placeholder="请输入下属人数">'
                }else{
                    str+='<input type="text" id="xxrs__" value="" class="ssrs_input form-control zp_jianli_zl_4_input3" placeholder="请输入下属人数">'
                }
                str+='</div>'
                str+='</li>'
                str+='<li>'
                str+='任职时间'
                str+='<div class="zp_jianli_zl_4_div2" style="position: relative" >'
                str+='<input class="form-control rzsh_input " id="rzsj__" value="'+getNowFormatDate(_self.obj_s[index].rzsj)+'" placeholder="请输入任职时间"> '
                str+='<em class="em3" style="left: 150px"></em>'
                str+='&nbsp;&nbsp;离职时间'
                str+='<input class="form-control pull-right lzsj_input" id="lzsj__" value="'+getNowFormatDate(_self.obj_s[index].lzsj)+'"placeholder="请输入离职时间" > '
                str+='<em class="em3" ></em>'
                str+='</div>'
                str+='</li>'
                str+='</ul>'
                str+='<div>'
                str+='<span>职责业绩</span>'
                str+='<textarea placeholder="请输入职责业绩" id="zzyj__">'+_self.obj_s[index].zzyj+'</textarea>'
                str+='<div style="clear: both;"></div>'
                str+='</div>'
                str+='<div class="zp_jianli_zl_2_bottom">'
                str+='<button type="button" class="btn btn-primary">确定</button>'
                str+='<button class="btn btn-default" id="jbzl_4_qx" type="button">取消</button>'
                str+='</div>'
                str+='</div>'
                $('#gzjl').siblings('div').eq(index).after(str);  //插入
                $('#ttk_jl').find('.em3').eq(0).on('click',function (){
                    alert('aaa')
                })
                $('#gzjl').siblings('div').eq(index).css({"display":"none"});


                // $('.csny__ > em').on('click',function (){
                //     jeDate({
                //         dateCell:"#jl_cstime",  //目标元素。由于jedate.js封装了一个轻量级的选择器，因此dateCell还允许你传入class、tag这种方式 '#id .class'
                //         format:"YYYY-MM-DD ",
                //         isinitVal:true, //显示时间
                //         isTime:true,
                //         festival: true, //显示节日
                //         minDate:"2014-09-19"
                //     })
                // })


                eee('#gsmc___')
                eee('#zwmc___')
                eee('#gzdd___')
                eee('#xxrs__')
                eee('#rzsj__')
                eee('#lzsj__')
                eee('#zzyj__')
                aaa();
                bbb();
            }

            $('.zp_jianli_zl_4').find('button').eq(1).on('click',function (){
                kg=true;                                        //一次只能修改一个简历
                tj_kg=true;
                $(this).parent().parent().prev().css({"display":"block"});
                $(this).parent().parent().remove();               //自杀

            })
            $('.zp_jianli_zl_4').find('button').eq(0).on('click',function (){   //修改事件
                var This=this;
                var gzjl=$(This).parent().parent();
                var aa=$(gzjl).find('.gsly_xg > div > div');
                var attr=[];

                aa.each(function (i,e) {
                    attr[i] ={
                        fieldId:aa.eq(i).attr('data-fieldid'),
                        fieldType:1,                //
                        fieldName:aa.eq(i).text(),
                    }
                })
                var obj_gzjl={
                    jobexpCompanyName:trim(gzjl.find('input').eq(0).val()),         //公司名称
                    fields:attr,                                            //公司领域
                    jobexpPostion:trim(gzjl.find('input').eq(1).val()),             //职位名称
                    jobexpWorkspace:trim(gzjl.find('input').eq(2).val()),           //工作地点
                    jobexpSubordinate:trim(gzjl.find('input').eq(3).val()),         //下属人数
                    jobexpBeginTime:trim(gzjl.find('input').eq(4).val()),           //任职时间
                    jobexpEndTime:trim(gzjl.find('input').eq(5).val()),             //离职时间
                    jobexpDuty:trim(gzjl.find('textarea').eq(0).val()),                //职责业绩
                    jobexpId:trim(gzjl.attr('data-id'))                             //工作经历ID
                };
                function bdyz(){
                    if(obj_gzjl.jobexpCompanyName==''||obj_gzjl.jobexpCompanyName==null){
                        $('#gsmc___').addClass('jl_name');
                        $('#gsmc___').focus();
                        return
                    }
                    if(obj_gzjl.fields.length==0){
                        $('.gsly_xg').css({
                            "border-color":"#FF4600"
                        })
                        return
                    }
                    if(obj_gzjl.jobexpPostion==''||obj_gzjl.jobexpPostion==null){
                        $('#zwmc___').addClass('jl_name');
                        $('#zwmc___').focus();
                        return
                    }
                    if(obj_gzjl.jobexpWorkspace==''||obj_gzjl.jobexpWorkspace==null){
                        $('#gzdd___').addClass('jl_name');
                        $('#gzdd___').focus();
                        return
                    }
                    if(obj_gzjl.jobexpSubordinate==''||obj_gzjl.jobexpSubordinate==null){
                        $('#xxrs__').addClass('jl_name');
                        $('#xxrs__').focus();
                        return
                    }
                    if(obj_gzjl.jobexpBeginTime==''||obj_gzjl.jobexpBeginTime==null){
                        $('#rzsj__').addClass('jl_name');
                        $('#rzsj__').focus();
                        return
                    }
                    if(obj_gzjl.jobexpEndTime==''||obj_gzjl.jobexpEndTime==null){
                        $('#lzsj__').addClass('jl_name');
                        $('#lzsj__').focus();
                        return
                    }
                    if(obj_gzjl.jobexpDuty==''||obj_gzjl.jobexpDuty==null){
                        $('#zzyj__').addClass('jl_name');
                        $('#zzyj__').focus();
                        return
                    }

                }
                bdyz()

                if(obj_gzjl.fields.length!=0&&obj_gzjl.jobexpCompanyName!=''&&obj_gzjl.jobexpCompanyName!=null&&obj_gzjl.jobexpPostion!=''&&obj_gzjl.jobexpPostion!=null&&obj_gzjl.jobexpWorkspace!=''&&obj_gzjl.jobexpWorkspace!=null&&obj_gzjl.jobexpSubordinate!=''&&obj_gzjl.jobexpSubordinate!=null&&obj_gzjl.jobexpBeginTime!=''&&obj_gzjl.jobexpBeginTime!=null&&obj_gzjl.jobexpEndTime!=''&&obj_gzjl.jobexpEndTime!=null&&obj_gzjl.jobexpDuty!=''&&obj_gzjl.jobexpDuty!=null){
                    $(this).unbind('click')
                    $.ajax({
                        type:"post",    //提交方式
                        async:true,  //是否异步
                        contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                        data:JSON.stringify(obj_gzjl),        //转为JSON格式
                        dataType:'text',                   //定义返回data类型
                        url:path+'JobExp/updateJobExp.do',    //路径
                        success:function (data){//data 就是数据 json
                            $(This).parent().parent().prev().css({"display":"block"});
                            $(This).parent().parent().remove();               //自杀
                            $('#gzjl').siblings('div').remove();
                            _self.init();

                        },error:function (){ //报错执行的
                            alert('基本资料修改错误')
                        }

                    })
                }
            })

        })
    }); //修改弹出框事件
    $('#tj_gzjl').unbind('click').on('click',function (){
        if(tj_kg){
            tj_kg=false;
            kg=false;
            var str='';
            str+='<div class="zp_jianli_zl_4">'
            str+='<ul>'
            str+=' <li>'
            str+=' 公司名称<input type="text"  class="form-control zp_jianli_zl_3_input1" placeholder="请输入公司名称">'
            str+='</li>'
            str+='</li>'

            str+='<li class="li_03">'
            str+='公司领域<div class="gsly_xg" >'

            str+='</div>'

            str+='<em class="em2"></em>'
            str+='</li>'
            str+='<li>'
            str+='职位名称<input type="text"  class="form-control zp_jianli_zl_3_input1 "  placeholder="请输入职位名称">'
            str+='</li>'
            str+='<li>'
            str+='工作地点'
            str+='<div class="zp_jianli_zl_4_div1">'
            str+='<input type="text"  class="form-control zp_jianli_zl_4_input2 "  placeholder="请输入工作地点">'
            str+='下属人数'
            str+='<input type="text"  class="form-control zp_jianli_zl_4_input3"  placeholder="请输入下属人数">'
            str+='</div>'
            str+='</li>'
            str+='<li>'
            str+='任职时间'
            str+='<div class="zp_jianli_zl_4_div2" >'
            str+='<input class="form-control "  placeholder="请输入任职时间" > '
            str+='&nbsp;&nbsp;离职时间'
            str+='<input class="form-control pull-right"  placeholder="请输入离职时间" > '
            str+='</div>'
            str+='</li>'
            str+='</ul>'
            str+='<div>'
            str+='<span>职责业绩</span>'
            str+='<textarea placeholder="请输入职责业绩" ></textarea>'
            str+='<div style="clear: both;"></div>'
            str+='</div>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" id="jbzl_4_qx" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $(this).before(str)//插入简历的空白模板
            aaa();              //判断行业是否为空
            bbb();              //加载全部的领域

            $(this).siblings('.zp_jianli_zl_4').find('button').eq(1).unbind('click').on('click',function (){ //添加简历的取消事件
                kg=true;
                tj_kg=true;
                $(this).parent().parent().remove();
            });
            $(this).siblings('.zp_jianli_zl_4').find('button').eq(0).unbind('click').on('click',function (){ //添加简历提交事件
            //    在这里向后台提交表单
                kg=true;

                tj_kg=true;
                var This2=this;
                var gzjl=$(This2).parent().parent();
                var aa=$(gzjl).find('.gsly_xg > div > div');
                var attr=[];
                aa.each(function (i,e) {
                    attr[i] ={
                        fieldId:aa.eq(i).attr('data-fieldid'),
                        fieldType:1,                //
                        fieldName:aa.eq(i).text(),
                    }
                })
                var obj_gzjl={
                    jobexpCompanyName:gzjl.find('input').eq(0).val(),         //公司名称
                    fields:attr,                                            //公司领域
                    jobexpPostion:gzjl.find('input').eq(1).val(),             //职位名称
                    jobexpWorkspace:gzjl.find('input').eq(2).val(),           //工作地点
                    jobexpSubordinate:gzjl.find('input').eq(3).val(),         //下属人数
                    jobexpBeginTime:gzjl.find('input').eq(4).val(),           //任职时间
                    jobexpEndTime:gzjl.find('input').eq(5).val(),             //离职时间
                    jobexpDuty:gzjl.find('textarea').eq(0).val(),                //职责业绩
                    resumeId:ID,                                                 //简历ID
                };
                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                    data:JSON.stringify(obj_gzjl),        //转为JSON格式
                    dataType:'text',                   //定义返回data类型
                    url:path+'JobExp/insertJobExp.do',    //路径
                    success:function (data){//data 就是数据 json
                        $(This2).parent().parent().remove();               //自杀
                         $('#gzjl').siblings('div').remove();
                        _self.init();

                    },error:function (){ //报错执行的
                        alert('基本资料修改错误')
                    }

                })





            })
        }


    })

};
//工作经历结束
//教育经历
function obj_yyjl(){
        this.xxmc='',       //学校名称
        this.zymc='',       //专业名称
        this.jdsj='',       //就读时间
        this.bynf='',       //毕业年份
        this.xl='',         //学历
        this.sftz=0         //是否统招
        this.jyjlID =0        //教育经历ID
}
obj_yyjl.prototype.init=function (){
    var _self=this;
    $.ajax({
        type: "get",//数据发送的方式（post 或者 get）
        url: path+'Education/selEducationByResumeId.do',//要发送的后台地址
        data:{resumeId:ID},                                      //传的参数
        success: function (data) {//ajax请求成功后触发的方法
            _self.obj_s=[];//接收对象的数组
            for(var i=0;i<data.educationList.length;i++){
                var obj__yyjl=new obj_yyjl();
                obj__yyjl.xxmc=data.educationList[i].educationSchool;
                obj__yyjl.zymc=data.educationList[i].educationMajor;
                obj__yyjl.jdsj=data.educationList[i].enrollmentDate;
                obj__yyjl.bynf=data.educationList[i].graduateDate;
                obj__yyjl.xl=data.educationList[i].educationLevel;
                obj__yyjl.sftz=data.educationList[i].educationEntrance;
                obj__yyjl.jyjlID=data.educationList[i].educationId;     //教育经历ID;
                _self.obj_s[i]=obj__yyjl;      //插入
            }
            //便利对象到页面上
            var str='';//用来装元素的容器    return出去
            for(var i=0;i<_self.obj_s.length;i++){
                str+='<div class="zp_qq1" data-id="'+_self.obj_s[i].jyjlID+'">'
                str+='<p class="zp_index_p_left">'
                str+=''+_self.obj_s[i].xxmc+'（'+getNowFormatDate(_self.obj_s[i].jdsj)+'------'+getNowFormatDate(_self.obj_s[i].bynf)+'）'
                str+='<a class="zp_jianli_xg" href="javascript:;"></a>'
                str+='</p>'
                str+='<ul>'
                str+='<li>专业名称：<span>'+_self.obj_s[i].zymc+'</span></li>'
                str+='<li>学历：<span>'+_self.obj_s[i].xl+'</span></li>'
                if( _self.obj_s[i].sftz==0){
                    str+='<li>是否统招：<span>否</span></li>'
                }else if(_self.obj_s[i].sftz==1){
                    str+='<li>是否统招：<span>是</span></li>'
                }else{
                    str+='<li>是否统招：<span></span></li>'
                }
                str+='</ul>'
                str+='</div>'
            }
            $('#zp_jyjl').after(str);   //插入元素
            _self.bindingSJ();          //触发绑定事件
        },
        error: function () {//ajax请求失败后触发的方法
            alert('教育经历出错了');//弹出错误信息
        }
    });
};
obj_yyjl.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;//这是修改开关
    var tj_kg=true;//   这是添开关

    $('.zp_jianli_cont_left_xl').find('.zp_jianli_xg').each(function (index,ele){
        $(ele).unbind('click').on('click',function (){
            var str='';
            if(kg){
                tj_kg=false;
                kg=false;
                str+='<div class="zp_jianli_zl_5" data-id="'+_self.obj_s[index].jyjlID+'">'
                    str+='<ul>'
                    str+='<li>学校名称 <input type="text" id="_xxmc_" value="'+_self.obj_s[index].xxmc+'" class="form-control " placeholder="请输入学校名称"></li>'
                    str+='<li>专业名称 <input type="text" id="_zymc_" value="'+_self.obj_s[index].zymc+'" class="form-control " placeholder="请输入专业名称"></li>'

                    str+='<li>就读时间 <input type="text" id="_jdsj_" value="'+ getNowFormatDate(_self.obj_s[index].jdsj)+'" placeholder="请输入就读时间" class="form-control "></li>'
                    str+='<li>毕业年份 <input type="text" id="_bynf_" value="'+getNowFormatDate(_self.obj_s[index].bynf)+'" placeholder="请输入毕业时间" class="form-control "></li>'
                    str+='<li>'
                    str+='学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历&nbsp;&nbsp;&nbsp;&nbsp;'
                    str+='<select class="form-control">'
                    str+='<option data-value="初中">初中</option>'
                    str+='<option data-value="中专">中专</option>'
                    str+='<option data-value="高中">高中</option>'
                    str+='<option data-value="大专">大专</option>'
                    str+='<option data-value="本科">本科</option>'
                    str+='<option data-value="硕士">硕士</option>'
                    str+='<option data-value="博士">博士</option>'
                    str+='</select>'
                    if(_self.obj_s[index].sftz==1){
                        str+='<input type="checkbox" value="1" checked id="sftz"><label for="sftz">是否统招</label>'
                    }else{
                        str+='<input type="checkbox"  value="0" id="sftz"><label for="sftz">是否统招</label>'
                    }
                    str+='</li>'
                    str+='</ul>'
                    str+='<div class="zp_jianli_zl_2_bottom">'
                    str+='<button type="button" class="btn btn-primary">确定</button>'
                    str+='<button class="btn btn-default"  type="button">取消</button>'
                    str+='</div>'
                    str+='</div>'
                    $(this).parent().parent().after(str)     //插入进去
                    eee('#_xxmc_');
                    eee('#_zymc_');
                    eee('#_jdsj_');
                    eee('#_bynf_');

                   $(this).parent().parent().css({"display":"none"});
                   $(this).parent().parent().siblings('.zp_jianli_zl_5').find('select > option').each(function (index2,ele){
                        var oxl=$(ele).text();              //下拉框
                       if(_self.obj_s[index].xl==oxl){
                           $(ele).attr('selected','selected')
                       }
                   })
                   $('.zp_jianli_zl_5').find('button').eq(1).on('click',function (){    //取消按钮
                       tj_kg=true;
                       kg=true;
                       $(this).parent().parent().prev().css({"display":"block"})
                       $(this).parent().parent().remove();
                   })
                    $('.zp_jianli_zl_5').find('button').eq(0).on('click',function (){    //修改按钮事件
                           var This=this
                            tj_kg=true;
                            kg=true;
                            var patent2=$(this).parent().parent();

                            var jyjl={
                                educationId:patent2.attr('data-id'),                      //简历ID
                                educationSchool:trim(patent2.find('input').eq(0).val()),        //学校名称
                                educationMajor:trim(patent2.find('input').eq(1).val()),         //专业名称
                                enrollmentDate:trim(patent2.find('input').eq(2).val()),         //开始时间
                                graduateDate:trim(patent2.find('input').eq(3).val()),           //结束时间
                                educationEntrance:patent2.find('input:checked').length,   //是否统招
                                 educationLevel:patent2.find('select').eq(0).val(),        // 学历
                            };
                            function bdyz(){
                                if(jyjl.educationSchool==''||jyjl.educationSchool==null){
                                    $('#_xxmc_').addClass('jl_name')
                                    $('#_xxmc_').focus()
                                    return
                                }
                                if(jyjl.educationMajor==''||jyjl.educationMajor==null){
                                    $('#_zymc_').addClass('jl_name')
                                    $('#_zymc_').focus()
                                    return
                                }
                                if(jyjl.enrollmentDate==''||jyjl.enrollmentDate==null){
                                    $('#_jdsj_').addClass('jl_name')
                                    $('#_jdsj_').focus()
                                    return
                                }
                                if(jyjl.graduateDate==''||jyjl.graduateDate==null){
                                    $('#_bynf_').addClass('jl_name')
                                    $('#_bynf_').focus()
                                    return
                                }
                            }
                        bdyz()
                        if(jyjl.educationSchool!=''&&jyjl.educationSchool!=null&&jyjl.educationMajor!=''&&jyjl.educationMajor!=null&&jyjl.enrollmentDate!=''&&jyjl.enrollmentDate!=null&&jyjl.graduateDate!=''&&jyjl.graduateDate!=null){
                            $(this).unbind('click')
                            $.ajax({
                                type:"post",    //提交方式
                                async:true,  //是否异步
                                contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                                data:JSON.stringify(jyjl),        //转为JSON格式
                                dataType:'text',                   //定义返回data类型
                                url:path+'Education/updateEducation.do',    //路径
                                success:function (data){//data 就是数据 json
                                    $(This).parent().parent().prev().css({"display":"block"})
                                    $(This).parent().parent().remove();
                                    var aaa=$('.zp_jianli_cont_left_xl > div')
                                    for(var i=1;i<aaa.length-1;i++){            //清空之前的经历
                                        aaa.eq(i).remove();
                                    }
                                    _self.init();

                                },error:function (){ //报错执行的
                                    alert('基本资料修改错误')
                                }

                            })
                        }


                     })


                }else{

            }
        })
    })
    $('#zp_tjjyjl').unbind('click').on('click',function (){
        var str='';
        if(tj_kg){
            kg=false;
            tj_kg=false;
            str+='<div class="zp_jianli_zl_5">'
            str+='<ul>'
            str+='<li>学校名称 <input type="text"  class="form-control "></li>'
            str+='<li>专业名称 <input type="text"  class="form-control "></li>'
            str+='<li>就读时间 <input type="text"  class="form-control "></li>'
            str+='<li>毕业年份 <input type="text"  class="form-control "></li>'
            str+='<li>'
            str+='学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历&nbsp;&nbsp;&nbsp;&nbsp;'
            str+='<select class="form-control">'
            str+='<option>初中</option>'
            str+='<option>中专</option>'
            str+='<option>高中</option>'
            str+='<option>大专</option>'
            str+='<option>本科</option>'
            str+='<option>硕士</option>'
            str+='<option>博士</option>'
            str+='</select>'
            str+='<input type="checkbox"   id="sftz"><label for="sftz">是否统招</label>'
            str+='</li>'
            str+='</ul>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default"  type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $(this).before(str)
            $('.zp_jianli_zl_5').find('button').eq(1).unbind('click').on('click',function (){
                tj_kg=true;
                kg=true;
                $(this).parent().parent().remove()
            })
            $('.zp_jianli_zl_5').find('button').eq(0).unbind('click').on('click',function (){
                tj_kg=true;
                kg=true;
                var This=this;
                var patent2=$(this).parent().parent();

                var jyjl={
                    resumeId:ID,                                              //简历ID
                    educationSchool:patent2.find('input').eq(0).val(),        //学校名称
                    educationMajor:patent2.find('input').eq(1).val(),         //专业名称
                    enrollmentDate:patent2.find('input').eq(2).val(),         //开始时间
                    graduateDate:patent2.find('input').eq(3).val(),           //结束时间
                    educationEntrance:patent2.find('input:checked').length,   //是否统招
                    educationLevel:patent2.find('select').eq(0).val(),        // 学历
                };
                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                    data:JSON.stringify(jyjl),        //转为JSON格式
                    dataType:'text',                   //定义返回data类型
                    url:path+'Education/insertEducation.do',    //路径
                    success:function (data){//data 就是数据 json
                        var aa=$('.zp_jianli_cont_left_xl > div');
                        for(var i=1;i<aa.length-1;i++){
                            aa.eq(i).remove();
                        }
                         _self.init();

                    },error:function (){ //报错执行的
                        alert('基本资料修改错误')
                    }

                })


            })
        }
    })
}
//教育经历结束
//项目经验开始
function obj_xmjy(){
    this.xmmc='';          //项目名称
    this.xmzw='';          //项目职务
    this.xmms='';          //项目描述
    this.zz='';            //项目职责
    this.kssj='';           //开始时间
    this.jssj='' ;          //结束时间
    this.xmjyID=''

}
obj_xmjy.prototype.init=function (){
    var _self=this;

    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'ProjectExp/selByResumeId.do?resumeId='+ID,    //路径

        success:function (data){//data 就是数据 json
            _self.obj_s=[];
            for(var i=0;i<data.projectExpList.length;i++){
                var new_bj_xmjy =new obj_xmjy();
                new_bj_xmjy.xmmc=data.projectExpList[i].proexpName; //项目名
                new_bj_xmjy.xmzw=data.projectExpList[i].proexpPostion;//项目职务
                new_bj_xmjy.xmms=data.projectExpList[i].proexpDescribe;//项目描述
                new_bj_xmjy.zz=data.projectExpList[i].proexpDuty;      //项目职责
                new_bj_xmjy.kssj=getNowFormatDate(data.projectExpList[i].createTime);    //开始时间
                new_bj_xmjy.jssj=getNowFormatDate(data.projectExpList[i].deleteTime);    //结束时间
                new_bj_xmjy.xmjyID=data.projectExpList[i].proexpId;
                _self.obj_s[i]=new_bj_xmjy;
            }
            var str='';
            for(var i=0;i<_self.obj_s.length;i++){
                str+='<div class="zp_xmjy" data-id="'+_self.obj_s[i].xmjyID+'">'
                str+='<a class="zp_jianli_xg" href="javascript:;"></a>'
                str+='<p>项目名称：'+_self.obj_s[i].xmmc+' ('+_self.obj_s[i].kssj+'------'+_self.obj_s[i].jssj+')</p> '
                str+='<div class="zp_xmjy_left">'
                str+='<ul>'
                str+='<li>项目职务：</li>'
                str+='<li>项目职责：</li>'
                str+='<li>项目描述：</li>'
                str+='</ul>'
                str+='</div>'
                str+='<div class="zp_xmjy_right">'
                str+='<ul>'
                str+='<li>'+_self.obj_s[i].xmzw+'</li>'
                str+='<li>'+_self.obj_s[i].zz+'</li>'
                str+='<li>'+_self.obj_s[i].xmms+'</li>'
                str+='</ul>'
                str+='</div>'
                str+='<div style="clear:both;"></div>'
                str+='</div>'
            }
            $('#zp_xmjy').after(str)
            _self.bindingSJ()
        },error:function (){ //报错执行的
            alert('项目经验出错了')
        }

    })
};
obj_xmjy.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;
    var tj_kg=true;
    $('.zp_jianli_cont_left_xmjy').find('.zp_jianli_xg').each(function (index,ele){
        $(ele).on('click',function (){
            if(kg){
                kg=false;
                tj_kg=false;
                var str='';
                str+='<div class="zp_jianli_zl_7" data-id="'+_self.obj_s[index].xmjyID+'">'
                str+='<ul>'
                str+='<li>项目名称 <input type="text" value="'+_self.obj_s[index].xmmc+'"  class="form-control"></li>'
                str+='<li>项目职务 <input type="text" value="'+_self.obj_s[index].xmzw+'" class="form-control"></li>'
                str+='<li>开始时间 <input type="text" value="'+_self.obj_s[index].kssj+'" class="form-control"></li>'
                str+='<li>结束时间 <input type="text" value="'+_self.obj_s[index].jssj+'" class="form-control"></li>'
                str+=' </ul>'
                str+='<div class="zp_zmjy">'
                str+='<div>'
                str+='<span>项目描述</span>'
                str+='<div>'
                str+='<textarea>'+_self.obj_s[index].xmms+'</textarea>'
                str+='<p>您还可以输入 <span>900</span>个字</p>'
                str+='</div>'
                str+='<div style="clear: both;"></div>'
                str+='</div>'
                str+='<div>'
                str+='<span>项目职责</span>'
                str+='<div>'
                str+='<textarea>'+_self.obj_s[index].zz+'</textarea>'
                str+='<p>您还可以输入 <span>900</span>个字</p>'
                str+='</div>'
                str+='<div style="clear: both;"></div>'
                str+='</div>'
                str+='</div>'
                str+='<div class="zp_jianli_zl_2_bottom">'
                str+='<button type="button" class="btn btn-primary">确定</button>'
                str+='<button class="btn btn-default"  type="button">取消</button>'
                str+='</div>'
                str+=' </div>'
                $(this).parent().after(str);//插入进去
                $(this).parent().css({"display":"none"})
                $('.zp_jianli_zl_7').find('button').eq(1).unbind('click').on('click',function (){    //取消按钮
                    kg=true;
                    tj_kg=true;
                    $(this).parent().parent().prev().css({"display":"block"})
                    $(this).parent().parent().remove();
                })
                $('.zp_jianli_zl_7').find('button').eq(0).unbind('click').on('click',function (){    //修改按钮事件
                    var xmjy=$(this).parent().parent();
                    var qrxg={
                        proexpName:xmjy.find('input').eq(0).val(),
                        proexpPostion:xmjy.find('input').eq(1).val(),
                        createTime:xmjy.find('input').eq(2).val(),         //时间
                        deleteTime:xmjy.find('input').eq(3).val(),
                        proexpDescribe:xmjy.find('textarea').eq(0).val(),
                        proexpDuty:xmjy.find('textarea').eq(1).val(),
                        proexpId:xmjy.attr('data-id')
                    }
                    $.ajax({
                        type:"post",    //提交方式
                        async:true,  //是否异步
                        contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                        data:JSON.stringify(qrxg),        //转为JSON格式
                        dataType:'json',                   //定义返回data类型
                        url:path+'ProjectExp/updateProjectExp.do',    //路径
                        success:function (data){//data 就是数据 json
                            var aa=$('.zp_jianli_cont_left_xmjy > div')
                            for(var i=1;i<aa.length-1;i++){
                                aa.eq(i).remove();
                            }
                            _self.init();
                        },error:function (){ //报错执行的
                            alert('基本资料修改错误')
                        }
                    })

                })
            }
        })
    })
    $('#zp_tjxmjy').on('click',function (){
         if(tj_kg){
             tj_kg=false;
             kg=false;
             var str='';
             str+='<div class="zp_jianli_zl_7">'
             str+='<ul>'
             str+='<li>项目名称 <input type="text"   class="form-control"></li>'
             str+='<li>项目职务 <input type="text"  class="form-control"></li>'
             str+='<li>开始时间 <input type="text"  class="form-control"></li>'
             str+='<li>结束时间 <input type="text"  class="form-control"></li>'
             str+=' </ul>'
             str+='<div class="zp_zmjy">'
             str+='<div>'
             str+='<span>项目描述</span>'
             str+='<div>'
             str+='<textarea></textarea>'
             str+='<p>您还可以输入 <span>900</span>个字</p>'
             str+='</div>'
             str+='<div style="clear: both;"></div>'
             str+='</div>'
             str+='<div>'
             str+='<span>项目职责</span>'
             str+='<div>'
             str+='<textarea></textarea>'
             str+='<p>您还可以输入 <span>900</span>个字</p>'
             str+='</div>'
             str+='<div style="clear: both;"></div>'
             str+='</div>'
             str+='</div>'
             str+='<div class="zp_jianli_zl_2_bottom">'
             str+='<button type="button" class="btn btn-primary">确定</button>'
             str+='<button class="btn btn-default"  type="button">取消</button>'
             str+='</div>'
             str+=' </div>'
             $(this).before(str) //插入进去
             $('.zp_jianli_zl_7').find('button').eq(1).on('click',function (){
                 kg=true;
                 tj_kg=true;
                 $(this).parent().parent().remove()
             })
             $('.zp_jianli_zl_7').find('button').eq(0).on('click',function (){
                 var xmjy=$(this).parent().parent();
                 var qrxg={
                     proexpName:xmjy.find('input').eq(0).val(),
                     proexpPostion:xmjy.find('input').eq(1).val(),
                     createTime:xmjy.find('input').eq(2).val(),         //时间
                     deleteTime:xmjy.find('input').eq(3).val(),
                     proexpDescribe:xmjy.find('textarea').eq(0).val(),
                     proexpDuty:xmjy.find('textarea').eq(1).val(),
                     resumeId:ID,

                 }
                 $.ajax({
                     type:"post",    //提交方式
                     async:true,  //是否异步
                     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                     data:JSON.stringify(qrxg),        //转为JSON格式
                     dataType:'json',                   //定义返回data类型
                     url:path+'ProjectExp/insertProjectExp.do',    //路径
                     success:function (data){//data 就是数据 json
                            var odiv=$('.zp_jianli_cont_left_xmjy >div')
                            for(var i=1;i<odiv.length-1;i++){
                                odiv.eq(i).remove();
                            }
                         _self.init();

                     },error:function (){ //报错执行的
                         alert('基本资料修改错误')
                     }

                 })



             })
         }
    })
};
//项目经验结束
//自我评价
function obj_zopj(){
    this.zopj=''        //自我评价
    this.DOM={
    }
}
obj_zopj.prototype.init=function (){
    var _self=this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',
        success:function (data){
            _self.zopj=data.resume.filed1;               //自我评价
            _self.bindingDOM();
            _self.bindingSJ();
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });




};
obj_zopj.prototype.bindingDOM=function (){
    var _self=this;
    if(_self.zopj!=''){                         //判断是否不为空
        $('#zp_tjzopj').css({"display":"none"});
        $('#zp_zopj').html(_self.zopj);

    }else{
        $('#zp_zopj').html('建议您对自己做一个简短评价，简明扼要的描述您的职业优势，让猎头顾问和企业HR快速了解您！填写文字限1000字以内');
    }
};
obj_zopj.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;
    $('.zp_jianli_cont_left_zopj').find('.zp_jianli_xg').on('click',function (){
        if(kg){
            kg=false;
            var str='';
            str+='<div class="zp_jianli_zl_8">'
            str+='<textarea class="form-control" rows="3">'+_self.zopj+'</textarea>'
            str+='<p>你还可以输入<span>600</span>个字</p>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('#zp_zopj').after(str);
            $('#zp_zopj').css({'display':"none"});
            $('.zp_jianli_zl_8').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove();
                $('#zp_zopj').css({'display':"block"});
            })
            $('.zp_jianli_zl_8').find('button').eq(0).on('click',function (){
                var aa = $(this).parent().siblings('textarea').val();
                var resume={
                    filed1:aa,
                    resume:ID
                }


            })
        }
    })
};
//自我评价结束
//附加信息开始
function obj_fjxx(){
    this.fjxx='';           //附加信息
}
obj_fjxx.prototype.init=function (){
    var _self=this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',
        success:function (data){
            _self.fjxx=data.resume.filed2;               //自我评价
            _self.bindingDOM();
            _self.bindingSJ();
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });

};
obj_fjxx.prototype.bindingDOM=function (){
    var _self=this;
    if(_self.fjxx!=''){                         //判断是否不为空
        $('#zp_tjfjxx').css({"display":"none"});
        $('#zp_fjxx').html(_self.fjxx);
    }else{
        $('#zp_fjxx').html('如：获奖项、技能资格证书、专利等，填写文字1000字以内');
    }
};
obj_fjxx.prototype.bindingSJ=function (){
    var _self=this;
    var kg=true;
    $('.zp_jianli_cont_left_fjxx').find('.zp_jianli_xg').on('click',function (){
        if(kg){
            kg=false
            var str='';
            str+='<div class="zp_jianli_zl_9">'
            str+='<textarea class="form-control" rows="3">'+_self.fjxx+'</textarea>'
            str+='<p>你还可以输入<span>600</span>个字</p>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('#zp_fjxx').after(str);
            $('#zp_fjxx').css({"display":"none"})
            $('.zp_jianli_zl_9').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove();
                $('#zp_fjxx').css({"display":"block"})
            })
            $('.zp_jianli_zl_9').find('button').eq(0).on('click',function (){
                var aa = $(this).parent().siblings('textarea').val();
                var resume={
                    filed1:aa,
                    resume:ID
                }
            })
        }
    })
};
//附加信息结束了
//擅长技能开始
function obj_scjn(){
    this.scjc='';          //擅长的技能
}
obj_scjn.prototype.init=function (){
    var _self=this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        data:{resumeId:ID},        //转为JSON格式
        url:path+'Skill/selSkillByResumeId.do',    //路径
        success:function (data){//data 就是数据 json
            _self.scjc=data.skills;              //
            _self.bindingDOM();
            _self.bindingSJ()
        },error:function (){ //报错执行的
            alert('擅长技能获取错误')
        }

    })

};
obj_scjn.prototype.bindingDOM=function (){
    var _self=this;
    var str=''
    if(_self.scjc.length!=0){
        for(var i=0;i<_self.scjc.length;i++){
            str+='<div data-id="'+_self.scjc[i].skillId+'">'+_self.scjc[i].skillName+'</div>'
        }
        $('#scjn_cont').html(str);
        $('#jl_tjscjn').css({"display":"none"});                        //添加按钮
    }else{
        $('#scjn_cont').html("快来添加你擅长的技能吧");                  //提示话
        $('#scjn').find('.zp_jianli_xg').css({"display":"none"})        //修改按钮
    }

};
obj_scjn.prototype.bindingSJ=function () {
    var kg=true;
    var _self=this;
    function jnzs(){                                 //技能自杀
        $('#jn_content > div > a').on('click',function (){
            $(this).parent().remove();              //自杀
        })
    }

    $('#jl_tjscjn').unbind('click').on('click',function (){

        var str='';
        str+='<div class="zp_jianli_zl_10">'
        str+='<div class="scjn_top">'
        str+='<p>已添加:</p>'
        str+='<div id="jn_content">'
        //循环技能
        str+='</div>'
        str+='</div>'
        str+='<div class="scjn_buttom">'
        str+='<p>请输入你擅长的技能：<input type="text" class="form-control"><span style="color:#FF7F00 ;">请按回车键添加</span></p>'
        str+='</div>'
        str+='<div class="zp_jianli_zl_2_bottom">'
        str+='<button type="button" class="btn btn-primary">确定</button>'
        str+='<button class="btn btn-default"  type="button">取消</button>'
        str+='</div>'
        str+='</div>'

        $('#scjn_cont').after(str);

        $("#jl_tjscjn").css({"display":"none"});
        $('#scjn_cont').css({"display":"none"});
        $('.zp_jianli_zl_10').find('input').keydown(function (event){       //回车插入事件
            if(event.which==13){        //13是代表回车
                if($(this).val().length<15&&$(this).val()!=''){
                    var ojn='<div><div>'+$(this).val()+'</div><a href="javascript:;">x</a></div>';
                    $('#jn_content').append(ojn);
                    $(this).val(null)
                    jnzs();
                }else{
                    alert('字太多了或者为空')
                    $(this).val(null)
                }
            }
        })
        $('.zp_jianli_zl_10').find('button').eq(1).on('click',function (){
            $("#jl_tjscjn").css({"display":"block"});
            $('#scjn_cont').css({"display":"block"});
            $(this).parent().parent().remove()
        })
        $('.zp_jianli_zl_10').find('button').eq(0).on('click',function (){  //提交地址
            var othis= $(this).parent().parent();
            var k=$('#jn_content > div > div');
            var attr=[];
            for(var i=0;i<k.length;i++){
                attr[i]={
                    skillName:k.eq(i).text(),
                    resumeId:ID,
                }
            }
            $.ajax({
                type:"post",    //提交方式
                async:true,  //是否异步
                contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                data:JSON.stringify(attr),        //转为JSON格式
                url:path+'Skill/updateSkillByResume.do',    //路径
                success:function (data){//data 就是数据 json
                    othis.remove();
                    _self.init();
                    $('#scjn_cont').css({"display":"block"})
                    $('.zp_jianli_xg').css({"display":"block"})

                },error:function (){ //报错执行的
                    alert('擅长技能提交错误')
                }
            })
        })






    })                      //添加按钮
    $('#scjn').find('.zp_jianli_xg').unbind('click').on('click',function (){
        var str2='';
        if(kg){
            kg=false;
            str2+='<div class="zp_jianli_zl_10">'
            str2+='<div class="scjn_top">'
            str2+='<p>已添加:</p>'
            str2+='<div id="jn_content">'
            for(var i=0;i<_self.scjc.length;i++){
                str2+='<div><div data-id="'+_self.scjc[i].skillId+'">'+_self.scjc[i].skillName+'</div><a href="javascript:;">x</a></div>'
            }
            //循环技能
            str2+='</div>'
            str2+='</div>'
            str2+='<div class="scjn_buttom">'
            str2+='<p>请输入你擅长的技能：<input type="text" class="form-control"> <span style="color:#FF7F00 ;">请按回车键添加</span></p>'
            str2+='</div>'
            str2+='<div class="zp_jianli_zl_2_bottom">'
            str2+='<button type="button" class="btn btn-primary">确定</button>'
            str2+='<button class="btn btn-default"  type="button">取消</button>'
            str2+='</div>'
            str2+='</div>'
            $('#scjn_cont').after(str2);                                 //插入

            jnzs();                                                     //技能的自杀
            $('#scjn_cont').css({"display":"none"});
            $('.zp_jianli_zl_10').find('input').keydown(function (event){       //回车插入事件
                if(event.which==13){        //13是代表回车
                    if($(this).val().length<15&&$(this).val()!=''){
                        var ojn='<div><div>'+$(this).val()+'</div><a  href="javascript:;">x</a></div>';
                        $('#jn_content').append(ojn);
                        $(this).val(null)
                        jnzs();                                           //技能自杀
                    }else{
                        alert('字太多了或者为空')
                        $(this).val(null)
                    }
                }
            })
            $('.zp_jianli_zl_10').find('button').eq(1).on('click',function (){
                kg=true;
                $('#scjn_cont').css({"display":"block"});
                $(this).parent().parent().remove();          //取消自杀
            })
            $('.zp_jianli_zl_10').find('button').eq(0).on('click',function (){
                var othis= $(this).parent().parent();
                var k=$('#jn_content > div > div');
                var attr=[];
                if(k.length==0){
                    //最后一个删除不掉

                }else{
                    for(var i=0;i<k.length;i++){
                        attr[i]={
                            skillName:k.eq(i).text(),
                            resumeId:ID,
                        }
                    }
                }

                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                    data:JSON.stringify(attr),        //转为JSON格式
                    url:path+'Skill/updateSkillByResume.do',    //路径
                    success:function (data){//data 就是数据 json
                        othis.remove();

                        _self.init();
                        $('#scjn_cont').css({"display":"block"})

                    },error:function (){ //报错执行的
                        alert('擅长技能提交错误')
                    }

                })

            })
        }


    })

};
//公司收藏开始
function obj_gssc(){
    this.sc=''                  //公司收藏
    this.kg=''                  //搜索框定时器开关
}
obj_gssc.prototype.bindingSJ=function (){

    var This=this;
    $('#pbqy').find('button').eq(0).on('click',function (){
        $(this).css({'display':'none'})
        $(this).siblings('input').css({"display":"inline-block"})
        $('#pbqy').find('button').eq(1).css({"display":"inline-block"})
        $('#sy').css({"display":"block"})
    })
    $('#pbqy').find('button').eq(1).on('click',function (){                 //这是取消按钮
        $('#pbqy').find('button').eq(0).css({'display':'inline-block'})
        $(this).siblings('input').css({"display":"none"})
        $('#pbqy').find('button').eq(1).css({"display":"none"})
        $('#sy').css({"display":"none"})
        $('#qr').css({"display":"none"})
        $('#sy > ul').html('');
        $('#gs_ssk').val('').attr('data-id','')
    })

    //模糊查询以及添加事件开始
    $('#gs_ssk').on('keyup',function (event){
        clearTimeout(This.kg);
        function jtjp(){
            $('#sy span').each(function (index,ele){                        //监听键盘
                if($('#gs_ssk').val()==$(ele).html()){
                    $('#pbqy').find('button').eq(2).css({"display":"inline-block"});
                    $('#gs_ssk').val($(ele).html()).attr('data-id',$(ele).attr('data-id'));
                    $('#sy > ul').html('')
                }else{
                    $('#gs_ssk').attr('data-id','');
                    $('#pbqy').find('button').eq(2).css({"display":"none"});
                }
            });
        }

        if(event.which==8){
             jtjp();
        }
        if($('#gs_ssk').val().length>=2){

            This.kg=setTimeout(function (){
                // 在这里发送AJAX
                var val=$('#gs_ssk').val();
                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    data:{companyName:val,resumeId:ID},
                    dataType:'json',
                    url:path+'CompanyInfo/selByCompanyName',
                    success:function (data){//data 就是数据 json
                        //AJAX成功后执行的
                        var str=''
                        for(var i=0;i<data.plist.length;i++){
                            str+='<li><span  data-id="'+data.plist[i].companyId+'">'+data.plist[i].companyName+'</span><a href="javascript:;" class="li_sc">o</a></li>'
                        }
                        $('#sy > ul').html(str);
                        $('#sy > ul').find('li').on('click',function (){             //添加公司的事件
                            $('#gs_ssk').val($(this).find('span').html()).attr('data-id',$(this).find('span').attr('data-id'));
                            $('#pbqy').find('button').eq(2).css({"display":"inline-block"});
                            $('#sy > ul').html('')
                        })

                        jtjp()



                    },error:function (){ //报错执行的
                        alert('基本资料修改错误')
                    }

                })


            },500)
        }else{
            $('#sy > ul').html('');     //清空
        }
    })
    //提交添加开始
    $('#qr').on('click',function (){
            var data={

                resumeId:ID,
                companyId:$('#gs_ssk').attr('data-id'),
            }

        $.ajax({
            type:"post",    //提交方式
            async:true,  //是否异步
            contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            data:JSON.stringify(data),        //转为JSON格式
            dataType:'text',                   //定义返回data类型
            url:path+'Shield/insertShield',    //路径
            success:function (data){//data 就是数据 json
                alert('aaa')
            },error:function (){ //报错执行的
                alert('基本资料修改错误')
            }

        })

    })

}




function eee(obj){
    $(obj).on('keyup',function (){
        if($(obj).val()==0){
            $(obj).addClass('jl_name');
        }else{
            $(obj).removeClass('jl_name')
        }
    })
}                               //改变颜色
function trim(str) {                                //去掉首尾空格
    return str.replace(/(^\s+)|(\s+$)/g, "");
}


$(function (){                              //入口函数

    var obj__yhxx=new obj_yhxx();           //基本信息
    obj__yhxx.init();

    var obj__zbzl=new obj_zbzl();           //基本资料
    obj__zbzl.init();

    var obj__zyyx=new obj_zyyx();           //职业意向
    obj__zyyx.init();

    var obj__gzjl=new obj_gzjl();           //工作经历
    obj__gzjl.init();

     var obj__yyjl=new obj_yyjl();           //教育经历
     obj__yyjl.init();

    var obj__xmjy=new obj_xmjy();           //项目经验开始
    obj__xmjy.init();

    var obj__zopj=new obj_zopj();           //自我评价开始
    obj__zopj.init();

    var obj__fjxx=new obj_fjxx();           //附加信息开始
    obj__fjxx.init();

    var obj__scjn=new obj_scjn();           //擅长技能
    obj__scjn.init()

    var obj__gssc=new obj_gssc();           //企业收藏开始
    obj__gssc.bindingSJ();

});



function getNowFormatDate(tt)       //时间格式函数
{
    var day;
    if(tt == undefined){
        day = new Date();
    }else{
        day = new Date(tt);
    }
    var Year = 0;
    var Month = 0;
    var Day = 0;
    var CurrentDate = "";
    //初始化时间
    //Year       = day.getYear();//有火狐下2008年显示108的bug
    Year       = day.getFullYear();//ie火狐下都可以
    Month      = day.getMonth()+1;
    Day        = day.getDate();
    CurrentDate += Year + "-";
    if (Month >= 10 )
    {
        CurrentDate += Month + "-";
    }
    else
    {
        CurrentDate += "0" + Month + "-";
    }
    if (Day >= 10 )
    {
        CurrentDate += Day ;
    }
    else
    {
        CurrentDate += "0" + Day ;
    }

    return CurrentDate;
}


