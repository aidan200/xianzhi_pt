var mzd=''                                                  //没找到

mzd+='<div class="comh_no">'
mzd+='<div class="pop_allimg">'
mzd+='<img src="'+path+'dist/foreEnd3/img/sfs.png" alt="" class="com_img">'
mzd+='<p>暂无简历记录</p>'
mzd+='</div>'
mzd+='</div>'

function scsj(data){                                    //计算时间
    var aa= getNowFormatDate(data).substring(0, 4)
    var bb=getNowFormatDate(new Date()).substring(0, 4);
    var sj=bb-aa;                    //页面负责运算计算年龄
    return sj
}


function Qxdx(){        //全局对象
    this.pages=1;       //总页数
    this.total=0;       //总记录数
    this.jl={           //记录全部页数
        xypjl:1,         //新应聘简历
        yxgk:1,          //意向沟通
        msyy:1,         //面试快
    }


}
var qxdx=new Qxdx();                    //全局对象

function parent(){   //父类

}


parent.prototype.fy=function (pages,page){  //总页数  当前页数
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<pages+1;i++){
        if(page==i){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+pages+'</span> 页</div>'
    str+='</div>'
    return str              //返回
}
parent.prototype.fy_sj=function (parent,pages,page,obj){        //参数1父级

    var aa=$(parent).find('.zp_botv a')
    $(parent).find('.zp_botv a').each(function (i,e){

        if(i==0&&page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                page-=1;         //减少1页
                var data=obj.seekCont();
                data.page=page
                obj.loader(data,obj.cg,obj.sb);
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                page=i;                          //设置你点的位置
                var data=obj.seekCont();
                data.page=page

                obj.loader(data,obj.cg,obj.sb);
            })
        }
        if(i==aa.length-1&&pages==page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&pages!=page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&pages!=page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                page+=1;                         //增加1页
                var data=obj.seekCont();
                data.page=page
                obj.loader(data,obj.cg,obj.sb);
            })
        }

    })
}


