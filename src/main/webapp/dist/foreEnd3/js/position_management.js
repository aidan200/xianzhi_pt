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
}
var _public=new Public(); //创建全局对象实例

function Zzzp(){
    this.postionId=0;         //职位id             1
    this.postionName='',      //1.职位名称         1
    this.yprx=0,              //2.应聘人选
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
            _public.total=data.total;     //记录总数
            _public.pages=data.pages;     //页数
            _public.size=data.size;       //不知道啥
            _public.page=data.page;       //当前页
            _public.searchMap=data.searchMap   //查询条件




            for(var i=0;i<data.postionList.length;i++){        //将值传给对象
                var zzzp =new Zzzp();
                zzzp.postionId=data.postionList[i].postionId;
                zzzp.postionName=data.postionList[i].postionName;
                //应聘人选空着呢
                zzzp.wcl=data.postionList[i].wcl;
                zzzp.zdxz=data.postionList[i].zdxz;
                zzzp.yxgt=data.postionList[i].yxgt;
                zzzp.createTime=data.postionList[i].createTime;
                zzzp.deleteTime=data.postionList[i].deleteTime;
                zzzp.dd=data.postionList[i].dd;
                zzzp.ms=data.postionList[i].ms;
                This.cont[i]=zzzp;
            }
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
                str+='<td class="all_no">我还空着呢</td>'
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
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}
Zzzp.prototype.seekCont=function (){
    var parent=$('#xxk_01').parent().parent()
    var _public_ssk=new Public();                                  //创建搜索对象
    _public_ssk.companyId=companyId;                                //企业ID
    _public_ssk.postionName=parent.find('input').eq(0).val();       //获取到关键字(职位名称)
    _public_ssk.postionSpace=parent.find('input').eq(1).val();      // 获取到关键字文本内容
    _public_ssk.beginDate=parent.find('input').eq(2).val();         // 获取到开始日期
    _public_ssk.endDate=parent.find('input').eq(3).val();           // 获取到截止日期
    return _public_ssk
}
Zzzp.prototype.load=function (){    //初始化逻辑
    var This=this
    var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级

    //初始化加载
    if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
        var data={
            companyId:companyId
        }
        This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
    }else{
        var data=This.seekCont()                     //获取到条件对象

        This.cshjz(data);                     //条件加载
    }
    //点击选项卡时候加载
    $('#myTab a').eq(0).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            var data={
                companyId:companyId
            }
            This.cshjz(data);       //判断如果搜索框里没有条件则执行默认加载
        }else{
            var data=This.seekCont()                     //获取到条件对象
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
                companyId:companyId
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
                    companyId:companyId
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
         if(i==0 ){                         //上一页事件(如果是第一页不设置事件)&&_public.page!=1
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();              //获取到条件
                 data.page-=1;                         //减少1页
                 This.cshjz(data);                     //条件加载
             })
         }
         if(i!=0&&i!=aa.length-1&&i!=_public.page){   //点击选页(当前页不设置事件)
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();              //获取到条件
                 data.page=i;                          //设置你点的位置
                 This.cshjz(data);                     //条件加载
             })
         }
         if(i==aa.length-1&&_public.pages!=_public.page){   //下一页(如果是最后一页不设置时间)
             $(e).unbind().on('click',function (){
                 var data=This.seekCont();             //获取到条件
                 data.page+=1;                         //增加1页
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
$(function (){

    var zzzp=new Zzzp();                    //正在招聘页
    zzzp.init();                             //初始化


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