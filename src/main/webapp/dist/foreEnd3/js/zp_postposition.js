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
                    if(date3<3600000){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/60000)+'分钟前</span>'
                    }else if(date3<3600000*24){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/6000/24)+'小时前</span>'
                    }else if (date3>3600000*24){
                        str+='<span style="margin-left: 190px;color: #666">'+Math.floor(date3/3600000/24)+'天前</span>'
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
            var attr2=[];
            if(data.postionSendList.length!=0){
                for(var i=0;i<data.postionSendList.length;i++){
                    if(data.postionSendList[i].sendState==0){
                        attr2.push(data.postionSendList[i])

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
                            str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/6000/24)+'小时前</span></li>'

                        }else if (date3>3600000*24){
                            str+='<li class="pop_tl2">投递时间：<span>'+Math.floor(date3/3600000/24)+'天前</span></li>'

                        }
                        str+='</ul>'
                        str+='</div>'
                    }
                    $('#pop_two > div').each(function (i,e){                //清除之前记录
                        if(i!=0&&$(e).attr('class')!='zp_botv'){
                            $(e).remove();
                        }
                    })
                    $('#pop_two .pop_top2 ').after(str);
                    fn1()
                    }

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
    _public_ssk.type=8;                                         //8是全查
    return _public_ssk
}
Ytd.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();
    var cont=This.loader(data,"/dada");

    if(cont!=0){   //返回0代表没查到数据
        $('#pop_two > div').each(function (i,e){                //清除之前记录
            if(i!=0&&$(e).attr('class')!='zp_botv'){
                $(e).remove();
            }
        })
        $('#pop_two .pop_top2').after(cont);
        var fy= This.fy(qxdx.pages,qxdx.jl.ytd);
        $('#pop_two .zp_botv').html(fy);                     //分页插入完成
        This.fy_sj('#pop_one',qxdx.pages,qxdx.jl.ytd,This)  //事件插入完成
    }else{          //没找到数据
        $('#pop_two .pop_top2').after(mzd);
    }





}


















$(function (){

      var qbzt=new Qbzt();
     qbzt.xxk_sj();

     var ytd=new Ytd();
    ytd.init();


})