function Xjl(){        //全部状态

}
Xjl.prototype=new parent();
Xjl.prototype.loader=function (data,fn1,fn2,obj){
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selByState.do',
        success:function (data){
            qxdx.pages=data.pages;
            qxdx.jl.yxgk=data.page;
            qxdx.total=data.total;
            $(obj).find('.comh_span span').html(qxdx.total);          //总记录数
            var str=''
            if(data.list.length!=0){
                for(var i=0;i<data.list.length;i++){
                    str+='<div class="comh_have">'
                    str+='<div class="comh_left">'
                    str+='<img src="'+path+'uploadImg/'+data.list[i].resumes.resumeIntentField+'" alt=""'        //空着呢
                    str+='class="comh_head">'
                    str+='<div class="comh_test">'
                    str+='<h4><a href='+path+'Resume/selResumeInfoCom.do?resumeId='+data.list[i].resumes.resumeId+' target="_blank"">'+data.list[i].resumes.resumeName+'</a></h4>'
                    str+='<div class="comh_in">'
                    if(data.list[i].resumes.resumeSex==0){
                        str+='<span>男</span>|'
                    }else{
                        str+='<span>女</span>|'
                    }


                    str+='<span>'+ scsj(data.list[i].resumes.resumeBirth)+'</span>|'     //我是年龄
                    str+='<span class="comh_more" style="max-width: 83px">'+data.list[i].resumes.resumeWorkspace+'</span>|'//我是地点
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'      //我是学历
                    str+='</div>'
                    str+='<div class="comh_in">'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].resumes.resumePosition+'</span>|' //当前职位

                    str+='<span>'+ scsj(data.list[i].resumes.resumeWorkinglife)+'年经验</span>'    //工作经验
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                    str+='<div class="comh_right">'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].jobExps.jobexpBeginTime).substring(0,7)+'--'+getNowFormatDate(data.list[i].jobExps.jobexpEndTime).substring(0,7)+'</span>|'
                    str+='<span class="comh_more" style="max-width: 150px">'+data.list[i].jobExps.jobexpCompanyName+'</span>|'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].jobExps.jobexpPostion+'</span>'
                    str+='</div>'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].xzResumeEducations.enrollmentDate).substring(0,7)+'--'+getNowFormatDate(data.list[i].xzResumeEducations.graduateDate).substring(0,7)+'</span>|'      //教育经历开始enrollmentDate/graduateDate
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationSchool+'</span>|'
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationMajor+'</span>|'
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'
                    str+='</div>'
                    str+='<div style="margin-top: 10px;margin-right: 3px;float: right;color: #a8a8a8">'

                    var date1= data.list[i].sendTime;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;
                    if(date3<60000*60){
                        str+='<span><span>'+Math.floor(date3/60000)+'</span>分钟前</span>'          //投递时间

                    }else if(date3<60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60)+'</span>小时前</span>'          //投递时间

                    }else if (date3>60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60/24)+'</span>天前</span>'          //投递时间

                    }
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                }
                $(obj+' > div').each(function (i,e){        //每次载入更新
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                });
                $(obj).find('.comh_top ').after(str);          //输出页面
                fn1()
            }else{

                fn2()
            }






        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Xjl.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.companyId=companyId;                                //ID
    _public_ssk.page=qxdx.jl.xypjl;                              //全部状态分页
    _public_ssk.sendState=0;                                        //未查看
    _public_ssk.zw=1;
    return _public_ssk
}
Xjl.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();

    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.xypjl);
        $('#pop_one .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_one',qxdx.pages,qxdx.jl.xypjl,This);  //事件插入完成
    }
    This.sb=function (){
        //没找到数据
        $('#pop_one .zp_botv').html('')
        $('#pop_one > div').each(function (i,e){        //每次载入更新
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        });
        $('#pop_one .comh_top').after(mzd);

    }
    This.loader(data,This.cg,This.sb,'#pop_one');                //加载数据






}
Xjl.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;
    This.init();
    $('#myTab li a').eq(0).unbind().on('click',function (){
        This.init();
    })

}

