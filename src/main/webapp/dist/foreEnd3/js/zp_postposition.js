

function Qxdx(){        //全局对象
    this.pages=0;       //总页数

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
parent.prototype.fy_sj=function (parent,pages,page){        //参数1父级
    var This=this;
    var aa=$(parent).find('.zp_botv a')
    $(parent).find('.zp_botv a').each(function (i,e){

        if(i==0&&page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){

                data.page-=1;                         //减少1页

            })
        }
        if(i!=0&&i!=aa.length-1&&i!=page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){

                data.page=i;                          //设置你点的位置

            })
        }
        if(i==aa.length-1&&pages==page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&pages!=page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&pages!=page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){

                data.page+=1;                         //增加1页

            })
        }

    })
}


function Qbzt(){

}
Qbzt.prototype=new parent();
Qbzt.prototype.loader=function (obj,url){
    var This=this;
    var str='';
    var data={
        pages:3,
        page:1,
        cont:[{},{},{}]
    };
    qxdx.pages=data.pages;
    qxdx.jl.qbzt=data.page;

    for(var i=0;i<data.cont.length;i++){
        str+='<div class="pop_have">'
        str+='<div class="pop_left2">'
        str+='<img src="'+path+'dist/foreEnd3/img/small.jpg" alt="" class="pop_head">'
        str+='<div class="pop_test2">'
        str+='<h4 style="display: inline-block">网站美工/网页设计师</h4>'
        str+='<div style="color: #fc6866;display: inline-block;margin-left: 10px">10万</div>'
        str+='<div style="display: inline-block;margin-left: 20px">吉林省江山网络科技公司</div>'
        str+='<div class="pop_in2">'
        str+='<span class="pop_sp">沈阳</span>|'
        str+='<span>1年经验</span>|'
        str+='<span>互联网/移动联网/电子商务</span>'
        str+='</div>'
        str+='<div style="margin-top: -10px">'
        str+='<button class="pop_but" style="margin-left: 200px">'
        str+='<span class="fa fa-chevron-down"></span>'
        str+='</button>'
        str+='<span style="margin-left: 190px;color: #666">4小时前</span>'
        str+='</div>'
        str+='</div>'
        str+='</div>'
        str+='<div class="pop-right-bottom">'
        str+='<b>快</b>'
        str+='</div>'
        str+='</div>'
    }

    return str   //返回
}
Qbzt.prototype.seekCont=function (){
    var _public_ssk={}
    _public_ssk.resumeId=resumeId;                              //ID
    _public_ssk.page=qxdx.jl.qbzt;                              //全部状态分页
    _public_ssk.zt=0                                            //状态
    return _public_ssk
}
Qbzt.prototype.init=function (){            //初始化载入数据
    var This=this;
    var data=This.seekCont();
    var cont=This.loader(data,"/dada");
    $('#pop_one .pop_cont').html(cont);
    var fy= This.fy(qxdx.pages,qxdx.jl.qbzt);
    $('#pop_one .zp_botv').html(fy);

}


$(function (){

    // var qbzt=new Qbzt();
    // qbzt.init();

})
