var mzd=''                                                  //没找到
mzd+='<div class="pop_no">'
mzd+='<div class="pop_allimg">'
mzd+='<img src="'+path+'dist/foreEnd3/img/sfs.png" alt=""'
mzd+='class="rem_img">'
mzd+='<p class="all_p">暂无简历记录</p>'
mzd+='</div>'
mzd+='</div>'

function Qxdx(){        //全局对象
    this.pages=0;       //总页数
    this.total=0;       //总记录数
    this.jl={           //记录全部页数
        qbzt:0,         //全部状态
        ytd:0,          //已投递
        yck:0,          //已查看
        msyy:0,         //面试邀越
    }


}
var qxdx=new Qxdx();


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
parent.prototype.xl_sj=function (parent){
        $(parent).find('.pop_but').unbind().on('click',function (){
            var aa=$(this).parent().parent().parent().parent().parent().next();
            $(aa).slideToggle(500);
        })
}

function Qbzt(){        //全部状态

}
Qbzt.prototype=new parent();
Qbzt.prototype.loader=function (data,fn1,fn2){
    var This=this;
    var str='';
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selSendByMember.do',
        success:function (data){

            qxdx.pages=data.pages;
            qxdx.jl.qbzt=data.page;
            qxdx.total=data.total;
            $('#pop_one .pop_span span').html(qxdx.total);          //总记录数
            if(data.postionSendList.length!=0){
                for(var i=0;i<data.postionSendList.length;i++){
                    str+='<div class="pop_cont">'
                    str+='<div class="pop_have">'
                    str+='<div class="pop_left2">'
                    str+='<img src="'+path+'uploadImg/ '+data.postionSendList[i].company.companyPicture+'" alt=""'
                    str+='class="pop_head">'
                    str+='<div class="pop_test2">'
                    str+='<h4 style="display: inline-block">'+data.postionSendList[i].postion.postionName+'</h4>'

                    var aa=data.postionSendList[i].postion.postionMm;
                    var bb=data.postionSendList[i].postion.postionYm;
                    if(aa!=-1){
                        str+='<div style="color: #fc6866;display: inline-block;margin-left: 10px">'+aa*12+"-"+bb*12+'</div>'
                    }else if(aa==bb){
                        str+='<div style="color: #fc6866;display: inline-block;margin-left: 10px">'+aa*12+'</div>'
                    }else{
                        str+='<div style="color: #fc6866;display: inline-block;margin-left: 10px">面议</div>'
                    }
                    str+='<div style="display: inline-block;margin-left: 20px">'+data.postionSendList[i].company.companyName+'</div>'
                    str+='<div class="pop_in2">'
                    str+='<span class="pop_sp">'+data.postionSendList[i].company.companyLocation+'</span>|'
                    str+='<span>'+data.postionSendList[i].postion.postionExp+'年经验</span>|'
                    var attr="";
                    for(var j=0;j<data.postionSendList[i].company.domains.length;j++){
                        var aa= data.postionSendList[i].company.domains[j].field.fieldName
                        attr+=aa+'/'
                    }
                    attr=attr.substr(0,attr.length-1);
                    str+='<span>'+attr+'</span>'                                       //行业插入完毕
                    str+='</div>'
                    str+='<div style="margin-top: -10px">'
                    str+='<button class="pop_but" style="margin-left: 200px">'
                    str+='<span class="fa fa-chevron-down"></span>'
                    str+='</button>'

                    var date1= data.postionSendList[i].sendTime1;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;
                    if(date3<60000*60){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/60000)+'分钟前</span>'
                    }else if(date3<60000*60*24){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/60000/60)+'小时前</span>'
                    }else if (date3>60000*60*24){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/60000/60/24)+'天前</span>'
                    }

                    str+='</div>'
                    str+='</div>'
                    str+='</div>'
                    str+='<div class="pop-right-bottom">'
                    if(data.postionSendList[i].company.companyNature==1){
                        str+='<b>国</b>'
                    }else if(data.postionSendList[i].company.companyNature==2){
                        str+='<b>民</b>'
                    }else if(data.postionSendList[i].company.companyNature==3){
                        str+='<b>外</b>'
                    }else if(data.postionSendList[i].company.companyNature==4){
                        str+='<b>政</b>'
                    }
                    str+='</div>'
                    str+='</div>'
                    str+='</div>'






                    if(data.postionSendList[i].sendState==0){           // 0未查看
                        str+='<div class="pop_more">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已投递'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='</div>'
                    }else if(data.postionSendList[i].sendState==1){     //1意向沟通(已查看）
                        str+='<div class="pop_more">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已投递'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已查看'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='</div>'
                    }else if(data.postionSendList[i].sendState==2){     // 2面试通知
                        str+='<div class="pop_more">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已投递'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已查看'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='约面试'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'

                        str+='</div>'
                    }else if(data.postionSendList[i].sendState==3){     //3不匹配
                        str+='<div class="pop_more">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已投递'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='已查看'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='约面试'
                        str+='</div>'
                        str+='</div>'
                        str+='<img src="'+path+'dist/foreEnd3/img/arrowr.png" alt=""'
                        str+='class="pop_ar">'
                        str+='<div class="pop_m1">'
                        str+='<div class="pop_min">'
                        str+='不匹配'
                        str+='</div>'
                        str+='</div>'
                        str+='</div>'
                    }









                }
                $('#pop_one > div').each(function (i,e){                //清除之前记录
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                })
                $('#pop_one .pop_top2 ').after(str)
                fn1()
            }else{
                fn2()
            }

        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Qbzt.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.resumeId=resumeId;                              //ID
    _public_ssk.page=qxdx.jl.qbzt;                              //全部状态分页
    _public_ssk.type=8;                                         //8是全查
    return _public_ssk
}
Qbzt.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();
    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.qbzt);
        $('#pop_one .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_one',qxdx.pages,qxdx.jl.qbzt,This);  //事件插入完成
        This.xl_sj('#pop_one')
    }
    This.sb=function (){
        //没找到数据
        $('#pop_one > div').each(function (i,e){                //清除之前记录
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        })
        $('#pop_one .pop_top2').after(mzd);

    }
    This.loader(data,This.cg,This.sb);                //加载数据






}
Qbzt.prototype.xxk_sj=function (){            //初始化载入数据
   var This=this;
    This.init();
    $('#myTab li a').eq(0).unbind().on('click',function (){
        This.init();
    })

}




