/**
 * Created by Administrator on 2017/7/3.
 */
$(function (){                          //页面功能
    
    $('.zp_gsxq_dz em').on('click',function (){
        $(this).prev().click();
    });
});


function jbxx(){    //基本信息
        this.gsmc='',       //公司名称
        this.ly='',         //领域
        this.yyjs='',       //应用技术
        this.gsgm='',       //公司规模
        this.gsdz=[],       //公司地址
        this.gsdy=[]        //公司待遇
        this.gsjs=''        //公司介绍
        this.cpjs=[]        //产品介绍
        this.DOM={
            ogsmc:$('#gsxq_gsmc'),
            oly:$('#gsxq_gshy'),
            oyyjs:$('#gsxq_yyjs'),
            ogsgm:$('#gsxq_gsgm'),
            ogsdz:$('#gsxq_gsdz'),//公司地址input_1
            ogsdz2:$('#gsxq_gsdz2'),//公司地址input_2
            ogsdy:$('#gsxq_gsdy input'),
            ogsjs:$('#gsxq_gsjs'),
            ocpjs:$('#gsxq_cpjs'),
    }
}
jbxx.prototype.init=function (){    //基本信息初始化
    var This=this;
    var aaa={
        gsmc:"沈阳先知蓝创",
        ly:"互联网行业",
        yyjs:"牛的技术",
        gsgm:"2",
        gsdz:{e:"辽宁省",s:"沈阳市",j:"啦啦啦啦同方广场"},
        gsdy:{aa:[1,2,6,8,0]},
        gsjs:"相当好",
        cpjs:"非常好",
    };
    This.gsmc=aaa.gsmc;
    This.ly=aaa.ly;
    This.yyjs=aaa.yyjs;
    This.gsgm=aaa.gsgm;
    This.gsdz=aaa.gsdz;
    This.gsdy=aaa.gsdy;
    This.gsjs=aaa.gsjs;
    This.cpjs=aaa.cpjs;
    This.bindingDOM()
};
jbxx.prototype.bindingDOM=function (){
    var This=this;
    This.DOM.ogsmc.val(this.gsmc);                                  //公司名称
    This.DOM.oly.val(this.ly);                                      //公司领域
    This.DOM.oyyjs.val(this.yyjs);                                  //应用技术
    This.DOM.ogsgm.find('option') .each(function (index,ele){       //公司规模
        if($(ele).attr('data-value')==This.gsgm){
            $(ele).attr('selected','selected')
        }
    });
   var cs_dj=This.gsdz.e+'/'+This.gsdz.s;
    This.DOM.ogsdz.val(cs_dj);                                        //公司城市地址
    This.DOM.ogsdz2.val(This.gsdz.j);                                 //公司街道地址

    for(var i=0;i<This.gsdy.aa.length;i++){                          //公司待遇福利
        This.DOM.ogsdy.each(function (index,ele){
            if($(ele).attr('data-value')==This.gsdy.aa[i]){
                $(ele).attr('checked','checked')
            }
        })
    }


    This.DOM.ogsjs.val(This.gsjs);                                    //公司介绍
}

