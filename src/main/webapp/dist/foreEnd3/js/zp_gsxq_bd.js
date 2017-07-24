/**
 * Created by Administrator on 2017/7/3.
 */
$(function (){                          //页面功能
    var width=$(window).width();
    var height=$(window).height();
    
    $('.zp_gsxq_hy em').on('click',function (){
        $('#zp_gsxq_bd_tck').css({
            "display":"block",
            "width":width,
            "height":height
        });
        $("#zp_gsxq_bd_tck_cont1").css({
            "display":"block"
        });
        $('#zp_gsxq_bd_tck_cont1').animate({
            "width":"700",
            "height":"450"
        })
    });
    $('.zp_gsxq_bd_tck_middle a').on("click",function (){//选择行业
        $('.zp_gsxq_hy > input').val($(this).html())
        $('#zp_gsxq_bd_tck').css({
            "display":"none"
        });
        $(this).parent().parent().parent().parent().css({
            "display":"none",
            "width":"0",
            "height":"0"
        })
    });
    $('.zp_gsxq_bd_tck_bottom button').on('click',function (){//关闭按钮
        $('#zp_gsxq_bd_tck').css({
            "display":"none"
        });
        $(this).parent().parent().css({
            "display":"none",
            "width":"0",
            "height":"0"
        })

    });
    $('.gb').on("click",function (){//关闭按钮
        $('#zp_gsxq_bd_tck').css({
            "display":"none"
        });
        $(this).parent().parent().css({
            "display":"none",
            "width":"0",
            "height":"0"
        })
    });

//   省市联动开始
    $(".zp_gsxq_dz em").on('click',function (){
        $('#zp_gsxq_bd_tck').css({
            "display":"block",
            "width":width,
            "height":height
        });
        $("#zp_gsxq_bd_tck_cont2").css({
            "display":"block"
        });
        $('#zp_gsxq_bd_tck_cont2').animate({
            "width":"700",
            "height":"300"
        })
    });
    $('.zp_gsxq_bd_tck_bottom > a').on("click",function (){
        var a=$('.zp_gsxq_bd_tck_cont2_cont select').eq(0).find("option:selected").text();
        var b=$('.zp_gsxq_bd_tck_cont2_cont select').eq(1).find("option:selected").text();
        $('.zp_gsxq_dz > input').eq(0).val(a+"/"+b);
        $('#zp_gsxq_bd_tck').css({
            "display":"none"
        });
        $(this).parent().parent().css({
            "display":"none",
            "width":"0",
            "height":"0"
        })
    });
});
function change() {
    var map = ['', ['朝阳区', '海淀区', '通州区', '房山区', '丰台区', '昌平区', '大兴区', '顺义区', '西城区', '延庆县', '石景山区', '宣武区', '怀柔区', '崇文区', '密云县', '东城区', '平谷区', '门头沟区'],

        ['东莞市', '广州市', '中山市', '深圳市', '惠州市', '江门市', '珠海市', '汕头市', '佛山市', '湛江市', '河源市', '肇庆市', '清远市', '潮州市', '韶关市', '揭阳市', '阳江市', '梅州市', '云浮市', '茂名市', '汕尾市'],

        ['济南市', '青岛市', '临沂市', '济宁市', '菏泽市', '烟台市', '淄博市', '泰安市', '潍坊市', '日照市', '威海市', '滨州市', '东营市', '聊城市', '德州市', '莱芜市', '枣庄市'],

        ['苏州市', '徐州市', '盐城市', '无锡市', '南京市', '南通市', '连云港市', '常州市', '镇江市', '扬州市', '淮安市', '泰州市', '宿迁市'],

        ['郑州市', '南阳市', '新乡市', '安阳市', '洛阳市', '信阳市', '平顶山市', '周口市', '商丘市', '开封市', '焦作市', '驻马店市', '濮阳市', '三门峡市', '漯河市', '许昌市', '鹤壁市', '济源市'],

        ['松江区', '宝山区', '金山区', '嘉定区', '南汇区', '青浦区', '浦东新区', '奉贤区', '徐汇区', '静安区', '闵行区', '黄浦区', '杨浦区', '虹口区', '普陀区', '闸北区', '长宁区', '崇明区', '卢湾区'],

        ['石家庄市', '唐山市', '保定市', '邯郸市', '邢台市', '河北区', '沧州市', '秦皇岛市', '张家口市', '衡水市', '廊坊市', '承德市'],

        ['温州市', '宁波市', '杭州市', '台州市', '嘉兴市', '金华市', '湖州市', '绍兴市', '舟山市', '丽水市', '衢州市'],

        ['无'],

        ['西安市', '咸阳市', '宝鸡市', '汉中市', '渭南市', '安康市', '榆林市', '商洛市', '延安市', '铜川市'],

        ['长沙市', '邵阳市', '常德市', '衡阳市', '株洲市', '湘潭市', '永州市', '岳阳市', '怀安市', '郴州市', '娄底市', '益阳市', '张家界市', '湘西州'],

        ['江北区', '渝北区', '沙坪坝区', '九龙坡区', '万州区', '永川区', '南岸区', '酉阳县', '北碚区', '涪陵区', '秀山县', '巴南区', '渝中区', '石柱县', '忠县', '合川市', '大渡口区', '开县', '长寿区', '荣昌县', '云阳县', '梁平县', '潼南县', '江津市', '彭水县', '綦江县', '璧山县', '黔江区', '大足县', '巫山县', '巫溪县', '垫江县', '丰都县', '武隆县', '万盛区', '铜梁县', '南川市', '奉节县', '双桥区', '城口县'],

        ['漳州市', '厦门市', '泉州市', '福州市', '莆田市', '宁德市', '三明市', '南平市', '龙岩市'],

        ['和平区', '北辰区', '河北区', '河西区', '西青区', '津南区', '东丽区', '武清区', '宝坻区', '红桥区', '大港区', '汉沽区', '静海县', '塘沽区', '宁河县', '蓟县', '南开区', '河东区'],

        ['昆明市', '红河州', '大理州', '文山州', '德宏州', '曲靖市', '昭通市', '楚雄州', '保山市', '玉溪市', '丽江地区', '临沧地区', '思茅地区', '西双版纳州', '怒江州', '迪庆州'],

        ['成都市', '绵阳市', '广元市', '达州市', '南充市', '德阳市', '广安市', '阿坝州', '巴中市', '遂宁市', '内江市', '凉山州', '攀枝花市', '乐山市', '自贡市', '泸州市', '雅安市', '宜宾市', '资阳市', '眉山市', '甘孜州'],

        ['贵港市', '玉林市', '北海市', '南宁市', '柳州市', '桂林市', '梧州市', '钦州市', '来宾市', '河池市', '百色市', '贺州市', '防城港市'],

        ['芜湖市', '合肥市', '六安市', '宿州市', '阜阳市', '安庆市', '马鞍山市', '蚌埠市', '淮北市', '淮南市', '宣城市', '黄山市', '铜陵市', '亳州市', '池州市', '巢湖市', '滁州市'],

        ['三亚市', '海口市', '琼海市', '文昌市', '东方市', '昌江县', '陵水县', '乐东县', '保亭县', '五指山市', '澄迈县', '万宁市', '儋州市', '临高县', '白沙县', '定安县', '琼中县', '屯昌县'],

        ['南昌市', '赣州市', '上饶市', '吉安市', '九江市', '新余市', '抚州市', '宜春市', '景德镇市', '萍乡市', '鹰潭市'],

        ['武汉市', '宜昌市', '襄樊市', '荆州市', '恩施州', '黄冈市', '孝感市', '十堰市', '咸宁市', '黄石市', '仙桃市', '天门市', '随州市', '荆门市', '潜江市', '鄂州市', '神农架林区'],

        ['太原市', '大同市', '运城市', '长治市', '晋城市', '忻州市', '临汾市', '吕梁市', '晋中市', '阳泉市', '宿州市'],

        ['大连市', '沈阳市', '丹东市', '辽阳市', '葫芦岛市', '锦州市', '朝阳市', '营口市', '鞍山市', '抚顺市', '阜新市', '盘锦市', '本溪市', '铁岭市'],

        ['台北市', '高雄市', '台中市', '新竹市', '基隆市', '台南市', '嘉义市'],

        ['齐齐哈尔市', '哈尔滨市', '大庆市', '佳木斯市', '双鸭山市', '牡丹江市', '鸡西市', '黑河市', '绥化市', '鹤岗市', '伊春市', '大兴安岭地区', '七台河市'],

        ['赤峰市', '包头市', '通辽市', '呼和浩特市', '鄂尔多斯市', '乌海市', '呼伦贝尔市', '兴安盟', '巴彦淖尔盟', '锡林郭勒盟', '阿拉善盟', '大兴安岭地区', '七台河市'],

        ['无'],

        ['贵阳市', '黔东南州', '黔南州', '遵义市', '黔西南州', '毕节地区', '铜仁地区', '安顺市', '六盘水市'],

        ['兰州市', '天水市', '庆阳市', '武威市', '酒泉市', '张掖市', '陇南地区', '白银市', '定西地区', '平凉市', '嘉峪关市', '临夏回族自治州', '金昌市', '甘南州'],

        ['西宁市', '海西州', '海东地区', '海北州', '果洛州', '玉树州', '黄南藏族自治州'],

        ['乌鲁木齐市', '伊犁州', '昌吉州', '石河子市', '哈密地区', '阿克苏地区', '巴音郭楞州', '喀什地区', '塔城地区', '克拉玛依市', '和田地区', '阿勒泰州', '吐鲁番地区', '阿拉尔市', '博尔塔拉州', '五家渠市', '克孜勒苏州', ' 图木舒克市'],

        ['拉萨市', '山南地区', '林芝地区', '日喀则地区', '阿里地区', '昌都地区', '那曲地区'],

        ['吉林市', '长春市', '白山市', '延边州', '白城市', '松原市', '辽源市', '通化市', '四平市'],

        ['银川市', '吴忠市', '中卫市', '石嘴山市', '固原市']
    ];
    var pro = document.getElementById('pro');
    var city = document.getElementById('city');
    var citys = map[pro.value];
    for (var i = 0, len = citys.length, str = ''; i < len; i++) {
        str = str + '<option>' + citys[i] + '</option>';
    }
    city.innerHTML = str;
}//城市

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
            alert(This.qyfc.arr.length)
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

        },error:function (){ //报错执行的
            alert('企业风采查询错误')
        }
    });


};
qyfc.prototype.qr=function (){                  //修改方法

    var This=this;
    $('.a1_gb_tj').on('click',function (){  //确认提交事件
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
                url:path+'Mien/updateMien',    //路径
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
            url:path+'Mien/deleteMien',
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
    This.DOM.tj_gsfc.on('click',function (){   //添加按钮的事件
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
                kg=true;
                    eee.prev('div').find('.a1_gb_tj').css({"display":"inline-block"});
                    eee.prev('div').find('div').attr('data-url',imgName);//赋值URL
            });
            uu.init();
            This.qr();           //提交方法

        }


    })
};           //添加一个新的企业风采

