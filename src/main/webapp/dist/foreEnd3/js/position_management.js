/**
 * Created by Administrator on 2017/7/25.
 */

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
mzd+='<div class="comh_no2" style="display: block">'
mzd+='<div class="pom_allimg">'
mzd+='<img src="'+path+'dist/foreEnd3/img/sfs.png" alt="" class="rem_img">'
mzd+='<p class="all_p">抱歉没有找到符合条件的职位</p>'
mzd+='</div>'
mzd+='</div>'

/*
* 正在招聘
* */
//需要方法
//1.载入方法
//2.搜索方法
//3.全选删除方法
//4.单行操作方法
//5.分页方法

//需要属性 1.职位名称 2.应聘人选 3.未处理 4.主动下载 5.意向沟通 6.面试快 7.刷新时间 8.结束时间 .9总数

//正在招聘开始
function Public(){             //(当前页状态)
    this.companyId=companyId;
    this.total=0               //总数
    this.pages=0               //页数
    this.size=0                //不知道什么
    this.page=0                //当前页
    this.searchMap={           //查询条件

    }
    this.postionWelfare;
}
var _public=new Public(); //创建全局对象实例;

function Jl(){              //几率上一次页数
    this.zzzp=0             // 记录正在招聘页数
    this.shz=0              // 记录审核中页数
    this.shwtg=0            // 记录审核未通过
    this.cgzw=0             // 草稿职位开始
    this.yzt=0              // 几率已暂停
    this.yjs=0              // 已结束
    this.qbzw=0             // 全部职位
}
var jl=new Jl()             //实例