function Yxgt(){        //全部状态

}
Yxgt.prototype=new parent();
Yxgt.prototype.loader=function (data,fn1,fn2,obj){
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selByState.do',
        success:function (data){
            qxdx.pages=data.pages;
            qxdx.jl.yxgk=data.page;
            qxdx.total=data.total;
            $(obj).find('.comh_span span').html(qxdx.total);          //总记录数
            var str=''
            if(data.list.length!=0){
                for(var i=0;i<data.list.length;i++){
                    str+='<div class="comh_have">'
                    str+='<div class="comh_left">'
                    str+='<img src="'+path+'uploadImg/'+data.list[i].resumes.resumeIntentField+'" alt=""'        //空着呢
                    str+='class="comh_head">'
                    str+='<div class="comh_test">'
                    str+='<h4><a href='+path+'Resume/selResumeInfoCom.do?resumeId='+data.list[i].resumes.resumeId+' target="_blank"">'+data.list[i].resumes.resumeName+'</a></h4>'
                    str+='<div class="comh_in">'
                    if(data.list[i].resumes.resumeSex==0){
                        str+='<span>男</span>|'
                    }else{
                        str+='<span>女</span>|'
                    }


                    str+='<span>'+ scsj(data.list[i].resumes.resumeBirth)+'</span>|'     //我是年龄
                    str+='<span class="comh_more" style="max-width: 83px">'+data.list[i].resumes.resumeWorkspace+'</span>|'//我是地点
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'      //我是学历
                    str+='</div>'
                    str+='<div class="comh_in">'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].resumes.resumePosition+'</span>|' //当前职位

                    str+='<span>'+ scsj(data.list[i].resumes.resumeWorkinglife)+'年经验</span>'    //工作经验
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                    str+='<div class="comh_right">'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].jobExps.jobexpBeginTime).substring(0,7)+'--'+getNowFormatDate(data.list[i].jobExps.jobexpEndTime).substring(0,7)+'</span>|'
                    str+='<span class="comh_more" style="max-width: 150px">'+data.list[i].jobExps.jobexpCompanyName+'</span>|'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].jobExps.jobexpPostion+'</span>'
                    str+='</div>'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].xzResumeEducations.enrollmentDate).substring(0,7)+'--'+getNowFormatDate(data.list[i].xzResumeEducations.graduateDate).substring(0,7)+'</span>|'      //教育经历开始enrollmentDate/graduateDate
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationSchool+'</span>|'
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationMajor+'</span>|'
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'
                    str+='</div>'
                    str+='<div style="margin-top: 10px;margin-right: 3px;float: right;color: #a8a8a8">'

                    var date1= data.list[i].sendTime;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;
                    if(date3<60000*60){
                        str+='<span><span>'+Math.floor(date3/60000)+'</span>分钟前</span>'          //投递时间

                    }else if(date3<60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60)+'</span>小时前</span>'          //投递时间

                    }else if (date3>60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60/24)+'</span>天前</span>'          //投递时间

                    }
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                }
                $(obj+' > div').each(function (i,e){        //每次载入更新
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                });
                $(obj).find('.comh_top ').after(str);          //输出页面
                fn1()
            }else{

                fn2()
            }






        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Yxgt.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.companyId=companyId;                                //ID
    _public_ssk.page=qxdx.jl.yxgk;                              //全部状态分页
    _public_ssk.sendState=1;                                        //未查看
    _public_ssk.zw=1;
    return _public_ssk
}
Yxgt.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();

    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.yxgk);
        $('#pop_three .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_three',qxdx.pages,qxdx.jl.yxgk,This);  //事件插入完成
    }
    This.sb=function (){
        //没找到数据
        $('#pop_three .zp_botv').html('')
        $('#pop_three > div').each(function (i,e){        //每次载入更新
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        });
        $('#pop_three .comh_top').after(mzd);

    }
    This.loader(data,This.cg,This.sb,'#pop_three');                //加载数据






}
Yxgt.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;

    $('#myTab li a').eq(1).unbind().on('click',function (){
        This.init();
    })

}