function gstb(){

}                //公司图标
gstb.prototype.bindingSJ=function (){
    var  ogstb_bg=document.getElementById('gstb_bg');
    var  Ogstb_inp1=document.getElementById('gstb_inp1');
    var uu =  new uploadUtil(ogstb_bg,dkh+"/upload/img",Ogstb_inp1,function (imgName){
                alert('aaa')
    });
    uu.init();
}

function cpjx(){
    this.cpjs=''
}
cpjx.prototype.init=function (){

};
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

function gsdz(){                    //公司地址
    this.x;
    this.y;
    this.local;
    this.map;
    this.address;
    this.city;

    this.gsdz={}
}
gsdz.prototype.init=function (){
    var This=this
    var aa={
        gsdz:{point:{lng:116.404,lat:39.915}}                   //假设后台传过来的地址
    }
    This.gsdz=aa;
}
gsdz.prototype.bindingSJ=function (){
    function init() {
        if (navigator.geolocation)
        {
            //获取当前位置，分别传入了成功和失败的两个函数
            navigator.geolocation.getCurrentPosition(showPosition,showError);
        }
        //如果不支持，则进行提示
        else{alert("Geolocation is not supported by this browser.");}
    }
    function showError(error) {
        //console.log("错误");
        //initMaps();
        switch(error.code) {
            case error.PERMISSION_DENIED:
                alert("定位失败,用户拒绝请求地理定位");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("定位失败,位置信息是不可用");
                break;
            case error.TIMEOUT:
                alert("定位失败,请求获取用户位置超时");
                break;
            case error.UNKNOWN_ERROR:
                alert("定位失败,定位系统失效");
                break;
        }
        initMaps(position);
    }

    function showPosition(position) {
        console.log("成功");
        initMaps(position);
    }


    var address;
    var map;
    var city = "沈阳市-和平区";           //区选择
    var x = 116.404;                      //经度
    var y = 39.915;                       //纬度
    function initMaps(position) {
        if(position){
            x = position.coords.latitude;
            y = position.coords.longitude;
        }
        map = new BMap.Map("gsdz");
        map.centerAndZoom(city);

        map.addControl(new BMap.NavigationControl());
        map.enableScrollWheelZoom();


        //创建搜索服务对象
        var autocomplete = new BMap.Autocomplete({location:"沈阳市",input:"gsdz_ssk"});

        //搜索对象
        var localSearch = new BMap.LocalSearch(map);
        localSearch.setSearchCompleteCallback(function (searchResult) {
            var poi = searchResult.getPoi(0);
            setPoint(poi);
        });
        //搜索对象选中回调
        autocomplete.addEventListener('onconfirm',function (rs) {
            //alert(rs);
            address = document.getElementById("gsdz_ssk").value;
            console.log(address);
            map.setZoom(14);
            //触发坐标搜索
            localSearch.search(address);
        });
        //map点击事件
        map.addEventListener('click',function (rs) {
            setPoint(rs);
             x=rs.point.lng;                //重新获取用户X轴向
             y=rs.point.lat;                //重新获取用户Y轴向
        });
    }
    //设置坐标
    function setPoint(rs) {
        console.log(rs);
        map.clearOverlays();//清空原来的标注
        var ppt = new BMap.Point(rs.point.lng, rs.point.lat);
        x=rs.point.lng;
        y=rs.point.lat;
        var marker = new BMap.Marker(ppt);  // 创建标注，为要查询的地址对应的经纬度
        map.addOverlay(marker);
        map.panTo(ppt);
    }
    initMaps();
}









$(function (){
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
        $(this).next().show();
        $(this).next().focus();
    })




    //var ojbxx=new jbxx();           //公司基本信息
    //ojbxx.init();

    var ogsdz=new gsdz();           //公司地址
    ogsdz.bindingSJ();

    var oqyfc=new qyfc();           //企业风采
    oqyfc.init();

     oqyfc.bindingSJ();


    var ogstb=new gstb();           //公司图标
    ogstb.bindingSJ();

    var ocpjx=new cpjx();           //产品介绍
    ocpjx.bindingSJ();



});