function Ytd(){         //已投递

}
Ytd.prototype=new parent();
Ytd.prototype.loader=function (data,fn1,fn2){
    var This=this;
    var str='';
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selSendByMember.do',
        success:function (data){

            qxdx.pages=data.pages;
            qxdx.jl.ytd=data.page;
            qxdx.total=data.total;
            $('#pop_two .pop_span span').html(qxdx.total);          //总记录数
            if(data.postionSendList.length!=0){


                for(var i=0;i<data.postionSendList.length;i++){

                    str+='<div class="pop_tou">'
                    str+='<ul>'
                    str+='<li class="pop_tl">公司名：<span>'+data.postionSendList[i].company.companyName+'</span></li>'
                    str+='<li class="pop_tl1">职位名：<span>'+data.postionSendList[i].postion.postionName+'</span></li>'

                    var date1= data.postionSendList[i].sendTime1;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;


                    if(date3<60000*60){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/60000)+'分钟前</span></li>'

                    }else if(date3<60000*60*24){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/60000/60)+'小时前</span></li>'

                    }else if (date3>60000*60*24){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/60000/60/24)+'天前</span></li>'

                    }
                    str+='</ul>'
                    str+='</div>'

                }
                $('#pop_two > div').each(function (i,e){                //清除之前记录
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                })
                $('#pop_two .pop_top2 ').after(str)
                fn1()
            }else{
                fn2()
            }

        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Ytd.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.resumeId=resumeId;                              //ID
    _public_ssk.page=qxdx.jl.ytd;                              //全部状态分页
    _public_ssk.type=0;                                         //0是已投递
    return _public_ssk
}
Ytd.prototype.init=function (){            //初始化载入数据

    var This=this;
    var data=This.seekCont();
    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.ytd);
        $('#pop_two .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_two',qxdx.pages,qxdx.jl.ytd,This);  //事件插入完成
        This.xl_sj('#pop_two')
    }
    This.sb=function (){
        //没找到数据
        $('#pop_two > div').each(function (i,e){                //清除之前记录
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        })
        $('#pop_two .pop_top2').after(mzd);

    }
    This.loader(data,This.cg,This.sb);                //加载数据





}
Ytd.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;
    This.init();
    $('#myTab li a').eq(1).unbind().on('click',function (){
        This.init();
    })

}


