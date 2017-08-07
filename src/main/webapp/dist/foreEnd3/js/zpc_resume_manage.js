//svn单选按钮
var svn_btn=''
svn_btn+='<i class="theI" sss="123">'
svn_btn+='<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"'
svn_btn+='width="50px" height="50px" viewBox="0 0 50 50"'
svn_btn+='enable-background="new 0 0 50 50" xml:space="preserve">'
svn_btn+='<circle fill="none" stroke="#B7B7B7" stroke-width="3" stroke-miterlimit="10" cx="25.11"'
svn_btn+='cy="24.883" r="23.519"/>'
svn_btn+='<path fill="none" stroke-width="3" stroke-miterlimit="10" d="M48.659,25c0,12.998-10.537,23.534-23.534,23.534'
svn_btn+='S1.591,37.998,1.591,25S12.127,1.466,25.125,1.466c9.291,0,17.325,5.384,21.151,13.203L19,36l-9-14"/>'
svn_btn+='</svg>'
svn_btn+='</i>'

var mzd=''      //抱歉没找到
mzd+='<div class="rem_no2">'
mzd+='<div class="rem_allimg">'
mzd+='<img src="'+path+'dist/foreEnd3/img/sfs.png" alt="">'
mzd+='<class="rem_img">'
mzd+='<p class="all_p"> 你暂时没有未处理的简历</p>'
mzd+='</div>'
mzd+='</div>'


function Jl(){
    this.companyId=companyId;
    this.total=''              //总数
    this.pages=''               //页数
    this.size=''               //不知道什么
    this.page=''               //当前页        默认值
    this.searchMap={           //查询条件

    }
    this.postionWelfare;        //查询类型

    this. wck_page=0              //未查看页数
    this. yxgg_page=0             //意向沟通页数
    this. mstz_page=0             //面试通知页数

}
var jl=new Jl();            //记录实例

