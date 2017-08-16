window.onload = function () {
    anlisten();
}
window.onscroll = function () {
    anlisten();
    var header = document.getElementsByTagName("header")[0];
    var nav = document.getElementsByTagName("nav")[0];
    var headerHeight = header.offsetHeight;
    var navHeight = nav.offsetHeight;
    var headerTopRange = header.getBoundingClientRect().top;
    var kj = 1-(headerTopRange+headerHeight-navHeight)/headerHeight;
    var bgc = getStyle(nav,"backgroundColor");
    var vlu = RGB(bgc);
    if(kj>=1){
        nav.style.backgroundColor = "rgba("+vlu+",1)";
    }else if(kj<=0.2){
        nav.style.backgroundColor = "rgba("+vlu+",0)";
    }else{
        nav.style.backgroundColor = "rgba("+vlu+","+kj+")";
    }
    var ddds = document.getElementsByClassName("ddds")[0];
    if(ddds.getBoundingClientRect().top< 800){
        gozhiweig();
    }
}
//获取真实样式
var getStyle = function (element,attr) {
    if(typeof window.getComputedStyle!='undefined'){
        //如果支持W3C，使用getComputedStyle来获取样式
        return  window.getComputedStyle(element,null)[attr];
    }else if(element.currentStyle){
        return element.currentStyle[attr];
    }
}
//拆分原色
function RGB(rgb){
    var reg = /\b\([\s\S]*\)$/;
    var str = rgb.match(reg)[0];
    str = str.substring(1,str.length-1);
    var strs = str.split(",");
    var rgbs = "";
    for(var i = 0;i<3;i++){
        rgbs += strs[i]+",";
    }
    if(rgbs.charAt(rgbs.length-1)==","){
        rgbs = rgbs.substr(0,rgbs.length-1);
    }
    return rgbs;
}
//动画监听
function  anlisten() {
    var lr = document.getElementsByClassName("relrLn");
    var du = document.getElementsByClassName("reduLn");
    var du2 = document.getElementsByClassName("reduLn2");
    var du3 = document.getElementsByClassName("reduLn3");
    var du4 = document.getElementsByClassName("reduLn4");
    var rl = document.getElementsByClassName("rerlLn");
    var ud = document.getElementsByClassName("reudLn");
    anGo(lr,'lr');
    anGo(rl,'rl');
    anGo(du,'du');
    anGo(du2,'du2');
    anGo(du3,'du3');
    anGo(du4,'du4');
    anGo(ud,'ud');
}
//动画类设置
function anGo(ans,type) {
    for(var i = 0;i < ans.length; i++){
        var s = ans[i].getBoundingClientRect().top;
        /*console.log(typeof ans[i]+"==="+s);
         console.log(window.screen.availHeight);*/
        if(s<=window.screen.availHeight){
            if(type=="lr") {
                addClass(ans[i], "relrGo");
            }else if(type=="rl"){
                addClass(ans[i], "rerlGo");
            }else if(type=="du"){
                addClass(ans[i], "reduGo");
            }else if(type=="ud"){
                addClass(ans[i], "reudGo");
            }else if(type=="du2"){
                addClass(ans[i], "reduGo2");
            }else if(type=="du3"){
                addClass(ans[i], "reduGo3");
            }else if(type=="du4"){
                addClass(ans[i], "reduGo4");
            }
        }
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

