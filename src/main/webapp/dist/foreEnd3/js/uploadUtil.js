/**
 * Created by Administrator on 2017/7/6.
 */
//外部容器框，图片上传控制器路径，已上传路径回显框,回调函数
function uploadUtil(box,upUrl,imgNameBox,callback) {
    //控件外框
    this.box = box;
    //上传控制器路径
    this.upUrl = "http://localhost:8080/go/upload/img";
    if(upUrl){
        this.upUrl = upUrl;
    }
    //图片保存名字input
    this.imgNameBox = imgNameBox;
    //图片回显路径
    this.urlBack;
    //回调函数
    this.callback = callback;

/*    this.totalSize;
    this.name;
    this.size;
    this.type;*/
}
uploadUtil.prototype.init = function () {
    var _self = this;
    _self.box.innerHTML = '<div class="xzFileBox"><form class="afff"><div class="msg"></div><input class="fffup" type="file" name="file"></form></div>';
    _self.msg = _self.box.getElementsByClassName("msg")[0];
    _self.form = _self.box.getElementsByClassName("afff")[0];
    _self.file = _self.box.getElementsByClassName("fffup")[0];
    _self.bar = _self.box.getElementsByClassName("barInd")[0];
    _self.box.onclick = function () {
        _self.file.click();
    }
    _self.file.onchange = function () {
        var ff = this.files[0];
        if(ff){
            _self.urlBack = window.URL.createObjectURL(ff);
            _self.uploadImg();
        }

    }
}


uploadUtil.prototype.uploadImg = function() {
    var _self = this;
    //创建FormData对象，初始化为form表单中的数据。需要添加其他数据可使用formData.append("property", "value");
    var formData = new FormData(_self.form);
    //ajax异步上传
    $.ajax({
        url: _self.upUrl,
        type: "POST",
        data: formData,
        xhr: function(){ //获取ajaxSettings中的xhr对象，为它的upload属性绑定progress事件的处理函数
            myXhr = $.ajaxSettings.xhr();
            if(myXhr.upload){ //检查upload属性是否存在
                //绑定progress事件的回调函数
                myXhr.upload.addEventListener('progress',_self.progressHandlingFunction, false);
            }
            return myXhr; //xhr对象返回给jQuery使用
        },
        success: function(result){
            if(result.msg == "ok"){
                //成功
                _self.box.style.backgroundImage = "url("+_self.urlBack+")";
                //console.log(_self.imgNameBox);
                if(_self.imgNameBox){
                    _self.imgNameBox.value = result.imgName;
                }
                if(_self.callback){
                    _self.callback();
                }
                _self.msg.innerHTML = "上传成功";
            }else if(result.msg == "err"){
                //失败
                _self.msg.innerHTML = "上传失败请重试";
            }
            addClass(_self.msg,"anim");
        },
        contentType: false, //必须false才会自动加上正确的Content-Type
        processData: false  //必须false才会避开jQuery对 formdata 的默认处理
    });
}
//上传进度回调函数：
uploadUtil.prototype.progressHandlingFunction = function (e) {
    if (e.lengthComputable) {
        $('progress').attr({value : e.loaded, max : e.total}); //更新数据到进度条
        var percent = e.loaded/e.total*100;
        console.log(percent);
        $('#progress').html(e.loaded + "/" + e.total+" bytes. " + percent.toFixed(2) + "%");
    }
}
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
}