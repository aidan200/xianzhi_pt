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
            ID=data.resume.resumeId;                  //获取到ID
            memberId=data.resume.memberId
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
    _self.DOM.name.html(_self.name)           //名字
    _self.DOM.zwmc.html(_self.zwmc)          //职位名称
    _self.DOM.szgs.html(_self.szgs)         //所在公司
    _self.DOM.dqcs.html(_self.dqcs)        //当前城市
    var str='';
    for(var i=0;i<_self.dqhy.length;i++){
         if(_self.dqhy[i].fieldType=="2"){
             str+=_self.dqhy[i].fieldName+'/'
         }
    }
    var str2 = str.substr(0,str.length-1);
    _self.DOM.dqhy.html(str2)         //当前行业
    _self.DOM.gznf.html(_self.gznf)         //工作年份
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
            str+='姓名 <input id="jl_name" type="text" value="'+_self.name+'"  class="form-control zp_jianli_input1">'
            str+='</li>'
            str+='<li>'
            str+='当前行业 <input id="jl_dqhy" value="'+str3+'" type="text" class="form-control zp_jianli_input2" >'
            str+='</li>'
            str+='<li>'
            str+='工作年份&nbsp;&nbsp;&nbsp;<input id="jl_gznf" value="'+_self.gznf+'" type="text"  class="form-control zp_jianli_input3" style="margin-right: 27px">   职位名称&nbsp;&nbsp;&nbsp;<input id="jl_zwmc" value="'+_self.zwmc+'" type="text" class="form-control zp_jianli_input3" >'
            str+='</li>'
            str+='<li>'
            str+='当前城市 <input id="jl_dqcs" value="'+_self.dqcs+'" type="text" class="form-control zp_jianli_input2" >'
            str+='</li>'
            str+='</ul>'
            str+='<button type="button" id="zp_jianli_bd_1_qd" class="btn btn-primary ">确定</button>'
            str+='<button class="btn btn-default" id="zp_jianli_bd_1_qx" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $('.zp_jianli_cont_left_top2_top').after(str);              //插入

            $('.zp_jianli_cont_left_top2_top').css({"display":"none"}); //隐藏

            //修改的事件
            $('.zp_jianli_zl_1').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove()                      //自杀
                $('.zp_jianli_cont_left_top2_top').css({"display":"block"}); //显示
            })
            $('.zp_jianli_zl_1').find('button').eq(0).on('click',function (){
                var xgk=$(this).parent().parent();               //修改框


                var www=$('#jl_dqhy').val().split('/');
                var resume={
                    resumeName:$('#jl_name').val(),                 //姓名//性别
                    resumeWorkinglife:$('#jl_gznf').val(),          //工作年份
                    field:www,                                      //行业
                    resumePosition:$('#jl_zwmc').val(),              //当前职位
                    resumeWorkspace:$('#jl_dqcs').val(),             //当前城市
                    resumeId:ID
                };

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
    _self.DOM.csnf.html(getNowFormatDate(_self.cstime));      //出生年月

    if(_self.hyzk==0){                      //婚姻状况
        _self.DOM.hyzk.html("未婚");
    }else if(_self.hyzk==1){
        _self.DOM.hyzk.html("已婚");
    }else if(_self.hyzk==2){
        _self.DOM.hyzk.html("保密");
    }
    _self.DOM.sj.html(_self.sj);            // 手机
    _self.DOM.yx.html(_self.youxiang);      //邮箱
               //性别
    if(_self.xb==0){
        _self.DOM.xb.html("男")
    }else{
        _self.DOM.xb.html("女")
    }
    if(_self.zt==0){                        //状态
        _self.DOM.zt.html("就职");
    }else if(_self.zt==1){
        _self.DOM.zt.html("未就职");
    }else if(_self.zt==2){
        _self.DOM.zt.html("保密");
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
            str+='<li>'
            str+='出生年月'
            str+='<input class="form-control" value="'+getNowFormatDate(_self.cstime)+'" id="jl_cstime">'
            str+='</li>'
            str+='<li class="zp_jianli_zl_2_li2" >'
            str+='<span >手机</span>'
            str+='<input id="jl_sj" type="text"  value="'+_self.sj+'" class="form-control zp_jianli_zl_2_input1 ">'
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
            str+='<input id="jl_yx" type="text" value="'+_self.youxiang+'" class="form-control zp_jianli_zl_2_input1 ">'
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
                resumeState:ozt,                         //状态           好使
                resumeMarriage:ohyzt,                    //婚姻状况        好使
                resumeBirth:$('#jl_cstime').val(),      //出生年月
                resumePhone:$('#jl_sj').val(),          //手机
                resumeSex:oxb,                           //性别
                resumeEmail:$('#jl_yx').val(),          //邮箱
            }
            /*var member={
                resumeBirth:$('#jl_cstime').val(),      //出生年月
                resumePhone:$('#jl_sj').val(),          //手机
                resumeSex:oxb,                           //性别
                resumeEmail:$('#jl_yx').val(),          //邮箱
                resume:resume
            };
            member.resume = resume;*/
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
        })
    })

};
//基本资料结束
//职业意向开始
function obj_zyyx(){
    this.qwhy='';
    this.qwzn='';
    this.qwdd='';
    this.qwnx=[];
    this.mqnx=[];
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
    for(var i=0;i<_self.qwhy.length;i++){
        if(_self.qwhy[i].fieldType=="3"&&_self.qwhy[i].fieldName!=''){
            str2+=_self.qwhy[i].fieldName+'/'
        }
    }
     str2=str2.substr(0,str2.length-1);             //去掉最后的/
    if(str2!=''&&str2!=null){
        str+='<p>期望行业：'+str2+'</p>';
    }
    if( _self.qwzn!=null&&_self.qwzn!=''){
        str+='<p>期望职能：'+_self.qwzn+'</p>'
    }
    if( _self.qwdd!=null&&_self.qwdd!=''){
        str+='<p>期望地点：'+_self.qwdd+'</p>'
    }
    if( _self.qwnx!=null&& _self.qwnx!=''){
        str+='<p>期望年薪：'+_self.qwnx[0]+'</p>'
    }
    if( _self.mqnx!=null&&_self.mqnx!=''){
        str+='<p>目前年薪：'+_self.mqnx[0]+'</p>'
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
            var str2=''                 //期望行业变量
            var str3=''                 //当前行业变量
            for(var i=0;i<_self.qwhy.length;i++){
                if(_self.qwhy[i].fieldType=="3"&&_self.qwhy[i].fieldName!=''){
                    str2+=_self.qwhy[i].fieldName+'/'
                }
                if(_self.qwhy[i].fieldType=="2"&&_self.qwhy[i].fieldName!=''){
                    str3+=_self.qwhy[i].fieldName+'/'
                }
            }
            str2=str2.substr(0,str2.length-1);             //去掉最后的/
            str3=str3.substr(0,str3.length-1);              //去掉最后的/

            str+='<div class="zp_jianli_zl_3">'
            str+='<ul>'
            str+='<li  class="li_01">'
            str+='期望行业 <div id="zp_qwhy" value="'+str2+'" type="text" class="form-control zp_jianli_zl_3_input1 ">'
            //这块循环出来  需要判断是否有内容没有给li设置一个高度
            for(var i=0;i<_self.qwhy.length;i++){
                if(_self.qwhy[i].fieldType=="3"&&_self.qwhy[i].fieldName!=''){
                    str+='<div><div>'+_self.qwhy[i].fieldName+'</div><a href="javascript:;">x</a></div>'
                }
            }
            str+='</div>'
            str+='<em></em>'
            str+='</li>'
            str+='<li>'
            str+='期望职能 <input id="jl_qwzn" value="'+_self.qwzn+'" type="text" class="form-control zp_jianli_zl_3_input1">'
            str+=' <em></em>'
            str+='</li>'
            str+='<li>'
            str+='期望地点 <input id="jl_qwdd" value="'+_self.qwdd+'" type="text" class="form-control zp_jianli_zl_3_input1">'
            str+='<em></em>'
            str+='</li>'
            str+='<li id="jl_qwnx">'
            str+='期望年薪 <input  type="text" value="'+_self.qwnx[0]+'" class="form-control zp_jianli_zl_3_input2">'
            str+=' 元/月x '
            str+='<input type="text" id="nx_ym" value="'+_self.qwnx[1]+'" class="form-control zp_jianli_zl_3_input3">'
            str+='个月= <span id="qwnx_cont">0.00</span> 万'
            str+='</li>'
            str+='<li id="jl_mqnx">'
            str+='目前年薪 <input type="text" id="" value="'+_self.mqnx[0]+'" class="form-control zp_jianli_zl_3_input2">'
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


            zhisha_01()
            $('#zyyx_cont').css({"display":"none"});

            function zhisha_01(){                   //一些判断什么的
                if( $('#zp_qwhy div').length==0){
                    $('.li_01').css({"height":"30px"})
                }else{
                    $('.li_01').css({"height":"auto"})
                }
                $('#zp_qwhy a').on('click',function (){
                    $(this).parent().remove();
                    if( $('#zp_qwhy div').length==0){
                        $('.li_01').css({"height":"30px"})
                        $('#zp_qwhy').html('请选择期望的行业')
                        $('#zp_qwhy').css({"line-height":"10px"})
                    }else{
                        $('.li_01').css({"height":"auto"})
                         $('#zp_qwhy').css({"line-height":"26px"})
                    }
                })
            }

            ////////////////////////////////选择行业//////////////////////////////////
            $('.zp_jianli_zl_3 em').eq(0).on("click",function (event){       //弹出框事件


                $.ajax({
                    type:"get",
                    async:true,
                    data:{type:2},
                    url:path+'Field/selByType',
                    success:function (data){        //
                        var attr=[]
                        for(var i=0;i<data.fieldList.length;i++){

                        }

                        $('#hy_tab').html();            //将后台提供的数据保存到列表中


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
                    $(this).removeClass('is-visible');
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
                zhisha_01();                         //删除技能自杀按钮
            });


            $('#jl_qwnx input').keyup(function (event){         //鼠标抬起事件
                    var aa_qwnx=$('#jl_qwnx').find('input').eq(0).val()*$('#jl_qwnx').find('input').eq(1).val(); //
                    $('#qwnx_cont').html(aa_qwnx/10000);       //期望年薪
            })
            $('#jl_mqnx input').keyup(function (event){         //鼠标抬起事件
                var aa_qwnx=$('#jl_qwnx').find('input').eq(0).val()*$('#jl_qwnx').find('input').eq(1).val(); //
                $('#qwnx_cont').html(aa_qwnx/10000);             //目前年薪
            })

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
                        fieldId: $(qwhy3).eq(i).attr('data-fieldid'),
                        fieldType:$(qwhy3).eq(i).attr('data-fieldtype'),
                    }
                }
                var pcont={
                    resumeId:ID,                                    //ID
                    fields:shuzu,                                   //行业
                    resumeIntentPosition:$('#jl_qwzn').val(),   //期望职能
                    resumeWorkspace:$('#jl_qwdd').val(),        //期望地点
                    resumeIntentYm:$('#jl_qwnx input').eq(0).val(),//期望年薪
                    resumeYm:$('#jl_mqnx input').eq(0).val()     //当前年息
                };
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
            })

        }else{

        }


    })
};
//职业意向结束
//工作经历开始
function obj_gzjl(){
    this.gsmc='';               //公司名称
    this.gshy='';               //公司行业
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
        url: path+'JobExp/selByResumeId?resumeId='+1,//要发送的后台地址
        success: function (data) {//ajax请求成功后触发的方法

            _self.obj_s=[];                           //放赋值后对象的列表
            for(var i=0;i<data.jobExpList.length;i++){
                var obj__gzjl=new obj_gzjl();       //循环创建对象
                obj__gzjl.gsmc=data.jobExpList[i].jobexpCompanyName;       //公司名
                obj__gzjl.gshy=data.jobExpList[i].jobexpField;             //公司行业
                obj__gzjl.zwmc2=data.jobExpList[i].jobexpPostion;          //职位名称
                obj__gzjl.gzdd=data.jobExpList[i].jobexpWorkspace;         //工作地点
                obj__gzjl.xxrs=data.jobExpList[i].jobexpSubordinate;       //下属人数
                obj__gzjl.rzsj=data.jobExpList[i].jobexpBeginTime;         //任职时间
                obj__gzjl.lzsj=data.jobExpList[i].jobexpEndTime;           //离职时间
                obj__gzjl.zzyj=data.jobExpList[i].jobexpDuty;              //职责业绩
                obj__gzjl.yx=data.jobExpList[i].jobexpMm;                //月薪
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
                str+='<p>工作地点：'+_self.obj_s[i].gzdd+' | 月薪：'+_self.obj_s[i].yx+'/月*12个月</p>'
                str+='<p>'+_self.obj_s[i].zzyj+'</p>'
                str+='</div>'
                str+='<p class="zp_jianli_p1">公司行业：'+_self.obj_s[i].gshy+'</p>'
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
    $('#gzjl').siblings('div').find('.zp_jianli_xg').each(function (index,ele){ //修改弹出框事件

        $(ele).on('click',function () {     //插入简历弹出框

            if(kg){
                kg=false;
                var str='';
                str+='<div class="zp_jianli_zl_4">'
                str+='<ul>'
                str+=' <li>'
                str+=' 公司名称<input type="text" value="'+_self.obj_s[index].gsmc+'" class="gsmc_input form-control zp_jianli_zl_3_input1">'
                str+='</li>'
                str+='<li>'
                str+='公司行业<input type="text" value="'+_self.obj_s[index].gshy+'" class="gshy_input form-control zp_jianli_zl_3_input1 ">'
                str+='</li>'
                str+='<li>'
                str+='职位名称<input type="text" value="'+_self.obj_s[index].zwmc2+'" class="zwmc_input form-control zp_jianli_zl_3_input1 ">'
                str+='</li>'
                str+='<li>'
                str+='工作地点'
                str+='<div class="zp_jianli_zl_4_div1">'
                str+='<input type="text" value="'+_self.obj_s[index].gzdd+'" class="gzdd_input form-control zp_jianli_zl_4_input2 ">'
                str+='下属人数'
                str+='<input type="text" value="'+_self.obj_s[index].xxrs+'" class="ssrs_input form-control zp_jianli_zl_4_input3">'
                str+='</div>'
                str+='</li>'
                str+='<li>'
                str+='任职时间'
                str+='<div class="zp_jianli_zl_4_div2" >'
                 str+='<input class="form-control rzsh_input " value="'+getNowFormatDate(_self.obj_s[index].rzsj)+'" > '
                 str+='&nbsp;&nbsp;离职时间'
                 str+='<input class="form-control pull-right lzsj_input" value="'+getNowFormatDate(_self.obj_s[index].lzsj)+'" > '
                str+='</div>'
                str+='</li>'
                str+='</ul>'
                str+='<div>'
                str+='<span>职责业绩</span>'
                str+='<textarea>'+_self.obj_s[index].zzyj+'</textarea>'
                str+='<div style="clear: both;"></div>'
                str+='</div>'
                str+='<div class="zp_jianli_zl_2_bottom">'
                str+='<button type="button" class="btn btn-primary">确定</button>'
                str+='<button class="btn btn-default" id="jbzl_4_qx" type="button">取消</button>'
                str+='</div>'
                str+='</div>'
                $('#gzjl').siblings('div').eq(index).after(str);  //插入
                 $('#gzjl').siblings('div').eq(index).css({"display":"none"})

            }else{
                alert('一次只能修改一个简历')
            }
            $('.zp_jianli_zl_4').find('button').eq(1).on('click',function (){
                kg=true;                                        //一次只能修改一个简历
                $(this).parent().parent().prev().css({"display":"block"});
                $(this).parent().parent().remove()               //自杀

            })
            $('.zp_jianli_zl_4').find('button').eq(0).on('click',function (){

                // alert( $(this).parent().parent()

            })

        })
    }); //修改弹出框事件
    $('#tj_gzjl').on('click',function (){
        if(tj_kg){
            tj_kg=false;
            var str='';
            str+='<div class="zp_jianli_zl_4">'
            str+='<ul>'
            str+=' <li>'
            str+=' 公司名称<input type="text"  class="form-control zp_jianli_zl_3_input1">'
            str+='</li>'
            str+='<li>'
            str+='公司行业<input type="text"  class="form-control zp_jianli_zl_3_input1 ">'
            str+='</li>'
            str+='<li>'
            str+='职位名称<input type="text"  class="form-control zp_jianli_zl_3_input1 ">'
            str+='</li>'
            str+='<li>'
            str+='工作地点'
            str+='<div class="zp_jianli_zl_4_div1">'
            str+='<input type="text"  class="form-control zp_jianli_zl_4_input2 ">'
            str+='下属人数'
            str+='<input type="text"  class="form-control zp_jianli_zl_4_input3">'
            str+='</div>'
            str+='</li>'
            str+='<li>'
            str+='任职时间'
            str+='<div class="zp_jianli_zl_4_div2" >'
            str+='<input class="form-control "  > '
            str+='&nbsp;&nbsp;离职时间'
            str+='<input class="form-control pull-right"  > '
            str+='</div>'
            str+='</li>'
            str+='</ul>'
            str+='<div>'
            str+='<span>职责业绩</span>'
            str+='<textarea></textarea>'
            str+='<div style="clear: both;"></div>'
            str+='</div>'
            str+='<div class="zp_jianli_zl_2_bottom">'
            str+='<button type="button" class="btn btn-primary">确定</button>'
            str+='<button class="btn btn-default" id="jbzl_4_qx" type="button">取消</button>'
            str+='</div>'
            str+='</div>'
            $(this).before(str)//插入简历的空白模板
            $(this).siblings('.zp_jianli_zl_4').find('button').eq(1).on('click',function (){ //添加简历的取消事件
                tj_kg=true;
                $(this).parent().parent().remove();
            });
            $(this).siblings('.zp_jianli_zl_4').find('button').eq(0).on('click',function (){ //添加简历提交事件
            //    在这里向后台提交表单




            })
        }else{
            alert('一次只能修改一个简历')
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
}
obj_yyjl.prototype.init=function (){
    var _self=this;
    $.ajax({
        type: "get",//数据发送的方式（post 或者 get）
        url: path+'Education/selEducationByMemberId',//要发送的后台地址
        data:{memberId:1},                                      //传的参数
        success: function (data) {//ajax请求成功后触发的方法
            _self.obj_s=[];//接收对象的数组
            for(var i=0;i<data.educationList.length;i++){
                var obj__yyjl=new obj_yyjl();
                obj__yyjl.xxmc=data.educationList[i].school;
                obj__yyjl.zymc=data.educationList[i].major;
                obj__yyjl.jdsj=data.educationList[i].enrollmentDate;
                obj__yyjl.bynf=data.educationList[i].graduateDate;
                obj__yyjl.xl=data.educationList[i].education;
                obj__yyjl.sftz=data.educationList[i].educationSkill; //缺少是否统招
                _self.obj_s[i]=obj__yyjl;      //插入
            }
            //便利对象到页面上
            var str='';//用来装元素的容器    return出去
            for(var i=0;i<_self.obj_s.length;i++){
                str+='<div class="zp_qq1">'
                str+='<p class="zp_index_p_left">'
                str+=''+_self.obj_s[i].xxmc+'（'+getNowFormatDate(_self.obj_s[i].jdsj)+'------'+getNowFormatDate(_self.obj_s[i].bynf)+'）'
                str+='<a class="zp_jianli_xg" href="javascript:;"></a>'
                str+='</p>'
                str+='<ul>'
                str+='<li>专业名称：<span>'+_self.obj_s[i].zymc+'</span></li>'
                str+='<li>学历：<span>'+_self.obj_s[i].xl+'</span></li>'
                if( _self.obj_s[i].sftz==0){
                    str+='<li>是否统招：<span>否</span></li>'
                }else{
                    str+='<li>是否统招：<span>是</span></li>'
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
        $(ele).on('click',function (){
            var str='';
            if(kg){
                kg=false;
                str+='<div class="zp_jianli_zl_5">'
                    str+='<ul>'
                    str+='<li>学校名称 <input type="text" value="'+_self.obj_s[index].xxmc+'" class="form-control "></li>'
                    str+='<li>专业名称 <input type="text" value="'+_self.obj_s[index].zymc+'" class="form-control "></li>'

                    str+='<li>就读时间 <input type="text" value="'+ getNowFormatDate(_self.obj_s[index].jdsj)+'" class="form-control "></li>'
                    str+='<li>毕业年份 <input type="text" value="'+getNowFormatDate(_self.obj_s[index].bynf)+'" class="form-control "></li>'
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
                    if(_self.obj_s[index].sftz==1){
                        str+='<input type="checkbox" checked id="sftz"><label for="sftz">是否统招</label>'
                    }else{
                        str+='<input type="checkbox"  value="否" id="sftz"><label for="sftz">是否统招</label>'
                    }
                    str+='</li>'
                    str+='</ul>'
                    str+='<div class="zp_jianli_zl_2_bottom">'
                    str+='<button type="button" class="btn btn-primary">确定</button>'
                    str+='<button class="btn btn-default"  type="button">取消</button>'
                    str+='</div>'
                    str+='</div>'
                   $(this).parent().parent().after(str)     //插入进去
                   $(this).parent().parent().css({"display":"none"});
                   $(this).parent().parent().siblings('.zp_jianli_zl_5').find('select > option').each(function (index2,ele){
                        var oxl=$(ele).text();              //下拉框
                       if(_self.obj_s[index].xl==oxl){
                           $(ele).attr('selected','selected')
                       }
                   })
                   $('.zp_jianli_zl_5').find('button').eq(1).on('click',function (){    //取消按钮
                       kg=true;
                       $(this).parent().parent().prev().css({"display":"block"})
                       $(this).parent().parent().remove();
                   })
                    $('.zp_jianli_zl_5').find('button').eq(0).on('click',function (){    //修改按钮事件
                            alert('ajax')
                     })


                }else{

            }
        })
    })
    $('#zp_tjjyjl').on('click',function (){
        var str='';
        if(tj_kg){
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
            $('.zp_jianli_zl_5').find('button').eq(1).on('click',function (){
                tj_kg=true;
                $(this).parent().parent().remove()
            })
        }else{
            alert('一次只能添加一个')
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
}
obj_xmjy.prototype.init=function (){
    var _self=this
    var data={cont:[{},{},{}]};             //假设AJAX数据
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'ProjectExp/selByResumeId?resumeId=1',    //路径

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
                _self.obj_s[i]=new_bj_xmjy;
            }
            var str='';
            for(var i=0;i<_self.obj_s.length;i++){
                str+='<div class="zp_xmjy">'
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
                var str='';
                str+='<div class="zp_jianli_zl_7">'
                str+='<ul>'
                str+='<li>项目名称 <input type="text" value="'+_self.obj_s[index].xmmc+'"  class="form-control"></li>'
                str+='<li>项目职务 <input type="text" value="'+_self.obj_s[index].xmzw+'" class="form-control"></li>'
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
                $('.zp_jianli_zl_7').find('button').eq(1).on('click',function (){    //取消按钮
                    kg=true;
                    $(this).parent().parent().prev().css({"display":"block"})
                    $(this).parent().parent().remove();
                })
                $('.zp_jianli_zl_7').find('button').eq(0).on('click',function (){    //修改按钮事件
                    alert('ajax')
                })

            }else{
                alert('一次只能添加一次')
            }
        })
    })
    $('#zp_tjxmjy').on('click',function (){
         if(tj_kg){
             tj_kg=false;
             var str='';
             var str='';
             str+='<div class="zp_jianli_zl_7">'
             str+='<ul>'
             str+='<li>项目名称 <input type="text"   class="form-control"></li>'
             str+='<li>项目职务 <input type="text"  class="form-control"></li>'
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
                 tj_kg=true;
                 $(this).parent().parent().remove()
             })
             $('.zp_jianli_zl_7').find('button').eq(0).on('click',function (){
                 alert('ajax')
             })
         }else{
                alert('一次只能添加一个')
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
    var data={cont:"我自我感觉良好你咋的？"};
    _self.zopj=data.cont;               //自我评价
    _self.bindingDOM();
    _self.bindingSJ();
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
            $('.zp_jianli_zl_8').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove();
            })
            $('.zp_jianli_zl_8').find('button').eq(0).on('click',function (){
                alert('ajax')
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
    var data={cont:"我自我感觉良好你23131231咋的？"};
    _self.fjxx=data.cont;               //自我评价
    _self.bindingDOM();
    _self.bindingSJ();
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
            $('.zp_jianli_zl_9').find('button').eq(1).on('click',function (){
                kg=true;
                $(this).parent().parent().remove();
            })
            $('.zp_jianli_zl_9').find('button').eq(0).on('click',function (){
                alert('ajax')
            })
        }
    })
};
//附加信息结束了
//擅长技能开始
function obj_scjn(){
    this.scjc=[];          //擅长的技能
}
obj_scjn.prototype.init=function (){
        var data={cont:["adadadad","adadadad","hahahaah"]}
        var _self=this
        _self.scjc=data.cont;
       _self.bindingDOM();
        _self.bindingSJ()

};
obj_scjn.prototype.bindingDOM=function (){
    var _self=this;
    var str=''
    if(_self.scjc.length!=0){
        for(var i=0;i<_self.scjc.length;i++){
            str+='<div>'+_self.scjc[i]+'</div>'
        }
        $('#scjn_cont').html(str);
        $('#jl_tjscjn').css({"display":"none"});                        //添加按钮
    }else{
        $('#scjn_cont').html("快来添加你擅长的技能吧");                  //提示话
        $('#scjn').find('.zp_jianli_xg').css({"display":"none"})        //修改按钮
    }

};
obj_scjn.prototype.bindingSJ=function () {
    function jnzs(){                                 //技能自杀
        $('#jn_content > div > a').on('click',function (){
            $(this).parent().remove();              //自杀
        })
    }
    var _self=this;
    $('#jl_tjscjn').on('click',function (){
        var _self=this;
        var str='';
        str+='<div class="zp_jianli_zl_10">'
        str+='<div class="scjn_top">'
        str+='<p>已添加:</p>'
        str+='<div id="jn_content">'
        //循环技能
        str+='</div>'
        str+='</div>'
        str+='<div class="scjn_buttom">'
        str+='<p>请输入你擅长的技能：<input type="text" class="form-control"> <a class="btn btn-default"  >添加</a></p>'
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
    })                      //添加按钮
    $('#scjn').find('.zp_jianli_xg').on('click',function (){

        var str='';
        str+='<div class="zp_jianli_zl_10">'
        str+='<div class="scjn_top">'
        str+='<p>已添加:</p>'
        str+='<div id="jn_content">'
        for(var i=0;i<_self.scjc.length;i++){
            str+='<div><div>'+_self.scjc[i]+'</div><a href="javascript:;">x</a></div>'
        }
        //循环技能
        str+='</div>'
        str+='</div>'
        str+='<div class="scjn_buttom">'
        str+='<p>请输入你擅长的技能：<input type="text" class="form-control"> <a class="btn btn-default"  >添加</a></p>'
        str+='</div>'
        str+='<div class="zp_jianli_zl_2_bottom">'
        str+='<button type="button" class="btn btn-primary">确定</button>'
        str+='<button class="btn btn-default"  type="button">取消</button>'
        str+='</div>'
        str+='</div>'
        $('#scjn_cont').after(str);                                 //插入
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
            $('#scjn_cont').css({"display":"block"});
            $(this).parent().parent().remove()          //取消自杀
        })

    })
};

$(function (){                              //入口函数
    var obj__yhxx=new obj_yhxx();           //基本信息
    obj__yhxx.init();

    var obj__zbzl=new obj_zbzl();           //基本资料
    obj__zbzl.init();

    var obj__zyyx=new obj_zyyx();           //职业意向
    obj__zyyx.init();

    var obj__gzjl=new obj_gzjl();           //创建简历对象
    obj__gzjl.init();

    // var obj__yyjl=new obj_yyjl();           //教育经历
    // obj__yyjl.init();

    var obj__xmjy=new obj_xmjy();           //项目经验开始
    obj__xmjy.init();

    var obj__zopj=new obj_zopj();           //自我评价开始
    obj__zopj.init();

    var obj__fjxx=new obj_fjxx();           //附加信息开始
    obj__fjxx.init();

    var obj__scjn=new obj_scjn();           //擅长技能
    obj__scjn.init()

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


