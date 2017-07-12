/**
 * Created by Administrator on 2017/7/6.
 */
//个人信息开始
function obj_yhxx(){
    this.name='';
    this.xb='';
    this.dqhy='';
    this.gznf='';
    this.zwmc='';
    this.dqcs='';
    this.DOM={
        oname: $('#jl_name'),
        oxb:   $('#jl_xb > input'),
        odqhy: $('#jl_dqhy'),
        ogznf: $('#jl_gznf'),
        ozwmc: $('#jl_zwmc'),
        odqcs: $('#jl_dqcs')
    }
}
obj_yhxx.prototype.init=function (){
    var _self = this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',    //路径
        success:function (data){//data 就是数据 json
            _self.name=data.resume.resumeName;         //姓名
            _self.xb=usersex;                         //性别
            _self.gznf=data.resume.resumeWorkinglife; //工作年份
            _self.dqhy='adadad';                      //当前行业
            _self.zwmc=data.resume.resumePosition;   //当前职位
            _self.dqcs=data.resume.resumeWorkspace;  //当前城市
            _self.bindingDOM();
            _self.bindingSJ();
            $('.zp_jianli_zl_1').css({"display":"block"});//显示
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });
};
obj_yhxx.prototype.bindingDOM=function (){ //个人信息绑定
    var _self=this;
    _self.DOM.oname.val(this.name);//名称初始化
    _self.DOM.oxb.each(function (index,ele){ //初始化性别
        if($(ele).val()==_self.xb){
            $(ele).attr("checked","checked")
        }
    });
    this.DOM.odqhy.val(this.dqhy);     //当前行业
    this.DOM.ogznf.val(this.gznf);      //工作年份
    this.DOM.ozwmc.val(this.zwmc);     //职位名称
    this.DOM.odqcs.val(this.dqcs);      //当前城市
};
obj_yhxx.prototype.bindingSJ=function (){
    $('#zp_jianli_bd_1_qx').on('click',function (){
        $('.zp_jianli_zl_1').css({"display":"none"});//显示

    })
};
//个人信息结束
// 基本资料构造函数开始
function obj_zbzl(){
    this.cstime='';     //出生年月
    this.sj=0;          //手机号
    this.zt='';         //状态
    this.hyzk='';       //婚姻状况
    this.youxiang='';   //邮箱
}
obj_zbzl.prototype.init=function (){    //初始化赋值
    var _self = this;
    $.ajax({
        type:"get",    //提交方式
        async:true,  //是否异步
        url:path+'Resume/selResume.do',             //路径
        success:function (data){                //data 就是数据 json
            _self.cstime=''                         //出生年月
            _self.sj="ada";                          //手机号
            _self.zt=data.resume.resumeState;       //状态
            _self.hyzk=data.resume.resumeMarriage; //婚姻状况
            _self.youxiang="ada";                   //邮箱
            _self.bindingDOM();
            _self.bindingSJ();
            $('.zp_jianli_zl_2').css({"display":"block"})
        },error:function (){ //报错执行的
                alert('错误的')
        }
    });
};
obj_zbzl.prototype.bindingDOM=function (){//绑定基本信息
    var _slef = this;
    $('#jl_cstime').html(_slef.cstime);  //出生事件
    $('#jl_sj').val(_slef.sj);          //手机号
    $('#jl_zt').html(_slef.zt);          //状态
    $('#jl_yx').val(_slef.youxiang);    //邮箱
    $('#jl_hyzk').html(_slef.hyzk);  //婚姻状况
};
obj_zbzl.prototype.bindingSJ=function () {      //绑定的事件
    $('#jbzl_2_qx').on('click',function (){
        $('.zp_jianli_zl_2').css({"display":"none"})
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
            _self.qwhy=data.resume.resumeWorkspace;         //期望行业
            _self.qwzn=data.resume.resumeIntentPosition;    //期望职能
            _self.qwdd=data.resume.resumeWorkspace;         //期望地点
            _self.qwnx=[data.resume.resumeIntentYm,12];     //期望年薪
            _self.mqnx=[data.resume.resumeYm,12];           //当前年薪
            _self.bindingDOM();
            _self.bindingSJ();
            $('.zp_jianli_zl_3').css({"display":"block"})
        },error:function (){ //报错执行的
            alert('错误的')
        }
    });
};
obj_zyyx.prototype.bindingDOM=function (){
    var _self=this;
    _self.DOM.oqwhy.val(_self.qwhy);
    _self.DOM.oqwzn.val(_self.qwzn);
    _self.DOM.oqwdd.val(_self.qwdd);
    _self.DOM.oqwnx.each(function (index,ele){
        if(index==0){
            $(ele).val(_self.qwnx[0])
        }else{
            $(ele).val(_self.qwnx[1])
        }
    });
    this.DOM.omqnx.each(function (index,ele){
        if(index==0){
            $(ele).val(_self.mqnx[0])
        }else{
            $(ele).val(_self.mqnx[1])
        }
    })
};
obj_zyyx.prototype.bindingSJ=function (){
    $('#zp_jianli_zl_3_qx').on('click',function (){
        $('.zp_jianli_zl_3').css({"display":"none"})
    })
};
//职业意向结束
//工作经历开始
function obj_gzjl(){
    this.gsmc='';               //公司名称   2
    this.gshy='';               //公司行业   2
    this.zwmc2='';               //职位名称  2
    this.gzdd='';               //工作地点   2
    this.xxrs='';               //下属人数
    this.rzsj='';               //任职时间   2
    this.lzsj='';               //离职时间   2
    this.zzyj='';               //职责业绩   2
    this.yx=''                  //月薪       2
}
obj_gzjl.prototype.init=function (){
        var data=[{                             //假设AJAX数据
            gsmc:"123",
            gshy:"123",
            zwmc2:"123"
        },{
            gsmc:"456",
            gshy:"123",
            zwmc2:"123",
            yx:"5000"
        },{
            gsmc:"456",
            gshy:"123",
            zwmc2:"123",
            yx:"5000"
        }];
        var _self=this;
    // $.ajax({
    //     type: "get",//数据发送的方式（post 或者 get）
    //     url: path+'JobExp/selByResumeId?resumeId='+1,//要发送的后台地址
    //     success: function (data) {//ajax请求成功后触发的方法
    //         alert('请求成功');
    //     },
    //     error: function () {//ajax请求失败后触发的方法
    //         alert('错误');//弹出错误信息
    //     }
    // });
    _self.obj_s=[];                           //放赋值后对象的列表
        for(var i=0;i<data.length;i++){
            var obj__gzjl=new obj_gzjl();       //循环创建对象
            obj__gzjl.gsmc=data[i].gsmc;
            obj__gzjl.gshy=data[i].gshy;
            obj__gzjl.zwmc2=data[i].zwmc2;
            obj__gzjl.gzdd=data[i].gzdd;
            obj__gzjl.xxrs=data[i].xxrs;
            obj__gzjl.rzsj=data[i].rzsj;
            obj__gzjl.lzsj=data[i].lzsj;
            obj__gzjl.zzyj=data[i].zzyj;
            obj__gzjl.yx=data[i].yx;
            _self.obj_s[i]=obj__gzjl;                  //插进数组
        }
        var str='';
        var jlgs=0;                             //计算多少个工作经历
        for (var i=0;i<_self.obj_s.length;i++){       //绑定元素开始
            str+='<div id="gzjl_'+jlgs+++'">'
            str+='<div class="zp_jianli_cont_left_gzjl_cont">'
            str+='<h3>'
            str+='<span>'+_self.obj_s[i].zwmc2+'</span><span class="zp_jianli_color">&nbsp;|&nbsp;</span><span>'+_self.obj_s[i].gsmc+'</span>&nbsp;&nbsp;&nbsp;&nbsp;<time>（'+_self.obj_s[i].rzsj+' － '+_self.obj_s[i].lzsj+'）</time>'
            str+='<a class="zp_jianli_xg" href="javascript:;"></a>'
            str+='</h3>'
            str+='<p>工作地点：'+_self.obj_s[i].gzdd+' | 月薪：'+_self.obj_s[i].yx+'/月*12个月</p>'
            str+='<p>'+_self.obj_s[i].zzyj+'</p>'
            str+='</div>'
            str+='<p class="zp_jianli_p1">公司行业：'+_self.obj_s[i].gshy+'</p>'
            str+='</div>'
        }
        return str;
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
                str+=' 公司名称<input type="text" value="'+_self.obj_s[index].gsmc+'" class="form-control zp_jianli_zl_3_input1">'
                str+='</li>'
                str+='<li>'
                str+='公司行业<input type="text" value="'+_self.obj_s[index].gshy+'" class="form-control zp_jianli_zl_3_input1 ">'
                str+='</li>'
                str+='<li>'
                str+='职位名称<input type="text" value="'+_self.obj_s[index].zwmc2+'" class="form-control zp_jianli_zl_3_input1 ">'
                str+='</li>'
                str+='<li>'
                str+='工作地点'
                str+='<div class="zp_jianli_zl_4_div1">'
                str+='<input type="text" value="'+_self.obj_s[index].gzdd+'" class="form-control zp_jianli_zl_4_input2 ">'
                str+='下属人数'
                str+='<input type="text" value="'+_self.obj_s[index].xxrs+'" class="form-control zp_jianli_zl_4_input3">'
                str+='</div>'
                str+='</li>'
                str+='<li>'
                str+='任职时间'
                str+='<div class="zp_jianli_zl_4_div2">'
                str+='<select class="form-control">'
                str+='<option>2017</option>'
                str+='<option>2016</option>'
                str+='<option>2015</option>'
                str+='<option>2014</option>'
                str+='<option>2013</option>'
                str+='</select>'
                str+='<select class="form-control">'
                str+='<option>01</option>'
                str+=' <option>02</option>'
                str+='<option>03</option>'
                str+='<option>04</option>'
                str+='<option>05</option>'
                str+='</select>'
                str+='-'
                str+='<select class="form-control">'
                str+='<option>2017</option>'
                str+='<option>2016</option>'
                str+='<option>2015</option>'
                str+='<option>2014</option>'
                str+='<option>2013</option>'
                str+='</select>'
                str+='<select class="form-control">'
                str+='<option>01</option>'
                str+='<option>02</option>'
                str+='<option>03</option>'
                str+='<option>04</option>'
                str+='<option>05</option>'
                str+='</select>'
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
            }else{
                alert('一次只能修改一个简历')
            }
            $('.zp_jianli_zl_4').find('button').eq(1).on('click',function (){
                kg=true;                                        //一次只能修改一个简历
                $(this).parent().parent().remove()              //取消自杀
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
            str+='<div class="zp_jianli_zl_4_div2">'
            str+='<select class="form-control">'
            str+='<option>2017</option>'
            str+='<option>2016</option>'
            str+='<option>2015</option>'
            str+='<option>2014</option>'
            str+='<option>2013</option>'
            str+='</select>'
            str+='<select class="form-control">'
            str+='<option>01</option>'
            str+=' <option>02</option>'
            str+='<option>03</option>'
            str+='<option>04</option>'
            str+='<option>05</option>'
            str+='</select>'
            str+='-'
            str+='<select class="form-control">'
            str+='<option>2017</option>'
            str+='<option>2016</option>'
            str+='<option>2015</option>'
            str+='<option>2014</option>'
            str+='<option>2013</option>'
            str+='</select>'
            str+='<select class="form-control">'
            str+='<option>01</option>'
            str+='<option>02</option>'
            str+='<option>03</option>'
            str+='<option>04</option>'
            str+='<option>05</option>'
            str+='</select>'
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
            })
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
    var data=[                           //假设后台传的AJAX数据
        {
        xxmc:"啦啦大学",
        zymc:"呵呵呵专业",
        jdsj:"adad",
        bynf:'adad',
        xl:'adad',
        sftz:0
    },
        {xxmc:"好牛的大学",
            zymc:"呵呵呵专业",
            jdsj:"adad",
            bynf:'adad',
            xl:'adad',
            sftz:0
        },];
    _self.obj_s=[];//接收对象的数组
    for(var i=0;i<data.length;i++){
        var obj__yyjl=new obj_yyjl();
        obj__yyjl.xxmc=data[i].xxmc;
        obj__yyjl.zymc=data[i].zymc;
        obj__yyjl.jdsj=data[i].jdsj;
        obj__yyjl.bynf=data[i].bynf;
        obj__yyjl.xl=data[i].xl;
        obj__yyjl.sftz=data[i].sftz;
        _self.obj_s[i]=obj__yyjl      //插入
    }
    //便利对象到页面上
    var str='';//用来装元素的容器    return出去
    for(var i=0;i<_self.obj_s.length;i++){
        str+='<div>'
        str+='<p class="zp_index_p_left">'
        str+=''+_self.obj_s[i].xxmc+'（'+_self.obj_s[i].jdsj+'–'+_self.obj_s[i].bynf+'）'
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
    return str;
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
                    str+='<li>学校名称 <input type="text" class="form-control "></li>'
                    str+='<li>专业名称 <input type="text" class="form-control "></li>'
                    str+='<li>就读时间 <input type="text" class="form-control "></li>'
                    str+='<li>毕业年份 <input type="text" class="form-control "></li>'
                    str+='<li>'
                    str+='学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历&nbsp;&nbsp;&nbsp;'
                    str+='<select class="form-control">'
                    str+='<option>1</option>'
                    str+='<option>2</option>'
                    str+='<option>3</option>'
                    str+='<option>4</option>'
                    str+='<option>5</option>'
                    str+='</select>'
                    str+='<input type="checkbox" id="sftz"><label for="sftz">是否统招</label>'
                    str+='</li>'
                    str+='</ul>'
                    str+='<div class="zp_jianli_zl_2_bottom">'
                    str+='<button type="button" class="btn btn-primary">确定</button>'
                    str+='<button class="btn btn-default"  type="button">取消</button>'
                    str+='</div>'
                    str+='</div>'
                   $(this).parent().parent().before(str)
                }
        })
    })

}















$(function (){
    $('.zp_jianli_xg').eq(0).on('click',function (){
        var obj__yhxx=new obj_yhxx();               //基本信息
        obj__yhxx.init();
    });
    $('.zp_jianli_xg').eq(1).on('click',function (){  //基本资料
        //    创建基本资料对象实例
        var obj__zbzl=new obj_zbzl();
        obj__zbzl.init();    //赋值初始化
    });
    $('.zp_jianli_xg').eq(2).on('click',function (){
        var obj__zyyx=new obj_zyyx();                 //职业意向
        obj__zyyx.init();
    });
    //当页面加载完成后AJAX插入所有简历
    var obj__gzjl=new obj_gzjl();     //创建简历对象
    var obj_jl=obj__gzjl.init();      //当页面加载完成后插入简历
    $('#gzjl').after(obj_jl)          //插入简历
    obj__gzjl.bindingSJ();            //调用简历事件

    //教育经历
    var obj__yyjl=new obj_yyjl();
    var obj_xl=obj__yyjl.init();
    $('#zp_jyjl').after(obj_xl);
     obj__yyjl.bindingSJ();

});