//全局方法
function Public(){}               //父类（公用的对象）
Public.prototype.huoqu=function (tbody,obj,fn1,fn2){ //全局查询方法
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,        //转为JSON格式
        dataType:'json',                   //定义返回data类型
        url:path+'PostionSend/selByState.do',    //路径
        success:function (data){//data 就是数据 json
            jl.pages=data.pages;              //获取总页
            jl.page=data.page;               //获取当前页

            if(data.list.list.length!=0){
                var str=''

                for(var i=0;i<data.list.list.length;i++){
                    alert(data.list.list[i].sendState)
                    if(data.list.list[i].sendState==0){
                        jl.wck_page=data.page;             //保留页数
                        str+='<tr class="pom_h" data-id="'+data.list.list[i].resumeId+'">'
                        str+='<td>'
                        str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                        str+='<input type="checkbox" id="'+tbody+i+'" class="choose2">'
                        str+='<label for="'+tbody+i+'" style="font-weight: normal;margin-bottom: 0">'
                        str+=svn_btn
                        str+='</label>'
                        str+='</div>'
                        str+='</td>'
                        str+='<td class="all_no">'+data.list.list[i].resumeName+'</td>'
                        if(data.list.list[i].resumeSex==0){
                            str+='<td class="all_no" data-xb="'+data.list.list[i].resumeSex+'">男</td>'
                        }else{
                            str+='<td class="all_no" data-xb="'+data.list.list[i].resumeSex+'">女</td>'
                        }
                        var aa= getNowFormatDate(data.list.list[i].resumeBirth).substring(0, 4)
                        var bb=getNowFormatDate(new Date()).substring(0, 4);
                        var sj=bb-aa;
                        str+='<td class="all_no">'+sj+'</td>'           //页面负责运算计算年龄

                        if(data.list.list[i].xzResumeEducations.length==0){
                            str+='<td class="all_no">没有</td>'
                        }else{
                            str+='<td class="all_no">'+data.list.list[i].xzResumeEducations[0].educationLevel+'</td>'
                        }
                        //学历有问题'+data.resumeList[i].xzResumeEducations+'

                        var cc=data.list.list[i].resumeWorkinglife     //计算出开始工作年限
                        var js2=bb-cc;
                        str+='<td class="all_no">'+js2+'</td>'
                        str+='<td class="all_no">'+data.list.list[i].postionName  +'</td>' //目前职位
                        str+='<td class="all_no">'+data.list.list[i].resumePosition  +'</td>'  //应聘职位
                        str+='<td class="all_no">'
                        str+='<a href="javascript:;" class="zw_yl">预览</a>'
                        str+='&nbsp;'
                        str+='<a href="javascript:;" class="zw_sc">删除</a>'

                        str+='</td>'
                        str+='</tr>'
                    }  //未查看
                    if(data.list.list[i].sendState==1){           //意向沟通


                        jl.yxgg_page=data.page;             //保留页数
                        str+='<tr class="pom_h" data-id="'+data.list.list[i].resumeId+'">'  //ID
                        str+='<td>'
                        str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                        str+='<input type="checkbox" id="'+tbody+i+'" class="choose2">'
                        str+='<label for="'+tbody+i+'" style="font-weight: normal;margin-bottom: 0">'
                        str+=svn_btn
                        str+='</label>'
                        str+='</div>'
                        str+='</td>'
                        str+='<td class="all_no">人选</td>' //人选编号
                        str+='<td class="all_no">'+data.list.list[i].resumeName+'</td>'
                        if(data.list.list[i].resumeSex==0){
                            str+='<td class="all_no" data-xb="'+data.list.list[i].resumeSex+'">男</td>'
                        }else{
                            str+='<td class="all_no" data-xb="'+data.list.list[i].resumeSex+'">女</td>'
                        }

                        str+='<td class="all_no">年龄</td>'

                        str+='<td class="all_no">目前职位</td>' //目前职位
                        str+='<td class="all_no">目前公司</td>'  //目前公司
                        str+='<td class="all_no">沟通职位</td>'  //目前公司
                        str+='<td class="all_no">意向度</td>'  //意向度
                        str+='<td class="all_no">沟通时间</td>'  //意向度

                        str+='<td class="all_no">'
                        str+='<a href="javascript:;" class="zw_yums">预约面试</a>'
                        str+='&nbsp;'
                        str+='<a href="javascript:;" class="zw_sc">删除</a>'

                        str+='</td>'
                        str+='</tr>'
                    }
                    if(data.list.list[i].sendState==2){          //面试通知

                    }
                    $(tbody+' tbody').html(str);

                }

                fn1()


            }else{
                fn2()
                alert('没找到数据')
            }


        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }
    })
}

Public.prototype.fy=function (pages,page){  //总页数  当前页数
    var str=''
        str+='<div class="zp_botv">'
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
        str+='</div>'
        return str              //返回
}
Public.prototype.fy_sj=function (parent,pages,page,obj){        //参数1父级

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
                var data=This.seekCont(parent);
                data.page-=1;                         //减少1页
                obj.huoqu(parent,data,obj.cg,obj.sb);  //把自己给传过来
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont(parent);
                data.page=i;                          //设置你点的位置
                obj.huoqu(parent,data,obj.cg,obj.sb);  //把自己给传过来
            })
        }
        if(i==aa.length-1&&pages==page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&pages!=page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&pages!=page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont(parent);
                data.page+=1;                         //增加1页
                obj.huoqu(parent,data,obj.cg,obj.sb);  //把自己给传过来
            })
        }

    })
}
Public.prototype.mzd=function (parent){
    $(parent).find('.rem_no2').remove();
    $(parent).find('.tbody').css({"display":"none"});
    $(parent).find('.rem_bb').css({"display":"none"}).after(mzd);
}
Public.prototype.zdl=function (parent){
    $(parent).find('.zp_botv').remove();
     $(parent).find('.tbody').css({"display":"table-row-group;"});      //显示内容区域
     $(parent).find('.rem_bb').css({"display":"block"});                //显示操作区
}
Public.prototype.qx=function (parent){  //全选和单个选择事件
        $(parent).find('.rem_bb input').eq(0).on('click',function (){
            var aa=$(parent).find('.rem_bb  input:checked').length;                  //判断是否选中
            if(aa!=1){
                $(parent).find('.tbody tr').removeAttr('data-kg')
            }else{
                $(parent).find('.tbody tr').attr('data-kg','true');
            }
        })
        $(parent).find('i').on('click',function (){                                     //单个选择完成
            var parent=$(this).parent().parent().parent().parent()            //获取到父
            if($(parent).attr('data-kg')!='true'){          //代表选中

                $(parent).attr('data-kg','true')
            }else{
                $(parent).removeAttr('data-kg')             //没选中
            }
        })
}
Public.prototype.dcjl=function (parent){

    $(parent).find('.rem_bb  button').eq(0).on('click',function (){



    })
}