function qyfc(){        //企业风采
        this.qyfc='',         //企业风采
        this.DOM={
            tj_gsfc:$('#tj_gsfc')
        }
}                                  //企业风采
qyfc.prototype.init=function (){
    var This=this;
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:{companyId:ID},        //转为JSON格式
        url:path+'Mien/selectByCompanyId',    //路径
        dataType:'json',
        success:function (data){//data 就是数据 json
            This.qyfc=data;
            for(var i=0;i<This.qyfc.arr.length;i++){                     //页面初始化
                This.qyfc.arr[i].dkh=dkh;
                This.qyfc.arr[i].path=path+'uploadImg/';
                var qyfc_html = template('qyfc_mb',This.qyfc.arr[i]);
                $('#tj_gsfc').before(qyfc_html);           //初始化载入
                var oid1=$('#tj_gsfc').prev('div').find('div').attr('id');
                var obj1=document.getElementById(oid1);
                var oid2=$('#tj_gsfc').prev('div').find('input').attr('id');
                var obj2=document.getElementById(oid2);
                var tpsc =  new uploadUtil(obj1,dkh+"/upload/img",obj2,function (){
                    var a = i;
                    return function (imgName) {
                        var aa=$('.qyfc > div').eq(a).find('div').attr('data-url',imgName);//赋值URL
                       $('.qyfc > div').eq(a).find('.a1_gb_tj').css({"display":"inline-block"})
                    }
                }(i));
                tpsc.init();        //上传图片的初始化方法
            }
            This.qr();          //修改和键盘监听
            This.sc();          //删除事件
            This.bindingSJ()

        },error:function (){ //报错执行的
            alert('企业风采查询错误')
        }
    });


};
qyfc.prototype.qr=function (){                  //修改方法

    var This=this;
    $('.a1_gb_tj').on('click',function (){  //确认提交事件
                                                    //开关
        var obj=$(this).parent().siblings('div'); //获取到你要提交的企业风采照片
        var oms=$(this).parent().siblings('textarea').val();

            var aaa={
                     mienId:obj.attr('data-id'),      //要提交的ID
                    mienUrl:obj.attr('data-url'),    //将你的图片路径传进来
                    mienIntro:oms,                   //描述
            };

            $.ajax({
                type:"post",    //提交方式
                async:true,  //是否异步
                contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                data:JSON.stringify(aaa),        //转为JSON格式
                url:path+'Mien/updateMien.do',    //路径
                success:function (data){//data 就是数据 json
                    $('.qyfc').find('div').remove();
                    This.init();

                },error:function (){ //报错执行的
                    alert('企业风采修改错误')
                }

            })





    });
                  //原来的描述
    $('.qyfc').find('textarea').each(function (index,ele){
        $(ele).on('keyup',function (){
           var ms_yl= This.qyfc.arr[index].mienIntro;     //原来的数据
            var ms_sx=$(ele).val();
            if(ms_yl==ms_sx){
                $(this).siblings('h3').find('.a1_gb_tj').css({"display":"none"}); //如果等于原来的关闭提交按钮
            }else{
                $(this).siblings('h3').find('.a1_gb_tj').css({"display":"inline-block"})
            }
        })
    })

}                   //修改和键盘监听
qyfc.prototype.sc=function (){                  //删除方法
    var This=this;
    $('.a1_gb_sc').on('click',function (){  //删除事件

        var sc_id=$(this).parent().siblings('div').attr('data-id'); //企业风采的ID
        $.ajax({
            type:"post",    //提交方式
            async:true,  //是否异步
            data:{mienId:sc_id},
            dataType:'text',
            url:path+'Mien/deleteMien.do',
            success:function (data){
                $('#tj_gsfc').siblings('div').remove();
                This.init();
            },error:function (){ //报错执行的
                alert('基本资料修改错误')
            }

        })

    });
}
qyfc.prototype.bindingSJ=function (){
    var This=this;
    var kg=true;
    This.DOM.tj_gsfc.unbind().on('click',function (){   //添加按钮的事件
        if(kg){
            kg=false;
            var obj={
                mienUrl:path+'dist/foreEnd3/img/timg.png',
                mienIntro:"请上公司风采照片和描述"
            }
            var qyfc_html = template('qyfc_mb',obj);
            $(this).before(qyfc_html);           //添加模板
            var eee=$(this);
            eee.prev('div').find('.a1_gb_sc').on('click',function (){       //删除事件
                kg=true;
                $(this).parent().parent().remove()
            })
            var aaa= $(this).prev('div').find('div').attr('id');
            var bbb=document.getElementById(aaa);                //获取到背景DIV的元素
            var ccc= $(this).prev('div').find('input[type=text]').attr('id');
            var ddd=document.getElementById(ccc);
            var uu =  new uploadUtil(bbb,dkh+"/upload/img",ddd,function (imgName){
                    eee.prev('div').find('.a1_gb_tj').css({"display":"inline-block"});
                    eee.prev('div').find('div').attr('data-url',imgName);//赋值URL
            });
            uu.init();
            // This.qr(kg);           //提交方法
            $('.a1_gb_tj').parent().parent().each(function (i,e){
                if($(e).attr('data-id')==''){
                    $(e).find('.a1_gb_tj').unbind().on('click',function (){
                        var obj=$(this).parent().siblings('div'); //获取到你要提交的企业风采照片
                        var oms=$(this).parent().siblings('textarea').val();
                        var aaa={
                            companyId:ID,
                            mienUrl:obj.attr('data-url'),    //将你的图片路径传进来
                            mienIntro:oms,                   //描述
                        };
                        $.ajax({
                            type:"post",    //提交方式
                            async:true,  //是否异步
                            contentType: "application/json",    //设置请求头文件格式要想后台传数据必须写
                            data:JSON.stringify(aaa),        //转为JSON格式
                            url:path+'Mien/insertMien.do',    //路径
                            success:function (data){//data 就是数据 json
                                $('.qyfc').find('div').remove();
                                This.init();

                            },error:function (){ //报错执行的
                                alert('企业风采修改错误')
                            }

                        })




                    })
                }
            })
        }


    })
};           //添加一个新的企业风采