function Yck(){         //已投递

}
Yck.prototype=new parent();
Yck.prototype.loader=function (data,fn1,fn2){
var This=this;
    var str='';
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selSendByMember.do',
        success:function (data){

            qxdx.pages=data.pages;
            qxdx.jl.yck=data.page;
            qxdx.total=data.total;
            $('#pop_three .pop_span span').html(qxdx.total);          //总记录数
            if(data.postionSendList.length!=0){


                for(var i=0;i<data.postionSendList.length;i++){

                    str+='<div class="pop_tou">'
                    str+='<ul>'
                    str+='<li class="pop_tl">公司名：<span>'+data.postionSendList[i].company.companyName+'</span></li>'
                    str+='<li class="pop_tl1">职位名：<span>'+data.postionSendList[i].postion.postionName+'</span></li>'

                    var date1= data.postionSendList[i].sendTime1;          //计算几小时以前
                    var date2=new Date();
                    var date3=date2-date1;
                    if(date3<3600000){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/60000)+'分钟前</span></li>'

                    }else if(date3<3600000*24){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/6000/60)+'小时前</span></li>'

                    }else if (date3>3600000*24){
                        str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/3600000/24)+'天前</span></li>'

                    }
                    str+='</ul>'
                    str+='</div>'

                }
                $('#pop_three > div').each(function (i,e){                //清除之前记录
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                })
                $('#pop_three .pop_top2 ').after(str)
                fn1()
            }else{
                fn2()
            }

        },error:function (){
            alert('基本资料修改错误')
        }

    })



}
Yck.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.resumeId=resumeId;                              //ID
    _public_ssk.page=qxdx.jl.yck;                              //全部状态分页
    _public_ssk.type=1;                                         //0是已投递
    return _public_ssk
}
Yck.prototype.init=function (){            //初始化载入数据

    var This=this;
    var data=This.seekCont();
    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.yck);
        $('#pop_three .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_three',qxdx.pages,qxdx.jl.yck,This);  //事件插入完成
        This.xl_sj('#pop_three')
    }
    This.sb=function (){
        //没找到数据
        $('#pop_three > div').each(function (i,e){                //清除之前记录
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        })
        $('#pop_three .pop_top2').after(mzd);

    }
    This.loader(data,This.cg,This.sb);                //加载数据





}
Yck.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;
    This.init();
    $('#myTab li a').eq(2).unbind().on('click',function (){
        This.init();
    })

}

