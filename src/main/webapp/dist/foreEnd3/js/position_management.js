/**
 * Created by Administrator on 2017/7/25.
 */

//svn单选按钮
var svn_btn=''
svn_btn+='<i>'
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
function Zzzp(){
    this.id=0;
    this.name='',             //1.职位名称
    this.yprx=0,              //2.应聘人选
    this.wcl=0,               //3.未处理
    this.zdxz=0,              //4.主动下载
    this.yxgt=0,              //5.意向沟通
    this.msk=0,               //6.面试快
    this.sxsj=0,              //7.刷新时间
    this.jssj=0;              //8.结束时间
    this.zs=0                 //9.总数
    this.cont=[]              //10装对象的数组
    this.Dom={                //装在常用DOM

    }
}
//初始化载入方法开始
Zzzp.prototype.load=function (){    //初始化载入方法结束
    var This=this
    var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级
    var del=function (){
        var data={
            zs:10,
            cont:[
                {
                    id:1,
                    name:"前端",
                    yprx:"前端",
                    wcl:"前端",
                    zdxz:"前端",
                    yxgt:"前端",
                    msk:"前端",
                    sxsj:"前端",
                    jssj:"前端",

                },
                {
                    id:2,
                    name:"前端",
                    yprx:"前端",
                    wcl:"前端",
                    zdxz:"前端",
                    yxgt:"前端",
                    msk:"前端",
                    sxsj:"前端",
                    jssj:"前端",

                }
            ]
        }
        for(var i=0;i<data.cont.length;i++){        //将值传给对象
            var zzzp =new Zzzp();
            zzzp.name=data.cont[i].name;
            zzzp.yprx=data.cont[i].yprx;
            zzzp.wcl=data.cont[i].wcl;
            zzzp.zdxz=data.cont[i].zdxz;
            zzzp.yxgt=data.cont[i].yxgt;
            zzzp.msk=data.cont[i].msk;
            zzzp.sxsj=data.cont[i].sxsj;
            zzzp.jssj=data.cont[i].jssj;
            zzzp.id=data.cont[i].id;
            This.cont[i]=zzzp;
        }
        var str=''
        for(var i=0;i<This.cont.length;i++){
            str+='<tr data-id="'+This.cont[i].id+'">'
            str+='<td>'
            str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
            str+='<input type="checkbox" id="pom10'+i+'" class="choose2">'
            str+='<label for="pom10'+i+'" style="font-weight: normal;margin-bottom: 0">'
            str+=svn_btn
            str+='</label>'
            str+='</div>'
            str+='</td>'
            str+='<td class="all_no"><a href="">'+This.cont[i].name+'</a></td>'
            str+='<td class="all_no">'+This.cont[i].yprx+'</td>'
            str+='<td class="all_no">'+This.cont[i].wcl+'</td>'
            str+='<td class="all_no">'+This.cont[i].zdxz+'</td>'
            str+='<td class="all_no">'+This.cont[i].yxgt+'</td>'
            str+='<td class="all_no">'+This.cont[i].msk+'</td>'
            str+='<td class="all_no">'+This.cont[i].sxsj+'</td>'
            str+='<td class="all_no">'+This.cont[i].jssj+'</td>'
            str+='<td class="all_no">'
            str+=' <a href="javascript:;" class="dg_xg">暂停</a> '
            str+=' <a href="javascript:;" class="dg_sc">结束</a> '
            str+='</td>'
            str+='</tr>'
        }
        $('#zzzp_tbody').html(str)      //输出到页面上
    }
    if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
        del();//默认载入第一个页面
    }
    $('#myTab a').eq(0).unbind().on('click',function (){
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            del();                               //当选中我时候载入界面
            This.updata()                       //单行修改
            This.allupdata()                    //input选中时间
        }
    })
    //

}
Zzzp.prototype.seekCont=function (){                    //搜索框方法
        var parent=$('#xxk_01').parent().parent()
        var data={
            gjz:parent.find('select').val(),                //获取到关键字类型
            gjzCont:parent.find('input').eq(0).val(),      // 获取到关键字文本内容
            ksrq:parent.find('input').eq(1).val(),         // 获取到开始日期
            jsrq:parent.find('input').eq(2).val(),         // 获取到截止日期
        }
        alert(data.gjz)
        // $.ajax({
        //     type:"post",
        //     async:true,
        //     contentType: "application/json",
        //     data:JSON.stringify(data),
        //     dataType:'json',
        //     url:path+'Resume/updateResume.do',
        //     success:function (data){
        //
        //
        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })
}
Zzzp.prototype.seek=function (){    //搜索框业务逻辑
    var This=this
    $('#xxk_01').unbind().on('click',function (){
        This.seekCont()
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
        alert('aaa')
        // $.ajax({
        //     type:"post",
        //     async:true,
        //     contentType: "application/json",
        //     data:JSON.stringify(data),
        //     dataType:'json',
        //     url:path+'Resume/updateResume.do',
        //     success:function (data){
        //
        var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级
        if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
            alert('执行了默认加载')
            This.load()                         //加载默认页面
            This.updata()                       //单行修改
            This.allupdata()                    //input选中事件
        }else{
            alert('执行了条件')
            This.seekCont()                     //执行条件查询
        }
        //     },error:function (){ //报错执行的
        //         alert('搜索框方法错误')
        //     }
        //
        // })

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
        // $.ajax({
        //     type:"post",
        //     async:true,
        //     contentType: "application/json",
        //     data:JSON.stringify(data),
        //     dataType:'json',
        //     url:path+'Resume/updateResume.do',
        //     success:function (data){
        //
            var xxk=$('#xxk_01').parent().parent();  //选择到搜索框父级
            if(xxk.find('input').eq(0).val()==''&&xxk.find('input').eq(1).val()==''&&xxk.find('input').eq(2).val()==''){
                alert('执行了默认加载')
                This.load()                         //加载默认页面
                This.updata()                       //单行修改
                This.allupdata()                    //input选中事件
            }else{
                alert('执行了条件')
                This.seekCont()                     //执行条件查询
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
Zzzp.prototype.allupdata=function (){   //全选删除方法以及单个删除方法
    $('#zzzp_tbody i').unbind().on('click',function (){
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
Zzzp.prototype.updata2=function (){      //分页方法


}
Zzzp.prototype.init=function (){        //初始化方法
    var This=this
    This.load()                         //加载页面
    This.seek()                         //搜索框时间
    This.updata()                       //单行修改
    This.allupdata()                    //input选中时间
}

$(function (){
    var zzzp=new Zzzp();                    //正在招聘页
    zzzp.init();



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