function Msyy(){        //全部状态

}
Msyy.prototype=new parent();
Msyy.prototype.loader=function (data,fn1,fn2,obj){
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selByState.do',
        success:function (data){
            qxdx.pages=data.pages;
            qxdx.jl.msyy=data.page;
            qxdx.total=data.total;
            $(obj).find('.comh_span span').html(qxdx.total);          //总记录数
            var str=''
            if(data.list.length!=0){
                for(var i=0;i<data.list.length;i++){
                    str+='<div class="comh_have">'
                    str+='<div class="comh_left">'
                    str+='<img src="'+path+'uploadImg/'+data.list[i].resumes.resumeIntentField+'" alt=""'        //空着呢
                    str+='class="comh_head">'
                    str+='<div class="comh_test">'
                    str+='<h4><a href='+path+'Resume/selResumeInfoCom.do?resumeId='+data.list[i].resumes.resumeId+' target="_blank"">'+data.list[i].resumes.resumeName+'</a></h4>'
                    str+='<div class="comh_in">'
                    if(data.list[i].resumes.resumeSex==0){
                        str+='<span>男</span>|'
                    }else{
                        str+='<span>女</span>|'
                    }


                    str+='<span>'+ scsj(data.list[i].resumes.resumeBirth)+'</span>|'     //我是年龄
                    str+='<span class="comh_more" style="max-width: 83px">'+data.list[i].resumes.resumeWorkspace+'</span>|'//我是地点
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'      //我是学历
                    str+='</div>'
                    str+='<div class="comh_in">'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].resumes.resumePosition+'</span>|' //当前职位

                    str+='<span>'+ scsj(data.list[i].resumes.resumeWorkinglife)+'年经验</span>'    //工作经验
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                    str+='<div class="comh_right">'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].jobExps.jobexpBeginTime).substring(0,7)+'--'+getNowFormatDate(data.list[i].jobExps.jobexpEndTime).substring(0,7)+'</span>|'
                    str+='<span class="comh_more" style="max-width: 150px">'+data.list[i].jobExps.jobexpCompanyName+'</span>|'
                    str+='<span class="comh_more" style="max-width: 130px">'+data.list[i].jobExps.jobexpPostion+'</span>'
                    str+='</div>'
                    str+='<div class="comh_rt">'
                    str+='<span>'+getNowFormatDate(data.list[i].xzResumeEducations.enrollmentDate).substring(0,7)+'--'+getNowFormatDate(data.list[i].xzResumeEducations.graduateDate).substring(0,7)+'</span>|'      //教育经历开始enrollmentDate/graduateDate
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationSchool+'</span>|'
                    str+='<span class="comh_more" style="max-width: 120px">'+data.list[i].xzResumeEducations.educationMajor+'</span>|'
                    str+='<span>'+data.list[i].xzResumeEducations.educationLevel+'</span>'
                    str+='</div>'
                    str+='<div style="margin-top: 10px;margin-right: 3px;float: right;color: #a8a8a8">'

                    var date1= data.list[i].sendTime;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;
                    if(date3<60000*60){
                        str+='<span><span>'+Math.floor(date3/60000)+'</span>分钟前</span>'          //投递时间

                    }else if(date3<60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60)+'</span>小时前</span>'          //投递时间

                    }else if (date3>60000*60*24){
                        str+='<span><span>'+Math.floor(date3/60000/60/24)+'</span>天前</span>'          //投递时间

                    }
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                }
                $(obj+' > div').each(function (i,e){        //每次载入更新
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                });
                $(obj).find('.comh_top ').after(str);          //输出页面
                fn1()
            }else{

                fn2()
            }






        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Msyy.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.companyId=companyId;                                //ID
    _public_ssk.page=qxdx.jl.yxgk;                              //全部状态分页
    _public_ssk.sendState=2;                                        //未查看
    _public_ssk.zw=1;
    return _public_ssk
}
Msyy.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();
    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.msyy);
        $('#pop_four .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_three',qxdx.pages,qxdx.jl.msyy,This);  //事件插入完成
    }
    This.sb=function (){
        //没找到数据
        $('#pop_four .zp_botv').html('')
        $('#pop_four > div').each(function (i,e){        //每次载入更新
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        });
        $('#pop_four .comh_top').after(mzd);

    }
    This.loader(data,This.cg,This.sb,'#pop_four');                //加载数据






}
Msyy.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;
    $('#myTab li a').eq(2).unbind().on('click',function (){
        This.init();
    })

}

function gszt(){

    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        dataType:'json',                   //定义返回data类型
        url:path+'CompanyInfo/selCompanyInfroation.do',    //路径
        success:function (data){//data 就是数据 json
            var str=''

            if(data.xzCompany.companyState==0){
                str+='<a href="###">'
                str+='<div class="comh_cir">未提交</div>'
                str+='</a>'
            }else if(data.xzCompany.companyState==1){
                str+='<a href="###">'
                str+='<div class="comh_cir">审核中</div>'
                str+='</a>'
            }else if(data.xzCompany.companyState==2){
                str+='<a href="###">'
                str+='<div class="comh_cir">已完成</div>'
                str+='</a>'
            }else if(data.xzCompany.companyState==3){
                str+='<a href="###">'
                str+='<div class="comh_cir">未通过</div>'
                str+='</a>'
            }

            $('#gs_shzt').html(str);




        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}




$(function (){

    gszt()
    var xjl=new Xjl();
    xjl.xxk_sj();

    var yxgt=new Yxgt();
    yxgt.xxk_sj();

    var msyy=new Msyy();
    msyy.xxk_sj();

})