/**
 * Created by Administrator on 2017/6/30.
 */
$(function (){
    $(".zp_lb_li").hover(function (){
        $(this).find('ul').css({
            "display":"block"

        })
    },function (){
        $(this).find('ul').css({
            "display":"none"
        })
    })
});