function Msyy(){         //已投递

}
Msyy.prototype=new parent();
Msyy.prototype.loader=function (data,fn1,fn2){
    var This=this;
    var str='';
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',
        url:path+'PostionSend/selSendByMember.do',
        success:function (data){

            qxdx.pages=data.pages;
            qxdx.jl.msyy=data.page;
            qxdx.total=data.total;
            $('#pop_four .pop_span span').html(qxdx.total);          //总记录数
            if(data.postionSendList.length!=0){

                for(var i=0;i<data.postionSendList.length;i++){

                    if(data.postionSendList[i].postionSendMsg!=null){
                        str+='<div class="pop_tou" data-pmsgName="'+data.postionSendList[i].postionSendMsg.pmsgName+'" data-pmsgId="'+data.postionSendList[i].postionSendMsg.pmsgId+'" >'
                    }else{
                        str+='<div class="pop_tou" >'
                    }
                    str+='<ul>'
                    str+='<li class="pop_tl3">公司名：<span>'+data.postionSendList[i].company.companyName+'</span></li>'
                    str+='<li class="pop_tl3">职位名：<span>'+data.postionSendList[i].postion.postionName+'</span></li>'
                    str+='</ul>'
                    if(data.postionSendList[i].postionSendMsg!=null){
                        str+='<span class="fa fa-chevron-down pop_d"></span>'
                    }else{

                    }
                    str+='</div>'
                    str+='<div class="pop_dd">'
                    str+='<ul>'
                    str+='<li class="pop_tl4">面试信息：';
                    str+='<span>面试公司：'+data.postionSendList[i].postionSendMsg.filed2+'</span><br>';
                    str+='<span>面试地点：'+data.postionSendList[i].postionSendMsg.filed1+'</span><br>';
                    str+='<span>面试时间：'+getNowFormatDate(data.postionSendList[i].postionSendMsg.interviewTime)+'</span><br>';
                    str+='<span>面试地点：'+data.postionSendList[i].postionSendMsg.pmsgValue+'</span><br>';
                    str+='</li>'
                    str+='<li class="pop_tl5 an_cz" >'
                    if(data.postionSendList[i].postionSendMsg.pmsgName=='2'){
                        str+='<p >你已同意</p>'
                    }else if(data.postionSendList[i].postionSendMsg.pmsgName=='3'){
                        str+='<p >你已拒绝</p>'
                    }else{
                        str+='<button type="button" class="ty_zw">同意</button>'
                        str+='<button type="button" class="jj_zw">拒绝</button>'
                    }

                    str+='</li>'
                    str+='</ul>'
                    str+='</div>'
                }
                $('#pop_four > div').each(function (i,e){                //清除之前记录
                    if(i!=0&&$(e).attr('class')!='zp_botv'){
                        $(e).remove();
                    }
                })
                $('#pop_four .pop_top2 ').after(str)
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
    _public_ssk.resumeId=resumeId;                              //ID
    _public_ssk.page=qxdx.jl.msyy;                              //全部状态分页
    _public_ssk.type=2;                                         //0是已投递
    return _public_ssk
}
Msyy.prototype.init=function (){            //初始化载入数据

    var This=this;
    var data=This.seekCont();
    This.cg=function (){
        var fy= This.fy(qxdx.pages,qxdx.jl.msyy);
        $('#pop_four .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_four',qxdx.pages,qxdx.jl.msyy,This);  //事件插入完成
        This.sj();
        $('#pop_four').find('.pop_d').unbind().on('click',function (){
            var aa=$(this).parent().next()
            var bb=$(this).parent()
            console.log(bb.attr('data-pmsgName'));
            if(bb.attr('data-pmsgName')==0){

                var data2={
                    pmsgId:bb.attr('data-pmsgId'),
                    pmsgName:1,                     //已查看
                }
                $.ajax({
                    type: "post",    //提交方式
                    async: true,  //是否异步
                    data: data2,        //转为JSON格式
                    dataType: 'text',
                    url: path +'PostionSend/updateType.do',
                    success: function (data) {


                        $(aa).slideToggle(500);

                    }, error: function () {
                        alert('基本资料修改错误')
                    }

                });
            }else{
                $(aa).slideToggle(500);
            }


        })

    }
    This.sb=function (){
        //没找到数据
        $('#pop_four > div').each(function (i,e){                //清除之前记录
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        })
        $('#pop_four .pop_top2').after(mzd);

    }
    This.loader(data,This.cg,This.sb);                //加载数据





}
Msyy.prototype.xxk_sj=function (){            //初始化载入数据
    var This=this;
    This.init();
    $('#myTab li a').eq(3).unbind().on('click',function (){
        This.init();
    })

}
Msyy.prototype.sj=function (){
    var This=this;
    $('#pop_four').find('.ty_zw').unbind().on('click',function (){          //同意
        var aa=$(this).parent().parent().parent().prev();
        var pmsgId=aa.attr('data-pmsgId');
        var data={
            pmsgId:pmsgId,
            pmsgName:2,                     //同意
        }
        $.ajax({
            type: "post",    //提交方式
            async: true,  //是否异步
            data: data,        //转为JSON格式
            dataType: 'text',
            url: path +'PostionSend/updateType.do',
            success: function (data) {
                alert(1);
                This.init()
            }, error: function () {
                alert('基本资料修改错误')
            }

        });

    })
    $('#pop_four').find('.jj_zw').unbind().on('click',function (){              //拒绝
        var aa=$(this).parent().parent().parent().prev();
        var pmsgId=aa.attr('data-pmsgId');

        var data={
            pmsgId:pmsgId,
            pmsgName:3,                     //同意
        }
        $.ajax({
            type: "post",    //提交方式
            async: true,  //是否异步
            data: data,        //转为JSON格式
            dataType: 'json',
            url: path + 'PostionSend/updateType.do',
            success: function (data) {

                This.init()
            }, error: function () {
                alert('基本资料修改错误')
            }

        });
    })
}







$(function (){

     var qbzt=new Qbzt();
     qbzt.xxk_sj();

     var ytd=new Ytd();
     ytd.xxk_sj();

    var yck=new Yck();
    yck.xxk_sj();

    var msyy=new Msyy();
    msyy.xxk_sj();


})