function Jlrzp(){                   //未查看
    this.DOM={
        parent:$('#rem_one')
    }
}
Jlrzp.prototype=new Public();   //继承父类原型方法
Jlrzp.prototype.seekCont=function (parent){
    var parent=$(parent).find('.rem_cen');
    var _public_ssk=jl;                                       //创建搜索对象
    _public_ssk.page=jl.wck_page;                              //替换分页
    _public_ssk.zw=parent.find('select').eq(0).val() ;         //查看
    _public_ssk.jlbh=parent.find('input').eq(0).val();         //获取到简历编号
    _public_ssk.name=parent.find('input').eq(1).val();         //获取姓名
    _public_ssk.mqrz=parent.find('input').eq(2).val();         //目前任职
    _public_ssk.mqgs=parent.find('input').eq(3).val();         //姓名
    _public_ssk.sendState=0;
    delete _public_ssk.pages;
    return _public_ssk
}
Jlrzp.prototype.upload=function (){     //初始化加载
    var This=this;
    var data=This.seekCont('#rem_one');                                 //获取到条件信息

    This.cg=function (){   //成功执行函数

        This.zdl('#rem_one');//成功显示
        This.DOM.parent.find('.rem_bb').after(This.fy(jl.pages,jl.wck_page));  //分页加载完成
        This.fy_sj('#rem_one',jl.pages,jl.wck_page,This);                       //分页事件完成
        This.qx('#rem_one');                                                //加载全选事件以及单选完成
        This.dcjl('#rem_one');
        This.JS();                                                          //选项卡点击事件加载完成
        This.yl();
    }
    This.sb=function (){                    //没查到数据执行的函数
        This.mzd('#rem_one');                       //没找到执行的
    }
    This.huoqu('#rem_one',data,This.cg,This.sb);    //调用加载方法（参数1 选择给谁加，参数2 参数)
}
Jlrzp.prototype.JS=function (){                     //点击事件加载
    var This=this
    $('#myTab li a').eq(0).unbind().on('click',function (){      //经理人应聘选项卡加载
        This.upload();
    })
    $(This.DOM.parent).find('.rem_b').unbind().on('click',function (){   //搜索事件按钮
        jl.page=1;                                              //搜索时候
        This.upload();
    })
}
Jlrzp.prototype.yl=function (){     //预览事件
    $('#rem_one').find('.zw_yl').unbind().on('click',function(){        //预览事件
        alert('aaa')
    })
    $('#rem_one').find('.zw_sc').unbind().on('click',function(){        //删除事件
        alert('aa')
    })
}


