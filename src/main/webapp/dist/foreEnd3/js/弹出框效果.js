/**
 * Created by Administrator on 2017/6/29.
 */
$(function (){
    var aaa=$(window).width();
    var bbb=$(window).height();
    $('#btn1').on('click',function (){
        $('body').append("<div id='div2'><div id='div3'></div></div>");
        $('#div2').css({
            "display":"block",
            "width":aaa,
            "height":bbb
        });
        $('#div3').animate({
            "width":"400",
            "height":"500"
        })
    })
});