function gstb(){

}                //公司图标
gstb.prototype.bindingSJ=function (){
    var  ogstb_bg=document.getElementById('gstb_bg');
    var  Ogstb_inp1=document.getElementById('gstb_inp1');
    var uu =  new uploadUtil(ogstb_bg,dkh+"/upload/img",Ogstb_inp1,function (imgName){
                console.log(imgName);
                Ogstb_inp1.value = imgName;
                console.log(Ogstb_inp1)
    });
    uu.init();
}

function cpjx(){
    this.cpjs=''
}

cpjx.prototype.init=function (){
    var This=this;

    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:{companyId:ID},        //转为JSON格式
        dataType:'json',                   //定义返回data类型
        url:path+'Product/selByCompanyId.do',    //路径
        success:function (data){//data 就是数据 json
            This.cpjs=data;
            for(var i=0;i<This.cpjs.productList.length;i++){                    //页面载入方法
                var tjcpjs_html  = template('tj_gscp',This.cpjs.productList[i]);
                $('#tjcpjs').before(tjcpjs_html);        //插入元素
            }
            This.xg();
            This.xgCont();

        },error:function (){ //报错执行的
            alert('基本资料修改错误')
        }

    })



}
cpjx.prototype.xg=function (){                          //修改按钮
    var This=this;
    $('#gsxq_cpjs').find('textarea').each(function (index,ele){
        $(ele).unbind().on('keyup',function (){
            var ms_yl= This.cpjs.productList[index].productIntro;     //原来的数据
            var ms_sx=$(ele).val();
            if(ms_yl==ms_sx){
                $(this).parent().siblings('a').css({"display":"none"}); //如果等于原来的关闭提交按钮
            }else{
                $(this).parent().siblings('a').css({"display":"block"}); //如果等于原来的关闭提交按钮
            }
        })
    })
    $('#gsxq_cpjs').find('._gsmc').each(function (index,ele){
        $(ele).unbind().on('keyup',function (){
            var ms_yl= This.cpjs.productList[index].filed1;     //原来的数据
            var ms_sx=$(ele).val();
            if(ms_yl==ms_sx){
                $(this).parent().siblings('a').css({"display":"none"}); //如果等于原来的关闭提交按钮
            }else{
                $(this).parent().siblings('a').css({"display":"block"}); //如果等于原来的关闭提交按钮
            }
        })
    })
}
cpjx.prototype.xgCont=function (){                          //修改
    var This=this;
     $('#gsxq_cpjs a').each(function (i,e){
            $(e).unbind().on('click',function (){
                var parent=$(e).parent()
                var data1={
                    productId:parent.attr('data-id'),
                    productIntro:parent.find('textarea').val(),
                    filed1:parent.find('._gsmc').val()
                }
                $.ajax({
                    type:"post",    //提交方式
                    async:true,  //是否异步
                    contentType: "application/json",
                    data:JSON.stringify(data1),
                    dataType:'json',
                    url:path+'Product/updateProduct',
                    success:function (data){



                    },error:function (){ //报错执行的
                        alert('基本资料修改错误')
                    }

                })


            })
     })

}
cpjx.prototype.bindingSJ=function (){
    var ww=0;
    $('#tjcpjs').on('click',function (){        //添加商品
        var aaa={
            index:ww++
        }
        var tjcpjs_html  = template('tj_gscp',aaa);
        $('#tjcpjs').before(tjcpjs_html);        //插入元素
        $('.zp_gsxq_cpjs_cp > span').on('click',function (){
            $(this).parent().remove();          //自杀
        })
        var oID=$('#tjcpjs').prev('div').find('.zp_gsxq_cpjs_cp_left').find('div').attr('id')
        var oinput=$('#tjcpjs').prev('div').find('.zp_gsxq_cpjs_cp_left').find('input').attr('id')
        var aa=document.getElementById(oID);
        var bb=document.getElementById(oinput);
        var uu =  new uploadUtil(aa,dkh+"/upload/img",bb,function (imgName){

        });
        uu.init();

    })
};