//*****************正在招聘开始*******************
function Zzzp(){
    this.postionId=0;         //职位id             1
    this.postionName='',      //1.职位名称         1
    this.yprx=0,              //2.应聘人选         1
    this.wcl=0,               //3.未处理           1
    this.zdxz=0,              //4.主动下载         1
    this.yxgt=0,              //5.意向沟通         1
    this.createTime=0,        //7.刷新时间         1
    this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Zzzp.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.zzzp=data.page;
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态

                for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                        var zzzp =new Zzzp();
                        zzzp.postionId=data.postionList[i].postionId;
                        zzzp.postionName=data.postionList[i].postionName;
                        zzzp.yprx=data.postionList[i].alls;     //应聘人选
                        zzzp.wcl=data.postionList[i].wcl;
                        zzzp.zdxz=data.postionList[i].zdxz;
                        zzzp.yxgt=data.postionList[i].yxgt;
                        zzzp.createTime=data.postionList[i].createTime;
                        zzzp.deleteTime=data.postionList[i].deleteTime;
                        zzzp.dd=data.postionList[i].dd;
                        zzzp.ms=data.postionList[i].ms;
                        This.cont[i]=zzzp;
                }
                if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                    $('#pom_one .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                    $('#pom_one .zp_botv').css({'display':"block"})
                    $('#pom_one .pom_bottom').css({'display':"block"})


                    var str=''
                    for(var i=0;i<This.cont.length;i++){
                        str+='<tr data-id="'+This.cont[i].postionId+'">'
                        str+='<td>'
                        str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                        str+='<input type="checkbox" id="pom10'+i+'" class="choose2">'
                        str+='<label for="pom10'+i+'" style="font-weight: normal;margin-bottom: 0">'
                        str+=svn_btn
                        str+='</label>'
                        str+='</div>'
                        str+='</td>'
                        str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                        str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                        str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                        str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                        str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                        str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                        str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                        str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                        str+='<td class="all_no">'
                        str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                        str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                        str+='</td>'
                        str+='</tr>'
                    }
                    $('#zzzp_tbody').html(str)      //输出到页面上
                    $('#pom_one .pom_bottom .gs_zwzs').html(_public.total);
                    This.allupdata()                    //input选中时间
                    This.updata();                      //单号操作事件
                    This.paging();                      //分页信息
                    This.paging_sj()                    //分页事件

                }else if(This.cont.length==0){
                    $('#zzzp_tbody').html('')
                    $('#pom_one .zp_botv').css({'display':"none"})
                    $('#pom_one .pom_bottom').css({'display':"none"})
                    if($('#pom_one .comh_no2').length<1){
                        $("#pom_one").append(mzd)           //插入元素没找到
                    }
                }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Zzzp.prototype.seekCont=function (){
    var parent=$('#xxk_01').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象

    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=3                                    //3是查找正在招聘
    return _public_ssk
}
Zzzp.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级

    //初始化加载
    if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
        var data={
            companyId:companyId,
            postionWelfare:3
        }
        if(jl.zzzp!=0){     //记录上一次位置
            data.page=jl.zzzp
        }
        This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
    }else{
        var data=This.seekCont()                     //获取到条件对象
        if(jl.zzzp!=0){     //记录上一次位置
            data.page=jl.zzzp
        }
        This.cshjz(data);                     //条件加载
    }
    //点击选项卡时候加载
    $('#myTab a').eq(0).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:3
            }
            if(jl.zzzp!=0){     //记录上一次位置
                data.page=jl.zzzp
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            if(jl.zzzp!=0){     //记录上一次位置
                data.page=jl.zzzp
            }
            This.cshjz(data);
        }
    })


}
Zzzp.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_01').unbind().on('click',function (){
       var data=This.seekCont()
        This.cshjz(data);                     //条件加载
    })
}
Zzzp.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_one i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_one .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_one .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#zzzp_tbody tr').removeAttr('data-kg')
        }else{
            $('#zzzp_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_one  .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#zzzp_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Zzzp.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
                postionWelfare:3
            }
            if(jl.zzzp!=0){
                data.page=jl.zzzp;
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象

            This.cshjz(data);                           //条件加载

        }


    })
}
Zzzp.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
            var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级
            if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
                alert('执行了默认加载')
                var data={
                    companyId:companyId,
                    postionWelfare:3
                }
                if(jl.zzzp!=0){
                    data.page=jl.zzzp;
                }
                This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
            }else{
                var data=This.seekCont()                     //获取到条件对象
                This.cshjz(data);                           //条件加载
            }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Zzzp.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#zzzp_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#zzzp_tbody  .dg_sc')       //单个结束事件
}
Zzzp.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_one .zp_botv').html(str)
}
Zzzp.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_one .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();              //获取到条件
                 data.page-=1;                         //减少1页
                 jl.zzzp=data.page;                    //记录页数
                 This.cshjz(data);                     //条件加载
             })
         }
         if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();              //获取到条件
                 data.page=i;                          //设置你点的位置
                 jl.zzzp=data.page;                    //记录页数
                 This.cshjz(data);                     //条件加载
             })
         }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
         if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();             //获取到条件
                 data.page+=1;                         //增加1页
                 jl.zzzp=data.page;                    //记录页数
                 This.cshjz(data);                     //条件加载


             })
         }
    })

}
Zzzp.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//******************正在招聘结束******************
//*******************审核中开始*******************
function Shz(){              //审核中
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Shz.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.shz=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var shz =new Shz();
                shz.postionId=data.postionList[i].postionId;
                shz.postionName=data.postionList[i].postionName;
                shz.yprx=data.postionList[i].alls;     //应聘人选
                shz.wcl=data.postionList[i].wcl;
                shz.zdxz=data.postionList[i].zdxz;
                shz.yxgt=data.postionList[i].yxgt;
                shz.createTime=data.postionList[i].createTime;
                shz.deleteTime=data.postionList[i].deleteTime;
                shz.dd=data.postionList[i].dd;
                shz.ms=data.postionList[i].ms;
                This.cont[i]=shz;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_eight .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_eight .zp_botv').css({'display':"block"})
                $('#pom_eight .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom20'+i+'" class="choose2">'
                    str+='<label for="pom20'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#shz_tbody').html(str)      //输出到页面上
                $('#pom_eight .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#shz_tbody').html('')
                $('#pom_eight .zp_botv').css({'display':"none"})
                $('#pom_eight .pom_bottom').css({'display':"none"})
                if($('#pom_eight .comh_no2').length<1){
                    $("#pom_eight").append(mzd)           //插入元素没找到
                }

            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Shz.prototype.seekCont=function (){
    var parent=$('#xxk_02').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=1                                    //3是查找正在招聘
    return _public_ssk
}
Shz.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_02').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(1).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:1
            }
            if(jl.shz!=0){     //记录上一次位置
                data.page=jl.shz
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.shz!=0){     //记录上一次位置
                data.page=jl.shz
            }
            This.cshjz(data);
        }
    })


}
Shz.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_02').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Shz.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_eight i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_eight .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_eight .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#shz_tbody tr').removeAttr('data-kg')
        }else{
            $('#shz_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_eight  .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#shz_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Shz.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_02').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
                postionWelfare:1
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


    })
}
Shz.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_02').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
                postionWelfare:1
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Shz.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#shz_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#shz_tbody  .dg_sc')       //单个结束事件
}
Shz.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_eight .zp_botv').html(str)
}
Shz.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_eight .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.shz=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.shz=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.shz=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Shz.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//*******************审核中结束了*******************
//*******************审核未通过开始*******************
function Shwtg(){              //审核未
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Shwtg.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.shwtg=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var shwtg =new Shwtg();
                shwtg.postionId=data.postionList[i].postionId;
                shwtg.postionName=data.postionList[i].postionName;
                shwtg.yprx=data.postionList[i].alls;     //应聘人选
                shwtg.wcl=data.postionList[i].wcl;
                shwtg.zdxz=data.postionList[i].zdxz;
                shwtg.yxgt=data.postionList[i].yxgt;
                shwtg.createTime=data.postionList[i].createTime;
                shwtg.deleteTime=data.postionList[i].deleteTime;
                shwtg.dd=data.postionList[i].dd;
                shwtg.ms=data.postionList[i].ms;
                This.cont[i]=shwtg;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_two .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_two .zp_botv').css({'display':"block"})
                $('#pom_two .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom30'+i+'" class="choose2">'
                    str+='<label for="pom30'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#shwtg_tbody').html(str)      //输出到页面上
                $('#pom_two .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#shwtg_tbody').html('')
                $('#pom_two .zp_botv').css({'display':"none"})
                $('#pom_two .pom_bottom').css({'display':"none"})
                if($('#pom_two .comh_no2').length<1){
                    $("#pom_two").append(mzd)           //插入元素没找到
                }
            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Shwtg.prototype.seekCont=function (){
    var parent=$('#xxk_03').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=2                                  //3是查找正在招聘
    return _public_ssk
}
Shwtg.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_03').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(2).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:2            //审核未通过
            }
            if(jl.shwtg!=0){     //记录上一次位置
                data.page=jl.shwtg
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.shwtg!=0){     //记录上一次位置
                data.page=jl.shwtg
            }
            This.cshjz(data);
        }
    })


}
Shwtg.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_03').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Shwtg.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_two i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_two .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_two .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#shwtg_tbody tr').removeAttr('data-kg')
        }else{
            $('#shwtg_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_two .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#shwtg_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Shwtg.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_03').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
                postionWelfare:2
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


    })
}
Shwtg.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_03').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
                postionWelfare:2
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Shwtg.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#shwtg_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#shwtg_tbody  .dg_sc')       //单个结束事件
}
Shwtg.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_two .zp_botv').html(str)
}
Shwtg.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_two .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.shwtg=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.shwtg=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.shwtg=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Shwtg.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//*******************审核未通过结束*******************
//*******************草稿开始*******************
function Cgzw(){              //审核未
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Cgzw.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.cgzw=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var cgzw =new Cgzw();
                cgzw.postionId=data.postionList[i].postionId;
                cgzw.postionName=data.postionList[i].postionName;
                cgzw.yprx=data.postionList[i].alls;     //应聘人选
                cgzw.wcl=data.postionList[i].wcl;
                cgzw.zdxz=data.postionList[i].zdxz;
                cgzw.yxgt=data.postionList[i].yxgt;
                cgzw.createTime=data.postionList[i].createTime;
                cgzw.deleteTime=data.postionList[i].deleteTime;
                cgzw.dd=data.postionList[i].dd;
                cgzw.ms=data.postionList[i].ms;
                This.cont[i]=cgzw;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_three .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_three .zp_botv').css({'display':"block"})
                $('#pom_three .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom30'+i+'" class="choose2">'
                    str+='<label for="pom30'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#cgzw_tbody').html(str)      //输出到页面上
                $('#pom_three .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#cgzw_tbody').html('')
                $('#pom_three .zp_botv').css({'display':"none"})
                $('#pom_three .pom_bottom').css({'display':"none"})
                if($('#pom_three .comh_no2').length<1){
                    $("#pom_three").append(mzd)           //插入元素没找到
                }
            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Cgzw.prototype.seekCont=function (){
    var parent=$('#xxk_04').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=0                                    //0是草稿箱
    return _public_ssk
}
Cgzw.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_04').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(3).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:0            //审核未通过
            }
            if(jl.cgzw!=0){     //记录上一次位置
                data.page=jl.cgzw
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.cgzw!=0){     //记录上一次位置
                data.page=jl.cgzw
            }
            This.cshjz(data);
        }
    })


}
Cgzw.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_04').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Cgzw.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_three i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_three .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_three .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#cgzw_tbody tr').removeAttr('data-kg')
        }else{
            $('#cgzw_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_three .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#cgzw_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Cgzw.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            postionId:parent.attr('data-id')     //职位ID
        };
        $.ajax({
            type:"get",    //提交方式
            async:true,  //是否异步
            data:data,        //转为JSON格式
            dataType:'json',                   //定义返回data类型
            url:path+'Postion/updateStateIng.do',    //路径
            success:function (data2){//data 就是数据 json
                var xxk=$('#xxk_04').parent().parent();  //选择到搜索框父级
                if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
                    var data={
                        companyId:companyId,
                        postionWelfare:0
                    }
                    This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
                }else{
                    alert('执行了条件')
                    var data=This.seekCont()                     //获取到条件对象
                    This.cshjz(data);                           //条件加载
                }

            },error:function (){ //报错执行的
                alert('基本资料修改错误')
            }
        })



    })
}
Cgzw.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_04').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
                postionWelfare:0
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Cgzw.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#pom_three  .dg_xg')       //单个暂停事件
    This.operateEnd('#pom_three  .dg_sc')       //单个结束事件
}
Cgzw.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_three .zp_botv').html(str)
}
Cgzw.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_three .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.cgzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.cgzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.cgzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Cgzw.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//*******************草稿结束*******************
//*******************已暂停开始*******************
function Yzt(){              //审核未
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Yzt.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.yzt=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var yzt =new Yzt();
                yzt.postionId=data.postionList[i].postionId;
                yzt.postionName=data.postionList[i].postionName;
                yzt.yprx=data.postionList[i].alls;     //应聘人选
                yzt.wcl=data.postionList[i].wcl;
                yzt.zdxz=data.postionList[i].zdxz;
                yzt.yxgt=data.postionList[i].yxgt;
                yzt.createTime=data.postionList[i].createTime;
                yzt.deleteTime=data.postionList[i].deleteTime;
                yzt.dd=data.postionList[i].dd;
                yzt.ms=data.postionList[i].ms;
                This.cont[i]=yzt;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_five .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_five .zp_botv').css({'display':"block"})
                $('#pom_five .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom30'+i+'" class="choose2">'
                    str+='<label for="pom30'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#yzt_tbody').html(str)      //输出到页面上
                $('#pom_five .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#yzt_tbody').html('')
                $('#pom_five .zp_botv').css({'display':"none"})
                $('#pom_five .pom_bottom').css({'display':"none"})
                if($('#pom_five .comh_no2').length<1){
                    $("#pom_five").append(mzd)           //插入元素没找到
                }
            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Yzt.prototype.seekCont=function (){
    var parent=$('#xxk_05').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=4                                    //0是草稿箱
    return _public_ssk
}
Yzt.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_05').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(4).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:4           //4暂停
            }
            if(jl.cgzw!=0){     //记录上一次位置
                data.page=jl.yzt
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.cgzw!=0){     //记录上一次位置
                data.page=jl.yzt
            }
            This.cshjz(data);
        }
    })


}
Yzt.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_05').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Yzt.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_five i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_five .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_five .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#yzt_tbody tr').removeAttr('data-kg')
        }else{
            $('#yzt_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_five .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#yzt_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Yzt.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_05').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
                postionWelfare:4
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


    })
}
Yzt.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_05').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
                postionWelfare:4
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Yzt.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#yzt_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#yzt_tbody  .dg_sc')       //单个结束事件
}
Yzt.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_five .zp_botv').html(str)
}
Yzt.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_five .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.yzt=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.yzt=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.yzt=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Yzt.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//*******************已暂停结束*******************
//*******************已结束开始*******************
function Yjs(){              //审核未
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Yjs.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.yjs=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var yjs =new Yjs();
                yjs.postionId=data.postionList[i].postionId;
                yjs.postionName=data.postionList[i].postionName;
                yjs.yprx=data.postionList[i].alls;     //应聘人选
                yjs.wcl=data.postionList[i].wcl;
                yjs.zdxz=data.postionList[i].zdxz;
                yjs.yxgt=data.postionList[i].yxgt;
                yjs.createTime=data.postionList[i].createTime;
                yjs.deleteTime=data.postionList[i].deleteTime;
                yjs.dd=data.postionList[i].dd;
                yjs.ms=data.postionList[i].ms;
                This.cont[i]=yjs;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_six .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_six .zp_botv').css({'display':"block"})
                $('#pom_six .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom30'+i+'" class="choose2">'
                    str+='<label for="pom30'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#yjs_tbody').html(str)      //输出到页面上
                $('#pom_six .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#yjs_tbody').html('')
                $('#pom_six .zp_botv').css({'display':"none"})
                $('#pom_six .pom_bottom').css({'display':"none"})
                if($('#pom_six .comh_no2').length<1){
                    $("#pom_six").append(mzd)           //插入元素没找到
                }
            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Yjs.prototype.seekCont=function (){
    var parent=$('#xxk_06').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    _public_ssk.postionWelfare=5                                    //5是已结束
    return _public_ssk
}
Yjs.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_06').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(5).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
                postionWelfare:5           //4暂停
            }
            if(jl.yjs!=0){     //记录上一次位置
                data.page=jl.yjs
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.yjs!=0){     //记录上一次位置
                data.page=jl.yjs
            }
            This.cshjz(data);
        }
    })


}
Yjs.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_06').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Yjs.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_six i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_six .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_six .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#yjs_tbody tr').removeAttr('data-kg')
        }else{
            $('#yjs_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_six .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#yjs_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Yjs.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_06').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
                postionWelfare:5
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


    })
}
Yjs.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_06').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
                postionWelfare:5
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Yjs.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#yjs_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#yjs_tbody  .dg_sc')       //单个结束事件
}
Yjs.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_six .zp_botv').html(str)
}
Yjs.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_six .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.yjs=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.yjs=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.yjs=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Yjs.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}
//*******************已结束结束*******************
//*******************全部职位开始*******************
function Qbzw(){              //审核未
    this.postionId=0;         //职位id                 1
    this.postionName='',      //1.职位名称             1
        this.yprx=0,              //2.应聘人选         1
        this.wcl=0,               //3.未处理           1
        this.zdxz=0,              //4.主动下载         1
        this.yxgt=0,              //5.意向沟通         1
        this.createTime=0,        //7.刷新时间         1
        this.deleteTime=0;        //8.结束时间         1
    this.dd=0                 //待定               1
    this.ms=0                 //面试               1
    //通知面试  待定
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
Qbzw.prototype.cshjz=function (obj){               //初始化加载
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,
        dataType:'json',
        url:path+'Postion/selPostionSend.do',
        success:function (data){
            jl.qbzw=data.page
            This.cont=[];
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件
            _public.postionWelfare=data.searchMap.postionWelfare; //职位状态


            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var qbzw =new Qbzw();
                qbzw.postionId=data.postionList[i].postionId;
                qbzw.postionName=data.postionList[i].postionName;
                qbzw.yprx=data.postionList[i].alls;     //应聘人选
                qbzw.wcl=data.postionList[i].wcl;
                qbzw.zdxz=data.postionList[i].zdxz;
                qbzw.yxgt=data.postionList[i].yxgt;
                qbzw.createTime=data.postionList[i].createTime;
                qbzw.deleteTime=data.postionList[i].deleteTime;
                qbzw.dd=data.postionList[i].dd;
                qbzw.ms=data.postionList[i].ms;
                This.cont[i]=qbzw;
            }
            if( This.cont.length!=0){       //判断如果后台没有查到正在招聘数据
                $('#pom_seven .comh_no2').remove();       //如果找到东西先删除掉没找到提示框
                $('#pom_seven .zp_botv').css({'display':"block"})
                $('#pom_seven .pom_bottom').css({'display':"block"})


                var str=''
                for(var i=0;i<This.cont.length;i++){
                    str+='<tr data-id="'+This.cont[i].postionId+'">'
                    str+='<td>'
                    str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                    str+='<input type="checkbox" id="pom30'+i+'" class="choose2">'
                    str+='<label for="pom30'+i+'" style="font-weight: normal;margin-bottom: 0">'
                    str+=svn_btn
                    str+='</label>'
                    str+='</div>'
                    str+='</td>'
                    str+='<td class="all_no"><a href="">'+This.cont[i].postionName+'</a></td>'
                    str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
                    str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
                    str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
                    str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
                    str+='<td class="all_no">'+This.cont[i].dd+'</td>'
                    str+='<td class="all_no">'+This.cont[i].ms+'</td>'
                    str+='<td class="all_no">'+getNowFormatDateSS(This.cont[i].postionTime)+'</td>'
                    str+='<td class="all_no">'
                    str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
                    str+=' <a href="javascript:;" class="dg_sc">结束</a> '
                    str+='</td>'
                    str+='</tr>'
                }
                $('#qbzw_tbody').html(str)      //输出到页面上
                $('#pom_seven .pom_bottom .gs_zwzs').html(_public.total);
                This.allupdata()                    //input选中时间
                This.updata();                      //单号操作事件
                This.paging();                      //分页信息
                This.paging_sj()                    //分页事件

            }else if(This.cont.length==0){
                $('#qbzw_tbody').html('')
                $('#pom_seven .zp_botv').css({'display':"none"})
                $('#pom_seven .pom_bottom').css({'display':"none"})
                if($('#pom_seven .comh_no2').length<1){
                    $("#pom_seven").append(mzd)           //插入元素没找到
                }
            }
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Qbzw.prototype.seekCont=function (){
    var parent=$('#xxk_07').parent().parent()
    var _public_ssk=_public;                                       //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    return _public_ssk
}
Qbzw.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_07').parent().parent();  //选择到搜索框父级

    //点击选项卡时候加载
    $('#myTab a').eq(6).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId,
            }
            if(jl.qbzw!=0){     //记录上一次位置
                data.page=jl.qbzw
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont();                     //获取到条件对象
            if(jl.qbzw!=0){     //记录上一次位置
                data.page=jl.qbzw
            }
            This.cshjz(data);
        }
    })


}
Qbzw.prototype.seek=function (){    //搜索框按钮点击加载
    var This=this
    $('#xxk_07').unbind().on('click',function (){
        var data=This.seekCont();
        This.cshjz(data);                     //条件加载
    })
}
Qbzw.prototype.allupdata=function (){   //全选删除方法以及单个删除方法

    $('#pom_seven i').unbind().on('click',function (){
        var parent=$(this).parent().parent().parent().parent()            //获取到父

        if($(parent).attr('data-kg')!='true'){          //代表选中

            $(parent).attr('data-kg','true')
        }else{
            $(parent).removeAttr('data-kg')             //没选中
        }
    })
    $('#pom_seven .qxan').unbind().on('click',function(){              //全选
        var kg=false;
        var aa=$('#pom_seven .qxan:checked').length;                  //判断是否选中
        if(aa!=1){
            $('#qbzw_tbody tr').removeAttr('data-kg')
        }else{
            $('#qbzw_tbody tr').attr('data-kg','true');
        }
    })
    $('#pom_seven .scan').unbind().on('click',function (){           //删除按钮事件
        var data={
            cont:[]
        }
        var index=0;                                        //到底有多少个要删除的
        $('#qbzw_tbody tr').each(function (i,e){
            if($(e).attr('data-kg')=='true'){
                data.cont[index++]={
                    positionId:$(e).attr('data-id')
                }
            }
        })
        if(index!=0){                        //在这里向后台发送AJAX
            alert(data.cont[0].positionId)
            // $.ajax({
            //     type:"post",    //提交方式
            //     async:true,  //是否异步
            //     contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
            //     data:JSON.stringify(pcont),        //转为JSON格式
            //     dataType:'json',                   //定义返回data类型
            //     url:path+'Resume/updateResume.do',    //路径
            //     success:function (data){//data 就是数据 json
            //
            //
            //     },error:function (){ //报错执行的
            //         alert('正在招聘删除错误')
            //     }
            //
            // })

        }
    })


}
Qbzw.prototype.definition=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent();
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是暂停')
        var xxk=$('#xxk_07').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认')                        //执行默认查询
            var data={
                companyId:companyId,
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            alert('执行了条件')
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


    })
}
Qbzw.prototype.operateEnd=function(obj){            //正在招聘暂停方法
    var This=this;
    $(obj).unbind().on('click',function (){
        var othis=this
        var parent=$(othis).parent().parent()
        var data={
            companyId:companyId,            //公司ID
            zwID:parent.attr('data-id')     //职位ID
        }
        alert('我是删除')
        var xxk=$('#xxk_07').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            var data={
                companyId:companyId,
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
            This.cshjz(data);                           //条件加载
        }


        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

    })
}
Qbzw.prototype.updata=function (){                  //正在招聘业务逻辑方法
    var This=this
    //在加载完成数据库后执行
    This.definition('#qbzw_tbody  .dg_xg')       //单个暂停事件
    This.operateEnd('#qbzw_tbody  .dg_sc')       //单个结束事件
}
Qbzw.prototype.paging=function (){                          //分页加载方法
    var str=''
    str+='<div class="zp_pl">'
    str+='<ul class="pagination zp_pa">'
    str+='<li class="b"><a href="javascript:;">上一页</a></li>'
    for(var i=1;i<_public.pages+1;i++){
        if(i==_public.page){
            str+='<li class="active"><a href="javascript:;">'+i+'</a></li>'
        }else{
            str+='<li class="a"><a href="javascript:;">'+i+'</a></li>'
        }
    }
    str+='<li class="a"><a href="javascript:;">下一页</a></li>'
    str+='</ul>'
    str+='<div class="zp_page">共 <span>'+_public.pages+'</span> 页</div>'
    str+='</div>'
    $('#pom_seven .zp_botv').html(str)
}
Qbzw.prototype.paging_sj=function (){      //分页事件
    var This=this
    var aa=$('#pom_seven .zp_botv a');
    aa.each(function (i,e){
        if(i==0&&_public.page==1){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==0&&_public.page!=1){
            $(e).css({"color":"#666666"})
        }
        if(i==0&&_public.page!=1){                         //上一页事件(如果是第一页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page-=1;                         //减少1页
                jl.qbzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();              //获取到条件
                data.page=i;                          //设置你点的位置
                jl.qbzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
        if(i==aa.length-1&&_public.pages==_public.page){              //样式
            $(e).css({"color":"#D8CDCA"})
        }else if(i==aa.length-1&&_public.pages!=_public.page){
            $(e).css({"color":"#666666"})
        }
        if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
            $(e).unbind().on('click',function (){
                var data=This.seekCont();             //获取到条件
                data.page+=1;                         //增加1页
                jl.qbzw=data.page
                This.cshjz(data);                     //条件加载
            })
        }
    })

}
Qbzw.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框点击加载事件
}













$(function (){

    var zzzp=new Zzzp();                    //正在招聘页
    zzzp.init();                             //初始化

    var shz=new Shz()                       //审核中
    shz.init();

    var shwtg=new Shwtg();                  //审核未通过
    shwtg.init();

    var cgzw=new Cgzw();                    //草稿
    cgzw.init();

    var yzt=new Yzt();                      //已暂停
    yzt.init()

    var yjs=new Yjs();                      //已结束
    yjs.init()

    var qbzw=new Qbzw();                    //全部职位
    qbzw.init();






})














/*
 * 审核未通过
 * */

/*
 * 草稿职位
 * */


/*
 * 已暂停
 * */

/*
 * 已结束
 * */


/*
* 全部职位
* */