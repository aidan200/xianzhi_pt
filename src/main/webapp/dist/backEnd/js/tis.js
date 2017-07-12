function tis(width) {
    this.msgBox;
    this.w = width;
    this.isRun = false;
}

tis.prototype.init = function () {
    var _self = this;
    _self.msgBox = document.createElement("div");
    _self.msgBox.style.width = _self.w+"px";
    _self.msgBox.className = 'myHyalineBox';
    var nodes = document.getElementsByTagName("body");
    nodes[0].appendChild(_self.msgBox);
}
tis.prototype.confirm = function (msg,callback) {
    var _self = this;
    if(!_self.isRun){
        _self.isRun = true;
        _self.msgBox = document.createElement("div");
        _self.msgBox.style.width = _self.w+"px";
        _self.msgBox.className = 'myHyalineBox';
        var nodes = document.getElementsByTagName("body");
        nodes[0].appendChild(_self.msgBox);

        var opacity = getStyle(_self.msgBox,"opacity");

        var nodeY = document.createElement("div");
        nodeY.className = "myHyalineBoxBtn Y";
        nodeY.innerHTML = "是";
        nodeY.onclick = function () {
            if(callback) callback(true);
            var id =setInterval(function () {
                opacity = opacity - 0.01;
                _self.msgBox.style.opacity = opacity;
                if(opacity<=0){
                    nodes[0].removeChild(_self.msgBox);
                    clearInterval(id);
                    _self.isRun = false;
                }
            },2);
        }

        var nodeN = document.createElement("div");
        nodeN.className = "myHyalineBoxBtn N";
        nodeN.innerHTML = "否";
        nodeN.onclick = function () {
            if(callback) callback(false);
            var id =setInterval(function () {
                opacity = opacity - 0.01;
                _self.msgBox.style.opacity = opacity;
                if(opacity<=0){
                    nodes[0].removeChild(_self.msgBox);
                    clearInterval(id);
                    _self.isRun = false;
                }
            },2);
        }

        var row1= document.createElement("div");
        row1.className = "myHyalineBoxMsg";
        row1.innerHTML = msg;

        var row2 = document.createElement("div");
        row2.className = "myHyalineBoxRow";
        row2.appendChild(nodeN);
        row2.appendChild(nodeY);

        _self.msgBox.appendChild(row1);
        _self.msgBox.appendChild(row2);
    }

}


tis.prototype.alert = function (msg) {
    var _self = this;
    if(!_self.isRun){
        _self.isRun = true;
        _self.msgBox = document.createElement("div");
        _self.msgBox.style.width = _self.w+"px";
        _self.msgBox.className = 'myHyalineBox mAlert';
        _self.msgBox.innerHTML= msg;
        var nodes = document.getElementsByTagName("body");
        nodes[0].appendChild(_self.msgBox);
        var opacity = getStyle(_self.msgBox,"opacity");
        setTimeout(function () {
            var id =setInterval(function () {
                opacity = opacity - 0.01;
                _self.msgBox.style.opacity = opacity;
                if(opacity<=0){
                    nodes[0].removeChild(_self.msgBox);
                    clearInterval(id);
                    _self.isRun = false;
                }
            },2);
        },1000);
    }
}


function getStyle(obj,styleName){
    if(obj.currentStyle){
        return obj.currentStyle[styleName];
    }else{
        return getComputedStyle(obj,null)[styleName];
    }
}

function pToSub(page) {
    if(page!=undefined){
        var pageInp = document.getElementById("thePage");
        pageInp.value = page;
        var form = document.getElementById("searchForm");
        form.submit();
    }
}