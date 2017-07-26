/**
 * Created by Administrator on 2017/7/6.
 */
//外部容器框，图片上传控制器路径，已上传路径回显框,回调函数
function uploadUtil(box,upUrl,imgNameBox,callback) {
    //控件外框
    this.box = box;
    //上传控制器路径
    this.upUrl;
    if(upUrl){
        this.upUrl = upUrl;
    }
    //图片保存名字input
    this.imgNameBox = imgNameBox;
    //图片回显路径
    this.urlBack;
    //回调函数
    this.callback = callback;

}
uploadUtil.prototype.init = function () {
    var _self = this;
    _self.box.innerHTML = '<div class="xzFileBox"><form class="afff"><div class="msgBox anim"><div class="msg"></div></div><input class="fffup" type="file" name="file"></form>' +
        //进度条
        '<div class="pro-bar">'+
        '<span class="progress-bar-inner" style="background-color: #fc9a2f; width: 0%;"></span>'+
        '</div>'+
        '</div>';
    _self.barBox = _self.box.getElementsByClassName("pro-bar")[0];
    _self.msgBox = _self.box.getElementsByClassName("msgBox")[0];
    _self.msg = _self.box.getElementsByClassName("msg")[0];
    _self.form = _self.box.getElementsByClassName("afff")[0];
    _self.file = _self.box.getElementsByClassName("fffup")[0];
    _self.bar = _self.box.getElementsByClassName("progress-bar-inner")[0];
    _self.box.onclick = function () {
        _self.file.click();
    }
    _self.file.onchange = function () {
        var ff = this.files[0];
        if(ff){
            _self.urlBack = window.URL.createObjectURL(ff);
            console.log(ff.size+"---"+ff.type);
            if(ff.type!='image/png'&&ff.type!="image/jpeg"){
                _self.msg.innerHTML = "只支持png或jpeg类型的图片";
                _self.msg.style.color = "red";
                $(_self.msgBox).removeClass("anim");
            }else if(ff.size>300000){
                _self.msg.innerHTML = "图片不能超过300KB";
                _self.msg.style.color = "red";
                $(_self.msgBox).removeClass("anim");
            }else{
                _self.uploadImg();
            }
            setTimeout(function () {
                $(_self.msgBox).addClass("anim");
            },3000)
        }

    }
}


uploadUtil.prototype.uploadImg = function() {
    var _self = this;
    //创建FormData对象，初始化为form表单中的数据。需要添加其他数据可使用formData.append("property", "value");
    var formData = new FormData(_self.form);
    //设置进度条可见
    _self.barBox.style.display = "block";
    //ajax异步上传
    $.ajax({
        url: _self.upUrl,
        type: "POST",
        data: formData,
        xhr: function(){ //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数
            myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){ //检查upload属性是否存在
                //绑定progress事件的回调函数
                myXhr.upload.addEventListener('progress',_self.progressHandlingFunction(), false);
            }
            return myXhr; //xhr对象返回给jQuery使用
        },
        success: function(result){
            if(result.msg == "ok"){
                //成功

                _self.box.style.backgroundImage = "url("+_self.urlBack+")";

                if(_self.imgNameBox){
                    _self.imgNameBox.value = result.imgName;
                }
                if(_self.callback){
                    _self.callback(result.imgName);
                }
                _self.msg.innerHTML = "上传成功";
                _self.msg.style.color = "green";
            }else if(result.msg == "err"){
                //失败
                _self.msg.innerHTML = "上传失败请重试";
                _self.msg.style.color = "red";
            }
            $(_self.msgBox).removeClass("anim");
        },
        contentType: false, //必须false才会自动加上正确的Content-Type
        processData: false  //必须false才会避开jQuery对 formdata 的默认处理
    });
}
//上传进度回调函数：
uploadUtil.prototype.progressHandlingFunction = function () {
    var _self = this;
    //闭包传值
    return function (e) {
        if (e.lengthComputable) {
            //更新数据到进度条
            var percent = parseInt(e.loaded/e.total*100);
            if(_self.bar){
                _self.bar.style.width = percent +"%";
            }
            if(percent==100){
                if(_self.barBox){
                    _self.barBox.style.display = "none";
                }
            }
        }
    }
}
/*
function addClass(el,addClass) {
    var b = true;
    var cs = el.getAttribute("class");
    var css = cs.split(" ");
    for(var i=0;i<css.length;i++){
        if(css[i]==addClass){
            b = false;
        }
    }
    if(b){
        cs += " " +addClass;
    }
    el.setAttribute("class",cs);
}*/