$(function (){
    //公司应用技术，待遇
    $('.skillBtn').on('click',function () {
        $(this).parent().remove();
    })
    $('.addBut').next().hide();
    $('.addBut').next().blur(function () {
        addVal($(this).prev().prev(),$(this).val(),$(this).attr("inpName"));
        $(this).hide();
        $(this).val("");
        $('.skillBtn').on('click',function () {
            $(this).parent().remove();
        })
    })
    $('.addBut').next().keyup(function (e) {
        if(e.keyCode==13){
            $(this).blur();
        }
    });
    function addVal(nodeBox,val,name) {
        if(val!=undefined&&val!=""){
            var nodes = nodeBox.html();
            nodeBox.html(nodes+"<div class='skilldiv'>"+
                "<div>"+val+"</div>"+
                "<a class='skillBtn'>x</a>"+
                "<input type='hidden' form='zp_gsxq_form' name='"+name+"' value='"+val+"'>"+
                "</div>");
        }
    }
    $('.addBut').on('click',function () {
        $(this).next().css("top",$(this).offset().top+$(this).height()/2+3);
        $(this).next().css("left",$(this).offset().left+$(this).width()/2+3);
        $(this).next().show();
        $(this).next().focus();
    })
    var ogstb=new gstb();           //公司图标
    ogstb.bindingSJ();
    //公司领域
    $('#gslyEdit').on('click',function () {
        //event.preventDefault();
        $('.cd-popuph').addClass('is-visible');
    })
    //关闭
    $('.cd-popup-closeh').unbind().on('click',function (){
        $('.cd-popuph').removeClass('is-visible');
    })
    //键盘关闭
    $(document).keyup(function(event){
        if(event.which=='27'){
            $('.cd-popuph').removeClass('is-visible');
        }
    });
    $.ajax({
        type:"post",    //提交方式
        async:true,  //是否异步
        data:{type:1},
        dataType:'json',                   //定义返回data类型
        url:path+'Field/selByType',    //路径
        success:function (data){//data 就是数据 json
            var ccHtml="";
            for(var i = 0;i < data.fieldList.length;i++){
                ccHtml+='<li><input class="gshychechBox" type="checkbox" ';
                for(var j = 0;j<theFiels.length;j++){
                            if(theFiels[j]==data.fieldList[i].fieldId){
                                ccHtml+= 'checked';
                            }
                }
                ccHtml+=' data-fieldId="'+data.fieldList[i].fieldId+'" data-value="'+data.fieldList[i].fieldName+'"/>'+data.fieldList[i].fieldName+' </li>';
            }
            $('#gshyBox').html(ccHtml);
            $('#xz_qwhy_qd').on('click',function () {
                $('#gslyBox').html("");
                $('.gshychechBox').each(function (i,e) {
                    if($(e).attr("checked")){
                        var id = $(e).attr('data-fieldId');
                        var val = $(e).attr('data-value');
                        $('#gslyBox').append("<div class='skilldiv'>"+
                            "<div>"+val+"</div>"+
                            "<a class='skillBtn'>x</a>"+
                            "<input type='hidden' form='zp_gsxq_form' name='domains' value='"+id+"'>"+
                            "</div>");
                    }
                })
                $('.skillBtn').on('click',function () {
                    $(this).parent().remove();
                })
                $('.cd-popuph').removeClass('is-visible');
            })
        },error:function (){ //报错执行的
            alert('行业查找失败');
        }
    })




    var oqyfc=new qyfc();           //企业风采
    oqyfc.init();


    var ocpjx=new cpjx();           //产品介绍
    ocpjx.init();
    ocpjx.bindingSJ();



});



