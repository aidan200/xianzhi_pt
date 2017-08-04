/**
 * Created by Administrator on 2017/8/3.
 */

var json={
    postionId:postionId
}
function Knzw(){        //获取  对象

}
Knzw.prototype.huoqu=function (data){   //加载方法
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:data,        //转为JSON格式
        dataType:'json',                   //定义返回data类型
        url:path+'/Postion/selInfoByName.do',    //路径
        success:function (data){//data 就是数据 json
            console.log(data);
            var str=''
            for(var i=0;i<data.plist.length;i++){
                str+='<li>'
                str+='<p>'
                str+='<a href="" class="zp_zwxq_a1">'+data.plist[i].postionName+'</a>'
                str+='<span class="zp_zwxq_span1">'+data.plist[i].postionMm+'-'+data.plist[i].postionYm+'</span>'
                str+='<a href="" class="zp_zwxq_a2">'+data.plist[i].company.companyName+'</a>'
                str+='</p>'
                str+=' <p>'
                str+='<span class="edu">'+data.plist[i].postionEducation+'|'+data.plist[i].postionExp+'年工作经验</span>'
                str+='<span class="place" title="">'+data.plist[i].postionSpace+'</span>'
                for(var j=0;j<data.plist[i].company.fields.length;j++){
                    data.plist[i].company.fields.fieldName;
                }
                str+='</span>'
                str+='</p>'
                str+='</li>'
            }
            $('#bbb').html(str)
        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })
}

$(function (){
    var knzw=new Knzw();
    knzw.huoqu(json);

})