function Yxgt(){                   //未查看
    this.DOM={
        parent:$('#rem_five')
    }
}
Yxgt.prototype=new Public();   //继承父类原型方法
Yxgt.prototype.seekCont=function (parent){
    var parent=$(parent).find('.rem_five');
    var _public_ssk=jl;                                       //创建搜索对象
    _public_ssk.zw=parent.find('select').eq(0).val() ;         //查看
    _public_ssk.jlbh=parent.find('input').eq(0).val();         //获取到简历编号
    _public_ssk.name=parent.find('input').eq(1).val();         //获取姓名
    _public_ssk.mqrz=parent.find('input').eq(2).val();         //目前任职
    _public_ssk.mqgs=parent.find('input').eq(3).val();         //姓名
    _public_ssk.sendState=1;
    delete _public_ssk.pages;
    return _public_ssk
}
Yxgt.prototype.upload=function (){     //初始化加载
    var This=this;
    var data=This.seekCont('#rem_five');                                 //获取到条件信息

    This.cg=function (){   //成功执行函数

        This.zdl('#rem_five');//成功显示
        This.DOM.parent.find('.rem_bb').after(This.fy(jl.pages,jl.page));  //分页加载完成
        This.fy_sj('#rem_five',jl.pages,jl.page,This);                       //分页事件完成
        This.qx('#rem_five');                                                //加载全选事件以及单选完成
        This.dcjl('#rem_five');
        This.JS();                                                          //选项卡点击事件加载完成
        This.yl();
    }
    This.sb=function (){                    //没查到数据执行的函数
        This.mzd('#rem_five');                       //没找到执行的
    }
    This.huoqu('#rem_five',data,This.cg,This.sb);    //调用加载方法（参数1 选择给谁加，参数2 参数)
}
Yxgt.prototype.JS=function (){                     //点击事件加载
    var This=this
    $('#myTab li a').eq(3).unbind().on('click',function (){      //经理人应聘选项卡加载
        This.upload();
    })
    $(This.DOM.parent).find('.rem_b').unbind().on('click',function (){   //搜索事件按钮
        jl.page=1;                                              //搜索时候
        This.upload();
    })
}
Yxgt.prototype.yl=function (){     //预览事件
    $('#rem_five').find('.zw_yl').unbind().on('click',function(){        //预览事件
        alert('aaa')
    })
    $('#rem_five').find('.zw_sc').unbind().on('click',function(){        //删除事件
        alert('aa')
    })
}

function Mstz(){                   //未查看
    this.DOM={
        parent:$('#rem_seven')
    }
}
Mstz.prototype=new Public();   //继承父类原型方法
Mstz.prototype.seekCont=function (parent){
    var parent=$(parent).find('.rem_seven');
    var _public_ssk=jl;                                       //创建搜索对象
    _public_ssk.zw=parent.find('select').eq(0).val() ;         //查看
    _public_ssk.jlbh=parent.find('input').eq(0).val();         //获取到简历编号
    _public_ssk.name=parent.find('input').eq(1).val();         //获取姓名
    _public_ssk.mqrz=parent.find('input').eq(2).val();         //目前任职
    _public_ssk.mqgs=parent.find('input').eq(3).val();         //姓名
    _public_ssk.sendState=2;
    delete _public_ssk.pages;
    return _public_ssk
}
Mstz.prototype.upload=function (){     //初始化加载
    var This=this;
    var data=This.seekCont('#rem_seven');                                 //获取到条件信息

    This.cg=function (){   //成功执行函数

        This.zdl('#rem_seven');//成功显示
        This.DOM.parent.find('.rem_bb').after(This.fy(jl.pages,jl.page));  //分页加载完成
        This.fy_sj('#rem_seven',jl.pages,jl.page,This);                       //分页事件完成
        This.qx('#rem_seven');                                                //加载全选事件以及单选完成
        This.dcjl('#rem_seven');
        This.JS();                                                          //选项卡点击事件加载完成
        This.yl();
    }
    This.sb=function (){                    //没查到数据执行的函数
        This.mzd('#rem_seven');                       //没找到执行的
    }
    This.huoqu('#rem_seven',data,This.cg,This.sb);    //调用加载方法（参数1 选择给谁加，参数2 参数)
}
Mstz.prototype.JS=function (){                     //点击事件加载
    var This=this
    $('#myTab li a').eq(4).unbind().on('click',function (){      //经理人应聘选项卡加载
        This.upload();
    })
    $(This.DOM.parent).find('.rem_b').unbind().on('click',function (){   //搜索事件按钮
        jl.page=1;                                              //搜索时候
        This.upload();
    })
}
Mstz.prototype.yl=function (){     //预览事件
    $('#rem_seven').find('.zw_yl').unbind().on('click',function(){        //预览事件
        alert('aaa')
    })
    $('#rem_seven').find('.zw_sc').unbind().on('click',function(){        //删除事件
        alert('aa')
    })
}







$(function (){
    var  jlrzp=new Jlrzp();
    jlrzp.upload();

     var  yxgt=new Yxgt();
     yxgt.JS();             //点击时候执行

})


