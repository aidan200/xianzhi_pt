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



//全局方法
function Public(){               //父类（公用的对象）
    this.companyId=companyId;
    this.total=0               //总数
    this.pages=0               //页数
    this.size=0                //不知道什么
    this.page=0                //当前页
    this.searchMap={           //查询条件

    }
    this.postionWelfare;        //查询类型
    this.jl={                   //记录页数对象

    }
}
var _public=new Public(); //创建全局对象实例;
Public.prototype.huoqu=function (tbody,obj){ //全局查询方法
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:obj,        //转为JSON格式
        dataType:'json',                   //定义返回data类型
        url:path+'Resume/selectResume.do',    //路径
        success:function (data){//data 就是数据 json
            This.pages=data.pages;              //获取总页
            This.page=data.page;               //获取当前页
        var str=''
            for(var i=0;i<data.resumeList.length;i++){
                str+='<tr class="pom_h" data-id="'+data.resumeList[i].resumeId+'">'
                str+='<td>'
                str+='<div class="checkboxWrapper theme3 extraSmallCheckboxSize">'
                str+='<input type="checkbox" id="rem101"'+i+' class="choose2">'
                str+='<label for="rem101"+i style="font-weight: normal;margin-bottom: 0">'
                str+=svn_btn
                str+='</label>'
                str+='</div>'
                str+='</td>'
                str+='<td class="all_no">'+data.resumeList[i].resumeName+'</td>'
                if(data.resumeList[i].resumeSex==0){
                    str+='<td class="all_no" data-xb="'+data.resumeList[i].resumeSex+'">男</td>'
                }else{
                    str+='<td class="all_no" data-xb="'+data.resumeList[i].resumeSex+'">女</td>'
                }
                var aa= getNowFormatDate(data.resumeList[i].resumeBirth).substring(0, 4)
                var bb=getNowFormatDate(new Date()).substring(0, 4);
                var sj=bb-aa;
                str+='<td class="all_no">'+sj+'</td>'           //页面负责运算计算年龄
                str+='<td class="all_no">没有</td>'    //学历有问题'+data.resumeList[i].xzResumeEducations+'

                var cc=data.resumeList[i].resumeWorkinglife     //计算出开始工作年限
                var js2=bb-cc;
                str+='<td class="all_no">'+js2+'</td>'
                str+='<td class="all_no">'+data.resumeList[i].resumePosition  +'</td>' //目前职位
                str+='<td class="all_no">'+data.resumeList[i].resumeField  +'</td>'   //目前公司
                str+='<td class="all_no">'+data.resumeList[i].resumeIntentPosition  +'</td>'  //应聘职位
                str+='<td class="all_no">'
                str+='<a href="">过滤</a>'
                str+='<a href="">待定</a>'
                str+='<a href="">不合适</a>'
                str+='<a href="">目标</a>'
                str+='</td>'
                str+='</tr>'
            }
          $(tbody+' tbody').html(str);

        alert('成功了')

        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }
    })
}


function Jlrzp(){                   //经理人应聘
    this.DOM={
        ssk:$('#rem_one .rem_cen'),     //搜索框
    }
}
Jlrzp.prototype=new Public();   //继承父类原型方法
Jlrzp.prototype.upload=function (){
    var This=this;
    var data={
        companyId:companyId,
        zw:This.DOM.ssk.find('select').eq(0).val(),           //获取到职位
        xl:This.DOM.ssk.find('select').eq(1).val(),          //获取到学历
        xlq:This.DOM.ssk.find('input[type="checkbox"]:checked').length , //如果是0代表不选如果是1代表选中
    }
    This.huoqu('#rem_one',data);    //调用加载方法（参数1 选择给谁加，参数2 参数)



}







$(function (){
    var  jlrzp=new Jlrzp();
    jlrzp.upload();

})


